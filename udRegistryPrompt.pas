unit udRegistryPrompt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TdRegistryPrompt = class(TForm)
    pnlRegistry: TPanel;
    edtRegister: TLabeledEdit;
    edtStore: TLabeledEdit;
    btnRegistry: TButton;
    lblChangeRegistry: TLabel;
    lblStoreTitle: TLabel;
    lblStore: TLabel;
    lblRegisterTitle: TLabel;
    lblRegister: TLabel;
    procedure btnRegistryClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetUp(aStore, aRegister, lStoreReg, lRegisterReg : string);
  end;


implementation

uses uuGlobals;

{$R *.dfm}

procedure TdRegistryPrompt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdRegistryPrompt.FormShow(Sender: TObject);
begin
   btnRegistry.SetFocus;
end;

procedure TdRegistryPrompt.SetUp(aStore, aRegister, lStoreReg, lRegisterReg : string);
begin
   lblStore.Caption := lStoreReg;
   lblRegister.Caption := lRegisterReg;
   edtRegister.Text := aRegister;
   edtStore.Text := aStore;
end;

procedure TdRegistryPrompt.btnRegistryClick(Sender: TObject);
begin
   SetRegistry(edtStore.Text, 'location_code', POS_DIRECTORY);
   SetRegistry(edtRegister.Text, 'register_code', POS_DIRECTORY);
   SetRegistry('POS' + edtStore.Text + edtRegister.Text, 'remedipc_id', POS_DIRECTORY);
   ModalResult := mrOk;
end;

end.
