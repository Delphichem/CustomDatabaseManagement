unit udCheckout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TdCheckout = class(TForm)
    btnGo: TButton;
    lblTaskName: TLabel;
    edtTask: TComboBox;
    lblTask: TLabel;
    rgCheckout: TRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtTaskChange(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    fTask : string;
  public
    property Task : string write fTask;
  end;

implementation

uses uuGlobals, uuTask;

{$R *.dfm}

procedure TdCheckout.btnGoClick(Sender: TObject);
var
   StartInfo: TStartupInfo;
   ProcInfo: TProcessInformation;
   procHandle : THandle;
   lLogMessage : string;
   lCommandToRun : string;
const
   NEXUS_REPOS = 'https://rdsvn/svn/rd/SMS/branches/NexusDB';
   TRUNK_REPOS = 'https://rdsvn/svn/rd/SMS/trunk';

   procedure RunCommandAndWait(aCommand : String);
   begin
      CreateProcess(PChar(CmdLine),PChar(aCommand),Nil,Nil,False,CREATE_NO_WINDOW,nil,nil,StartInfo,ProcInfo);
      procHandle:= ProcInfo.hProcess;
      WaitForSingleObject(procHandle, INFINITE);
   end;

begin
   //lLogMessage := '"[' + lVersion + ']' + ' ' + edtTask.Text + ' ' + lblTaskName.Caption + '"';
//   CmdLine := 'C:\\windows\\system32\\cmd.exe';
//   //Copy mainstream to version folder
//   if rgCheckout.ItemIndex = 0 then
//   begin
//      lCommandToRun := '/C TortoiseProc.exe /command:copy /path:"' + TRUNK_REPOS + '" /url:"' + gSettings.ReposDir + edtTask.Text + '"';
//      RunCommandAndWait(lCommandToRun);
//   end
//   else if rgCheckout.ItemIndex = 1 then
//   begin
//      lCommandToRun := '/C TortoiseProc.exe /command:copy /path:"' + NEXUS_REPOS + '" /url:"' + gSettings.ReposDir + edtTask.Text + '"';
//      RunCommandAndWait(lCommandToRun);
//   end;
//
//   lCommandToRun := '/C TortoiseProc.exe /command:checkout /path:"' + gSettings.BranchDir + '\' + edtTask.Text + '" /url:"' + gSettings.ReposDir + edtTask.Text + '"';
//   RunCommandAndWait(lCommandToRun);
   ShowMessage('...coming soon');
   ModalResult := mrOk;
end;

procedure TdCheckout.edtTaskChange(Sender: TObject);
begin
   TaskChange(edtTask, lblTaskName);
end;

procedure TdCheckout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdCheckout.FormShow(Sender: TObject);
begin
   if gSettings.ReposDir = '' then
   begin
      ShowMessage('Set your Branch Repositry Directory in Settings.' + ^M + 'e.g. https://rdsvn/svn/rd/SMS/branches/DCL/');
      Close;
   end
   else if gSettings.BranchDir = '' then
   begin
      ShowMessage('Set your SMS Branch Directory in Settings');
      Close;
   end
   else
   begin
      edtTask.Text := fTask;
      edtTaskChange(self);
   end;
end;

end.
