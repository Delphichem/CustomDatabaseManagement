unit udSchemaChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCGrids, ComCtrls, SynEditHighlighter,
  SynHighlighterSQL, SynEdit, SynMemo, ufDBEDatabase, Buttons, Grids, DBGrids,
  SMDBGrid, DB, kbmMemTable;

type
  TdSchemaChange = class(TForm)
    cboTask: TComboBox;
    lblTask: TLabel;
    edtLocalTaskBranch: TEdit;
    lblLocalTaskBranch: TLabel;
    lblSchemaChangeFolder: TLabel;
    edtSchemaChangeFolder: TEdit;
    btnPrepare: TButton;
    btnExecute: TButton;
    pgcDDLS: TPageControl;
    sqlSQL: TSynMemo;
    hl1: TSynSQLSyn;
    cboVersion: TComboBox;
    lblSMSVersion: TLabel;
    btnLocalSCRTaskBranch: TSpeedButton;
    btnSchemaFolder: TSpeedButton;
    lblSQLWarning: TLabel;
    cboPayrollId: TComboBox;
    lbl1: TLabel;
    dbgSMSChanges: TSMDBGrid;
    mtbSMSChanges: TkbmMemTable;
    dsSMSChanges: TDataSource;
    lblSMSChanges: TLabel;
    mtbSMSChangesbusiness_object: TStringField;
    mtbSMSChangestable_name: TStringField;
    mtbSMSChangeschange_type: TStringField;
    mtbSMSChangesfield_name: TStringField;
    mtbSMSChangesfield_type: TStringField;
    mtbSMSChangessize: TStringField;
    lbl2: TLabel;
    btnReset: TButton;
    mtbSMSChangesSQL: TStringField;
    lbl3: TLabel;
    procedure btnPrepareClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cboTaskChange(Sender: TObject);
    procedure edtLocalTaskBranchChange(Sender: TObject);
    procedure edtSchemaChangeFolderChange(Sender: TObject);
    procedure cboVersionChange(Sender: TObject);
    procedure btnLocalSCRTaskBranchClick(Sender: TObject);
    procedure btnSchemaFolderClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    fDDLFileNames : TStringList;
    fTSchemaFolder, fSchemaUpgradeFile : string;
    fNewDDLNewLines, fNewDDLAlteredLines : array of TStringList;

    procedure LoadConfigsFromIni;
    procedure DisplayMail(aAddress, aSubject, aBody: string);
    procedure SetupRMSDB(var aDBEDatabase: TDBEDatabase; aDBIni : String);
    procedure CommitToSVN(aTaskDesc : String);
    procedure CanPrepare;
    function  AppendSQLToUpgradeScript(aPublic: Boolean): Boolean;
    function  ApplySQLToRMS(aRDReference : Boolean): Boolean;
    procedure FillDropdowns;
    function  IsFieldInOldDDL(aOldMemo : TSynEdit; aFieldName : String): Boolean;
    procedure AddAlterField(aTableName : string; aWords: TStringList; aSMSTable : Boolean; aBO : String);
    procedure AddNewField(aTableName : string; aWords: TStringList; aSMSTable : Boolean; aBO : String);
    procedure AddCommentWithTaskInfo(aTask: String);
    procedure ProcessSMSChanges(aTaskDesc : String);
    function  GetBusinessObject(aTableName: String): string;
    function  GetTaskDesc: string;
    function  IsIndexInOldDDL(aOldMemo: TSynEdit; aIndexName: String): Boolean;
    procedure AddNewIndex(aTableName: string; aWords: TStringList;
      aSMSTable: Boolean; aBO : String);
    procedure ResetPreparation;
    procedure NewDDLSpecialLineColors(Sender: TObject; Line: Integer;
      var Special: Boolean; var FG, BG: TColor);
  public

  end;


implementation

uses
   IniFiles, uuGlobals, ShellAPI, ufISQLQuery, StrUtils;

{$R *.dfm}

procedure TdSchemaChange.FormCreate(Sender: TObject);
begin
   btnPrepare.Enabled := False;
   btnExecute.Enabled := False;
   LoadConfigsFromIni;
end;

procedure TdSchemaChange.FormActivate(Sender: TObject);
begin
   if not DirectoryExists(fTSchemaFolder) then
   begin
      ShowMessage('Public schema datamodel folder not found: ' + fTSchemaFolder + ' Offline? VPN?');
      Exit;
   end
   else //Assuming this means RDHeadOffice can be queried
      FillDropdowns;
end;

procedure TdSchemaChange.LoadConfigsFromIni;
var
   lSMSIni : TIniFile;
begin
   lSMSIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      fTSchemaFolder     := lSMSIni.ReadString('SchemaChange', 'SchemaFolder', '');
      fSchemaUpgradeFile := lSMSIni.ReadString('SchemaChange', 'SchemaUpgrade', '');
   finally
      lSMSIni.Free;
   end;
end;

procedure TdSchemaChange.ResetPreparation;
var
   I : Integer;
begin
   pgcDDLS.DestroyComponents; //Remove all tabs
   sqlSQL.Clear;
   mtbSMSChanges.Close;
   if Assigned(fDDLFileNames) then
      FreeAndNil(fDDLFileNames);
   for I := 0 to Length(fNewDDLNewLines) - 1 do
      FreeAndNil(fNewDDLNewLines[I]);
   for I := 0 to Length(fNewDDLAlteredLines) - 1 do
      FreeAndNil(fNewDDLAlteredLines[I]);
end;

procedure TdSchemaChange.btnPrepareClick(Sender: TObject);
var
   lSchemaFolder, lLocalBranchFolder : string;
   lNewDDL, lOldDDL : TextFile;
   searchResult : TSearchRec;
   lNewTab : TTabSheet;
   lOldMemo, lNewMemo : TSynEdit;
   lText : string;
   lInCreateTable : Boolean;
   lWords : TStringList;
   lTableName : string;
   lSMSTable : Boolean;
   lLineNo : Integer;
   lDDLIndex : Integer;
   lBO : string;
begin
   lInCreateTable := False;

   lSchemaFolder      := Trim(edtSchemaChangeFolder.Text);
   lLocalBranchFolder := Trim(edtLocalTaskBranch.Text);

   //Check folders and files exist
   if not FileExists(fSchemaUpgradeFile) then
   begin
      ShowMessage('Public schema upgrade file not found: ' + fSchemaUpgradeFile);
      Exit;
   end;

   if not DirectoryExists(lSchemaFolder) then
   begin
      ShowMessage('Schema folder not found: ' + lSchemaFolder);
      Exit;
   end;

   if not DirectoryExists(lLocalBranchFolder) then
   begin
      ShowMessage('Local branch folder not found: ' + lLocalBranchFolder);
      Exit;
   end;

   if not DirectoryExists(lLocalBranchFolder + '\Datamodel') then
   begin
      ShowMessage('Local branch datamodel folder not found: ' + lLocalBranchFolder + '\Datamodel');
      Exit;
   end;

   ResetPreparation;
   mtbSMSChanges.Open;

   //Load DDL files from schema folder
   fDDLFileNames := TStringList.Create;
   lDDLIndex := 0;
   try
      if FindFirst(lSchemaFolder + '\*.ddl', faAnyFile, searchResult) = 0 then
      begin
         repeat
            fDDLFileNames.Add(searchResult.Name);

            if not FileExists(lLocalBranchFolder + '\Datamodel\Schema\' + searchResult.Name) then
            begin
               ShowMessage('A new table exists for this schema change. Too hard. No changes made.');
               Exit;
            end;

            lTableName := searchResult.Name;
            Delete(lTableName, Length(lTableName) - 3, 4);

            lBO := GetBusinessObject(lTableName);
            if lBO = '' then
            begin
               ShowMessage('The business object for ' + lTableName + ' cannot be found in SMSDataEditor.ini. Please add it then commit to SVN.');
               Exit;
            end;

            //Create new tab in pgcDDLS with 2 memos inside it showing before and after
            lNewTab := TTabSheet.Create(pgcDDLS);
            lNewTab.Caption := searchResult.Name;
            lNewTab.PageControl := pgcDDLS;

            //**********OLD DDL FILE*******************

            lOldMemo := TSynEdit.Create(lNewTab);
            lOldMemo.Parent := lNewTab;
            lOldMemo.Align  := alLeft;
            lOldMemo.Width  := Trunc(lNewTab.Width/2);
            lOldMemo.ScrollBars := ssBoth;
            lOldMemo.ReadOnly := True;

            lSMSTable := False;

            AssignFile(lOldDDL, lLocalBranchFolder + '\Datamodel\Schema\' + searchResult.Name);
            Reset(lOldDDL);
            while not Eof(lOldDDL) do
            begin
               ReadLn(lOldDDL, lText);
               lText := Trim(lText);
               lOldMemo.Lines.Add(lText);

               //Is this an SMS table?
               lSMSTable := lSMSTable or (AnsiPos('%^table notforsubschema = false', lText) <> 0);
               lSMSTable := lSMSTable or (AnsiPos('%^table schema_version = 0', lText) <> 0);
            end;
            CloseFile(lOldDDL);

            //**********NEW DDL FILE*******************

            lNewMemo := TSynEdit.Create(lNewTab);
            lNewMemo.Parent := lNewTab;
            lNewMemo.Align  := alRight;
            lNewMemo.Width  := Trunc(lNewTab.Width/2);
            lNewMemo.ScrollBars := ssBoth;
            lNewMemo.ReadOnly := True;
            lNewMemo.OnSpecialLineColors := NewDDLSpecialLineColors;

            //This stuff is all for coloring the memo lines in the new ddls
            lLineNo := 1;
            SetLength(fNewDDLNewLines, lDDLIndex + 1);
            fNewDDLNewLines[lDDLIndex] := TStringList.Create;
            SetLength(fNewDDLAlteredLines, lDDLIndex + 1);
            fNewDDLAlteredLines[lDDLIndex] := TStringList.Create;

            AssignFile(lNewDDL, lSchemaFolder + '\' + searchResult.Name);
            Reset(lNewDDL);
            while not Eof(lNewDDL) do
            begin
               ReadLn(lNewDDL, lText);
               lText := Trim(lText);
               lNewMemo.Lines.Add(lText);

               if AnsiPos('create table', LowerCase(lText)) = 1 then
                  lInCreateTable := True
               else if lInCreateTable and (AnsiPos(')', LowerCase(lText)) = 1) then
                  lInCreateTable := False;

               //Check for new/changed lines
               if lInCreateTable and (lOldMemo.Lines.IndexOf(lText) = -1) then
               begin
                  //Comparing the ddls, we have found a non-description only change
                  //This means we'll be executing new SQL
                  //Get task information from our head office database for initial SQL comment
                  if sqlSQL.Text = '' then
                     AddCommentWithTaskInfo(Trim(cboTask.Text));

                  lWords := TStringList.Create;
                  try
                     SplitSQL(lWords, lText,' ', False);
                     //Grab the first word of the new text (the field name) and
                     //search for it in the old ddl create table. If it's not there
                     //we are adding a new field. Otherwise, we are altering this
                     //field.
                     if lWords.Count > 0 then
                     begin
                        if IsFieldInOldDDL(lOldMemo, lWords[0]) then
                        begin
                           //alter field
                           AddAlterField(lTableName, lWords, lSMSTable, lBO);
                           fNewDDLAlteredLines[lDDLIndex].Add(IntToStr(lLineNo));
                        end
                        else
                        begin
                           //new field
                           AddNewField(lTableName, lWords, lSMSTable, lBO);
                           fNewDDLNewLines[lDDLIndex].Add(IntToStr(lLineNo));
                        end;
                     end;
                  finally
                     FreeAndNil(lWords);
                  end;
               end
               else  //Now we are looking for new or altered indices
               begin
                  if (AnsiPos('create index ', LowerCase(lText)) = 1) and (lOldMemo.Lines.IndexOf(lText) = -1) then
                  begin
                     //Comparing the ddls, we have found a non-description only change
                     //This means we'll be executing new SQL
                     //Get task information from our head office database for initial SQL comment
                     if sqlSQL.Text = '' then
                        AddCommentWithTaskInfo(Trim(cboTask.Text));

                     lWords := TStringList.Create;
                     try
                        SplitSQL(lWords, lText,' ', False);
                        //Grab the third word of the new text (the index name) and
                        //search for it in the old ddl. If it's not there
                        //we are adding a new field. Otherwise, we are altering this
                        //index.
                        if lWords.Count > 2 then
                        begin
                           if IsIndexInOldDDL(lOldMemo, lWords[2]) then
                           begin
                              //alter index
                              //AddAlterIndex(lTableName, lWords, lSMSTable, lBO);
                              fNewDDLAlteredLines[lDDLIndex].Add(IntToStr(lLineNo));
                           end
                           else
                           begin
                              //new index
                              AddNewIndex(lTableName, lWords, lSMSTable, lBO);
                              fNewDDLNewLines[lDDLIndex].Add(IntToStr(lLineNo));
                           end;
                        end;
                     finally
                        FreeAndNil(lWords);
                     end;
                  end;
               end;
               Inc(lLineNo);
            end;
            CloseFile(lNewDDL);
            Inc(lDDLIndex);
         until FindNext(searchResult) <> 0;
         FindClose(searchResult);
      end;

      btnExecute.Enabled := True;
   except
      on E : Exception do
      begin
         ShowMessage('Error loading DDL files from schema folder: ' + E.Message);
         btnPrepare.Enabled := False;
         Exit;
      end;
   end;
end;

procedure TdSchemaChange.btnResetClick(Sender: TObject);
begin
   ResetPreparation;
   CanPrepare;
end;

procedure TdSchemaChange.AddCommentWithTaskInfo(aTask : String);
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
   lPayrollId, lSchemaAuthor, lVersion, lTaskName, lSystemCode : string;
begin
   lDBEDatabase := TDBEDatabase.Create;
   try
      SetupRMSDB(lDBEDatabase, 'RDHeadOffice');

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
      try
         lQuery.SQL.Add('select t.task_name, e.remediuser_code,');
         lQuery.SQL.Add(' s.system_version, s.system_release, s.systemrd_code');
         lQuery.SQL.Add(' from task t (nolock)');
         lQuery.SQL.Add(' join employee e (nolock) on (e.employee_id = t.employee_id)');
         lQuery.SQL.Add(' join systemrdversion s (nolock) on (t.intended_rdversion_id = s.systemrdversion_id)');
         lQuery.SQL.Add(' where task_number = ' + Trim(cboTask.Text));
         lQuery.Open;
         if not lQuery.eof then
         begin
            lPayrollId    := Trim(cboPayrollId.Text);
            lSchemaAuthor := lQuery.FieldByName('remediuser_code').AsString;
            lSystemCode   := lQuery.FieldByName('systemrd_code').AsString;
            lVersion      := lSystemCode + ' ' + lQuery.FieldByName('system_version').AsString + '.' + lQuery.FieldByName('system_release').AsString;
            lTaskName     := lQuery.FieldByName('task_name').AsString;
            sqlSQL.Lines.Add('-- ' + lPayrollId + ' for ' + lSchemaAuthor + ' - ' + lVersion + ' - Task ' + Trim(cboTask.Text) + ' - ' + lTaskName);
         end;
      finally
         lQuery.Close;
         lQuery := nil;
      end;
   finally
      lDBEDatabase.Connected := False;
      lDBEDatabase.Free;
   end;
end;

procedure TdSchemaChange.AddNewField(aTableName : string; aWords : TStringList; aSMSTable : Boolean; aBO : String);
var
   lSQL : string;
   I : Integer;
begin
   //Add SQL for schema_upgrade.sql
   sqlSQL.Lines.Add('');
   sqlSQL.Lines.Add('-- new column on existing table: ' + aTableName);
   sqlSQL.Lines.Add('exec up_schema_column_add ''');
   lSQL := '    alter table ' + aTableName + ' add';
   for I := 0 to aWords.Count - 1 do
   begin
      if aWords[I] = 'timestamp' then
         lSQL := lSQL + ' datetime'
      else
         lSQL := lSQL + ' ' + aWords[I];
   end;
   if EndsStr(',', lSQL) then
      Delete(lSQL, Length(lSQL), 1);
   sqlSQL.Lines.Add(lSQL + '''');
   sqlSQL.Lines.Add('GO');

   //SMS code
   if aSMSTable then
   begin
      mtbSMSChanges.Append;
      mtbSMSChangeschange_type.AsString     := 'N'; //New
      mtbSMSChangestable_name.AsString      := aTableName;
      mtbSMSChangesbusiness_object.AsString := aBO;
      mtbSMSChangesfield_name.AsString      := aWords[0];
      mtbSMSChangesfield_type.AsString      := 'type(TODO)';
      mtbSMSChangessize.AsString            := 'size(TODO)';
      mtbSMSChangesSQL.AsString             := 'alter table ' + aTableName + ' add column ' + aWords[0] + ' type(TODO)';

      mtbSMSChanges.Post;
   end;
end;

procedure TdSchemaChange.AddNewIndex(aTableName : string; aWords : TStringList; aSMSTable : Boolean; aBO : String);
var
   lSQL : string;
   I : Integer;
   lPosOfStartBracket, lPosOfEndBracket : Integer;
   lLine : string;
begin
   //Add SQL for schema_upgrade.sql
   sqlSQL.Lines.Add('');
   sqlSQL.Lines.Add('-- new index on existing table: ' + aTableName);
   sqlSQL.Lines.Add('exec up_schema_index_create ''');
   lSQL := '    create nonclustered index ' + aWords[2] + ' on ' + aTableName;

   lLine := aWords.Text;
   lPosOfStartBracket := AnsiPos('(', lLine);
   Delete(lLine, 1, lPosOfStartBracket - 1);

   lPosOfEndBracket   := AnsiPos(')', lLine);
   Delete(lLine, lPosOfEndBracket + 1, Length(lLine) - lPosOfEndBracket);
   lSQL := lSQL + ' ' + lLine;
   
   sqlSQL.Lines.Add(lSQL + ''',''GENTBLE_NDX''');
   sqlSQL.Lines.Add('GO');

   //SMS code
   if aSMSTable then
   begin
      mtbSMSChanges.Append;
      mtbSMSChangeschange_type.AsString     := 'I'; //New index
      mtbSMSChangestable_name.AsString      := aTableName;
      mtbSMSChangesbusiness_object.AsString := aBO;
      //For a new index, we don't need field_name, type and size. We just need the SQL
//      mtbSMSChangesfield_name.AsString      := aWords[0];
//      mtbSMSChangesfield_type.AsString      := 'type(TODO)';
//      mtbSMSChangessize.AsString            := 'size(TODO)';
//      mtbSMSChangesSQL.AsString             := 'create index...';
      mtbSMSChanges.Post;
   end;
end;

procedure TdSchemaChange.AddAlterField(aTableName : string; aWords : TStringList; aSMSTable : Boolean; aBO : String);
var
   lType : string;
   lPosOfStartBracket, lPosOfEndBracket, lPosOfComma : Integer;
   lSize, lPrec : string;
begin
   sqlSQL.Lines.Add('');
   sqlSQL.Lines.Add('-- alter column on existing table: ' + aTableName);
   sqlSQL.Lines.Add('exec up_schema_column_alter @table_name = ''' + aTableName + ''',');
   sqlSQL.Lines.Add('                            @column_name = ''' + aWords[0] + ''',');
   //need to figure out whether its a char, varchar, nvarchar, integer, datetime
   lType := LowerCase(aWords[1]);
   if (lType = 'integer') or (lType = 'smallint') then
   begin
      sqlSQL.Lines.Add('                            @new_column_type = ''' + lType + ''',');
      sqlSQL.Lines.Add('                            @new_length = 0,');
   end
   else if lType = 'timestamp' then
   begin
      sqlSQL.Lines.Add('                            @new_column_type = ''datetime'',');
      sqlSQL.Lines.Add('                            @new_length = 0,');
   end
   else if (AnsiPos('nvarchar', lType) <> 0) or
           (AnsiPos('varchar', lType) <> 0) or
           (AnsiPos('char', lType) <> 0) then
   begin
      //get the size
      lPosOfStartBracket := AnsiPos('(', lType);
      lSize := lType;
      Delete(lSize, 1, lPosOfStartBracket);

      lPosOfEndBracket   := AnsiPos(')', lSize);
      Delete(lSize, lPosOfEndBracket, 1);

      //This is just how the up_schema_column_alter function works
      if LowerCase(lSize) = 'MAX' then
         lSize := '-1';

      //get the raw type
      Delete(lType, lPosOfStartBracket, Length(lType));

      sqlSQL.Lines.Add('                            @new_column_type = ''' + lType + ''',');
      sqlSQL.Lines.Add('                            @new_length = ' + lSize + ',');
   end
   else if (AnsiPos('numeric', lType) <> 0) then
   begin
      //get the size and precision
      lPosOfStartBracket := AnsiPos('(', lType);
      lPosOfEndBracket   := AnsiPos(')', lType);
      lPosOfComma        := AnsiPos(',', lType);

      lSize := lType;
      Delete(lSize, 1, lPosOfStartBracket);
      Delete(lSize, lPosOfComma, Length(lSize));

      lPrec := lType;
      Delete(lPrec, 1, lPosOfComma);
      Delete(lPrec, lPosOfEndBracket, Length(lSize));

      sqlSQL.Lines.Add('                            @new_column_type = ''numeric'',');
      sqlSQL.Lines.Add('                            @new_length = ' + lSize + ',');
      sqlSQL.Lines.Add('                            @new_prec = ' + lPrec + ',');
   end
   else if (AnsiPos('double precision', lType) <> 0) then
   begin
      ShowMessage('Unknown type: ' + lType + ' in table ' + aTableName + '. Unable to determine SQL for this field.');
   end
   else
   begin
      ShowMessage('Unknown type: ' + lType + ' in table ' + aTableName + '. Unable to determine SQL for this field.');
   end;
                    

   if AnsiPos(LowerCase(aWords.Text), ' not null') <> 0 then
   begin
      if lSize = '-1' then
         sqlSQL.Lines.Add('                            @allow_null_ind = ''N'',')
      else
         sqlSQL.Lines.Add('                            @allow_null_ind = ''Y''')
   end
   else
   begin
      if lSize = '-1' then
         sqlSQL.Lines.Add('                            @allow_null_ind = ''Y'',')
      else
         sqlSQL.Lines.Add('                            @allow_null_ind = ''Y''')
   end;

   if lSize = '-1' then
      sqlSQL.Lines.Add('                            @max_length_field = ''Y''');
   sqlSQL.Lines.Add('GO');

   //SMS code
   if aSMSTable then
   begin
      mtbSMSChanges.Append;
      mtbSMSChangeschange_type.AsString     := 'A'; //Alter
      mtbSMSChangestable_name.AsString      := aTableName;
      mtbSMSChangesbusiness_object.AsString := aBO;
      mtbSMSChangesfield_name.AsString      := aWords[0];
      mtbSMSChangesfield_type.AsString      := 'type(TODO)';
      mtbSMSChangessize.AsString            := lSize;
      mtbSMSChangesSQL.AsString             := 'alter table ' + aTableName + ' alter column ' + aWords[0] + ' type(TODO)';
      mtbSMSChanges.Post;
   end;
end;

function TdSchemaChange.IsFieldInOldDDL(aOldMemo : TSynEdit; aFieldName : String) : Boolean;
var
   lInCreateTable : Boolean;
   I : Integer;
   lText : String;
   lWords : TStringList;
begin
   lInCreateTable := False;
   Result := False;
   for I := 0 to aOldMemo.Lines.Count - 1 do
   begin
      lText := LowerCase(Trim(aOldMemo.Lines[I]));
      if AnsiPos('create table', lText) = 1 then
         lInCreateTable := True
      else if lInCreateTable and (AnsiPos(')', lText) = 1) then
         lInCreateTable := False;

      if lInCreateTable then
      begin
         lWords := TStringList.Create;
         try
            SplitSQL(lWords, lText,' ', False);
            if (lWords.Count > 0) and (lWords[0] = aFieldName) then
            begin
               Result := True;
            end;
         finally
            FreeAndNil(lWords);
         end;
      end;
   end;
end;

function TdSchemaChange.IsIndexInOldDDL(aOldMemo : TSynEdit; aIndexName : String) : Boolean;
var
   lInCreateTable : Boolean;
   I : Integer;
   lText : String;
   lWords : TStringList;
begin
   lInCreateTable := False;
   Result := False;
   for I := 0 to aOldMemo.Lines.Count - 1 do
   begin
      lText := LowerCase(Trim(aOldMemo.Lines[I]));
      if AnsiPos('create table', lText) = 1 then
         lInCreateTable := True
      else if lInCreateTable and (AnsiPos(')', lText) = 1) then
         lInCreateTable := False;

      if not lInCreateTable then
      begin
         lWords := TStringList.Create;
         try
            SplitSQL(lWords, lText,' ', False);
            if (lWords.Count > 2) and
               (lWords[0] = 'create') and
               (lWords[1] = 'index') and
               (lWords[2] = aIndexName) then
            begin
               Result := True;
            end;
         finally
            FreeAndNil(lWords);
         end;
      end;
   end;
end;

procedure TdSchemaChange.cboTaskChange(Sender: TObject);
begin
   CanPrepare;
end;

procedure TdSchemaChange.cboVersionChange(Sender: TObject);
begin
   CanPrepare;
end;

procedure TdSchemaChange.CanPrepare;
begin
   btnPrepare.Enabled := (Trim(cboTask.Text) <> '') and (Trim(edtLocalTaskBranch.Text) <> '') and
      (Trim(cboVersion.Text) <> '') and (Trim(edtSchemaChangeFolder.Text) <> '');
end;

procedure TdSchemaChange.btnExecuteClick(Sender: TObject);
var
   I : Integer;
   lSchemaFolder, lLocalBranchFolder : string;
   lTaskDesc, lSubject : string;
   lPublicDDLFileName : string;
   attrs : Integer;
begin
   lSchemaFolder      := Trim(edtSchemaChangeFolder.Text);
   lLocalBranchFolder := Trim(edtLocalTaskBranch.Text);

   for I := 0 to fDDLFileNames.Count - 1 do
   begin
      //Replace ddl files in local branch DataModel folder
      if not CopyFile(PAnsiChar(lSchemaFolder + '\' + fDDLFileNames[I]), PAnsiChar(lLocalBranchFolder + '\Datamodel\Schema\' + fDDLFileNames[I]), False) then
      begin
         ShowMessage('Failed to copy ' + fDDLFileNames[I] + ' to local branch DataModel folder');
         Exit;
      end;

      //Replace ddl files on T drive and set to read only
      lPublicDDLFileName := fTSchemaFolder + '\' + fDDLFileNames[I];
      attrs := filegetattr(lPublicDDLFileName);

//      if (attrs and faReadOnly) > 0 then
//      begin
//         // Make the file non read only
//         if not (filesetattr(lPublicDDLFileName, faAnyFile) > 0) then
//            ShowMessage('Unable to make ' + lPublicDDLFileName + ' non read-only');
//      end;

      //This will overwrite the file
      if not CopyFile(PAnsiChar(lSchemaFolder + '\' + fDDLFileNames[I]), PAnsiChar(lPublicDDLFileName), False) then
      begin
         ShowMessage('Failed to copy ' + fDDLFileNames[I] + ' to public DataModel folder');
         Exit;
      end
      else //Copy was successful
      begin
//         // Make the file read only
//         if not (filesetattr(lPublicDDLFileName, faReadOnly) > 0) then
//            ShowMessage('Unable to make ' + lPublicDDLFileName + ' read-only');
      end;
   end;

   //Schema upgrade script
   if (Trim(sqlSQL.Text) <> '') then
   begin
      //Append whatever is in the SQL memo, to the schema upgrade script
      if not AppendSQLToUpgradeScript(False) then
      begin
         ShowMessage('Unable to append SQL to local schemaupgrade.sql. Manually intervention is now required as the ddl files have been copied');
         Exit;
      end;

      //Set the public schema upgrade script to read only
      if not AppendSQLToUpgradeScript(True) then
      begin
         ShowMessage('Unable to append SQL to public schemaupgrade.sql. Manually intervention is now required as the ddl files have been copied');
         Exit;
      end;

      //Apply new SQL to RDHeadOffice
      if not ApplySQLToRMS(False) then
      begin
         ShowMessage('Unable to apply SQL to RMS dev test. Manually intervention is now required as the ddl files have been copied and schema upgrade updated.');
         Exit;
      end;

      //Apply new SQL to RDReference
      if not ApplySQLToRMS(True) then
      begin
         ShowMessage('Unable to apply SQL to RDReference. Manually intervention is now required as the ddl files have been copied, schema upgrade updated and RMS dev test updated.');
         Exit;
      end;
   end;

   lTaskDesc := GetTaskDesc;

   //Cycle through mtbSMSChanges to make code changes
   ProcessSMSChanges(lTaskDesc);

   //Commit to SVN.
   CommitToSVN(lTaskDesc);

   //Setup mail
   lSubject := '[' + Trim(cboVersion.Text) + ']: Task ' + Trim(cboTask.Text) + ' - ' + lTaskDesc + ' - Schema Change Request';
   DisplayMail('', lSubject, '');

   btnExecute.Enabled := False;
end;

function TdSchemaChange.AppendSQLToUpgradeScript(aPublic : Boolean) : Boolean;
var
   lUpgradeScript : TextFile;
   lLocalBranchFolder : string;
   I: Integer;
begin
   Result := False;
   lLocalBranchFolder := Trim(edtLocalTaskBranch.Text);

   if aPublic then
      AssignFile(lUpgradeScript, fSchemaUpgradeFile)
   else
      AssignFile(lUpgradeScript, lLocalBranchFolder + '\DataModel\SQL\schema_upgrade.sql');

   try
      Append(lUpgradeScript);

      for I := 0 to sqlSQL.Lines.Count - 1 do
      begin
         WriteLn(lUpgradeScript, sqlSQL.Lines[I]);
      end;
      Result := True;
   finally
      CloseFile(lUpgradeScript);
   end;

   if aPublic then
   begin
//      if not (filesetattr(fSchemaUpgradeFile, faReadOnly) > 0) then
//      begin
//         Result := False;
//         ShowMessage('Unable to make ' + fSchemaUpgradeFile + ' read-only');
//      end;
   end;
end;

function TdSchemaChange.ApplySQLToRMS(aRDReference : Boolean) : Boolean;
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
begin
   Result := False;

   lDBEDatabase := TDBEDatabase.Create;
   try
      if aRDReference then
         SetupRMSDB(lDBEDatabase, 'RDReference')
      else
         SetupRMSDB(lDBEDatabase, 'Dev');

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
      try
         lQuery.SQL.Add(Trim(sqlSQL.Text));
         lQuery.ExecSQL;
         Result := True;
      finally
         lQuery := nil;
      end;
   finally
      lDBEDatabase.Connected := False;
      lDBEDatabase.Free;
   end;
end;

procedure TdSchemaChange.ProcessSMSChanges(aTaskDesc : String);
var
   lFNPosSchema, lFNDCM4Inc, lFNDCM4Pas, lFNDCM3Dfm, lFNDCM3Pas, lFNPosDfm, lFNPosPas : string;
   lPosSchema, lDCM4Inc, lDCM4Pas, lDCM3Dfm, lDCM3Pas, lPosDfm, lPosPas : TextFile;
   lLocalBranchFolder : string;
   lBO : string;
   lText : String;
   lInTable : Boolean;
   I, lEndLine : Integer;
   lYear, lMonth, lDay : Word;
begin
   lLocalBranchFolder := Trim(edtLocalTaskBranch.Text);
   mtbSMSChanges.First;
   while not mtbSMSChanges.eof do
   begin
      lBO := mtbSMSChangesbusiness_object.AsString;
      Delete(lBO, 1, 2);

      lFNPosSchema := lLocalBranchFolder + '\DataModel\POSSchema.pas';
      lFNDCM4Inc   := lLocalBranchFolder + '\DCM4\Schema\us' + lBO + '.inc';
      lFNDCM4Pas   := lLocalBranchFolder + '\DCM4\Schema\us' + lBO + '.pas';
      lFNDCM3Dfm   := lLocalBranchFolder + '\HODCM 3.5\uo'   + lBO + '.dfm';
      lFNDCM3Pas   := lLocalBranchFolder + '\HODCM 3.5\uo'   + lBO + '.pas';
      lFNPosDfm    := lLocalBranchFolder + '\Pos\Source\uo'  + lBO + '.dfm';
      lFNPosPas    := lLocalBranchFolder + '\Pos\Source\uo'  + lBO + '.pas';

      //Must also apply SQL change to NexusDB MasterSchema on build machine.
      //SMSDataEditor can access this DB remotely, Nexus@HV_SMS_BUILD -> MasterSchema,
      //which means it's theoretically possible to do.

      //DCM4 Inc file
      lInTable := False;
      AssignFile(lDCM4Inc, lFNDCM4Inc);
      try
         I := 1;
         ReSet(lDCM4Inc);
         while not Eof(lDCM4Inc) do
         begin
            ReadLn(lDCM4Inc, lText);
            if AnsiPos(Trim(lText), 'lTable   := AddTable(''' + mtbSMSChangestable_name.AsString + ''',') <> 0 then
               lInTable := True;

            if lInTable then
            begin
               if AnsiPos(Trim(lText), 'end;') <> 0 then
               begin
                  lEndLine := I;
               end;
            end;
            Inc(I);
         end;

         I := 1;
         ReWrite(lDCM4Inc);
         while not Eof(lDCM4Inc) do
         begin
            ReadLn(lDCM4Inc, lText);
            if I = lEndLine - 1 then  //found it
            begin
               WriteLn('      AddColumn(''' + mtbSMSChangesfield_name.AsString + ''',   sft' + mtbSMSChangesfield_type.AsString + ',   ' + mtbSMSChangessize.AsString + ');');
               Break;
            end;
            Inc(I);
         end;
      finally
         CloseFile(lDCM4Inc);
      end;

      //DCM4 Pas file
      AssignFile(lDCM4Pas, lFNDCM4Pas);
      try
         I := 1;
         ReSet(lDCM4Pas);
         while not Eof(lDCM4Pas) do
         begin
            ReadLn(lDCM4Pas, lText);
            //TODO - Decide whether to create a new version comment
            if AnsiPos(Trim(lText), '| ********************* Version') <> 0 then
               lInTable := True;

            if lInTable then
            begin
//               DecodeDate(Date, lYear, lMonth, lDay);
//               WriteLn('| ' + Trim(cboTask.Text) + ' ' + lYear + lMonth + lDay + ' ' + Trim(cboPayrollId.Text) + '   Schema Change Request');
//               WriteLn('|                        - ' + aTaskDesc);
//               WriteLn('|                       Table ' + mtbSMSChangestable_name.AsString + ':');
//               WriteLn('|                        - Add ' + mtbSMSChangesfield_name.AsString);
//               Break;
            end;
            Inc(I);
         end;
      finally
         CloseFile(lDCM4Inc);
      end;

      mtbSMSChanges.Next;
   end;

   
end;

function TdSchemaChange.GetTaskDesc : string;
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
begin
   Result := '';
   if Trim(cboTask.Text) = '' then Exit;

   lDBEDatabase := TDBEDatabase.Create;
   try
      SetupRMSDB(lDBEDatabase, 'RDHeadOffice');
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
      lQuery.SQL.Add('select task_name from task with (nolock) where task_number = ' + QuotedStr(Trim(cboTask.Text)));
      lQuery.Open;
      try
         if not lQuery.eof then
         begin
            Result := lQuery.FieldByName('task_name').AsString;
         end
         else
            ShowMessage('Task ' + Trim(cboTask.Text) + ' not found in RMS');
      finally
         lQuery.Close;
         lQuery := nil;
      end;
   finally
      lDBEDatabase.Connected := False;
      lDBEDatabase.Free;
   end;
end;

procedure TdSchemaChange.CommitToSVN(aTaskDesc : String);
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
   lTaskDesc, lLogMessage, lCommandToRun : string;
   StartInfo: TStartupInfo;
   ProcInfo: TProcessInformation;
   procHandle : THandle;

   procedure RunCommandAndWait(aCommand : String);
   begin
      CmdLine := 'C:\\windows\\system32\\cmd.exe';
      CreateProcess(PChar(CmdLine),PChar(aCommand),Nil,Nil,False,CREATE_NO_WINDOW,nil,nil,StartInfo,ProcInfo);
      procHandle := ProcInfo.hProcess;
      WaitForSingleObject(procHandle, INFINITE);
   end;
begin
   lLogMessage := '"[' + Trim(cboVersion.Text) + ']' + ' ' + Trim(cboTask.Text) + ' ' + aTaskDesc + '"';
   lCommandToRun := '/C TortoiseProc.exe /command:commit /logmsg:' + lLogMessage + ' /path:"' + Trim(edtLocalTaskBranch.Text) + '"';
   RunCommandAndWait(lCommandToRun);
end;

procedure TdSchemaChange.DisplayMail(aAddress, aSubject, aBody: string);
var
   pCh: String;
begin
  pCh := 'mailto:' + aAddress + '?subject=' + aSubject + '&body=' + aBody;
  ShellExecute(0, 'open', PAnsiChar(pCh), nil, nil, SW_SHOWNORMAL);
end;

procedure TdSchemaChange.edtLocalTaskBranchChange(Sender: TObject);
begin
   CanPrepare;
end;

procedure TdSchemaChange.edtSchemaChangeFolderChange(Sender: TObject);
begin
   CanPrepare;
end;

procedure TdSchemaChange.btnLocalSCRTaskBranchClick(Sender: TObject);
var
   lFolderNotChosen : Boolean;
   lFolderChosen : String;
   lDefaultFolder : String;
begin
   lDefaultFolder := '';
   if edtLocalTaskBranch.Text <> '' then
      lDefaultFolder := edtLocalTaskBranch.Text
   else
   begin
      if DirectoryExists('C:\svn\rd\SMS\Branches') then
          lDefaultFolder := 'C:\svn\rd\SMS\Branches'
      else if DirectoryExists('C:\dev\rd\SMS\Branches') then
          lDefaultFolder := 'C:\dev\rd\SMS\Branches'
   end;   
   lFolderChosen := ChooseFolder(lFolderNotChosen, 'Set Local SCR Task Branch Directory',
      lDefaultFolder, self);
   if not lFolderNotChosen then
   begin
      edtLocalTaskBranch.Text := lFolderChosen;
   end;
end;

procedure TdSchemaChange.btnSchemaFolderClick(Sender: TObject);
var
   lFolderNotChosen : Boolean;
   lFolderChosen, lDefaultFolder : String;
begin
   lDefaultFolder := '';
   if Trim(edtSchemaChangeFolder.Text) = '' then
      lDefaultFolder := '\\rdsvr\Public\Development Tasks\Schema Change Requests';
   lFolderChosen := ChooseFolder(lFolderNotChosen, 'Set Schema Change Directory',
      lDefaultFolder, self);
   if not lFolderNotChosen then
   begin
      edtSchemaChangeFolder.Text := lFolderChosen;
   end;
end;

procedure TdSchemaChange.SetupRMSDB(var aDBEDatabase : TDBEDatabase; aDBIni : String);
var
   SMSDataEditorIni : TIniFile;
begin
   SMSDataEditorIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      aDBEDatabase.ServerName := SMSDataEditorIni.ReadString(aDBIni, 'Server', '');
      aDBEDatabase.AliasName  := SMSDataEditorIni.ReadString(aDBIni, 'AliasName', '');
      aDBEDatabase.UserName   := SMSDataEditorIni.ReadString(aDBIni, 'Username', '');
      aDBEDatabase.Password   := SMSDataEditorIni.ReadString(aDBIni, 'Password', '');
   finally
      SMSDataEditorIni.Free;
   end;
end;

procedure TdSchemaChange.FillDropdowns;
var
   lQuery : ISQLQuery;
   lDBEDatabase : TDBEDatabase;
begin
   cboTask.Items.Clear;
   cboVersion.Items.Clear;

   lDBEDatabase := TDBEDatabase.Create;
   try
      SetupRMSDB(lDBEDatabase, 'RDHeadOffice');
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
      lQuery.SQL.Add('select task_number from task (nolock) where lifecycle <> 95 order by task_number');
      try
         lQuery.Open;
         lQuery.First;
         while not lQuery.eof do
         begin
            cboTask.Items.Add(lQuery.FieldByName('task_number').AsString);
            lQuery.Next;
         end;
      finally
         lQuery.Close;
      end;

      lQuery.SQL.Clear;
      lQuery.SQL.Add('select release_mnemonic from systemrdversion with (nolock)');
      lQuery.SQL.Add(' where systemrd_code = ' + QuotedStr('SMS'));
      lQuery.SQL.Add(' and release_mnemonic > ' + QuotedStr('SMS 4.9.28'));
      lQuery.SQL.Add(' order by established_on desc');
      lQuery.Open;
      try
         while not lQuery.eof do
         begin
            cboVersion.Items.Add(lQuery.FieldByName('release_mnemonic').AsString);
            lQuery.Next;
         end;
      finally
         lQuery.Close;
      end;
   finally
      lQuery := nil;
      lDBEDatabase.Connected := False;
      lDBEDatabase.Free;
   end;
end;

function TdSchemaChange.GetBusinessObject(aTableName : String) : string;
var
   DCIni : TIniFile;
   I : Integer;
begin
   DCIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      Result  := DCIni.ReadString('BOList', aTableName, '');
   finally
      DCIni.Free;
   end;
end;

procedure TdSchemaChange.NewDDLSpecialLineColors(Sender: TObject;
  Line: Integer; var Special: Boolean; var FG, BG: TColor);
var
   lDDLIndex : Integer;
   lMemo : TSynEdit;
   lTabSheet : TTabSheet;
begin
   lMemo := (Sender as TSynEdit);
   lTabSheet := (lMemo.Parent as TTabSheet);
   lDDLIndex := lTabSheet.PageIndex;

   if fNewDDLNewLines[lDDLIndex].IndexOf(IntToStr(Line)) <> -1 then
   begin
      Special := True;
      BG := clGreen;
      FG := clWhite;
   end
   else if fNewDDLAlteredLines[lDDLIndex].IndexOf(IntToStr(Line)) <> -1 then
   begin
      Special := True;
      BG := clPurple;
      FG := clWhite;
   end;
end;

procedure TdSchemaChange.FormDestroy(Sender: TObject);
begin
   ResetPreparation;
end;

end.
