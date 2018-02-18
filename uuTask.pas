unit uuTask;
{
  June 2015 Code By: Daniel Campbell
}
interface

uses
   ufDBEDatabase, StdCtrls, Classes;

procedure SetupRDHeadOffice(var aDBEDatabase : TDBEDatabase);
procedure SetupQCExplorer(var aDBEDatabase : TDBEDatabase);
function  FindUserEmail(aUser : String) : string;
procedure DisplayMail(aAddress, aSubject, aBody: string);
function  GetLastModifiedFolderName(aFolder: String; edtTask : TComboBox): String;
procedure TaskChange(edtTask: TComboBox; lblTaskName : TLabel);
procedure FillDefectsList(var aDefectsList : TStringList; aDefects : String);

implementation

uses
   IniFiles, uuGlobals, ShellAPI, SysUtils, Windows, ufISQLQuery, Dialogs;

procedure SetupRDHeadOffice(var aDBEDatabase : TDBEDatabase);
var
   SMSDataEditorIni : TIniFile;
begin
   SMSDataEditorIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      aDBEDatabase.ServerName := SMSDataEditorIni.ReadString('RDHeadOffice', 'Server', '');
      aDBEDatabase.AliasName  := SMSDataEditorIni.ReadString('RDHeadOffice', 'AliasName', '');
      aDBEDatabase.UserName   := SMSDataEditorIni.ReadString('RDHeadOffice', 'Username', '');
      aDBEDatabase.Password   := SMSDataEditorIni.ReadString('RDHeadOffice', 'Password', '');
   finally
      SMSDataEditorIni.Free;
   end;
end;

procedure SetupQCExplorer(var aDBEDatabase : TDBEDatabase);
var
   SMSDataEditorIni : TIniFile;
begin
   SMSDataEditorIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      aDBEDatabase.ServerName := SMSDataEditorIni.ReadString('QCExplorer', 'Server', '');
      aDBEDatabase.AliasName  := SMSDataEditorIni.ReadString('QCExplorer', 'AliasName', '');
      aDBEDatabase.UserName   := SMSDataEditorIni.ReadString('QCExplorer', 'Username', '');
      aDBEDatabase.Password   := SMSDataEditorIni.ReadString('QCExplorer', 'Password', '');
   finally
      SMSDataEditorIni.Free;
   end;
end;

function FindUserEmail(aUser : String) : string;
var
   SMSDataEditorIni : TIniFile;
   lCount : Integer;
   lStaff : string;
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
begin
   Result := '';
   SMSDataEditorIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      lStaff := 'someguy';
      lCount := 1;
      while lStaff <> '' do
      begin
         lStaff := SMSDataEditorIni.ReadString('Email', 'Staff' + IntToStr(lCount), '');
         if lStaff = aUser then
         begin
            Result := SMSDataEditorIni.ReadString('Email', 'Address' + IntToStr(lCount), '');
            Break;
         end;
         lCount := lCount + 1;
      end;
   finally
      SMSDataEditorIni.Free;
   end;

//   HMM....WHERE ARE THE EMPLOYEE EMAILS KEPT AGAIN?

//   lDBEDatabase := TDBEDatabase.Create;
//   try
//      SetupRDHeadOffice(lDBEDatabase);
//      try
//         lDBEDatabase.Connected := True;
//      except
//         on E : SysUtils.Exception do
//         begin
//            ShowMessage(E.Message);
//            lDBEDatabase.Free;
//            Exit;
//         end;
//      end;
//
//      lQuery := lDBEDatabase.NewQuery;
//      lQuery.SQL.Add('select email_address from employee with (nolock) where task_number = ' + QuotedStr(edtTask.Text));
//      lQuery.Open;
//      try
//         if not lQuery.eof then
//         begin
//            lblTaskName.Caption := lQuery.FieldByName('email_address').AsString;
//            lblTaskName.Visible := True;
//         end
//         else
//         begin
//            lblTaskName.Caption := '';
//            lblTaskName.Visible := False;
//         end;
//      finally
//         lQuery.Close;
//      end;
//   finally
//      lQuery := nil;
//      lDBEDatabase.Connected := False;
//      lDBEDatabase.Free;
//   end;
end;

procedure DisplayMail(aAddress, aSubject, aBody: string);
var
   pCh: String;
begin
  pCh := 'mailto:' + aAddress + '?subject=' + aSubject + '&body=' + aBody;
  ShellExecute(0, 'open', PAnsiChar(pCh), nil, nil, SW_SHOWNORMAL);
end;

function GetLastModifiedFolderName(aFolder: String; edtTask : TComboBox): String;
var
  sr: TSearchRec;
  aTime: Integer;
begin
  Result := '';
  aTime := 0;

  try
     if FindFirst(IncludeTrailingPathDelimiter(aFolder) + '*.*', faDirectory, sr) < 0 then
       Exit
     else
     repeat
       if ((sr.Attr and faDirectory <> 0) AND (sr.Name <> '.') AND (sr.Name <> '..')) then
       begin
          edtTask.Items.Add(sr.Name);
          if sr.Time > aTime then
          begin
             Result := sr.Name;
             aTime  := sr.Time;
          end;
       end;
     until FindNext(sr) <> 0;
   finally
     SysUtils.FindClose(sr) ;
   end;
end;

procedure FillDefectsList(var aDefectsList : TStringList; aDefects : String);
var
   I : Integer;
   lPos : Integer;
   lStr : string;
begin
   SplitSQL(aDefectsList, aDefects, ',', True);
   for I := 0 to aDefectsList.Count - 1 do
   begin
      lStr := aDefectsList[I];
      lPos := AnsiPos('#', lStr);
      if lPos <> 0 then
      begin
         Delete(lStr, 1, lPos);
      end;
      //StringReplace(aDefectsList[I], '#', '', []);
      Trim(lStr);
      aDefectsList[I] := lStr;
   end;   
end;

procedure TaskChange(edtTask: TComboBox; lblTaskName : TLabel);
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
begin
   lDBEDatabase := TDBEDatabase.Create;
   try
      SetupRDHeadOffice(lDBEDatabase);
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
      lQuery.SQL.Add('select task_name from task with (nolock) where task_number = ' + QuotedStr(edtTask.Text));
      lQuery.Open;
      try
         if not lQuery.eof then
         begin
            lblTaskName.Caption := lQuery.FieldByName('task_name').AsString;
            lblTaskName.Visible := True;
         end
         else
         begin
            lblTaskName.Caption := '';
            lblTaskName.Visible := False;
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

end.
