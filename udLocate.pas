unit udLocate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TdLocate = class(TForm)
    edtLocate: TLabeledEdit;
    cbPartialMatch: TCheckBox;
    cbCaseInsensitive: TCheckBox;
    btnCancel: TButton;
    btnOK: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure GetValue(var aValue: String; var aPartial,
      aCaseInsensitive: Boolean);
    procedure SetUp(aFieldName: String);
    { Public declarations }
  end;

implementation

procedure TdLocate.SetUp(aFieldName : String);
begin
   edtLocate.EditLabel.Caption := aFieldName;
end;

procedure TdLocate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdLocate.GetValue(var aValue : String;
  var aPartial : Boolean; var aCaseInsensitive : Boolean);
begin
   aValue := edtLocate.Text;
   aPartial := cbPartialMatch.Checked;
   aCaseInsensitive := cbCaseInsensitive.Checked;
end;

{$R *.dfm}

end.
