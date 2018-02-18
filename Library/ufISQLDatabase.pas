unit ufISQLDatabase;
{*******************************************************************************
|
| Description        :  Abstract base class for a 'Database' - either a head
|                       office MSSQL database or a POS Nexus database.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| ********************* Version 4.9.16.1 ***************************************
| 024345 20140501 MDA   Added GetDatabaseNames function.
| ********************* Version 4.8.1.1 ****************************************
| 014684 20110719 CFR   Added Interface definition
| 017357 20110418 MDA   Created.
*******************************************************************************}
interface

uses
   Classes, ufISQLQuery;

type
   ISQLDatabase = interface
   ['{BF29F0B1-18E4-484D-92C4-DF87404A5147}']
      function  GetConnected: Boolean;
      function  GetServerName: String;
      function  GetAliasName: String;
      function  GetUserName: String;
      function  GetPassword: String;
      function  GetTimeout: Integer;
      procedure SetConnected(const aConnected: Boolean);
      procedure SetServerName(const aServerName: String);
      procedure SetAliasName(const aAliasName: String);
      procedure SetUserName(const aUserName: String);
      procedure SetPassword(const aPassword: String);
      procedure SetTimeout(const aTimeout: Integer);
      procedure DeleteAlias(aAliasName: String);
      function  GetInTransaction: Boolean;
      procedure Connect;
      function  NewQuery: ISQLQuery;
      function  GetDatabaseNames: TStrings;
      procedure StartTransaction(aTablesAffected : TStringList = nil);
      procedure Commit;
      procedure Rollback;
      function  GetTableNames: TStringList;
      function  GetStoredProcNames: TStringList;
      function  GetTriggerNames: TStringList;
      function  GetViewNames: TStringList;
      function  GetStoredProcSQL(aStoredProcName : String) : string;
      function  GetViewSQL(aViewName : String) : string;
      function  GetTriggerSQL(aTriggerName : String) : string;
      procedure UsePipedTransport;

      function  GetNextPrimaryKey(aTableName, aPrimaryKey: String): string;
      function  GetLastCode(aCode, aTableName, aInsertDateTime: String;
        var aReceiptRef: string; aRegisterCode: String = ''): String;

      property  InTransaction : Boolean  read GetInTransaction;
      property  Connected  : Boolean  read GetConnected  write SetConnected;
      property  ServerName : String   read GetServerName write SetServerName;
      property  AliasName  : String   read GetAliasName  write SetAliasName;
      property  UserName   : String   read GetUserName   write SetUserName;
      property  Password   : String   read GetPassword   write SetPassword;
      property  Timeout    : Integer  read GetTimeout    write SetTimeout;
   end;

   TAfterConnectEvent = procedure of object;

   TSQLDatabase = class(TInterfacedObject, ISQLDatabase)
   private
      fAfterConnect: TAfterConnectEvent;
      function GetNextAlphaSeq(AString: String; aStep: Integer = 1): String;
   protected
      function  GetInTransaction: Boolean; virtual; abstract;
      function  GetConnected: Boolean; virtual; abstract;
      function  GetServerName: String; virtual; abstract;
      function  GetAliasName: String; virtual; abstract;
      function  GetUserName: String;  virtual; abstract;
      function  GetPassword: String; virtual; abstract;
      procedure SetConnected(const aConnected: Boolean); virtual;
      procedure SetServerName(const aServerName: String); virtual; abstract;
      procedure SetAliasName(const aAliasName: String); virtual; abstract;
      procedure SetUserName(const aUserName: String); virtual; abstract;
      procedure SetPassword(const aPassword: String); virtual; abstract;
      function  GetTimeout: Integer; virtual; abstract;
      procedure SetTimeout(const aTimeout: Integer); virtual; abstract;
      procedure DoAfterConnect;
   public
      procedure Connect; virtual; abstract;
      procedure StartTransaction(aTablesAffected : TStringList = nil); virtual; abstract;
      procedure Commit; virtual; abstract;
      procedure Rollback; virtual; abstract;
      function  NewQuery: ISQLQuery; virtual; abstract;
      function  GetDatabaseNames: TStrings; virtual;
      function  GetTableNames: TStringList; virtual; abstract;
      function  GetStoredProcNames: TStringList; virtual; abstract;
      function  GetTriggerNames: TStringList; virtual; abstract;
      function  GetViewNames: TStringList; virtual; abstract;
      function  GetStoredProcSQL(aStoredProcName : String) : string; virtual; abstract;
      function  GetViewSQL(aViewName : String) : string; virtual; abstract;
      function  GetTriggerSQL(aTriggerName : String) : string; virtual; abstract;
      procedure DeleteAlias(aAliasName: String); virtual; abstract;
      procedure UsePipedTransport; virtual; abstract;

      function  GetNextPrimaryKey(aTableName, aPrimaryKey: String): string;
      function GetLastCode(aCode, aTableName, aInsertDateTime: String;
        var aReceiptRef: string; aRegisterCode: String = ''): String;
        
      property  AfterConnect : TAfterConnectEvent   read fAfterConnect   write fAfterConnect;
      property  Connected    : Boolean              read GetConnected    write SetConnected;
      property  ServerName   : String               read GetServerName   write SetServerName;
      property  AliasName    : String               read GetAliasName    write SetAliasName;
      property  UserName     : String               read GetUserName     write SetUserName;
      property  Password     : String               read GetPassword     write SetPassword;
      property  InTransaction  : Boolean         read GetInTransaction;
      property  Timeout    : Integer  read GetTimeout    write SetTimeout;
   end;

implementation

uses
   SysUtils;

procedure TSQLDatabase.DoAfterConnect;
{*******************************************************************************
|
| Description        :  Fires the AfterConnect event if it is assigned.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   -------------------------------------------------------
| 017357 20110622 MDA   Created.
*******************************************************************************}
begin
   if Assigned(fAfterConnect) then
      fAfterConnect;
end;

function TSQLDatabase.GetDatabaseNames: TStrings;
begin
   Result := nil;
end;

procedure TSQLDatabase.SetConnected(const aConnected: Boolean);
{*******************************************************************************
|
| Description        :  Setter for the Connected property.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   -------------------------------------------------------
| 017357 20110622 MDA   Created.
*******************************************************************************}
begin
   if aConnected and (not Connected) then
      Connect;
end;

function TSQLDatabase.GetNextPrimaryKey(aTableName, aPrimaryKey : String) : string;
var
   lQry : ISQLQuery;
   lMaxPK, lPKIndex : Integer;
   lPK : string;
begin
   Result := '';
   lMaxPK := 1;
   lQry := NewQuery;

   lQry.SQL.Clear;
   lQry.SQL.Add('select ' + aPrimaryKey + ' as pk from "' + aTableName +
                '" where (' + aPrimaryKey + ' like ''SMSDE_%'')' +
                ' and (' + aPrimaryKey + ' is not null)');
   try
      lQry.Open;
      if not lQry.eof then
      begin
         lQry.First;
         while not lQry.eof do
         begin
            lPK := lQry.FieldByName('pk').AsString;
            Delete(lPK, 1, 6);
            lPKIndex := StrToInt(lPK);
            if lMaxPK < lPKIndex then
            begin
               lMaxPK := lPKIndex;
            end;
            lQry.Next;
         end;
         Result := 'SMSDE_' + IntToStr(lMaxPK + 1);
         
      end
      else
      begin
         Result := 'SMSDE_1';
      end;
   finally
      lQry.Close;
      lQry := nil;
   end;
end;

function TSQLDatabase.GetNextAlphaSeq(AString: String; aStep : Integer = 1): String;
{*******************************************************************************
|
| Description       :   Takes an alphanumeric string and "increments" it -
|                       e.g.  GetNextAlphaSeq('11a') = '11b',
|                             GetNextAlphaSeq('19z') = '1a0'
|
| ******************************************************************************}
const
   DOMAIN = '0123456789abcdefghijklmnopqrstuvwxyz';
var
   lDomainMax : Integer;
   lDomainNum : Integer;
   lModPos    : Integer;
   lChar      : Char;
   lIncChar   : Boolean;
begin
   Result     := LowerCase(aString);
   lDomainMax := Length(DOMAIN);
   lModPos    := Length(aString);
   lIncChar   := True;
   while (lModPos >= 1) and lIncChar do
   begin
      lChar      := Result[lModPos];
      lDomainNum := Pos(lChar, DOMAIN);
      Inc(lDomainNum, aStep);
      if lDomainNum > lDomainMax then
      begin
         aStep        := lDomainNum div lDomainMax;
         lDomainNum   := lDomainNum mod lDomainMax;
      end
      else if (lDomainNum <= 0) then     //negative step!
      begin
         aStep        := (lDomainNum div lDomainMax)    - 1;
         lDomainNum   := 36 - Abs(lDomainNum mod lDomainMax);
      end
      else
         lIncChar     := False;
      Result[lModPos] := DOMAIN[lDomainNum];
      Dec(lModPos);
   end;
end;

function TSQLDatabase.GetLastCode(aCode : String; aTableName : String;
   aInsertDateTime : String; var aReceiptRef : string; aRegisterCode : String = '') : String;
var
   lLatestDateTime : TDateTime;
   lLatestCode, lLatestReceiptRef : String;
   lQry : ISQLQuery;
begin
   lLatestDateTime := 0;
   lLatestCode := '';
   lLatestReceiptRef := '';

   lQry := NewQuery;

   lQry.SQL.Clear;
   if aCode = 'sale_code' then
      lQry.SQL.Add('select sale.sale_code')
   else
      lQry.SQL.Add('select ' + aCode);
   if aCode = 'sale_code' then
      lQry.SQL.Add(', receipt_ref');

   if aCode = 'sale_code' then
      lQry.SQL.Add(', sale.insert_date_time from ' + aTableName)
   else
      lQry.SQL.Add(', ' + aInsertDateTime + ' from ' + aTableName);

   if aCode = 'sale_code' then
      lQry.SQL.Add(' join saleline on (sale.sale_code = saleline.sale_code)');  //get non-empty sale
   if aRegisterCode <> '' then
      lQry.SQL.Add('where register_code = ' + QuotedStr(aRegisterCode));

   lQry.Prepare;
   try
      lQry.Open;
      while not lQry.eof do
      begin
         if (lQry.FieldByName(aInsertDateTime).AsDateTime > lLatestDateTime) and
            (lQry.FieldByName(aInsertDateTime).AsDateTime < (Date + 1)) then
         begin
            lLatestDateTime := lQry.FieldByName(aInsertDateTime).AsDateTime;
            lLatestCode := lQry.FieldByName(aCode).AsString;
            if aCode = 'sale_code' then
               lLatestReceiptRef := lQry.FieldByName('receipt_ref').AsString;
         end;
         lQry.Next;
      end;
      Result := lLatestCode;
      aReceiptRef := lLatestReceiptRef;
   finally
      lQry.Close;
      lQry := nil;
   end;
end;

end.
