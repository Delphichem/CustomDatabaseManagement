unit udSMSConfigs;
{
  July 2016 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, SMDBGrid, DB, kbmMemTable, Buttons,
  ufDBEDatabase, IniFiles;

type
  TdSMSConfigs = class(TForm)
    dbgConfigs: TSMDBGrid;
    mtbConfigs: TkbmMemTable;
    dsConfigs: TDataSource;
    mtbConfigssmsconfig_mnemonic: TStringField;
    mtbConfigsdefault_value: TStringField;
    mtbConfigslow_value: TStringField;
    mtbConfigshigh_value: TStringField;
    mtbConfigsdescription: TStringField;
    btnOK: TSpeedButton;
    mtbConfigsexists: TBooleanField;
    pb1: TProgressBar;
    btnNewConfig: TSpeedButton;
    mtbConfigsIndex: TIntegerField;
    btnRemove: TSpeedButton;
    btnUpdate: TSpeedButton;
    mtbConfigsSMSdefault_value: TStringField;
    mtbConfigsobsolete: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure mtbConfigsdescriptionChange(Sender: TField);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgConfigsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mtbConfigsBeforePost(DataSet: TDataSet);
    procedure btnNewConfigClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure mtbConfigsBeforeDelete(DataSet: TDataSet);
    procedure btnUpdateClick(Sender: TObject);
    procedure mtbConfigsSMSdefault_valueChange(Sender: TField);
  private
    fLoading, fUpdating, fCommitToSVN : Boolean;
    fSMSIni : TIniFile;
    procedure LoadConfigsFromIni;
    procedure SaveLastChange;
    procedure CanNowCommit;
    procedure SetupDevConnection(var aDBEDatabase: TDBEDatabase);
    procedure HideProgress;
    procedure ShowProgress;
    procedure AppendConfig(aConfig, aDesc: String; aIndex : Integer = -1);
    procedure DetectAndSaveNewConfigsFromGRef;

  public

  end;


implementation

uses
   ufISQLQuery, uuGlobals, StdCtrls, DBCtrls, StrUtils, ufReference;

const
   C_SECTION = 'smsconfigs';
   D_SECTION = 'smsconfigs_desc';
   DV_SECTION = 'smsconfigs_DV';

{$R *.dfm}

procedure TdSMSConfigs.ShowProgress;
begin
   pb1.Visible := True;
   pb1.Position := 0;
   pb1.BringToFront;
end;

procedure TdSMSConfigs.HideProgress;
begin
   pb1.Visible := False;
   pb1.Position := 0;
end;

procedure TdSMSConfigs.FormActivate(Sender: TObject);
var
   lLevelCode : string;
begin
   fUpdating := False;
   ShowProgress;
   lLevelCode := GetRegistry('location_code', POS_DIRECTORY) +
                   GetRegistry('register_code', POS_DIRECTORY);
   Self.Caption := 'SMS Configuration Settings ' + lLevelCode;
   gRef.LoadConfig(lLevelCode, True);
   LoadConfigsFromIni;
   HideProgress;
   dbgConfigs.FocusFilterBar;
end;

//Used when loading Ini, pressing 'New', updating from dev, updating from gRef
//Note: When loading from Ini, we already know the Index, and that's the only time
procedure TdSMSConfigs.AppendConfig(aConfig, aDesc : String; aIndex : Integer = -1);
var
   lStr : string;
begin
   if mtbConfigs.Locate('smsconfig_mnemonic',aConfig,[loCaseInsensitive]) then
      ShowMessage('Duplicate config found in SMSDataEditor.ini: ' + ^M + aConfig)
   else
   begin
      mtbConfigs.Append;
      mtbConfigssmsconfig_mnemonic.AsString := aConfig;
      if aIndex < 0 then //not loading from Ini
      begin
         mtbConfigsIndex.AsInteger := mtbConfigs.RecordCount + 1;

         //If dev/Gref gives us an empty string but there is something in the config guide,
         //we don't want to override the desc's we have manually entered. e.g. direct configs
         if aDesc <> '' then
            mtbConfigsDescription.AsString := aDesc;
      end
      else if fLoading then
      begin
         //We want to get the desc from the Ini only when loading from Ini
         //Not when updating from gRef/dev/'New'
         mtbConfigsIndex.AsInteger := aIndex;
         if Assigned(fSMSIni) then
         begin
            lStr := fSMSIni.ReadString(D_SECTION, 'D' + IntToStr(mtbConfigsIndex.AsInteger), '');
            lStr := StringReplace(lStr, INI_ENTER, #13#10,[rfReplaceAll]);
            mtbConfigsdescription.AsString  := lStr;
            lStr := fSMSIni.ReadString(DV_SECTION, 'V' + IntToStr(mtbConfigsIndex.AsInteger), '');
            mtbConfigsSMSdefault_value.AsString  := lStr;
         end;
      end
      else //This shouldn't happen
      begin
         mtbConfigs.Cancel;
         ShowMessage('Unexpected error when appending config: ' + aConfig);
         Exit;
      end;

      if gRef.Exists(aConfig) then
      begin
         mtbConfigsdefault_value.AsString      := gRef.Get(aConfig, '');
         mtbConfigslow_value.AsString          := gRef.GetLow(aConfig, '');
         mtbConfigshigh_value.AsString         := gRef.GetHigh(aConfig, '');
         mtbConfigsexists.AsBoolean            := True;
      end
      else
         mtbConfigsexists.AsBoolean            := False;

      mtbConfigs.Post;
      if not fLoading then
         CanNowCommit;
   end;
end;

procedure TdSMSConfigs.LoadConfigsFromIni;
var
   lEntries : TStringList;
   I, lPos : Integer;
   lConfig : string;
   lConfigIndex : string;
begin
   fLoading := True;
   mtbConfigs.Close;
   mtbConfigs.Open;

   fSMSIni := TIniFile.Create(gAppPath + MAIN_INI);
   lEntries := TStringList.Create;
   mtbConfigs.DisableControls;
   try
      fSMSIni.ReadSectionValues('smsconfigs', lEntries);
      pb1.Max := lEntries.Count;
      for I := 0 to lEntries.Count - 1 do
      begin
         lConfig := lEntries[I];
         lPos := AnsiPos('=', lConfig);
         if AnsiStartsStr('C', lConfig) then
         begin
            lConfigIndex := lConfig;
            Delete(lConfig, 1, lPos);   //delete the 'C23='
            Delete(lConfigIndex, lPos, Length(lConfigIndex)); //delete '=CONFIG'
            Delete(lConfigIndex, 1, 1); //delete the 'C'

            if (Trim(lConfig) <> '') and (lConfigIndex <> '') then
               AppendConfig(Trim(lConfig), '', StrToInt(lConfigIndex));
         end;
         pb1.StepBy(1);
         Application.ProcessMessages;
      end;
   finally
      mtbConfigs.SortOn('smsconfig_mnemonic', [mtcoCaseInsensitive]);
      mtbConfigs.First;
      mtbConfigs.EnableControls;
      fSMSIni.Free;
      FreeAndNil(lEntries);
      HideProgress;
      fLoading := False;
   end;
end;

procedure TdSMSConfigs.mtbConfigsBeforeDelete(DataSet: TDataSet);
var
   SMSIni : TIniFile;
   lIndex : Integer;
begin
   lIndex := mtbConfigsIndex.AsInteger;
   SMSIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      SMSIni.DeleteKey(C_SECTION, 'C' + IntToStr(lIndex));
      SMSIni.DeleteKey(D_SECTION, 'D' + IntToStr(lIndex));
      SMSIni.DeleteKey(DV_SECTION, 'V' + IntToStr(lIndex));
   finally
      SMSIni.Free;
   end;
end;

//Called when loading from Ini, pressing 'New', updating from dev, updating from gRef
procedure TdSMSConfigs.mtbConfigsBeforePost(DataSet: TDataSet);
   procedure InsertSMSConfig(aName, aDefaultValue, aLowValue, aHighValue : String);
   var
      lQry : ISQLQuery;
      lLevelCode : string;
   begin
      lQry := gDataBase.NewQuery;
      try
         try
            //First check if there is already a register level setting
            //If there is, then change it, otherwise create a new register level setting
            lLevelCode := GetRegistry('location_code', POS_DIRECTORY) +
                            GetRegistry('register_code', POS_DIRECTORY);
            lQry.SQL.Clear;
            lQry.SQL.Add('select * from smsconfig where smsconfig_mnemonic = ' + QuotedStr(aName) +
                        ' and active_ind = ''Y'' and level_ind = ''R'' and level_code = ' + QuotedStr(lLevelCode));
            lQry.Open;
            if not lQry.eof then
            begin
               lQry.Edit;
               lQry.FieldByName('default_value').AsString := aDefaultValue;
               lQry.FieldByName('low_value').AsString     := aLowValue;
               lQry.FieldByName('high_value').AsString    := aHighValue;
               lQry.Post;
            end
            else
            begin
               lQry.Append;
               lQry.FieldByName('smsconfig_id').Value        := gDatabase.GetNextPrimaryKey('smsconfig', 'smsconfig_id');
               lQry.FieldByName('smsconfig_mnemonic').Value  := aName;
               lQry.FieldByName('active_ind').Value          := 'Y';
               lQry.FieldByName('default_value').AsString    := aDefaultValue;
               lQry.FieldByName('low_value').AsString        := aLowValue;
               lQry.FieldByName('high_value').AsString       := aHighValue;
               lQry.FieldByName('level_ind').Value           := 'R';
               lQry.FieldByName('level_code').Value          := lLevelCode;
               lQry.Post;
            end;
         except
            On E : Exception do
               ShowMessage('Failed to insert smsconfig: ' + E.Message);
         end;
      finally
         if Assigned(lQry) and lQry.Active then
            lQry.Close;
         lQry := nil;
      end;
   end;

   procedure InsertIntoIni(aName, aDesc, aDefaultValue : string; aIndex : Integer);
   var
      SMSIni : TIniFile;
   begin
      aDesc := StringReplace(aDesc, #13#10, INI_ENTER,[rfReplaceAll]);
      SMSIni := TIniFile.Create(gAppPath + MAIN_INI);
      try
         if SMSIni.ReadString(C_SECTION, 'C' + IntToStr(aIndex), '') = '' then
            SMSIni.WriteString(C_SECTION, 'C' + IntToStr(aIndex), aName);
         SMSIni.WriteString(D_SECTION, 'D' + IntToStr(aIndex), aDesc);
         SMSIni.WriteString(DV_SECTION, 'V' + IntToStr(aIndex), aDefaultValue);
      finally
         SMSIni.Free;
      end;
   end;
begin
   if not fLoading then
   begin
      if mtbConfigssmsconfig_mnemonic.AsString <> '' then
      begin
         //We don't want to insert records into smsconfig if updating from Gref/dev
         //But we do want to insert them into the Ini, that's the whole point
         if not fUpdating then
         begin
            InsertSMSConfig(mtbConfigssmsconfig_mnemonic.AsString,
                            mtbConfigsdefault_value.AsString,
                            mtbConfigslow_value.AsString,
                            mtbConfigshigh_value.AsString);
         end;
         InsertIntoIni(mtbConfigssmsconfig_mnemonic.AsString,
                       mtbConfigsdescription.AsString,
                       mtbConfigsSMSdefault_value.AsString,
                       mtbConfigsIndex.AsInteger);
      end;
   end;
end;

procedure TdSMSConfigs.mtbConfigsdescriptionChange(Sender: TField);
begin
   if not fLoading then
   begin
      CanNowCommit;
   end;
end;

procedure TdSMSConfigs.mtbConfigsSMSdefault_valueChange(Sender: TField);
begin
   if not fLoading then
   begin
      CanNowCommit;
   end;
end;

procedure TdSMSConfigs.CanNowCommit;
begin
   fCommitToSVN  := True;
   btnOK.Caption := 'Commit To SVN';
end;

procedure TdSMSConfigs.btnNewConfigClick(Sender: TObject);
var
   lConfigName : string;
begin
   SaveLastChange;

   lConfigName := Trim(InputBox('New SMS Configuration Setting', 'smsconfig_mnemonic?', ''));
   if lConfigName <> '' then
   begin
      //We dont want to insert into smsconfig when adding a new config
      fUpdating := True;
      AppendConfig(lConfigName, '');
      fUpdating := False;
      mtbConfigs.Locate('smsconfig_mnemonic',lConfigName,[loCaseInsensitive]);
   end;   
end;

procedure TdSMSConfigs.btnOKClick(Sender: TObject);
begin
   SaveLastChange;

   if fCommitToSVN then
      CommitSMSIni;
   ModalResult := mrOk;
end;

procedure TdSMSConfigs.btnRemoveClick(Sender: TObject);
begin
   SaveLastChange;
   mtbConfigs.Delete;
   CanNowCommit;
end;

procedure TdSMSConfigs.DetectAndSaveNewConfigsFromGRef;
var
   lConfigFromGRef : string;
   lAdded : TStringList;
   lShowM : string;
   I : Integer;
begin
   lShowM := '';
   ShowProgress;
   pb1.Max := gRef.MT.RecordCount;
   Application.ProcessMessages;
   lAdded := TStringList.Create;
   try
      gRef.MT.First;
      while not gRef.MT.eof do
      begin
         lConfigFromGRef := UpperCase(Trim(gRef.MT.FieldByName('smsconfig_mnemonic').AsString));
         if (lConfigFromGRef <> '') and (not mtbConfigs.Locate('smsconfig_mnemonic', lConfigFromGRef, [loCaseInsensitive])) then
         begin
            AppendConfig(lConfigFromGRef, '');
            lAdded.Add(lConfigFromGRef);
         end;

         gRef.MT.Next;
         pb1.StepBy(1);
         Application.ProcessMessages;
      end;

      if lAdded.Count > 0 then
      begin
         lShowM := IntToStr(lAdded.Count) + ' configs added to SMSDataEditor.ini from this database.' + ^M +
                     'Please commit to SVN if they are not rubbish.' + ^M;
         for I := 0 to lAdded.Count - 1 do
         begin
            lShowM := lShowM + ^M + lAdded[I];
         end;
         ShowMessage(lShowM);
         CanNowCommit;
      end;
   finally
      lAdded.Free;
      HideProgress;
   end;
end;

procedure TdSMSConfigs.btnUpdateClick(Sender: TObject);
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
   lSMSConfig : string;
   lRecCount : Integer;
   lAdded : TStringList;
   lShowM : string;
   I : Integer;
   lDesc : string;
begin
   SaveLastChange;
   fUpdating := True;
   mtbConfigs.DisableControls;
   DetectAndSaveNewConfigsFromGRef;
   lDBEDatabase := TDBEDatabase.Create;
   try
      SetupDevConnection(lDBEDatabase);
      try
         lDBEDatabase.Connected := True;
      except
         on E : SysUtils.Exception do
         begin
            ShowMessage(E.Message);
            lDBEDatabase.Free;
            Exit;
         end;
      end;

      lQuery := lDBEDatabase.NewQuery;

      lQuery.SQL.Clear;
      lQuery.SQL.Add('select count(1) as reccount from smsconfigassist sa with (nolock)');
      lQuery.SQL.Add(' left join smsconfigtemp st with (nolock) on (sa.smsconfig_mnemonic = st.mnemonic)');
      lQuery.Open;
      try
         lRecCount := lQuery.FieldByName('reccount').AsInteger;
      finally
         lQuery.Close;
      end;

      lQuery.SQL.Clear;
      lQuery.SQL.Add('select sa.smsconfig_mnemonic, sa.description, st.default_value, st.obsolete from smsconfigassist sa with (nolock)');
      lQuery.SQL.Add(' left join smsconfigtemp st with (nolock) on (sa.smsconfig_mnemonic = st.mnemonic)');
      lQuery.Open;

      pb1.Max := lRecCount;
      ShowProgress;
      lAdded := TStringList.Create;
      try
         lQuery.First;
         while not lQuery.eof do
         begin
            lSMSConfig := UpperCase(Trim(lQuery.FieldByName('smsconfig_mnemonic').AsString));
            lDesc      := lQuery.FieldByName('description').AsVariant;
            if mtbConfigs.Locate('smsconfig_mnemonic',lSMSConfig,[locaseinsensitive]) then
            begin
               mtbConfigs.Edit;
               //will .AsString only give 255 chars?
               if Trim(lDesc) <> '' then
                  mtbConfigsdescription.AsString      := Trim(lDesc);
               mtbConfigsSMSdefault_value.AsString := lQuery.FieldByName('default_value').AsString;
               //Might use this to colour obsolete configs red
               mtbConfigsobsolete.AsString         := lQuery.FieldByName('obsolete').AsString;
               mtbConfigs.Post;
            end
            else if lDesc <> '' then
            begin
               //Only add the config if it has a description, there are silly configs
               //in dev that have come from register and store tables, etc
               AppendConfig(lSMSConfig, lDesc);
               lAdded.Add(lSMSConfig);
            end;

            pb1.StepBy(1);
            Application.ProcessMessages;
            lQuery.Next;
         end;

         if lAdded.Count > 0 then
         begin
            lShowM := IntToStr(lAdded.Count) + ' configs added to SMSDataEditor.ini from MSSQL Dev Test.' + ^M +
                        'Please commit to SVN if they are not rubbish.' + ^M;
            for I := 0 to lAdded.Count - 1 do
            begin
               lShowM := lShowM + ^M + lAdded[I];
            end;
            ShowMessage(lShowM);
         end
         else
            ShowMessage('No new configs from dev test. Descriptions and default values have been overriden.');
      finally
         lQuery.Close;
         mtbConfigs.First;
         lAdded.Free;
         HideProgress;
      end;
   finally
      lQuery := nil;
      lDBEDatabase.Free;
      fUpdating := False;
      mtbConfigs.EnableControls;
   end;
end;


procedure TdSMSConfigs.SetupDevConnection(var aDBEDatabase : TDBEDatabase);
var
   SMSDataEditorIni : TIniFile;
begin
   SMSDataEditorIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      aDBEDatabase.ServerName := SMSDataEditorIni.ReadString('dev', 'Server', '');
      aDBEDatabase.AliasName  := SMSDataEditorIni.ReadString('dev', 'AliasName', '');
      aDBEDatabase.UserName   := SMSDataEditorIni.ReadString('dev', 'Username', '');
      aDBEDatabase.Password   := SMSDataEditorIni.ReadString('dev', 'Password', '');
   finally
      SMSDataEditorIni.Free;
   end;
end;

procedure TdSMSConfigs.SaveLastChange;
begin
   if mtbConfigs.State in [dsEdit] then
      mtbConfigs.Post;
end;

procedure TdSMSConfigs.dbgConfigsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   lGrid : TSMDBGrid;
   lDataSet : TDataSet;
begin
   lGrid := (Sender as TSMDBGrid);
   lDataSet := lGrid.DataSource.DataSet;
   if Assigned(lDataSet) then
   begin
      if lDataSet.FieldByName('exists').AsBoolean then
         lGrid.Canvas.Font.Color := clWindowText
      else
         lGrid.Canvas.Font.Color := clGray;
   end;

   lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TdSMSConfigs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //Don't save last change
   mtbConfigs.Close;
   FreeAndNil(gRef);
end;

procedure TdSMSConfigs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

end.
