unit ufReference;
{*******************************************************************************
|
| Description      :
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| ********************* Version 4.9.18.5 ***************************************
| 024072 20140710 CRE   Created.
*******************************************************************************}
interface

uses Classes, Registry, Forms, SysUtils, Windows, DB,
   ufISQLDatabase, kbmMemTable, ufISQLQuery;

const
   REF_DATABASENAME  = 'ReferenceCon';
   REF_SESSION       = 'Default';

resourcestring
   rd__REFERENCE_0000 = 'Problem creating data storage list.';
   rd__REFERENCE_0001 = 'Registry Error.';
   rd__REFERENCE_0002 = 'Problem creating Transaction Object.';
   rd__REFERENCE_0003 = 'Problem creating Datastore Object.';
   rd__REFERENCE_0004 = 'Cannot read Register Level from SMSConfig.';
   rd__REFERENCE_0005 = 'Cannot read the Register table.';
   rd__REFERENCE_0006 = 'Cannot read Store Level from SMSConfig.';
   rd__REFERENCE_0007 = 'Cannot read the Store table.';
   rd__REFERENCE_0008 = 'Cannot read the Location table.';
   rd__REFERENCE_0009 = 'Cannot read RetailChain details.';
   rd__REFERENCE_0010 = 'Cannot read Global Level from SMSConfig.';

   rd__REFERENCE_0020 = 'Unable to Create Reference Object: ';
   rd__REFERENCE_0030 = 'Unable to read from the Registry at step[%d].';
   rd__COULDNT_CONNECT_TO_DB = 'Couldn''t connect to database. Check that BDE aliases are correctly configured';

   rd__REFERENCE_0100 = 'SMS has not been correctly configured.  The location_code is not present in the registry or the command line.';
   rd__REFERENCE_0110 = 'SMS has not been correctly configured.  The register_code (datacentre_local_ref) is not present in the registry or the command line.';
   rd__REFERENCE_0120 = 'SMS has not been correctly configured.  The registry entry ''remedipc_id'' is not present.';
   rd__REFERENCE_0130 = 'SMS has not been correctly configured.  There is no Register table entry for the remedipc_id of ';
   rd__REFERENCE_0140 = 'SMS has not been correctly configured.  There is no store_code entry in the Register table for the register_code of ';

   rd__ERROR_CONVERTING_TO_NUM = 'Problem converting the reference mnemonic %s to a number.';

type
   TRefTypes = (rtRegistry, rtRegister, rtStore, rtChain, rtLocation, rtConfig, rtConfigAll);

   TRefTypeSet = Set of TRefTypes;

   TRefObject = class
      RefType  : TRefTypeSet;
      DataType : TFieldType;
      Def      : Variant;
      High     : Variant;
      Low      : Variant;
   end; // TRefObject Class

   TRefRetailChainRec = class
      Code        : String;           // Stores Retail Chain Code
      Description : String;           // Stores Retail Chain Description
   end;

   TReference = Class
   private
      fSMSConfigOnly : Boolean;
      fData     : TStringList;
      fMemTable:  TKbmMemTable;

      procedure   Load_DataBase(const aRegisterCode: String);
      class function ConvertVariantToFloat(aValue: Variant; aDefault: Extended): Extended;
      procedure   ConfigureTable;
    function IV(aVariant: Variant): Integer;
   public
      constructor Create;
      destructor  Destroy; override;

      function    Exists(aMnemonic: string): Boolean;                      overload;

      function    Get(aMnemonic: string): variant;                         Overload;
      function    Get(aMnemonic: string; aDefault: variant): variant;      Overload;
      function    GetAsFloat(aMnemonic: string; aDefault: Extended): Extended; Overload;
      function    GetInt(aMnemonic: String; aDefault: Integer): Integer;

      function    GetLow(aMnemonic: string): variant;                      Overload;
      function    GetLow(aMnemonic: string; aDefault: variant): variant;   Overload;
      function    GetLowAsFloat(aMnemonic: string; aDefault: Extended): Extended; Overload;
      function    GetLowAsInt(aMnemonic: String; aDefault: Integer): Integer;

      function    GetHigh(aMnemonic: string): variant;                     Overload;
      function    GetHigh(aMnemonic: string; aDefault: variant): variant;  Overload;
      function    GetHighAsFloat(aMnemonic: string; aDefault: Extended): Extended; Overload;
      function    GetHighAsInt(aMnemonic: String; aDefault: Integer): Integer;

      procedure   LoadConfig(aRegisterCode: String; aSMSConfigOnly : Boolean);
      property    MT : TkbmMemTable read fMemTable;
      property    SMSConfigOnly : Boolean write fSMSConfigOnly;
   end; // TReference Class

var
   gRef: TReference;

implementation

uses uuGlobals
   , Variants
   ;

procedure TReference.ConfigureTable;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   if fMemTable.Active then
      fMemTable.Close;

   fMemTable.FieldDefs.Clear;
   fMemTable.IndexDefs.Clear;

   fMemTable.FieldDefs.Add('smsconfig_mnemonic', ftString, 24, false);
   fMemTable.FieldDefs.Add('default_value', ftString, 64, false);
   fMemTable.FieldDefs.Add('low_value', ftString, 64, false);
   fMemTable.FieldDefs.Add('high_value', ftString, 64, false);
   fMemTable.FieldDefs.Add('display_sequence', ftInteger, 0, false);
   fMemTable.FieldDefs.Add('active_ind', ftString, 1, false);
   fMemTable.FieldDefs.Add('level_ind', ftString, 1, false);
   fMemTable.FieldDefs.Add('level_code', ftString, 12, false);
   
   fMemTable.IndexDefs.Add('pk', 'smsconfig_mnemonic', [ixPrimary, ixUnique]);
   
   fMemTable.Open;
end;

class function TReference.ConvertVariantToFloat(aValue: Variant;
  aDefault: Extended): Extended;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
var
   lStrValue: string;
   i: Integer;
begin
   if aValue = null then
      Result := aDefault
   else if VarType(aValue) = varString then
   begin
      // replace the last '.' with the regional decimal seperator.
      lStrValue := aValue;
      for i := Length(lStrValue) downto 1 do
         if lStrValue[i] = '.' then
         begin
            lStrValue[i] := DecimalSeparator;
            Break;
         end;

      Result := StrToFloat(lStrValue);
   end
   else
      Result := aValue;
end;

constructor TReference.Create;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
var
   lExMsg:     string;
begin
   inherited;

   lExMsg := rd__REFERENCE_0000;
   fData := TStringList.Create;
   fData.Sorted := True;            // Allows binary searching.  Needed for finding duplicates.
   fMemTable := TkbmMemTable.Create(nil);
end;

destructor TReference.Destroy;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
var
   i: integer;
begin
   // Free all the objects contained in fData - this includes fRCList!
   for i := 0 to fData.Count - 1 do
      fData.Objects[i].Free;
   // Now dispose of fData
   FreeAndNil(fMemTable);
   FreeAndNil(fData);
   inherited;
end;

function TReference.Exists(aMnemonic: string): Boolean;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   Result := fMemTable.Locate('smsconfig_mnemonic', aMnemonic, [loCaseInsensitive]);
end;

function TReference.Get(aMnemonic: string; aDefault: variant): variant;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   Result := Get(aMnemonic);
   if Result = null then
      Result := aDefault;
end;

function TReference.Get(aMnemonic: string): variant;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   if Exists(aMnemonic) then
      Result := fMemTable.FieldByName('default_value').AsVariant
   else
      Result := null;
end;

function TReference.GetAsFloat(aMnemonic: string; aDefault: Extended): Extended;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   try
      Result := ConvertVariantToFloat(Get(aMnemonic), aDefault);
   except
      on e: Exception do
      begin
         Result := aDefault;
      end;
   end;
end;

function TReference.GetHigh(aMnemonic: string): variant;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   if Exists(aMnemonic) then
   begin
      if VarIsEmpty(fMemTable.FieldByName('high_value').AsVariant) then
         Result := null
      else
         Result := fMemTable.FieldByName('high_value').AsVariant;
   end
   else
      Result := null;
end;

function TReference.GetHigh(aMnemonic: string; aDefault: variant): variant;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   Result := GetHigh(aMnemonic);
   if Result = null then
      Result := aDefault;
end;

function TReference.GetHighAsFloat(aMnemonic: string;
  aDefault: Extended): Extended;
  {*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   try
      Result := ConvertVariantToFloat(GetHigh(aMnemonic), aDefault);
   except
      on e: Exception do
      begin
         Result := aDefault;
      end;
   end;
end;

function TReference.GetHighAsInt(aMnemonic: String; aDefault: Integer): Integer;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   try
      Result := IV(GetHigh(aMnemonic, aDefault));
   except
      on E: Exception do
      begin
         Result := aDefault;
      end;
   end;
end;

function TReference.GetInt(aMnemonic: String; aDefault: Integer): Integer;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   try
      Result := IV(Get(aMnemonic, aDefault));
   except
      on E: Exception do
      begin
         Result := aDefault;
      end;
   end;
end;

function TReference.GetLow(aMnemonic: string; aDefault: variant): variant;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   Result := GetLow(aMnemonic);
   if Result = null then
      Result := aDefault;
end;

function TReference.GetLow(aMnemonic: string): variant;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   if Exists(aMnemonic) then
   begin
      if VarIsEmpty(fMemTable.FieldByName('low_value').AsVariant) then
         Result := null
      else
         Result := fMemTable.FieldByName('low_value').AsVariant;
   end
   else
      Result := null;
end;

function TReference.GetLowAsFloat(aMnemonic: string;
  aDefault: Extended): Extended;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   try
      Result := ConvertVariantToFloat(GetLow(aMnemonic), aDefault);
   except
      on e: Exception do
      begin
         Result := aDefault;
      end;
   end;
end;

function TReference.GetLowAsInt(aMnemonic: String; aDefault: Integer): Integer;
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   try
      Result := IV(GetLow(aMnemonic, aDefault));
   except
      on E: Exception do
      begin
         Result := aDefault;
      end;
   end;
end;

procedure TReference.Load_DataBase(const aRegisterCode: String);
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
var
   lExMsg:     string;
   lQuery:     ISqlQuery;
   lStoreCode,
   lRegisterCode,
   lRetailChain: String;

   {----------------------------------------------------------------------------
   | LOCAL Procedure AddToList
   }
   procedure AddToList(aMnemonic, aDefault, aLow, aHigh: String;
      aSequence: Integer; aActive, aLevel, aCode: String);
   begin
   {*******************************************************************************
   |
   | Description        :
   |
   ********************************************************************************
   | Maintenance Log
   |
   | Task   Date     Who   Description
   | ------ -------- ---   --------------------------------------------------------
   | 024072 20141106 CRE   Created
   ********************************************************************************}
      if not Exists(aMnemonic) then
      begin
         fMemTable.Append;
         fMemTable.FieldByName('smsconfig_mnemonic').AsString := aMnemonic;
         fMemTable.FieldByName('default_value').AsString      := aDefault;
         fMemTable.FieldByName('low_value').AsString          := aLow;
         fMemTable.FieldByName('high_value').AsString         := aHigh;
         fMemTable.FieldByName('display_sequence').AsInteger  := aSequence;
         fMemTable.FieldByName('active_ind').AsString         := aActive;
         fMemTable.FieldByName('level_ind').AsString          := aLevel;
         fMemTable.FieldByName('level_code').AsString         := aCode;
         fMemTable.Post;
      end;
   end; // local procedure AddToList

   procedure AddSMSConfigDataSet(aDataSet: TDataSet);
   {*******************************************************************************
   |
   | Description        :
   |
   ********************************************************************************
   | Maintenance Log
   |
   | Task   Date     Who   Description
   | ------ -------- ---   --------------------------------------------------------
   | 024072 20141106 CRE   Created
   ********************************************************************************}
   var
      lMnemonic, lDefault, lLow, lHigh: String;
      lSequence: Integer;
      lActive, lLevel, lCode: String;
   begin
      aDataSet.First;
      while not aDataSet.EOF do
      begin
         lMnemonic := aDataSet.FieldByName('smsconfig_mnemonic').AsString;
         lDefault  := aDataSet.FieldByName('default_value').AsString;
         lLow      := aDataSet.FieldByName('low_value').AsString;
         lHigh     := aDataSet.FieldByName('high_value').AsString;
         lSequence := aDataSet.FieldByName('display_sequence').AsInteger;
         lActive   := aDataSet.FieldByName('active_ind').AsString;
         lLevel    := aDataSet.FieldByName('level_ind').AsString;
         lCode     := aDataSet.FieldByName('level_code').AsString;

         AddToList(lMnemonic, lDefault, lLow, lHigh, lSequence, lActive, lLevel, lCode);
         aDataSet.Next;
      end;
   end;

   procedure AddSMSConfigSQL(aSQL: String);
   {*******************************************************************************
   |
   | Description        :
   |
   ********************************************************************************
   | Maintenance Log
   |
   | Task   Date     Who   Description
   | ------ -------- ---   --------------------------------------------------------
   | 024072 20141106 CRE   Created
   ********************************************************************************}
   begin
      lQuery := gDatabase.NewQuery;
      lQuery.SQL.Add(aSQL);
      try
         lQuery.Open;
         try
            AddSMSConfigDataSet(lQuery.DataSet);
         finally
            lQuery.Close;
         end;
      finally
         lQuery := nil;
      end;
   end;

   procedure AddDataSetColumns(aDataSet: TDataSet; aLevel, aLevelCode: String);
   {*******************************************************************************
   |
   | Description        :
   |
   ********************************************************************************
   | Maintenance Log
   |
   | Task   Date     Who   Description
   | ------ -------- ---   --------------------------------------------------------
   | 024072 20141106 CRE   Created
   ********************************************************************************}
   var
      i : Integer;
   begin
      for i := 0 to aDataSet.FieldCount - 1 do
         AddToList(aDataSet.Fields[i].FieldName,
            aDataSet.Fields[i].AsString,
            EMPTY_STRING,
            EMPTY_STRING,
            0,
            IND_YES,
            aLevel,
            aLevelCode);
   end;

   procedure AddMiscSQL(aSQL, aLevel, aLevelCode: String);
   {*******************************************************************************
   |
   | Description        :
   |
   ********************************************************************************
   | Maintenance Log
   |
   | Task   Date     Who   Description
   | ------ -------- ---   --------------------------------------------------------
   | 024072 20141106 CRE   Created
   ********************************************************************************}
   begin
      lQuery := gDataBase.NewQuery;
      lQuery.SQL.Add(aSQL);
      try
         lQuery.Open;
         try
            AddDataSetColumns(lQuery.DataSet, aLevel, aLevelCode);
         finally
            lQuery.Close;
         end;
      finally
         lQuery := nil;
      end;
   end;

   function GetStoreCode(aRegisterCode: String): String;
   {*******************************************************************************
   |
   | Description        :
   |
   ********************************************************************************
   | Maintenance Log
   |
   | Task   Date     Who   Description
   | ------ -------- ---   --------------------------------------------------------
   | 024072 20141106 CRE   Created
   ********************************************************************************}
   begin
      Result := Copy(aRegisterCode, 1, 4);
   end;

   function GetRetailChainCode(aStoreCode: String): String;
   {*******************************************************************************
   |
   | Description        :
   |
   ********************************************************************************
   | Maintenance Log
   |
   | Task   Date     Who   Description
   | ------ -------- ---   --------------------------------------------------------
   | 024072 20141106 CRE   Created
   ********************************************************************************}
   begin
      lQuery := gDataBase.NewQuery;
      lQuery.SQL.Add('select retailchain_code from location where location_code = ' + QuotedStr(aStoreCode));
      try
         lQuery.Open;
         try
            if not lQuery.EOF then
               Result := lQuery.FieldByName('retailchain_code').AsString;
         finally
            lQuery.Close;
         end;
      finally
         lQuery := nil;
      end;
   end;

{-------------------------------------------------------------------------------
| MAIN BODY of TReference.Load_DataBase
}
begin
   lRegisterCode    := aRegisterCode;
   lStoreCode       := GetStoreCode(aRegisterCode);
   lRetailChain := GetRetailChainCode(lStoreCode);

   try // finally
      try // except
         lExMsg := rd__REFERENCE_0003;

         ConfigureTable;
         fMemTable.EmptyTable;

// SMSCONFIG

         {----------------------------------------------------------------------
         | Retrieve Register level details from SMSConfig (if any)
         }
         AddToList('register_code', aRegisterCode, EMPTY_STRING, EMPTY_STRING, 0, IND_YES, 'R', aRegisterCode);
         AddSMSConfigSQL(' select * from smsconfig' +
                '  where active_ind = ' + QuotedStr(IND_YES) +
                '    and (level_ind = ' + QuotedStr('R') +
                '    and level_code = ' + QuotedStr(aRegisterCode) + ')');

         {----------------------------------------------------------------------
         | Retrieve Store level details from SMSConfig (should be some)
         }
         AddToList('location_code', lStoreCode, EMPTY_STRING, EMPTY_STRING, 0, IND_YES, 'S', lStoreCode);
         AddSMSConfigSQL(' select * from smsconfig' +
                '  where active_ind = ' + QuotedStr(IND_YES) +
                '    and (level_ind = ' + QuotedStr('S') +
                '    and level_code = ' + QuotedStr(lStoreCode) + ')');

         {----------------------------------------------------------------------
         | Retrieve Retail Chain level details from SMSConfig (if any)
         }
         AddToList('retailchain_code', lRetailChain, EMPTY_STRING, EMPTY_STRING, 0, IND_YES, 'S', lStoreCode);
         AddSMSConfigSQL(' select * from smsconfig' +
                '  where active_ind = ' + QuotedStr(IND_YES) +
                '    and (level_ind = ' + QuotedStr('C') +
                '    and level_code = ' + QuotedStr(lRetailChain) + ')');

         {----------------------------------------------------------------------
         | Retrieve Global level details from SMSConfig (should be plenty)
         }
         AddSMSConfigSQL(' select * from smsconfig' +
                ' where (level_ind = ' + QuotedStr('A') +
                ' or level_ind = '''' or level_ind is null)');

// OTHER TABLES
         if not fSMSConfigOnly then
         begin
            {----------------------------------------------------------------------
            | Retrieve details from the register table.
            }
            lExMsg := rd__REFERENCE_0005;
            AddMiscSQL('select * from register' +
                   '  where register_code = ' + QuotedStr(lRegisterCode), 'R', aRegisterCode);

            {----------------------------------------------------------------------
            | Retrieve details from the store table.
            }
            lExMsg := rd__REFERENCE_0007;
            AddMiscSQL(' select * from store' +
                   '  where active_ind = ' + QuotedStr(IND_YES) +
                   '    and store_code = ' + QuotedStr(lStoreCode), 'S', lStoreCode);

            {----------------------------------------------------------------------
            | Retrieve details from the location table.
            }
            lExMsg := rd__REFERENCE_0008;
            AddMiscSQL(' select * from location' +
                   '  where active_ind = ' + QuotedStr(IND_YES) +
                   '    and type_ind = ' + QuotedStr('S') +
                   '    and location_code = ' + QuotedStr(lStoreCode), 'S', lStoreCode);

            {----------------------------------------------------------------------
            | Retrieve details from the retailchain table.
            }
            lExMsg := rd__REFERENCE_0009;
            AddMiscSQL(' select * from retailchain' +
                   '  where active_ind = ' + QuotedStr(IND_YES) +
                   '    and retailchain_code = ' + QuotedStr(lRetailChain), 'C', lRetailChain);
         end;
      except
         on e: Exception do
         begin
            raise exception.create(lExMsg + e.message);
         end; // on exception
      end; // try...except

   finally
   end; // try...finally
end;

procedure TReference.LoadConfig(aRegisterCode: String; aSMSConfigOnly : Boolean);
{*******************************************************************************
|
| Description        :
|
********************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 024072 20141106 CRE   Created
********************************************************************************}
begin
   if not Assigned(gRef) then
      gRef := TReference.Create;
   gRef.SMSConfigOnly := aSMSConfigOnly;
   gRef.Load_Database(aRegisterCode);
end;

function TReference.IV(aVariant: Variant): Integer;
begin
   if VarType(aVariant) = varString then
   begin
      if (aVariant = '') or (aVariant = '0') then
         Result := 0
      else
         Result := StrToInt(aVariant);
   end
   else if VarIsEmpty(aVariant) or (aVariant = null) then
      Result := 0
   else
      Result := aVariant;
end; // function IV

end.
