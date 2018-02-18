unit udTaskSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TdTaskSettings = class(TForm)
    btnBranchDir: TSpeedButton;
    edtBranchReposDir: TLabeledEdit;
    edtEmployeeCode: TLabeledEdit;
    lblBranchDir: TLabel;
    edtApp: TLabeledEdit;
    btnTrunkDir: TSpeedButton;
    lblTrunkDir: TLabel;
    edtTrunkReposDir: TLabeledEdit;
    procedure btnBranchDirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnTrunkDirClick(Sender: TObject);
  private

  public
    procedure SetSettings;
    procedure LoadSettings;
  end;

implementation

uses uuGlobals;

{$R *.dfm}

procedure TdTaskSettings.btnBranchDirClick(Sender: TObject);
var
   lFolderNotChosen : Boolean;
   lFolderChosen : String;
begin
   lFolderChosen := ChooseFolder(lFolderNotChosen, 'Set Local Branch Directory',
      lblBranchDir.Caption, self);
   if not lFolderNotChosen then
   begin
      lblBranchDir.Caption := lFolderChosen;
   end;
end;

procedure TdTaskSettings.btnTrunkDirClick(Sender: TObject);
var
   lFolderNotChosen : Boolean;
   lFolderChosen : String;
begin
   lFolderChosen := ChooseFolder(lFolderNotChosen, 'Set Local Trunk Directory',
      lblTrunkDir.Caption, self);
   if not lFolderNotChosen then
   begin
      lblTrunkDir.Caption := lFolderChosen;
   end;
end;

procedure TdTaskSettings.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdTaskSettings.LoadSettings;
begin
   lblBranchDir.Caption    := gSettings.BranchDir;
   edtBranchReposDir.Text  := gSettings.ReposDir;
   lblTrunkDir.Caption     := gSettings.TrunkDir;
   edtTrunkReposDir.Text   := gSettings.TrunkReposDir;
   edtEmployeeCode.Text    := gSettings.EmployeeCode;
   edtApp.Text             := gSettings.AppCode;
end;

procedure TdTaskSettings.SetSettings;
begin
   gSettings.BranchDir := lblBranchDir.Caption;
   gSettings.ReposDir := edtBranchReposDir.Text;
   gSettings.TrunkDir := lblTrunkDir.Caption;
   gSettings.TrunkReposDir := edtTrunkReposDir.Text;
   gSettings.EmployeeCode := edtEmployeeCode.Text;
   gSettings.AppCode := edtApp.Text;

   if edtEmployeeCode.Text <> '' then
      SetRegistry(edtEmployeeCode.Text, 'DEEmployeeCode');

   if edtApp.Text <> '' then
      SetRegistry(edtApp.Text, 'DEAppCode');

   if lblBranchDir.Caption <> '' then
      SetRegistry(lblBranchDir.Caption, 'DEBranchDir');

   if edtBranchReposDir.Text <> '' then
      SetRegistry(edtBranchReposDir.Text, 'DEReposDir');

   if lblTrunkDir.Caption <> '' then
      SetRegistry(lblTrunkDir.Caption, 'DETrunkDir');

   if edtTrunkReposDir.Text <> '' then
      SetRegistry(edtTrunkReposDir.Text, 'DETrunkReposDir');
end;

end.
