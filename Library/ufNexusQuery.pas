unit ufNexusQuery;
{*******************************************************************************
|
| Description        :  Subclass of the Nexus TnxQuery that implements the
|                       ISQLQuery interface used in SMSPrepare and PosInstall.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| ********************* Version 4.8.1.1 ****************************************
| 014684 20110809 LIU   Added _AddRef and _Release.
| 017357 20110418 MDA   Created.
*******************************************************************************}
interface

uses
   Classes, DB, nxdb, ufISQLQuery;

type
   TNexusQuery = class(TnxQuery, ISQLQuery)
   private
      fRefCount : Integer;
      function  GetSQL: TStrings;
      function  GetEOF: Boolean;
      function  GetFieldCount: Integer;
      function  GetFields: TFields;
      function  GetActive: Boolean;
      function  GetPrepared: Boolean;
      function  GetParams: TParams;
      function  GetDataSet: TDataSet;
      function  GetRowsAffected : Integer;
   protected
      function _AddRef: Integer; stdcall;
      function _Release: Integer; stdcall;
   public
      constructor Create(AOwner: TComponent); override;
      function  FormatDate(aDate: TDateTime): String;
      function  NoLock: String; overload;
      function  NoLock(aTableName: String): String; overload;
      function  CharLengthExpr(const aField: String): String;
      procedure SetParams(const aParamNames : String; aParamValues : Variant);
      procedure SetDateParam(const aParamName : String; aDateTime : TDateTime);
      procedure SetUniDir(aValue : Boolean);
      property  DataSet : TDataSet read GetDataSet;
      property  RowsAffected     : Integer      read GetRowsAffected;
   end;

implementation

uses
   SysUtils;

constructor TNexusQuery.Create(AOwner: TComponent);
{*******************************************************************************
|
| Description        :  Default constructor and initializations.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110809 LIU   Created.
*******************************************************************************}
begin
   inherited;
   RequestLive := True;
   fRefCount := 0;
   Options := Options + [dsoRecNoSupport];
end;

function TNexusQuery._AddRef: Integer;
{*******************************************************************************
|
| Description        :  Override behaviour to allow reference counting and
|                       indirect cleanup (expected from interface usage).
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110809 LIU   Created.
*******************************************************************************}
begin
   Inc(fRefCount);
   Result := fRefCount;
end;

function TNexusQuery._Release: Integer;
{*******************************************************************************
|
| Description        :  Override behaviour to allow reference counting and
|                       indirect cleanup (expected from interface usage).
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110809 LIU   Created.
*******************************************************************************}
begin
   Dec(fRefCount);
   Result := fRefCount;
   if Result = 0 then Destroy;
end;

function  TNexusQuery.GetRowsAffected : Integer;
begin
   Result := RowsAffected;
end;

function TNexusQuery.CharLengthExpr(const aField: String): String;
{*******************************************************************************
|
| Description        :  Implementation of ISQLQuery CharLengthExpr. Returns the
|                       SQL expression to get the length of a Field.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := ' CHAR_LENGTH(' + aField + ') '; 
end;

function TNexusQuery.FormatDate(aDate: TDateTime): String;
{*******************************************************************************
|
| Description        :  Implementation of ISQLQuery FormatDate. Formats the date
|                       in a manner that can be used in an SQL where clause.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := ' TIMESTAMP ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', aDate));
end;

function TNexusQuery.GetActive: Boolean;
begin
   Result := inherited Active;
end;

function TNexusQuery.GetDataSet: TDataSet;
begin
   Result := (Self as TDataSet);
end;

function TNexusQuery.GetEOF: Boolean;
begin
   Result := inherited EOF;
end;

function TNexusQuery.GetFieldCount: Integer;
begin
   Result := inherited FieldCount;
end;

function TNexusQuery.GetFields: TFields;
begin
   Result := inherited Fields;
end;

function TNexusQuery.GetPrepared: Boolean;
begin
   Result := inherited Prepared;
end;

function TNexusQuery.GetSQL: TStrings;
begin
   Result := inherited SQL;
end;

function TNexusQuery.GetParams: TParams;
begin
   Result := inherited Params;
end;

function TNexusQuery.NoLock(aTableName: String): String;
{*******************************************************************************
|
| Description        :  Implementation of ISQLQuery NoLock. Nexus does not use
|                       locking hints.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := ' ' + aTableName + ' ';
end;

function TNexusQuery.NoLock: String;
{*******************************************************************************
|
| Description        :  Implementation of ISQLQuery NoLock. Nexus does not use
|                       locking hints.
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 017357 20110418 MDA   Created.
*******************************************************************************}
begin
   Result := ' ';
end;

procedure TNexusQuery.SetParams(const aParamNames: String; aParamValues: Variant);
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
   Params.ParamValues[aParamNames] := aParamValues;
end;

procedure TNexusQuery.SetDateParam(const aParamName: String; aDateTime: TDateTime);
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
   Params.ParamByName(aParamName).asDateTime := aDateTime;
end;

procedure TNexusQuery.SetUniDir(aValue : Boolean);
begin
   SetUniDirectional(aValue);
end;

end.
