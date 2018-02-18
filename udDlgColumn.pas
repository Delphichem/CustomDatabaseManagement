unit udDlgColumn;
{
  Mar 2015 Code By: Daniel Campbell  (Stolen from original DataGenie)
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uuGlobals;

type
  TdDlgColumn = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    lbl1: TLabel;
    edtColumnName: TEdit;
    lblAliasName: TLabel;
    edtAliasName: TEdit;
    lbl2: TLabel;
    cDataType: TComboBox;
    lbl3: TLabel;
    edtLength: TEdit;
    edtSMSLength: TEdit;
    lblSMSLength: TLabel;
    lbl4: TLabel;
    edtDecimals: TEdit;
    mmoComments: TMemo;
    lbl5: TLabel;
    grp1: TGroupBox;
    cbNullsAllowed: TCheckBox;
    cbIdentity: TCheckBox;
    cbCalculated: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDecimalsKeyPress(Sender: TObject; var Key: Char);
    procedure edtLengthChange(Sender: TObject);
    procedure cDataTypeChange(Sender: TObject);
  private
    fNativeDataTypeList:     TStringList;
    procedure PopulateNativeDataTypes;
    procedure SetCtrlEnabled(aControl: TEdit; aEnabled: Boolean);
    function DoIt: Boolean;
    function FieldsAreValid: Boolean;
  public
//    DMStream:             TFDMStream;
//    DMStreamTreeNode:     TTreeNode;
//    Mode:                 String;
//    EditColumn:           TFDMColumn;
//    EditColumnTreeNode:   TTreeNode;
    fDialogMode:          TDialogMode;
//    function  DoIt: Boolean;
//    function  FieldsAreValid: Boolean;
//    procedure SetCtrlEnabled(aControl: TEdit; aEnabled: Boolean);
    property  DialogMode:   TDialogMode read  fDialogMode write fDialogMode default dmNew;
  end;


implementation

{$R *.dfm}

procedure TdDlgColumn.PopulateNativeDataTypes;
begin
	fNativeDataTypeList := TStringList.Create;
	fNativeDataTypeList.Add(DT_CHAR);
	fNativeDataTypeList.Add(DT_VARCHAR);
	fNativeDataTypeList.Add(DT_DECIMAL);
	fNativeDataTypeList.Add(DT_NUMERIC);
	fNativeDataTypeList.Add(DT_SMALLINT);
	fNativeDataTypeList.Add(DT_INTEGER);
	fNativeDataTypeList.Add(DT_REAL);
	fNativeDataTypeList.Add(DT_FLOAT);
	fNativeDataTypeList.Add(DT_DOUBLEPREC);
	fNativeDataTypeList.Add(DT_LONGVARBIN);
	fNativeDataTypeList.Add(DT_TIMESTAMP);
  	fNativeDataTypeList.Add(DT_TEXT);
   fNativeDataTypeList.Add(DT_NVARCHAR);
	fNativeDataTypeList.Add(DT_NCHAR);
   fNativeDataTypeList.Add(DT_V_LANGTRAN);
	fNativeDataTypeList.Add(DT_BIGINT);
   fNativeDataTypeList.Add(DT_VARCHAR_MAX);
end;

procedure TdDlgColumn.FormCreate(Sender: TObject);
var
   I:    Integer;
begin
   PopulateNativeDataTypes;
   for i := 0 to fNativeDataTypeList.Count - 1 do
      cDataType.Items.Add(fNativeDataTypeList.Strings[i]);
   cDataType.Text := DT_VARCHAR;
end;

function TdDlgColumn.DoIt: Boolean;
//var
//  lColumn:                TFDMColumn;
//  lNode:                  TTreeNode;
//  lLastColumnTreeNode:    TTreeNode;
//  lChild:                 TTreeNode;
//  lIndexOf:               Integer;
begin
  Result := false;
//  if FieldsAreValid then
//  begin
//    if fDialogMode = dmNew then
//    begin
//      lColumn := DMStream.Table.AddColumn(cColumnName.Text);
//      lColumn.Calculated := cbCalculated.Checked;
//    end
//    else
//    begin
//      lColumn := EditColumn;
//      lColumn.Name := cColumnName.Text;
//      lColumn.AliasName := eAliasName.Text;
//      lColumn.Calculated := cbCalculated.Checked;
//      lIndexOf := DMStream.Table.ColumnList.IndexOfObject(lColumn);
//      if lIndexOf >= 0 then
//        DMStream.Table.ColumnList.Strings[lIndexOf] := lColumn.Name;
//    end;
//    lColumn.Identity := cIdentity.Checked;
//    lColumn.DataTypeText := cDataType.Text;
//    if cLength.Text <> '' then
//      lColumn.Length := StrToInt(cLength.Text)
//    else
//      lColumn.Length := UNDEFINED_LENGTH;
//    if cDecimals.Text <> '' then
//      lColumn.SubLength := StrToInt(cDecimals.Text)
//    else
//      lColumn.SubLength := UNDEFINED_LENGTH;
//    lColumn.NullsAllowed := cNullsAllowed.Checked;
//    lColumn.Comments := cComments.Text;
//    if fDialogMode = dmNew then
//    begin
//      // Find last column
//      lLastColumnTreeNode := DMStreamTreeNode;
//      lChild := DMStreamTreeNode.GetFirstChild;
//      while (lChild <> nil) and (TObject(lChild.Data) is TFDMColumn) do
//      begin
//        lLastColumnTreeNode := lChild;
//        lChild := DMStreamTreeNode.GetNextChild(lChild);
//      end;
//      if lLastColumnTreeNode.AbsoluteIndex < dDataModel.cTV.Items.Count - 1 then
//        lNode := dDataModel.cTV.Items.InsertObject(dDataModel.cTV.Items[lLastColumnTreeNode.AbsoluteIndex + 1], lColumn.Description, lColumn)
//      else
//        lNode := dDataModel.cTV.Items.AddChildObject(DMStreamTreeNode, lColumn.Description, lColumn);
//      lNode.ImageIndex := 2;
//      lNode.SelectedIndex := 2;
//    end
//    else
//      EditColumnTreeNode.Text := lColumn.Description;
//    dDataModel.RefreshDMStreamNode(DMStreamTreeNode);
//    DMStream.SaveMode := smNative;
//    DMStream.SaveFile;
//    Result := True;
//  end;
end;

function TdDlgColumn.FieldsAreValid: Boolean;
//var
//  i:          Integer;
//  lColumn:    TFDMColumn;
begin
  Result := True;
//  try
//    if edtColumnName.Text = '' then
//      raise Exception.Create('You must enter a column name');
//    if Length(edtColumnName.Text) > 25 then
//      raise Exception.Create('The name is longer than 25 characters');
//    for i := 0 to DMStream.Table.ColumnList.Count - 1 do
//    begin
//      lColumn := TFDMColumn(DMStream.Table.ColumnList.Objects[i]);
//      if (LowerCase(lColumn.Name) = LowerCase(edtColumnName.Text)) and
//        ((fDialogMode = dmNew) or (EditColumn <> lColumn)) then
//        raise Exception.Create('This column already exists');
//      if cbIdentity.Checked and lColumn.Identity and
//        ((fDialogMode = dmNew) or (EditColumn <> lColumn)) then
//        raise Exception.Create('There is already an identity column for this table');
//    end;
//    if cbIdentity.Checked then
//    begin
//       if (cDataType.Text <> 'integer') and
//          (cDataType.Text <> 'bigint') and
//          (cDataType.Text <> 'numeric') then
//          raise Exception.Create('Identity columns must be of type numeric(p, 0), integer or bigint');
//       if (cDataType.Text = 'numeric') then
//          if not ((edtDecimals.Text = '') or (edtDecimals.Text = '0')) then
//             raise Exception.Create('Identity columns must be of type numeric(p, 0), integer or bigint');
//    end;
//    if cbIdentity.Checked and cbNullsAllowed.Checked then
//      raise Exception.Create('Identity columns must not allow nulls');
//    if cDataType.Text = '' then
//      raise Exception.Create('You must enter a data type');
//    if ((cDataType.Text = DT_CHAR) or (cDataType.Text = DT_VARCHAR) or
//        (cDataType.Text = DT_NCHAR) or (cDataType.Text = DT_NVARCHAR) or
//        (cDataType.Text = DT_V_LANGTRAN)) and
//      (edtLength.Text = '') then
//      raise Exception.Create('You must enter a length');
//    //DT_VARCHAR_MAX does not require a length.
//    if edtLength.Text <> '' then
//    begin
//      try
//      	// Make sure we have an integer value
//      	StrToInt(edtLength.Text);
//      except
//        raise Exception.Create('The length is not a valid integer');
//      end;
//      if ((cDataType.Text = DT_CHAR) or (cDataType.Text = DT_VARCHAR)) and
//        (StrToInt(edtLength.Text) > 255) then
//        raise Exception.Create('The maximum length of a character column is 255')
//
//      else if ((cDataType.Text = DT_NCHAR) or (cDataType.Text = DT_NVARCHAR)) and
//      		  (StrToInt(edtLength.Text) > 120) then
//        raise Exception.Create('The maximum length of a unicode character column is 120')
//
//      else if ((cDataType.Text = DT_V_LANGTRAN)) and
//      		   (StrToInt(edtLength.Text) > 64) then
//        //raise Exception.Create('The maximum length of a language translation column is 64');
//        Application.MessageBox(PChar('Data exceeding 64 characters in a Language Translation column cannot currently be translated.'),
//        								 'Column Length Warning', MB_OK);
//    end;
//
//    if edtDecimals.Text <> '' then
//    begin
//      if edtLength.Text = '' then
//        raise Exception.Create('You must enter a length');
//      try
//      except
//        raise Exception.Create('The number of decimals is not a valid integer');
//      end;
//      if StrToInt(edtDecimals.Text) > StrToInt(edtLength.Text) then
//        raise Exception.Create('The number of decimals cannot exceed the length');
//    end;
//  except
//    on E:Exception do
//    begin
//      Result := False;
//      sysutils.beep;
//      Application.MessageBox(PChar(E.Message), 'Error', MB_OK);
//    end;
//  end;
end;

procedure TdDlgColumn.SetCtrlEnabled(aControl: TEdit; aEnabled: Boolean);
begin
  aControl.Enabled := aEnabled;
  if not aEnabled then
    aControl.Text := '';
end;

procedure TdDlgColumn.cDataTypeChange(Sender: TObject);
begin
  SetCtrlEnabled(edtLength, (cDataType.Text = DT_CHAR) or (cDataType.Text = DT_VARCHAR) or
    (cDataType.Text = DT_DECIMAL) or (cDataType.Text = DT_NUMERIC) or
    (cDataType.Text = DT_NCHAR) or (cDataType.Text = DT_NVARCHAR) or
    (cDataType.Text = DT_V_LANGTRAN));

  SetCtrlEnabled(edtDecimals, (cDataType.Text = DT_DECIMAL) or (cDataType.Text = DT_NUMERIC));
  cbIdentity.Enabled := (cDataType.Text = DT_NUMERIC)
                    or (cDataType.Text = DT_INTEGER)
                    or (cDataType.Text = DT_BIGINT);
  if not cbIdentity.Enabled then
    cbIdentity.Checked := False;

  // Trigger a field length recalculation for SMS based on the new datatype
  edtLengthChange(cDataType)
end;

procedure TdDlgColumn.edtDecimalsKeyPress(Sender: TObject; var Key: Char);
begin
  // ignore non-numeric keys and backspace
  if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TdDlgColumn.edtLengthChange(Sender: TObject);
var
	lLength:		Integer;
   lMult: 		Integer;
begin
	// Determine if we need to Multiply the column width for SMS
	if (cDataType.Text = DT_NCHAR) or (cDataType.Text = DT_NVARCHAR) or
    	(cDataType.Text = DT_V_LANGTRAN) then
      lMult := 2
   else
   	lMult := 1;

	if Length(edtLength.Text) > 0 then
   begin
   	try
      	lLength := StrToInt(edtLength.Text);
         lLength := (lLength * lMult);
      except
      	lLength := 0;
      end;
   	edtSMSLength.Text := Format('%d', [lLength]);
   end
   else
   	edtSMSLength.Text := '';
end;

procedure TdDlgColumn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdDlgColumn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(fNativeDataTypeList);
end;

end.
