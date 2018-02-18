unit udMSSQLConnect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TdMSSQLConnect = class(TForm)
    edtServer: TLabeledEdit;
    edtDatabase: TLabeledEdit;
    edtUsername: TLabeledEdit;
    edtPassword: TLabeledEdit;
    btnConnect: TButton;
    btnCancel: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetUp(const aServer, aDataBase, aUsername, aPassword : String);
    procedure GetConnection(var aServer, aDataBase, aUsername, aPassword : String);
  end;


implementation

{$R *.dfm}

procedure TdMSSQLConnect.SetUp(const aServer, aDataBase, aUsername, aPassword : String);
begin
   edtServer.Text   := aServer;
   edtDataBase.Text := aDataBase;
   edtUsername.Text := aUsername;
   edtPassword.Text := aPassword;
end;

procedure TdMSSQLConnect.GetConnection(var aServer, aDataBase, aUsername, aPassword : String);
begin
   aServer   := edtServer.Text;
   aDataBase := edtDataBase.Text;
   aUsername := edtUsername.Text;
   aPassword := edtPassword.Text;
end;

procedure TdMSSQLConnect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

end.
