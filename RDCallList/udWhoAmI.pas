unit udWhoAmI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ufDBEDatabase;

type
  TdWhoAmI = class(TForm)
    btnRemember: TButton;
    cboPayrollID: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnRememberClick(Sender: TObject);
  private
     fPayrollID : string;
  public
     procedure Setup(aDB: TDBEDatabase);
     property PayrollID : string read fPayrollID write fPayrollID;
  end;


implementation

uses
   ufISQLQuery;

{$R *.dfm}

procedure TdWhoAmI.Setup(aDB : TDBEDatabase);
var
   lQry : ISQLQuery;
begin
   cboPayrollID.Items.Clear;
   try
      lQry := aDB.NewQuery;
      lQry.SQL.Clear;
      lQry.SQL.Add('select payroll_id from employee where status_ind = ' + QuotedStr('Y') + ' order by payroll_id');
      lQry.Open;
      lQry.First;
      while not lQry.eof do
      begin
         cboPayrollID.Items.Add(lQry.FieldByName('payroll_id').AsString);
         lQry.Next;
      end;
   finally
      if Assigned(lQry) then
      begin
         lQry.Close;
         lQry := nil;
      end;
   end;
end;

procedure TdWhoAmI.btnRememberClick(Sender: TObject);
begin
   fPayrollID := Trim(cboPayrollID.Text);
end;

procedure TdWhoAmI.FormShow(Sender: TObject);
begin
   cboPayrollID.SetFocus;
end;

end.
