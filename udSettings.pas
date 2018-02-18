unit udSettings;
{
  Oct/Nov 2014 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Spin, SMDBGrid, DB, uuGlobals;

type
  TdSettings = class(TForm)
    cdOptions: TColorDialog;
    lblInactive: TLabel;
    btnDefaultSQLColors: TButton;
    btnSchemaDir: TSpeedButton;
    lblSchemaDir: TLabel;
    cbUppercaseSQL: TCheckBox;
    cbRowNumbers: TCheckBox;
    cbAutoRefresh: TCheckBox;
    gbSQL: TGroupBox;
    gbGrid: TGroupBox;
    lblFilterRow: TLabel;
    gbShortcuts: TGroupBox;
    pnlInactiveCol: TPanel;
    pnlFilterCol: TPanel;
    cbSelectedBold: TCheckBox;
    cbNewRecView: TCheckBox;
    edtMouseScroll: TSpinEdit;
    lblMouseScroll: TLabel;
    pnlOddCol: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlBackgroundCol: TPanel;
    cbRollbackSQL: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    gbTypeColours: TGroupBox;
    pnlString: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    pnlFloat: TPanel;
    Label10: TLabel;
    pnlInteger: TPanel;
    Label11: TLabel;
    pnlDateTime: TPanel;
    cbTypeColours: TCheckBox;
    Label12: TLabel;
    pnlCurrency: TPanel;
    Label13: TLabel;
    pnlFooterCol: TPanel;
    gbCtrlAlt: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    gbSQLShortcuts: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cbRemoteNexus: TCheckBox;
    Label21: TLabel;
    pnlSelectedCol: TPanel;
    lblSelectedRow: TLabel;
    cbAutoFilterReg: TCheckBox;
    cbAutoFilterLoc: TCheckBox;
    lblBranchDir: TLabel;
    btnBranchDir: TSpeedButton;
    edtReposDir: TLabeledEdit;
    lbl1: TLabel;
    edtDBTimeout: TSpinEdit;
    lbl2: TLabel;
    edtEmployeeCode: TLabeledEdit;
    procedure btnSchemaDirClick(Sender: TObject);
    procedure btnDefaultSQLColorsClick(Sender: TObject);
    procedure pnlColClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnBranchDirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadSettings;
    procedure SetSettings;
  end;

implementation

uses Math;

{$R *.dfm}

procedure TdSettings.LoadSettings;
begin
   pnlInactiveCol.Color := gSettings.ColInactive;
   pnlFilterCol.Color := gSettings.ColFilter;
   pnlBackgroundCol.Color := gSettings.ColBackground;
   pnlOddCol.Color := gSettings.ColOdd;
   pnlFooterCol.Color := gSettings.ColFooter;
   pnlSelectedCol.Color := gSettings.ColSelected;

   cbTypeColours.Checked := gSettings.TypeColours;
   pnlString.Color := gSettings.ColString;
   pnlInteger.Color := gSettings.ColInteger;
   pnlFloat.Color := gSettings.ColFloat;
   pnlDateTime.Color := gSettings.ColDateTime;
   pnlCurrency.Color := gSettings.ColCurrency;

   cbSelectedBold.Checked := gSettings.SelectedBold;
   cbNewRecView.Checked := gSettings.NewRecView;
   cbRowNumbers.Checked := gSettings.ShowRows;
   cbAutoRefresh.Checked := gSettings.AutoRefresh;
   cbUppercaseSQL.Checked := gSettings.UppercaseSQL;
   cbRollbackSQL.Checked := gSettings.RollbackSQL;
   cbRemoteNexus.Checked := gSettings.RemoteNexus;
   cbAutoFilterReg.Checked := gSettings.AutoFilterReg;
   cbAutoFilterLoc.Checked := gSettings.AutoFilterLoc;

   edtMouseScroll.Text := gSettings.MouseScroll;
   edtDBTimeout.Text   := gSettings.DBTimeout;

   lblSchemaDir.Caption := gSettings.SchemaDir;
   lblBranchDir.Caption := gSettings.BranchDir;
   edtReposDir.Text     := gSettings.ReposDir;
   edtEmployeeCode.Text := gSettings.EmployeeCode;
end;

procedure TdSettings.btnDefaultSQLColorsClick(Sender: TObject);
begin
   pnlInactiveCol.Color := NON_ACTIVE_COLOUR;
   pnlFilterCol.Color := FILTER_COLOR;
   pnlBackgroundCol.Color := BACKGROUND;
   pnlOddCol.Color := ODD_COLOR;
   pnlFooterCol.Color := FOOTER_COLOR;
   pnlSelectedCol.Color := SELECTED_COLOR;

   pnlString.Color := STRING_COLOR;
   pnlInteger.Color := INTEGER_COLOR;
   pnlFloat.Color := FLOAT_COLOR;
   pnlDateTime.Color := DATETIME_COLOR;
   pnlCurrency.Color := CURRENCY_COLOR;
end;

procedure TdSettings.btnSchemaDirClick(Sender: TObject);
var
   lFolderNotChosen : Boolean;
   lFolderChosen : String;
begin
   lFolderChosen := ChooseFolder(lFolderNotChosen, 'Set Schema Directory',
      lblSchemaDir.Caption, self);
   if not lFolderNotChosen then
   begin
      lblSchemaDir.Caption := lFolderChosen;
   end;
end;

procedure TdSettings.btnBranchDirClick(Sender: TObject);
var
   lFolderNotChosen : Boolean;
   lFolderChosen : String;
begin
   lFolderChosen := ChooseFolder(lFolderNotChosen, 'Set SMS Branch Directory',
      lblBranchDir.Caption, self);
   if not lFolderNotChosen then
   begin
      lblBranchDir.Caption := lFolderChosen;
   end;
end;

procedure TdSettings.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdSettings.SetSettings;
begin
   //Return a global Options record for fast access

   gSettings.ColInactive := pnlInactiveCol.Color;
   gSettings.ColFilter := pnlFilterCol.Color;
   gSettings.ColBackground := pnlBackgroundCol.Color;
   gSettings.ColOdd := pnlOddCol.Color;
   gSettings.ColFooter := pnlFooterCol.Color;
   gSettings.ColSelected := pnlSelectedCol.Color;

   gSettings.TypeColours := cbTypeColours.Checked;
   gSettings.ColString := pnlString.Color;
   gSettings.ColInteger := pnlInteger.Color;
   gSettings.ColFloat := pnlFloat.Color;
   gSettings.ColDateTime := pnlDateTime.Color;
   gSettings.ColCurrency := pnlCurrency.Color;

   gSettings.SelectedBold := cbSelectedBold.Checked;
   gSettings.NewRecView := cbNewRecView.Checked;
   gSettings.ShowRows := cbRowNumbers.Checked;
   gSettings.UppercaseSQL := cbUppercaseSQL.Checked;
   gSettings.AutoRefresh := cbAutoRefresh.Checked;
   gSettings.RollbackSQL := cbRollbackSQL.Checked;
   gSettings.RemoteNexus := cbRemoteNexus.Checked;
   gSettings.AutoFilterReg := cbAutoFilterReg.Checked;
   gSettings.AutoFilterLoc := cbAutoFilterLoc.Checked;

   gSettings.SchemaDir := lblSchemaDir.Caption;
   gSettings.BranchDir := lblBranchDir.Caption;
   gSettings.ReposDir := edtReposDir.Text;

   gSettings.MouseScroll := edtMouseScroll.Text;
   gSettings.DBTimeout := edtDBTimeout.Text;
   gSettings.EmployeeCode := edtEmployeeCode.Text;

   //Set Registry Settings
   SetRegistry(ColorToString(pnlInactiveCol.Color), 'DEInactiveColor');
   SetRegistry(ColorToString(pnlFilterCol.Color), 'DEFilterColor');
   SetRegistry(ColorToString(pnlBackgroundCol.Color), 'DEBackground');
   SetRegistry(ColorToString(pnlOddCol.Color), 'DEOddColor');
   SetRegistry(ColorToString(pnlFooterCol.Color), 'DEFooterColor');
   SetRegistry(ColorToString(pnlSelectedCol.Color), 'DESelectedColor');

   SetRegistry(ColorToString(pnlString.Color), 'DEStringColor');
   SetRegistry(ColorToString(pnlInteger.Color), 'DEIntegerColor');
   SetRegistry(ColorToString(pnlFloat.Color), 'DEFloatColor');
   SetRegistry(ColorToString(pnlDateTime.Color), 'DEDateTimeColor');
   SetRegistry(ColorToString(pnlCurrency.Color), 'DECurrencyColor');

   SetRegistry(RegBoolToStr(cbSelectedBold.Checked), 'DESelectedBold');
   SetRegistry(RegBoolToStr(cbNewRecView.Checked), 'DENewRecView');
   SetRegistry(RegBoolToStr(cbRowNumbers.Checked), 'DERowNumbers');
   SetRegistry(RegBoolToStr(cbUppercaseSQL.Checked), 'DEUppercaseSQL');
   SetRegistry(RegBoolToStr(cbAutoRefresh.Checked), 'DEAutoRefresh');
   SetRegistry(RegBoolToStr(cbRollbackSQL.Checked), 'DERollbackSQL');
   SetRegistry(RegBoolToStr(cbRemoteNexus.Checked), 'DERemoteNexus');
   SetRegistry(RegBoolToStr(cbAutoFilterReg.Checked), 'DEAutoFilterReg');
   SetRegistry(RegBoolToStr(cbAutoFilterLoc.Checked), 'DEAutoFilterLoc');

   SetRegistry(edtMouseScroll.Text, 'DEMouseScroll');
   SetRegistry(edtDBTimeout.Text, 'DEDBTimeout');
   
   if edtEmployeeCode.Text <> '' then
      SetRegistry(edtEmployeeCode.Text, 'DEEmployeeCode');

   if lblSchemaDir.Caption <> '' then
      SetRegistry(lblSchemaDir.Caption, 'DESchemaDir');

   if lblBranchDir.Caption <> '' then
      SetRegistry(lblBranchDir.Caption, 'DEBranchDir');

   if edtReposDir.Text <> '' then
      SetRegistry(edtReposDir.Text, 'DEReposDir');
end;

procedure TdSettings.pnlColClick(Sender: TObject);
begin
   cdOptions.Color := (Sender as TPanel).Color;
   if cdOptions.Execute then
      (Sender as TPanel).Color := cdOptions.Color;
end;

end.
