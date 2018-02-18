unit udShowTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TdShowTask = class(TForm)
    pgc1: TPageControl;
    tsRequirements: TTabSheet;
    tsSolution: TTabSheet;
    tsReleaseNotes: TTabSheet;
    mmoReleaseNotes: TMemo;
    mmoSolution: TMemo;
    mmoRequirements: TMemo;
    btnSave: TButton;
    edtTaskDesc: TLabeledEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmoRequirementsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmoSolutionChange(Sender: TObject);
    procedure mmoReleaseNotesChange(Sender: TObject);
    procedure edtTaskDescChange(Sender: TObject);
  private
    fTask : string;
    fLoading, fDescChanged, fReqChanged, fSolChanged, fRelChanged : Boolean;
  public
    property Task : string write fTask;
  end;

implementation

uses
   ufISQLQuery, ufDBEDatabase, uuTask, uuGlobals;

{$R *.dfm}

procedure TdShowTask.btnSaveClick(Sender: TObject);
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
begin
   if fDescChanged or fReqChanged or fSolChanged or fRelChanged then
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
         lQuery.SQL.Add('update task set');
         lQuery.SQL.Add(' update_datetime = GETDATE()');
         if Trim(gSettings.EmployeeCode) <> '' then
            lQuery.SQL.Add(' update_user = ' + QuotedStr(gSettings.EmployeeCode));
         if fDescChanged then
            lQuery.SQL.Add(' task_name = ' + QuotedStr(Trim(edtTaskDesc.Text)));
         if fReqChanged then
            lQuery.SQL.Add(' details = ' + QuotedStr(Trim(mmoRequirements.Text)));
         if fSolChanged then
            lQuery.SQL.Add(' intention = ' + QuotedStr(Trim(mmoSolution.Text)));
         if fRelChanged then
            lQuery.SQL.Add(' action = ' + QuotedStr(Trim(mmoReleaseNotes.Text)));
         lQuery.SQL.Add(' where task.task_number = ' + QuotedStr(fTask));
         //lQuery.ExecSQL;
         fDescChanged := False;
         edtTaskDesc.EditLabel.Caption := 'Description';
         fReqChanged := False;
         tsRequirements.Caption := 'Requirements';
         fSolChanged := False;
         tsSolution.Caption := 'Solution';
         fRelChanged := False;
         tsReleaseNotes.Caption := 'Release Notes';

         Self.Caption := 'Task ' + fTask + ' ' + edtTaskDesc.Text;
         btnSave.Enabled := False;
         ShowMessage('...coming soon. No changes made');
      finally
         lQuery := nil;
         lDBEDatabase.Connected := False;
         lDBEDatabase.Free;
      end;
   end
   else
      ShowMessage('Error: No changes made');
end;

procedure TdShowTask.FormCreate(Sender: TObject);
begin
   fDescChanged := False;
   fReqChanged  := False;
   fSolChanged  := False;
   fRelChanged  := False;
   fLoading     := False;
end;

procedure TdShowTask.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdShowTask.FormShow(Sender: TObject);
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
   lDataSize : Integer;
   lDataPtr : Pointer;
   lStr : TStringStream;
begin
   btnSave.Enabled := False;

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
      lQuery.SQL.Add('select task_name, details, intention, action from task with (nolock)');
      lQuery.SQL.Add(' where task_number = ' + QuotedStr(fTask));
      lQuery.Open;
      try
         if not lQuery.eof then
         begin
            fLoading := True;
            edtTaskDesc.Text      := lQuery.FieldByName('task_name').AsString;
            mmoRequirements.Text  := lQuery.FieldByName('details').AsVariant;
            mmoSolution.Text      := lQuery.FieldByName('intention').AsVariant;
            mmoReleaseNotes.Text  := lQuery.FieldByName('action').AsVariant;
         end;
      finally
         lQuery.Close;
      end;
   finally
      lQuery := nil;
      lDBEDatabase.Connected := False;
      lDBEDatabase.Free;
      fLoading := False;
   end;
end;

procedure TdShowTask.edtTaskDescChange(Sender: TObject);
begin
   if (not fLoading) and (not fDescChanged) then
   begin
      fDescChanged := True;
      edtTaskDesc.EditLabel.Caption := 'Description*';
      btnSave.Enabled := True;
   end;
end;

procedure TdShowTask.mmoReleaseNotesChange(Sender: TObject);
begin
   if (not fLoading) and (not fRelChanged) then
   begin
      fRelChanged := True;
      tsReleaseNotes.Caption := 'Release Notes*';
      btnSave.Enabled := True;
   end;
end;

procedure TdShowTask.mmoRequirementsChange(Sender: TObject);
begin
   if (not fLoading) and (not fReqChanged) then
   begin
      fReqChanged := True;
      tsRequirements.Caption := 'Requirements*';
      btnSave.Enabled := True;
   end;
end;

procedure TdShowTask.mmoSolutionChange(Sender: TObject);
begin
   if (not fLoading) and (not fSolChanged) then
   begin
      fSolChanged := True;
      tsSolution.Caption := 'Solution*';
      btnSave.Enabled := True;
   end;
end;

end.
