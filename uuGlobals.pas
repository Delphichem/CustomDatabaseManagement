unit uuGlobals;
{
  Oct/Nov 2014 Code By: Daniel Campbell
}
interface

uses
   Windows, Classes, SMDBGrid, DB, Graphics, ufISQLDataBase;

const
   POS_DIRECTORY = '\SOFTWARE\RMS\POS';
   WS_DIRECTORY = '\SOFTWARE\RMS\WS';
   KEY_DIRECTORY = '\SOFTWARE\RMS\POS\SMSDE';
   SHELL_DIRECTORY = '\SOFTWARE\MICROSOFT\WINDOWS NT\CURRENTVERSION\WINLOGON';
   NO_COLUMN_HINT = 'No Hint Available';
   NO_OF_TABS = 10;
   CUSTOM_SQL = 'SELECT';
   EMPTY_TABLE_PASSWORD = 'rmsbravo';
   EDITOR_PASSWORD = 'dev';
   POS_DATABASE_DIRECTORY = 'C:\POS\Datacentres';
   PERSONAL_INI = 'Personal.ini';
   MAIN_INI = 'SMSDataEditor.ini';
   WITH_NO_LOCK = 'with (nolock)';
   NO_LOCK = '(nolock)';
   EMPTY_STRING = '';
   IND_YES = 'Y';
   IND_NO = 'N';
   INI_ENTER = '<ENTER>';

   //OPTION DEFAULTS
   NON_ACTIVE_COLOUR = $00BFCEFF;
   FILTER_COLOR = $00AAFFFF;
   FOOTER_COLOR = clBtnFace;
   SELECTED_COLOR = $00FFB3B3;
   SELECT_COLOR = clPurple;
   UPDATE_COLOR = clBlue;
   INSERT_COLOR = clGreen;
   DELETE_COLOR = clRed;
   WHERE_COLOR = clMaroon;
   GROUP_BY_COLOR = clAqua;
   ORDER_BY_COLOR = clOlive;
   JOIN_COLOR = clLime;
   SCHEMA_DIR = 'C:\Program Files\Datagenie\Schema';
   MOUSE_SCROLL = '5';
   BACKGROUND = clWhite;
   ODD_COLOR = clInactiveBorder;
   TYPE_COLORS = True;
   STRING_COLOR = $00D8F3DB;
   INTEGER_COLOR = $00FFE8E8;
   FLOAT_COLOR = $00CEFFFF;
   DATETIME_COLOR = $00FFDFFF;
   CURRENCY_COLOR = $00D7EBFF;
   DB_TIMEOUT = '100';

   { Datatype constants used by DataGenie }
   { Register all used datatypes here     }
   DT_CHAR				= 'char';
	DT_VARCHAR		   = 'varchar';
	DT_DECIMAL			= 'decimal';
	DT_NUMERIC			= 'numeric';
	DT_SMALLINT			= 'smallint';
	DT_INTEGER			= 'integer';
	DT_REAL				= 'real';
	DT_FLOAT				= 'float';
	DT_DOUBLEPREC		= 'double precision';
	DT_LONGVARBIN		= 'long varbinary';
	DT_TIMESTAMP		= 'timestamp';
   DT_TEXT				= 'text';
   DT_NVARCHAR			= 'nvarchar';
	DT_NCHAR				= 'nchar';
   DT_V_LANGTRAN		= 'languagetrans';
   DT_BIGINT         = 'bigint';       //SQL server only
   DT_VARCHAR_MAX    = 'varchar(max)'; //SQL server only
      
type
  // type used in column addition and editing udDlgColumn
  TDialogMode = (dmNew, dmEdit);

  TSettings = Record
     ColInactive : TColor;
     ColFilter : TColor;
     ShowRows : Boolean;
     UppercaseSQL : Boolean;
     AutoRefresh : Boolean;
     SchemaDir : String;
     BranchDir : String;
     ReposDir : string;
     TrunkDir : String;
     TrunkReposDir : string;
     MouseScroll : String;
     ColBackGround : TColor;
     ColOdd : TColor;
     ColFooter : TColor;
     SelectedBold : Boolean;
     NewRecView : Boolean;
     RollbackSQL : Boolean;
     TypeColours : Boolean;
     ColString : TColor;
     ColInteger : TColor;
     ColFloat : TColor;
     ColDateTime : TColor;
     ColCurrency : TColor;
     RemoteNexus : Boolean;
     ColSelected : TColor;
     AutoFilterReg : Boolean;
     AutoFilterLoc : Boolean;
     DBTimeout : string;
     EmployeeCode : string;
     AppCode : string;
  end;

type
  DatabaseType = String;
const
  dtUnknown = 'U';
  dtMSSQL = 'M';
  dtNexus = 'N';
  dtParadox = 'P';

function GetRegistry(aKey : String; aKeyDir : String = KEY_DIRECTORY;
   aRootKey : Cardinal = HKEY_CURRENT_USER) : String;
procedure SetRegistry(aRegVal : String;
   aKey : String; aKeyDir : String = KEY_DIRECTORY; aRootKey : Cardinal = HKEY_CURRENT_USER);
function ExtractAliasNumber(aWorkingDirectory : String): String;
function GetTableName(aSQL : String) : String;
function GetTableNames(aSQL : String; var aAliases : TStringList) : TStringList;
function GetValFromString(aStr : String) : String;
procedure SplitSQL(var aStrList : TStringList; aSQL : String; aDelimiter : Char; aStrict : Boolean);
function msecToTime(msec:Int64) : String;
function RegStrToBool(aStr : String) : Boolean;
function RegBoolToStr(aBool : Boolean) : String;
function GetIndexOfWord(lStrList : TStringList; aWord : String) : Integer;
function ChooseFolder(var aNotChosen : Boolean;
   aCaption : String; aDefaultFolder : String; aOwner: TComponent) : String;
function OpenFile(aCSV : Boolean; var aNotChosen : Boolean;
   aCaption : String; aDefaultFolder : String; aOwner: TComponent) : String;
function SaveFile(aCSV : Boolean; var aNotChosen : Boolean;
   aCaption : String; aDefaultFile : String; aOwner: TComponent) : String;
function GetTableHint(aTableName : String; aSchemaDir : String) : String;
function GetTableNamesFromSchema : TStringList;
function FieldTypeToString(aFieldType: TFieldType): String;
function DisplaySQL(aSQL : String) : String;
procedure LoadSettings;
function IsNexusServerNamePiped(aServerName : String) : Boolean;
procedure CommitSMSIni;


var
   gSettings : TSettings;
   gWin7 : Boolean;
   gDBType : DataBaseType;
   gDataBase : ISQLDataBase;
   gMyStoreCode : String;
   gMyRegisterCode : String;
   gAppPath : String;

implementation

uses
  Registry, SysUtils, Dialogs, FileCtrl, StrUtils, ShellAPI;

function DisplaySQL(aSQL : String) : String;
begin
   if gSettings.UppercaseSQL then
      Result := Uppercase(aSQL)
   else
      Result := Lowercase(aSQL);
end;

function GetRegistry(aKey : String; aKeyDir : String = KEY_DIRECTORY;
   aRootKey : Cardinal = HKEY_CURRENT_USER) : String;
var
   key : String;
begin
   Result := '';
   with TRegistry.Create do
   begin
      RootKey := aRootKey;
      try
         key := aKeyDir;
         if OpenKey(key, false) then
         begin
            if ValueExists(aKey) then
            begin
               Result := ReadString(aKey);
            end;
         end;
      finally
         CloseKey();
         Free;
      end;
   end;
end;

procedure SetRegistry(aRegVal : String;
   aKey : String; aKeyDir : String = KEY_DIRECTORY; aRootKey : Cardinal = HKEY_CURRENT_USER);
var
   key : String;
begin
   with TRegistry.Create do
   begin
      RootKey := aRootKey;
      try
         key := aKeyDir;
         if OpenKey(key, True) then
         begin
            WriteString(aKey, aRegVal);
         end;
      finally
         CloseKey();
         Free;
      end;
   end;
end;

function ExtractAliasNumber(aWorkingDirectory : String) : String;
var
  PosOfDataBase : Integer;
begin
  Result := aWorkingDirectory;
  PosOfDataBase := AnsiPos('\Database', aWorkingDirectory);
  if PosOfDataBase <> 0 then
     Delete(Result, PosOfDataBase, 9) //delete end part
  else //maybe its Nexus
  begin
     PosOfDataBase := AnsiPos('\DB', aWorkingDirectory);
     Delete(Result, PosOfDataBase, 3); //delete end part
  end;
  Delete(Result, 1, PosOfDataBase - 3); //delete start part
end;

function GetTableName(aSQL : String) : String;
var
   lLineStrList : TStringList;
   I : Integer;
begin
   Result := '';
   lLineStrList := TStringList.Create;
   try
      SplitSQL(lLineStrList, Trim(aSQL),' ', False);

      if Uppercase(lLineStrList[0]) = 'SELECT' then
      begin
         for I := 0 to lLineStrList.Count - 1 do
         begin
            if Uppercase(lLineStrList[I]) = 'FROM' then
            begin
               if I <> lLineStrList.Count - 1 then
                  Result := LowerCase(lLineStrList[I+1]);
            end;
         end;
      end
      else if Uppercase(lLineStrList[0]) = 'UPDATE' then
         Result := LowerCase(lLineStrList[1])
      else if Uppercase(lLineStrList[0]) = 'INSERT' then
         Result := LowerCase(lLineStrList[2])
      else if Uppercase(lLineStrList[0]) = 'DELETE' then
      begin
         if Uppercase(lLineStrList[2]) = 'FROM' then
            Result := LowerCase(lLineStrList[3])
         else
            Result := LowerCase(lLineStrList[2]);
      end;
   finally
      FreeAndNil(lLineStrList);
   end;
end;

function GetTableNames(aSQL : String; var aAliases : TStringList) : TStringList;
var
   lWords, lAliases : TStringList;
   lIndexOfWord : Integer;
   lPossAlias : string;
begin
   Result := TStringList.Create;

   lWords := TStringList.Create;
   try
      SplitSQL(lWords, aSQL,' ', False);
      if lWords.Count > 0 then
      begin
         if (Uppercase(lWords[0]) = 'SELECT') then
         begin
            lIndexOfWord := GetIndexOfWord(lWords, 'FROM');
            if (lIndexOfWord <> -1) and (lWords.Count > (lIndexOfWord + 1)) then
            begin
               Result.Add(lWords[lIndexOfWord + 1]);
               //add possible aliases
               if Assigned(aAliases) then
               begin
                  if (lWords.Count > (lIndexOfWord + 2)) then
                  begin
                     lPossAlias := UpperCase(lWords[lIndexOfWord + 2]);
                     if (lPossAlias <> 'JOIN') and (lPossAlias <> 'WHERE') and
                        (lPossAlias <> 'GROUP') and (lPossAlias <> 'ORDER') then
                        aAliases.Add(lPossAlias)
                     else
                        aAliases.Add('');
                  end
                  else
                     aAliases.Add('');
               end;
            end;

            //find all instances of join, this only gets the first one
            lIndexOfWord := GetIndexOfWord(lWords, 'JOIN');
            if (lIndexOfWord <> -1) and (lWords.Count > (lIndexOfWord + 1)) then
            begin
               Result.Add(lWords[lIndexOfWord + 1]);
               //add possible aliases
               if Assigned(aAliases) then
               begin
                  if (lWords.Count > (lIndexOfWord + 2)) then
                  begin
                     lPossAlias := UpperCase(lWords[lIndexOfWord + 2]);
                     if (lPossAlias <> 'ON') then
                        aAliases.Add(lPossAlias)
                     else
                        aAliases.Add('');
                  end
                  else
                     aAliases.Add('');
               end;
            end;
         end
         else if (Uppercase(lWords[0]) = 'UPDATE') then
         begin
            if lWords.Count > 1 then
            begin
               Result.Add(LowerCase(lWords[1]));
               if Assigned(aAliases) then
               begin
                  if lWords.Count > 2 then
                     aAliases.Add(lWords[2])
                  else
                     aAliases.Add('');
               end;
            end;
         end
         else if (Uppercase(lWords[0]) = 'INSERT') then
         begin
            if lWords.Count > 2 then
            begin
               Result.Add(LowerCase(lWords[2]));
               if Assigned(aAliases) then
               begin
                  if lWords.Count > 3 then
                     aAliases.Add(lWords[3])
                  else
                     aAliases.Add('');
               end;
            end;
         end
         else if (Uppercase(lWords[0]) = 'DELETE') then
         begin
            if (lWords.Count > 2) and (Uppercase(lWords[2]) = 'FROM') then
            begin
               if (lWords.Count > 3) then
               begin
                  Result.Add(LowerCase(lWords[3]));
                  if Assigned(aAliases) then
                  begin
                     if lWords.Count > 4 then
                        aAliases.Add(lWords[4])
                     else
                        aAliases.Add('');
                  end;
               end;
            end
            else
            begin
               if (lWords.Count > 2) then
               begin
                  Result.Add(LowerCase(lWords[2]));
                  if Assigned(aAliases) then
                  begin
                     if lWords.Count > 3 then
                        aAliases.Add(lWords[3])
                     else
                        aAliases.Add('');
                  end;
               end;
            end;
         end;
      end;
   finally
      FreeAndNil(lWords);
   end;
end;

procedure SplitSQL(var aStrList : TStringList; aSQL : String; aDelimiter : Char; aStrict : Boolean);
begin
   if AnsiPos(aDelimiter, aSQL) <> 0 then
   begin
      aStrList.Clear;
      aStrList.StrictDelimiter := aStrict;
      aStrList.Delimiter := aDelimiter;
      aStrList.DelimitedText := aSQL;
   end
   else
      aStrList.Add(aSQL);
end;

function msecToTime(msec:Int64) : String;
//var
//   secs : Integer;
begin
   //secs := Trunc(msec / 1000);
   Result := IntToStr(msec);
end;

function GetValFromString(aStr : String) : String;
var
   lPosOfEqual : Integer;
begin
   Result := aStr;
   lPosOfEqual := AnsiPos('=', aStr);
   Delete(Result,1,lPosOfEqual);
end;

function RegStrToBool(aStr : String) : Boolean;
begin
   //should be done with a ifthen ternary statement
   if aStr = 'Y' then
      Result := True
   else
      Result := False;
end;

function RegBoolToStr(aBool : Boolean) : String;
begin
   if aBool then
      Result := 'Y'
   else
      Result := 'N';
end;

function GetIndexOfWord(lStrList : TStringList; aWord : String) : Integer;
var
   I : Integer;
begin
   Result := -1;
   for I := 0 to lStrList.Count - 1 do
   begin
      if Uppercase(lStrList[I]) = aWord then
         Result := I;
   end;
end;

function ChooseFolder(var aNotChosen : Boolean;
   aCaption : String; aDefaultFolder : String; aOwner: TComponent) : String;
var
  OpenDialog: TFileOpenDialog;
begin
   Result := '';
   aNotChosen := False;
   if gWin7 then
      OpenDialog := TFileOpenDialog.Create(aOwner);
   try
      if gWin7 then
      begin
         if DirectoryExists(aDefaultFolder) then
            OpenDialog.DefaultFolder := aDefaultFolder;

         OpenDialog.Options := OpenDialog.Options + [fdoPickFolders];

         if (not OpenDialog.Execute) then
            aNotChosen := True
         else
            Result := OpenDialog.FileName;
      end
      else
      begin
         aNotChosen := not SelectDirectory(aCaption, aDefaultFolder, Result, [sdNewFolder]);
      end;
   finally
      if gWin7 then
         OpenDialog.Free;
   end;

end;

function OpenFile(aCSV : Boolean; var aNotChosen : Boolean;
   aCaption : String; aDefaultFolder : String; aOwner: TComponent) : String;
var
   OpenDialog: TFileOpenDialog;
   Dialog : TOpenDialog;
begin
   aNotChosen := True;
   if gWin7 then
      OpenDialog := TFileOpenDialog.Create(aOwner)
   else
      Dialog := TOpenDialog.Create(aOwner);
   try
      if gWin7 then
      begin
         if aCSV then
         begin
            with OpenDialog.FileTypes.Add do
            begin
               DisplayName := 'csv file';
               FileMask := '*.csv';
            end;
         end;
         OpenDialog.DefaultFolder := aDefaultFolder;
         aNotChosen := not OpenDialog.Execute;
         Result := OpenDialog.FileName;
      end
      else
      begin
         //Dialog.Filter :=
         Dialog.InitialDir := aDefaultFolder;
         aNotChosen := not Dialog.Execute;
         Result := Dialog.FileName;
      end;
   finally
      if gWin7 then
         OpenDialog.Free
      else
         Dialog.Free;
   end;

end;

function SaveFile(aCSV : Boolean; var aNotChosen : Boolean;
   aCaption : String; aDefaultFile : String; aOwner: TComponent) : String;
var
   SaveDialog: TFileSaveDialog;
   Dialog : TSaveDialog;
begin
   aNotChosen := True;
   if gWin7 then
      SaveDialog := TFileSaveDialog.Create(aOwner)
   else
      Dialog := TSaveDialog.Create(aOwner);
   try
      if gWin7 then
      begin
         if aCSV then
         begin
            SaveDialog.DefaultExtension := 'csv';
            with SaveDialog.FileTypes.Add do
            begin
               DisplayName := 'csv file';
               FileMask := '*.csv';
            end;
         end;
         SaveDialog.FileName := aDefaultFile;
         aNotChosen := not SaveDialog.Execute;
         Result := SaveDialog.FileName;
      end
      else
      begin
         //Dialog.Filter :=
         Dialog.InitialDir := aDefaultFile;
         aNotChosen := not Dialog.Execute;
         Result := Dialog.FileName;
      end;
   finally
      if gWin7 then
         SaveDialog.Free
      else
         Dialog.Free;
   end;

end;

function GetTableHint(aTableName : String; aSchemaDir : String) : String;
var
  lDDLFile : TextFile;
  lLine : String;
begin
  Result := NO_COLUMN_HINT;
  if FileExists(aSchemaDir + '\' + aTableName + '.ddl') then
  begin
    AssignFile(lDDLFile, aSchemaDir + '\' + aTableName + '.ddl');
    Reset(lDDLFile);
    try
       while not EOF(lDDLFile) do
       begin
          ReadLn(lDDLFile, lLine);
          if AnsiStartsStr('%^table comments = ', Trim(lLine)) then
          begin
                Delete(lLine, 1, 20);
                Delete(lLine, Length(lLine), 1);
                Result := lLine;
          end;
       end;
    finally
       CloseFile(lDDLFile);
    end;
  end;
end;

function GetTableNamesFromSchema : TStringList;
var
   searchResult : TSearchRec;
   tbl : string;
begin
   Result := TStringList.Create;

   if FindFirst(gSettings.SchemaDir + '\*.ddl', faAnyFile, searchResult) = 0 then
   begin
      repeat
         tbl := searchResult.Name;
         Delete(tbl, Length(tbl) - 3, 4); //Delete '.ddl'
         Result.Add(tbl);
      until FindNext(searchResult) <> 0;
      FindClose(searchResult);
   end;
end;

function FieldTypeToString(aFieldType: TFieldType): String;
begin
   case aFieldType of
   ftUnknown:
      Result := 'Unknown';
   ftString:
      Result := 'String';
   ftSmallInt:
      Result := 'SmallInt';
   ftInteger:
      Result := 'Integer';
   ftWord:
      Result := 'Word';
   ftBoolean:
      Result := 'Boolean';
   ftFloat:
      Result := 'Float';
   ftCurrency:
      Result := 'Currency';
   ftBCD:
      Result := 'BCD';
   ftDate:
      Result := 'Date';
   ftTime:
      Result := 'Time';
   ftDateTime:
      Result := 'DateTime';
   ftBytes:
      Result := 'Bytes';
   ftVarBytes:
      Result := 'VarBytes';
   ftAutoInc:
      Result := 'AutoInc';
   ftBlob:
      Result := 'Blob';
   ftMemo:
      Result := 'Memo';
   ftGraphic:
      Result := 'Graphic';
   //ftFmtMemo:
      //Result := rd__GLOBALFUNCTIONS_0059;
   ftParadoxOle:
      Result := 'Paradox OLE';
   ftDBaseOle:
      Result := 'dBase OLE';
   ftTypedBinary:
      Result := 'Typed binary';
   end;
end;

procedure LoadSettings;
var
   lColInactive : String;
   lColFilter : String;
   lColBackground : String;
   lColOdd : String;
   lColFooter : String;
   lColSelected : String;
   lTypeColours : String;
   lColString : String;
   lColInteger : String;
   lColFloat : String;
   lColDateTime : String;
   lColCurrency : String;
   lSelectedBold : String;
   lNewRecView : String;
   lShowRows : String;
   lAutoRefresh : String;
   lRollbackSQL : String;
   lUppercaseSQL : String;
   lSchemaDir : String;
   lBranchDir : String;
   lReposDir : String;
   lTrunkDir : String;
   lTrunkReposDir : String;
   lMouseScroll : String;
   lRemoteNexus : String;
   lAutoFilterReg : String;
   lAutoFilterLoc : String;
   lDBTimeout : string;
   lEmployeeCode : string;
   lAppCode : string;
begin
   //Get options from registry settings or use the defaults
   lColInactive := GetRegistry('DEInactiveColor');
   lColFilter := GetRegistry('DEFilterColor');
   lColBackground := GetRegistry('DEBackground');
   lColOdd := GetRegistry('DEOddColor');
   lColFooter := GetRegistry('DEFooterColor');
   lColSelected := GetRegistry('DESelectedColor');

   lTypeColours := GetRegistry('DETypeColours');
   lColString := GetRegistry('DEStringColor');
   lColInteger := GetRegistry('DEIntegerColor');
   lColFloat := GetRegistry('DEFloatColor');
   lColDateTime := GetRegistry('DEDateTimeColor');
   lColCurrency := GetRegistry('DECurrencyColor');

   lSelectedBold := GetRegistry('DESelectedBold');
   lNewRecView := GetRegistry('DENewRecView');
   lShowRows := GetRegistry('DEShowRows');
   lAutoRefresh := GetRegistry('DEAutoRefresh');
   lRollbackSQL := GetRegistry('DERollbackSQL');
   lUppercaseSQL := GetRegistry('DEUppercaseSQL');
   lRemoteNexus := GetRegistry('DERemoteNexus');
   lAutoFilterReg := GetRegistry('DEAutoFilterReg');
   lAutoFilterLoc := GetRegistry('DEAutoFilterLoc');

   lSchemaDir := GetRegistry('DESchemaDir');
   lBranchDir := GetRegistry('DEBranchDir');
   lReposDir := GetRegistry('DEReposDir');
   lTrunkDir := GetRegistry('DETrunkDir');
   lTrunkReposDir := GetRegistry('DETrunkReposDir');
   lMouseScroll := GetRegistry('DEMouseScroll');
   lDBTimeout := GetRegistry('DEDBTimeout');
   lEmployeeCode := GetRegistry('DEEmployeeCode');
   lAppCode := GetRegistry('DEAppCode');

   if lColInactive <> '' then
      gSettings.ColInactive := StringToColor(lColInactive)
   else
      gSettings.ColInactive := NON_ACTIVE_COLOUR;

   if lColFilter <> '' then
      gSettings.ColFilter := StringToColor(lColFilter)
   else
      gSettings.ColFilter := FILTER_COLOR;

   if lColBackground <> '' then
      gSettings.ColBackground := StringToColor(lColBackground)
   else
      gSettings.ColBackground := BACKGROUND;

   if lColOdd <> '' then
      gSettings.ColOdd := StringToColor(lColOdd)
   else
      gSettings.ColOdd := ODD_COLOR;

   if lColFooter <> '' then
      gSettings.ColFooter := StringToColor(lColFooter)
   else
      gSettings.ColFooter := FOOTER_COLOR;

   if lColSelected <> '' then
      gSettings.ColSelected := StringToColor(lColSelected)
   else
      gSettings.ColSelected := SELECTED_COLOR;

   if lTypeColours <> '' then
      gSettings.TypeColours := RegStrToBool(lTypeColours)
   else
      gSettings.TypeColours := TYPE_COLORS;

   if lColString <> '' then
      gSettings.ColString := StringToColor(lColString)
   else
      gSettings.ColString := STRING_COLOR;

   if lColInteger <> '' then
      gSettings.ColInteger := StringToColor(lColInteger)
   else
      gSettings.ColInteger := INTEGER_COLOR;

   if lColFloat <> '' then
      gSettings.ColFloat := StringToColor(lColFloat)
   else
      gSettings.ColFloat := FLOAT_COLOR;

   if lColDateTime <> '' then
      gSettings.ColDateTime := StringToColor(lColDateTime)
   else
      gSettings.ColDateTime := DATETIME_COLOR;

   if lColCurrency <> '' then
      gSettings.ColCurrency := StringToColor(lColCurrency)
   else
      gSettings.ColCurrency := CURRENCY_COLOR;

   if lSelectedBold <> '' then
      gSettings.SelectedBold := RegStrToBool(lSelectedBold)
   else
      gSettings.SelectedBold := True;

   if lNewRecView <> '' then
      gSettings.NewRecView := RegStrToBool(lNewRecView)
   else
      gSettings.NewRecView := True;

   if lShowRows <> '' then
      gSettings.ShowRows := RegStrToBool(lShowRows)
   else
      gSettings.ShowRows := True;

   if lAutoRefresh <> '' then
      gSettings.AutoRefresh := RegStrToBool(lAutoRefresh)
   else
      gSettings.AutoRefresh := False;

   if lRollbackSQL <> '' then
      gSettings.RollbackSQL := RegStrToBool(lRollbackSQL)
   else
      gSettings.RollbackSQL := False;

   if lUppercaseSQL <> '' then
      gSettings.UppercaseSQL := RegStrToBool(lUppercaseSQL)
   else
      gSettings.UppercaseSQL := True;

   if lRemoteNexus <> '' then
      gSettings.RemoteNexus := RegStrToBool(lRemoteNexus)
   else
      gSettings.RemoteNexus := True;

   if lAutoFilterReg <> '' then
      gSettings.AutoFilterReg := RegStrToBool(lAutoFilterReg)
   else
      gSettings.AutoFilterReg := False;

   if lAutoFilterLoc <> '' then
      gSettings.AutoFilterLoc := RegStrToBool(lAutoFilterLoc)
   else
      gSettings.AutoFilterLoc := False;

   if lSchemaDir <> '' then
      gSettings.SchemaDir := lSchemaDir
   else
      gSettings.SchemaDir := SCHEMA_DIR;

   if lBranchDir <> '' then
      gSettings.BranchDir := lBranchDir
   else
      gSettings.BranchDir := '';

   if lReposDir <> '' then
      gSettings.ReposDir := lReposDir
   else
      gSettings.ReposDir := '';

   if lTrunkDir <> '' then
      gSettings.TrunkDir := lTrunkDir
   else
      gSettings.TrunkDir := '';

   if lTrunkReposDir <> '' then
      gSettings.TrunkReposDir := lTrunkReposDir
   else
      gSettings.TrunkReposDir := '';

   if lMouseScroll <> '' then
      gSettings.MouseScroll := lMouseScroll
   else
      gSettings.MouseScroll := MOUSE_SCROLL;

   if lDBTimeout <> '' then
      gSettings.DBTimeout := lDBTimeout
   else
      gSettings.DBTimeout := DB_TIMEOUT;

   if lEmployeeCode <> '' then
      gSettings.EmployeeCode := lEmployeeCode
   else
      gSettings.EmployeeCode := '';

   if lAppCode <> '' then
      gSettings.AppCode := lAppCode
   else
      gSettings.AppCode := '';
end;

function IsNexusServerNamePiped(aServerName : String) : Boolean;
begin
   Result := (AnsiPos('192.168', aServerName) = 0) and (aServerName <> 'NexusDB');
end;

procedure CommitSMSIni;
var
   lBatFile : string;
begin
   lBatFile := gAppPath + 'SVNAutoCommitIni.bat';
   if (FileExists(lBatFile)) then
      ShellExecute(0, 'open', PAnsiChar(lBatFile), PChar(lBatFile), nil, SW_NORMAL);
end;

end.
