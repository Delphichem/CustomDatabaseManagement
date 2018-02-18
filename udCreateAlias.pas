unit udCreateAlias;
{
  July 2015 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit;

type
  TdCreateAlias = class(TForm)
    Label1: TLabel;
    edtAlias: TEdit;
    lblAlias: TLabel;
    btnCancel: TButton;
    btnOK: TButton;
    edtWorkingDirectory: TJvDirectoryEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fAliasFixed : Boolean;
  public
    { Public declarations }
    procedure SetUp(aAlias : String; aWorkingDirectory : String; aAliasFixed : Boolean);
    procedure GetAlias(var aAlias, aWorkingDirectory: String);
  end;

implementation

procedure TdCreateAlias.SetUp(aAlias : String; aWorkingDirectory : String;
   aAliasFixed : Boolean);
begin
   edtAlias.Text := aAlias;
   edtWorkingDirectory.Text := aWorkingDirectory;
   fAliasFixed := aAliasFixed;
end;

procedure TdCreateAlias.FormShow(Sender: TObject);
begin
   if fAliasFixed then
   begin
      edtWorkingDirectory.SetFocus;
      edtAlias.Enabled := False;
      btnOK.Caption := 'Edit';
      Self.Caption := 'Set Working Directory';
   end
   else
   begin
      edtAlias.SetFocus;
      btnOK.Caption := 'Create';
      Self.Caption := 'Create Alias';
   end;
end;

procedure TdCreateAlias.btnOKClick(Sender: TObject);
begin
   if not DirectoryExists(edtWorkingDirectory.Text) then
   begin
      ShowMessage('Working Directory does not exist');
      edtWorkingDirectory.SetFocus;
      ModalResult := mrNone;
   end
   else
      ModalResult := mrOk;
end;

procedure TdCreateAlias.GetAlias(var aAlias : String; var aWorkingDirectory : String);
begin
   aAlias := edtAlias.Text;
   aWorkingDirectory := edtWorkingDirectory.Text;
end;

procedure TdCreateAlias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

{$R *.dfm}

end.
