unit ufPDXDatabase;
{*******************************************************************************
|
| Description        :  POS database class. Uses Paradox components to connect
|                       to a Paradox database.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| ********************* Version 4.8.1.1 ****************************************
| 014684 20110719 CFR   Created (based on DBE version).
*******************************************************************************}
interface

uses
   Classes, ufISQLDatabase, ufISQLQuery, dbTables;

type
   TPDXDatabase = class(TSQLDatabase)
   private
      fSession  : TSession;
      fDatabase : TDatabase;
      fTablesAffectedBySQL : array of TTable;
   protected
      function  GetInTransaction: Boolean; override;
      function  GetConnected: Boolean; override;
      procedure SetTimeout(const aTimeout: Integer); override;
      function  GetTimeout: Integer;   override;      
   public
      constructor Create;
      destructor  Destroy; override;

      function  NewQuery: ISQLQuery; override;
      procedure Connect; override;
      procedure StartTransaction(aTablesAffected : TStringList = nil); override;
      procedure Commit; override;
      procedure Rollback; override;
      function  GetTableNames: TStringList; override;
      function  GetStoredProcNames: TStringList; override;
      function  GetTriggerNames: TStringList; override;
      function  GetViewNames: TStringList; override;
      function  GetStoredProcSQL(aStoredProcName : String) : string; override;
      function  GetTriggerSQL(aTriggerName: String): string; override;
      function  GetViewSQL(aViewName: String): string; override;
      procedure DeleteAlias(aAliasName: String); override;
      procedure UsePipedTransport; override;

      function  GetServerName: String; override;
      function  GetAliasName: String;  override;
      function  GetUserName: String;   override;
      function  GetPassword: String;   override;
      procedure SetConnected(const aConnected: Boolean); override;
      procedure SetServerName(const aServerName: String); override;
      procedure SetAliasName(const aAliasName: String); override;
      procedure SetUserName(const aUserName: String);   override;
      procedure SetPassword(const aPassword: String);   override;
      function  Directory : string;

      property  ServerName : String   read GetServerName write SetServerName;
      property  AliasName  : String   read GetAliasName  write SetAliasName;
      property  UserName   : String   read GetUserName   write SetUserName;
      property  Password   : String   read GetPassword   write SetPassword;
      property  Session    : TSession read fSession      write fSession;
      property  InTransaction : Boolean         read GetInTransaction;
      property  Timeout    : Integer  read GetTimeout    write SetTimeout;
   end;

implementation

uses
   SysUtils, ufPDXQuery;

constructor TPDXDatabase.Create;
{*******************************************************************************
|
| Description        :  Initialises a new TPDXDatabase
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   inherited;
   fSession  := TSession.Create(nil);
   fDatabase := TDatabase.Create(fSession);
   fDataBase.TransIsolation := tiDirtyRead;
end;

destructor TPDXDatabase.Destroy;
{*******************************************************************************
|
| Description        :  
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   if Assigned(fDatabase)  then FreeAndNil(fDatabase);
   if Assigned(fSession)   then FreeAndNil(fSession);
   inherited;
end;

function  TPDXDatabase.GetTableNames: TStringList;
begin
   Result := TStringList.Create;
   fDataBase.GetTableNames(Result);
end;

function  TPDXDatabase.GetStoredProcNames: TStringList;
begin
   Result := TStringList.Create;
end;

function TPDXDatabase.GetTriggerNames: TStringList;
begin
   Result := TStringList.Create;
end;

function TPDXDatabase.GetViewNames: TStringList;
begin
   Result := TStringList.Create;
end;

function  TPDXDatabase.GetStoredProcSQL(aStoredProcName : String) : string;
begin
   Result := '';
end;

function  TPDXDatabase.GetTriggerSQL(aTriggerName : String) : string;
begin
   Result := '';
end;

function  TPDXDatabase.GetViewSQL(aViewName : String) : string;
begin
   Result := '';
end;

function TPDXDatabase.GetTimeout: Integer;
begin
//   Result := Timeout;
end;

procedure TPDXDatabase.StartTransaction(aTablesAffected : TStringList = nil);
var
   I : Integer;
begin
   if Assigned(aTablesAffected) and (aTablesAffected.Count <> 0) then
   begin
      SetLength(fTablesAffectedBySQL, aTablesAffected.Count);
      for I := 0 to aTablesAffected.Count - 1 do
      begin
         fTablesAffectedBySQL[I] := TTable.Create(nil);
         fTablesAffectedBySQL[I].DatabaseName := fDataBase.AliasName;
         fTablesAffectedBySQL[I].TableName := aTablesAffected[I];
         fTablesAffectedBySQL[I].Open;
         fTablesAffectedBySQL[I].LockTable(ltWriteLock);
      end;
   end;
   fDatabase.StartTransaction;
end;

procedure TPDXDatabase.Commit;
var
   I : Integer;
begin
   fDatabase.Commit;
   for I := 0 to Length(fTablesAffectedBySQL) - 1 do
   begin
      fTablesAffectedBySQL[I].UnLockTable(ltWriteLock);
      fTablesAffectedBySQL[I].Close;
      FreeAndNil(fTablesAffectedBySQL[I]);
   end;
end;

procedure TPDXDatabase.Rollback;
var
   I : Integer;
begin
   fDatabase.Rollback;
   for I := 0 to Length(fTablesAffectedBySQL) - 1 do
   begin
      fTablesAffectedBySQL[I].UnLockTable(ltWriteLock);
      fTablesAffectedBySQL[I].Close;
      FreeAndNil(fTablesAffectedBySQL[I]);
   end;
end;

procedure TPDXDatabase.Connect;
{*******************************************************************************
|
| Description        :  Creates the connection to the POS database.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   inherited;
   fSession.Active     := True;
   fDatabase.Connected := True;
   DoAfterConnect;
end;

function TPDXDatabase.GetConnected: Boolean;
begin
   Result := fDatabase.Connected;
end;

function TPDXDatabase.GetInTransaction: Boolean;
begin
   Result := fDatabase.InTransaction;
end;

function TPDXDatabase.GetPassword: String;
begin
   Result := fDatabase.Params.Values['PASSWORD'];
end;

function TPDXDatabase.GetServerName: String;
begin
   Result := ''; //not used for paradox tables (might return the folder?)
end;

function TPDXDatabase.GetUserName: String;
begin
   Result := fDatabase.Params.Values['USER NAME'];
end;

procedure TPDXDatabase.DeleteAlias(aAliasName: String);
begin
   fSession.Active := True;
   if Session.IsAlias(aAliasName) then
      Session.DeleteAlias(aAliasName);
end;

procedure TPDXDatabase.UsePipedTransport;
begin
   //nothing for Paradox
end;

function TPDXDatabase.NewQuery: ISQLQuery;
{*******************************************************************************
|
| Description        :  Creates and returns a new TPDXQuery
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
var
   lQry: TPDXQuery;
begin
   lQry := TPDXQuery.Create(nil);
   lQry.RequestLive := True;
   lQry.Database := fDatabase;
   Result := (lQry as ISQLQuery);
end;

function TPDXDatabase.GetAliasName: String;
{*******************************************************************************
|
| Description        :  Getter for the AliasName property
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   Result := fDatabase.AliasName;
end;

procedure TPDXDatabase.SetAliasName(const aAliasName: String);
{*******************************************************************************
|
| Description        :  Setter for the AliasName property
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   fDatabase.AliasName    := aAliasName;
   fDatabase.DatabaseName := aAliasName;
   fSession.SessionName   := aAliasName;
end;

procedure TPDXDatabase.SetConnected(const aConnected: Boolean);
begin
   fDatabase.Connected := aConnected;
end;

procedure TPDXDatabase.SetPassword(const aPassword: String);
begin
   fDatabase.Params.Values['PASSWORD']  := aPassword;
end;

procedure TPDXDatabase.SetServerName(const aServerName: String);
begin
   //ignored
end;

procedure TPDXDatabase.SetTimeout(const aTimeout: Integer);
begin
  inherited;
  //fDatabase.Timeout := aTimeout;
end;

procedure TPDXDatabase.SetUserName(const aUserName: String);
begin
   fDatabase.Params.Values['USER NAME'] := aUserName;
end;

function TPDXDatabase.Directory : string;
begin
   Result := fDatabase.Directory;
end;

end.
