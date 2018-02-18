unit udSelectOptions;
{
  Feb 2015 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TdSelectOptions = class(TForm)
    edtTop: TLabeledEdit;
    cbNoLock: TCheckBox;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetUp(aTop : Integer; aNoLock : Boolean);
    procedure GetOptions(var aTop : Integer; var aNoLock : Boolean);
  end;

implementation

{$R *.dfm}

procedure TdSelectOptions.SetUp(aTop : Integer; aNoLock : Boolean);
begin
   edtTop.Text := IntToStr(aTop);
   cbNoLock.Checked := aNoLock;
end;

procedure TdSelectOptions.GetOptions(var aTop : Integer; var aNoLock : Boolean);
begin
   aTop := StrToInt(edtTop.Text);
   aNoLock := cbNoLock.Checked;
end;

procedure TdSelectOptions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

end.
