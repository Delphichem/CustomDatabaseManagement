unit ufPDXQuery;
{*******************************************************************************
|
| Description        :  Subclass of the TFQuery that implements the
|                       ISQLQuery interface.
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
   Classes, DB, ufTFQuery, ufISQLQuery;

type
   TPdxQuery = class(TFQuery, ISQLQuery)
   private
      fRefCount : Integer;
      function  GetSQL: TStrings;
      function  GetEOF: Boolean;
      function  GetFieldCount: Integer;
      function  GetFields: TFields;
      function  GetActive: Boolean;
      function  GetParams: TParams;
      function  GetPrepared: Boolean;
      function  GetDataset: TDataSet;
      function  GetRowsAffected : Integer;
   protected
      function _AddRef: Integer; stdcall;
      function _Release: Integer; stdcall;
   public
      constructor Create(AOwner: TComponent); override;

      procedure SetParams(const aParamNames : String; aParamValues : Variant);
      procedure SetDateParam(const aParamName : String; aDateTime : TDateTime);
      function  FormatDate(aDate: TDateTime): String;
      function  NoLock: String; overload;
      function  NoLock(aTableName: String): String; overload;
      function  CharLengthExpr(const aField: String): String;
      procedure SetUniDir(aValue : Boolean);
      property  RowsAffected     : Integer      read GetRowsAffected;
   end;

implementation

uses
   SysUtils;

const
   DT_QUERY_DATE_FORMAT          = 'mm/dd/yyyy hh:nn:ss';         // Date format for queries.   

constructor TPdxQuery.Create(AOwner: TComponent); 
{*******************************************************************************
|
| Description        :  Default constructor and initializations.
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
   fRefCount := 0;
end;

function TPdxQuery._AddRef: Integer;
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
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   Inc(fRefCount);
   Result := fRefCount;
end;

function TPdxQuery._Release: Integer;
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
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   Dec(fRefCount);
   Result := fRefCount;
   if Result = 0 then Destroy;
end;

function  TPdxQuery.GetRowsAffected : Integer;
begin
   Result := RowsAffected;
end;

function TPdxQuery.CharLengthExpr(const aField: String): String;
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
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   Result := ' LEN(' + aField + ') ';
end;

function TPdxQuery.FormatDate(aDate: TDateTime): String;
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
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   Result := (FormatDateTime(DT_QUERY_DATE_FORMAT, aDate));
end;

function TPdxQuery.GetActive: Boolean;
begin
   Result := inherited Active;
end;

function TPdxQuery.GetDataset: TDataSet;
begin
   Result := inherited Dataset;
end;

function TPdxQuery.GetEOF: Boolean;
begin
   Result := inherited EOF;
end;

function TPdxQuery.GetFieldCount: Integer;
begin
   Result := inherited FieldCount;
end;

function TPdxQuery.GetFields: TFields;
begin
   Result := inherited Fields;
end;

function TPdxQuery.GetParams: TParams;
begin
   Result := inherited Params;
end;

function TPdxQuery.GetPrepared: Boolean;
begin
   Result := inherited Prepared;
end;

function TPdxQuery.GetSQL: TStrings;
begin
   Result := inherited SQL;
end;

procedure TPdxQuery.SetDateParam(const aParamName: String; aDateTime: TDateTime);
{*******************************************************************************
|
| Description     :     Special considerations for a DateTime paramater
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   Params.ParamByName(aParamName).asDateTime := aDateTime;
end;

procedure TPdxQuery.SetParams(const aParamNames: String; aParamValues: Variant);
{*******************************************************************************
|
| Description     :     Generic method to set a parameter value
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 014684 20110719 CFR   Created.
*******************************************************************************}
begin
   Params.ParamValues[aParamNames] := aParamValues;
end;

function TPdxQuery.NoLock(aTableName: String): String;
{*******************************************************************************
|
| Description        :  Implementation of ISQLQuery NoLock. Paradox does not use
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

function TPdxQuery.NoLock: String;
{*******************************************************************************
|
| Description        :  Implementation of ISQLQuery NoLock. Paradox does not use
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

procedure TPdxQuery.SetUniDir(aValue : Boolean);
begin
   SetUniDirectional(aValue);
end;

end.
