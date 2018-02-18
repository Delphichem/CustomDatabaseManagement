unit ufNexusDatabase;
{*******************************************************************************
|
| Description        :  POS database class. Uses Nexus components to connect
|                       to a NexusDB database.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| ********************* Version 4.9.16.1 ***************************************
| 024345 20140501 MDA   Sync trunk with NexusDB changes. Added debug mode to
|                       make heartbeat interval infinite when debugging.
| ********************* Version 4.8.1.1 ****************************************
| 017357 20110418 MDA   Created.
*******************************************************************************}
interface

uses
   Classes, ufISQLDatabase, ufISQLQuery,
   nxllComponent, nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
   nxdb, nxsdServerEngine, nxreRemoteServerEngine, nxtnNamedPipeTransport;

type
   TNexusDatabase = class(TSQLDatabase)
   private
      fTransport   : TnxWinsockTransport;
      fPipedTransport : TnxNamedPipeTransport;
      fServer      : TnxRemoteServerEngine;
      fSession     : TnxSession;
      fDatabase    : TnxDatabase;
      fDatabaseDir : String;
      fNumTables   : Integer;

      function  GetNumTables: Integer;
   protected
      function  GetInTransaction: Boolean; override;
      function  GetConnected: Boolean; override;
      function  GetServerName: String; override;
      function  GetAliasName: String; override;
      procedure SetAliasName(const aAlias: String); override;
      procedure SetServerName(const aServerName: String); override;
      function  GetUserName: String;  override;
      function  GetPassword: String; override;
      procedure SetUserName(const aUserName: String); override;
      procedure SetPassword(const aPassword: String); override;
      procedure SetConnected(const aConnected: Boolean); override;
      function  GetRowsAffected : Integer;
      procedure SetTimeout(const aTimeout: Integer); override;
      function  GetTimeout: Integer;   override;      
   public
      constructor Create(aDebugMode: Boolean = false);
      destructor  Destroy; override;

      function  GetTableNames: TStringList; override;
      function  GetStoredProcNames: TStringList; override;
      function  GetTriggerNames: TStringList; override;
      function  GetViewNames: TStringList; override;
      function  GetDatabaseNames: TStrings; override;
      procedure DeleteAlias(aAliasName: String); override;
      procedure GetServerNames(aServerList : TStrings);
      procedure GetPipedServerNames(aServerList : TStrings);
      procedure UsePipedTransport; override;

      procedure StartTransaction(aTablesAffected : TStringList = nil); override;
      procedure Commit; override;
      procedure Rollback; override;
      procedure Connect; override;
      function  NewQuery: ISQLQuery; override;
      function  NewTable: TnxTable;
      function  GetStoredProcSQL(aStoredProcName : String) : string; override;
      function  GetTriggerSQL(aTriggerName: String): string; override;
      function  GetViewSQL(aViewName: String): string; override;


      property  InTransaction : Boolean         read GetInTransaction;
      property  Connected     : Boolean         read GetConnected    write SetConnected;
      property  DB            : TnxDatabase     read fDatabase       write fDatabase;
      property  ServerName    : String          read GetServerName   write SetServerName;
      property  AliasName     : String          read GetAliasName    write SetAliasName;
      property  UserName      : String          read GetUserName     write SetUserName;
      property  Password      : String          read GetPassword     write SetPassword;
      property  Session       : TnxSession      read fSession        write fSession;
      property  DatabaseDir   : String          read fDatabaseDir    write fDatabaseDir;
      property  NumTables     : Integer         read GetNumTables;
      property  RowsAffected     : Integer      read GetRowsAffected;
      property  Timeout    : Integer  read GetTimeout    write SetTimeout;
   end;

implementation

uses
   SysUtils, ufNexusQuery;

procedure TNexusDatabase.Connect;
{*******************************************************************************
|
| Description        :  Creates the connection to the POS database.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   inherited;
   fSession.Active := True;
   if not Session.IsAlias(AliasName) then
   begin
      ForceDirectories(DatabaseDir);
      Session.AddAlias(AliasName, DatabaseDir);
   end;
   fDatabase.Connect;
   DoAfterConnect;
end;

procedure TNexusDatabase.GetServerNames(aServerList : TStrings);
begin
    fTransport.GetServerNames(aServerList, 1000);
end;

procedure TNexusDatabase.GetPipedServerNames(aServerList : TStrings);
begin
    fServer.Transport     := fPipedTransport;
    fPipedTransport.GetServerNames(aServerList, 1000);
end;

procedure TNexusDatabase.UsePipedTransport;
begin
    fServer.Transport     := fPipedTransport;
end;

procedure TNexusDatabase.StartTransaction(aTablesAffected : TStringList = nil);
begin
   fDatabase.StartTransaction;
end;

function  TNexusDatabase.GetRowsAffected : Integer;
begin
   Result := RowsAffected;
end;

procedure TNexusDatabase.Commit;
begin
   fDatabase.Commit;
end;

procedure TNexusDatabase.Rollback;
begin
   fDatabase.Rollback;
end;

constructor TNexusDatabase.Create(aDebugMode: Boolean = false);
{*******************************************************************************
|
| Description        :  Initialises a new Nexus Database
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   fTransport  := TnxWinsockTransport.Create(nil);
   fPipedTransport  := TnxNamedPipeTransport.Create(nil);
   fServer     := TnxRemoteServerEngine.Create(nil);
   fSession    := TnxSession.Create(nil);
   fDatabase   := TnxDatabase.Create(nil);
   fTransport.ServerName := 'localhost';
   fServer.Transport     := fTransport;
   fSession.ServerEngine := fServer;
   fDatabase.Session     := fSession;
   fNumTables := -1;
   fTransport.HeartbeatInterval := 0;
end;

destructor TNexusDatabase.Destroy;
{*******************************************************************************
|
| Description        :  Initialises a new Nexus Database
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   if Assigned(fDatabase) then
      FreeAndNil(fDatabase);
   if Assigned(fSession) then
      FreeAndNil(fDatabase);
   if Assigned(fServer) then
      FreeAndNil(fDatabase);
   if Assigned(fTransport) then
      FreeAndNil(fDatabase);
   inherited;
end;

procedure TNexusDatabase.DeleteAlias(aAliasName: String);
begin
   fSession.Active := True;
   if Session.IsAlias(aAliasName) then
      Session.DeleteAlias(aAliasName);
end;

function TNexusDatabase.GetAliasName: String;
{*******************************************************************************
|
| Description        :  Getter for the AliasName property
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := fDatabase.AliasName;
end;

function TNexusDatabase.GetDatabaseNames: TStrings;
begin
   Result := TStringList.Create;
   Session.Active := True;
   Session.GetAliasNames(Result);
end;

function TNexusDatabase.GetConnected: Boolean;
begin
   Result := fDatabase.Connected;
end;

function TNexusDatabase.GetInTransaction: Boolean;
begin
   Result := fDatabase.InTransaction;
end;

function TNexusDatabase.GetUserName: String;
{*******************************************************************************
|
| Description        :
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110804 LIU   Created.
*******************************************************************************}
begin
   Result := '';
end;

function TNexusDatabase.GetPassword: String;
{*******************************************************************************
|
| Description        :
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110804 LIU   Created.
*******************************************************************************}
begin
   Result := '';
end;

procedure TNexusDatabase.SetUserName(const aUserName: String);
{*******************************************************************************
|
| Description        :
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110804 LIU   Created.
*******************************************************************************}
begin
   //
end;

procedure TNexusDatabase.SetPassword(const aPassword: String);
{*******************************************************************************
|
| Description        :
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110804 LIU   Created.
*******************************************************************************}
begin
   //
end;

function TNexusDatabase.GetNumTables: Integer;
{*******************************************************************************
|
| Description        :  Returns the number of tables in the database.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
var
   lTables: TStringList;
begin
   if fNumTables < 0 then
   begin
      lTables := GetTableNames;
      try
         fNumTables := lTables.Count;
      finally
         lTables.Free;
      end;
   end;
   Result := fNumTables;
end;

function TNexusDatabase.GetServerName: String;
{*******************************************************************************
|
| Description        :  Getter for the ServerName property
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := fTransport.ServerName;
   if Result = 'localhost' then
      Result := 'NexusDB';
end;

function TNexusDatabase.GetTableNames: TStringList;
{*******************************************************************************
|
| Description        :  Returns a list of all of the tables in the database.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := TStringList.Create;
   Session.GetTableNames(AliasName, Result);
end;

function  TNexusDatabase.GetStoredProcNames: TStringList;
var
   lStoredProcs, lStoredFuncs : TStringList;
begin
   Result := TStringList.Create;

   //Add stored procedures
   lStoredProcs := TStringList.Create;
   try
      fDatabase.GetStoredProcNames(lStoredProcs);
      Result.AddStrings(lStoredProcs);
   finally
      FreeAndNil(lStoredProcs);
   end;

   //Add stored functions
   lStoredFuncs := TStringList.Create;
   try
      fDatabase.GetStoredFuncNames(lStoredFuncs);
      Result.AddStrings(lStoredFuncs);
   finally
      FreeAndNil(lStoredFuncs);
   end;
end;

function  TNexusDatabase.GetTriggerNames: TStringList;
var
   lQry : ISQLQuery;
begin
   Result := TStringList.Create;
   lQry := NewQuery;
   try
      lQry.SQL.Add('SELECT TRIGGER_NAME from #triggers');
      lQry.Open;
      while not lQry.eof do
      begin
         Result.Add(lQry.FieldByName('TRIGGER_NAME').AsString);
         lQry.Next;
      end;
   finally
      lQry.Close;
      lQry := nil;
   end;
end;

function  TNexusDatabase.GetViewNames: TStringList;
var
   lQry : ISQLQuery;
begin
   Result := TStringList.Create;
   lQry := NewQuery;
   try
      lQry.SQL.Add('SELECT VIEW_NAME from #views');
      lQry.Open;
      while not lQry.eof do
      begin
         Result.Add(lQry.FieldByName('VIEW_NAME').AsString);
         lQry.Next;
      end;
   finally
      lQry.Close;
      lQry := nil;
   end;
end;

function TNexusDatabase.GetTimeout: Integer;
begin
   Result := fDatabase.Timeout;
end;

function TNexusDatabase.NewQuery: ISQLQuery;
{*******************************************************************************
|
| Description        :  Creates and returns a new TPosQuery
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110804 LIU   Changed to use TNexusQuery.
| 017357 20110418 MDA   Created.
*******************************************************************************}
var
   lQry: TNexusQuery;
begin
   lQry := TNexusQuery.Create(nil); 
   lQry.Database := fDatabase;
   Result := (lQry as ISQLQuery);
end;

function TNexusDatabase.NewTable: TnxTable;
{*******************************************************************************
|
| Description        :  Creates and returns a new TnxTable
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := TnxTable.Create(nil);
   Result.Database := fDatabase;
end;

procedure TNexusDatabase.SetAliasName(const aAlias: String);
{*******************************************************************************
|
| Description        :  Setter for the AliasName property
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   fDatabase.AliasName := aAlias;
end;

procedure TNexusDatabase.SetConnected(const aConnected: Boolean);
begin
   if aConnected and (not Connected) then
      Connect
   else
   begin
      fSession.Active := False;
      fDatabase.Active := False;
   end;
end;

procedure TNexusDatabase.SetServerName(const aServerName: String);
{*******************************************************************************
|
| Description        :  Setter for the ServerName property
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
var
   lConnected: Boolean;
begin
   lConnected := fServer.Transport.Active;
   fServer.Transport.Active := False;
   if aServerName = 'NexusDB' then
      fServer.Transport.ServerName := 'localhost'
   else
      fServer.Transport.ServerName := aServerName;
   if lConnected then
   begin
      fServer.Transport.Active := True;
      fSession.Active   := True;
   end;
end;

procedure TNexusDatabase.SetTimeout(const aTimeout: Integer);
begin
  inherited;
  fDatabase.Timeout := aTimeout;
end;

function  TNexusDatabase.GetStoredProcSQL(aStoredProcName : String) : string;
var
   lQry : ISQLQuery;
begin
   Result := '';
   lQry := NewQuery;
   try
      lQry.SQL.Add('SELECT FUNCTION_SOURCE as SOURCE from #functions WHERE FUNCTION_NAME = ' + QuotedStr(aStoredProcName));
      lQry.Open;
      if not lQry.eof then
      begin
         Result := 'DROP ROUTINE IF EXISTS "' + aStoredProcName + '";' + ^M + ^M
                    + lQry.FieldByName('SOURCE').AsString;
      end
      else
      begin
         lQry.Close;
         lQry.SQL.Clear;
         lQry.SQL.Add('SELECT PROCEDURE_SOURCE as SOURCE from #procedures WHERE PROCEDURE_NAME = ' + QuotedStr(aStoredProcName));
         lQry.Open;
         if not lQry.eof then
         begin
            Result := 'DROP ROUTINE IF EXISTS "' + aStoredProcName + '";' + ^M + ^M
                    + lQry.FieldByName('SOURCE').AsString
         end;
      end;
   finally
      lQry.Close;
      lQry := nil;
   end;
end;

function  TNexusDatabase.GetTriggerSQL(aTriggerName : String) : string;
var
   lQry : ISQLQuery;
begin
   Result := '';
   lQry := NewQuery;
   try
      lQry.SQL.Add('SELECT TRIGGER_SOURCE as SOURCE from #triggers WHERE TRIGGER_NAME = ' + QuotedStr(aTriggerName));
      lQry.Open;
      if not lQry.eof then
      begin
         Result := lQry.FieldByName('SOURCE').AsString;
      end;
   finally
      lQry.Close;
      lQry := nil;
   end;
end;

function  TNexusDatabase.GetViewSQL(aViewName : String) : string;
var
   lQry : ISQLQuery;
begin
   Result := '';
   lQry := NewQuery;
   try
      lQry.SQL.Add('SELECT VIEW_SOURCE as SOURCE from #views WHERE VIEW_NAME = ' + QuotedStr(aViewName));
      lQry.Open;
      if not lQry.eof then
      begin
         Result := lQry.FieldByName('SOURCE').AsString;
      end;
   finally
      lQry.Close;
      lQry := nil;
   end;
end;

end.
