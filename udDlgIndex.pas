unit udDlgIndex;
{*******************************************************************************
|
| Description        :  Edit Dialog for indexes
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
|****************************** v2.0.1.12 **************************************
| 025349 20140826 BCD   Support for SMS Only indexes.
|****************************** v2.0.1.6 ***************************************
| 022682 20130813 BCD   Add ability to include column data into the leaf level
|                       of a nonclustered index.
|
*******************************************************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Buttons, uuGlobals;

type
  TdDlgIndex = class(TForm)
    bvl1: TBevel;
    lbl1: TLabel;
    lblColumnsInIndex: TLabel;
    lblAvailableColumns: TLabel;
    btnAdd: TSpeedButton;
    btnRemove: TSpeedButton;
    btnClear: TSpeedButton;
    lbl2: TLabel;
    btnRemoveInclude: TSpeedButton;
    btnAddInclude: TSpeedButton;
    btnClearInclude: TSpeedButton;
    lblIncludeText: TLabel;
    lblIncludeTitle: TLabel;
    btnOK1: TButton;
    btnCancel1: TButton;
    btnAddAnother: TButton;
    edtIndexName: TEdit;
    cIndexColumns: TListBox;
    grpIndexOptions: TGroupBox;
    cbUnique: TCheckBox;
    chkDescending: TCheckBox;
    cbClustered: TCheckBox;
    cAllColumns: TListBox;
    cIncludeColumns: TListBox;
    rgIndexScope: TRadioGroup;
    pm1: TPopupMenu;
    SortbyColumnName1: TMenuItem;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddAnotherClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SortbyColumnName1Click(Sender: TObject);
    procedure cbDescendingClick(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure cbClusteredClick(Sender: TObject);
    procedure sbAddIncludeClick(Sender: TObject);
    procedure sbRemoveIncludeClick(Sender: TObject);
    procedure sbClearIncludeClick(Sender: TObject);
  private
    fTempList:    TStringList;    // in memory storage of the original order of the columns
                                  // used when reverting back to viewing columns once viewed
                                  // in alphabetical order
    fDialogMode:  TDialogMode;    // Am I editing or creating?
//    fCheckForPriKeyFields: boolean; // check for primary key fields when adding INCLUDE columns
  public
//    DMStream:            TFDMStream;
//    DMStreamTreeNode:    TTreeNode;
//    EditIndex:           TFDMIndex;
//    EditIndexTreeNode:   TTreeNode;
    function DoIt: Boolean;
    function FieldsAreValid: Boolean;
    procedure SetCtrlEnabled(aControl: TEdit; aEnabled: Boolean);
    property  DialogMode:   TDialogMode read  fDialogMode write fDialogMode default dmNew;
  end;

implementation

{$R *.dfm}

procedure TdDlgIndex.btnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TdDlgIndex.btnOKClick(Sender: TObject);
begin
  if DoIt then
    ModalResult := mrOK;
end;

procedure TdDlgIndex.btnAddAnotherClick(Sender: TObject);
{*******************************************************************************
|
| Description        :  
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 025349 20140826 BCD   Support for SMS Only indexes.
|
********************************************************************************}
begin
  if DoIt then
  begin
    edtIndexName.Text := '';
    cbUnique.Checked := False;
    cbClustered.Checked := False;
    rgIndexScope.ItemIndex := 0;
    cIndexColumns.Clear;
  end;
end;

function TdDlgIndex.DoIt: Boolean;
{*******************************************************************************
|
| Description        :  
|
| Return Values      :  True  - Successful
|                       False - Failure
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 025349 20140826 BCD   Support for SMS Only indexes.
|
********************************************************************************}
//var
//  lNode:      TTreeNode;
//  i:          Integer;
//  lIndexOf:   Integer;
//  lIndex:     TFDMIndex;
//  lColName:   String;
begin
  Result := False;
//  if FieldsAreValid then
//  begin
//    if fDialogMode = dmNew then
//    begin
//      lIndex := DMStream.Table.AddIndex;
//      lIndex.Name := edtIndexName.Text;
//    end
//    else
//    begin
//      lIndex := EditIndex;
//      lIndex.Name := edtIndexName.Text;
//      lIndexOf := DMStream.Table.IndexList.IndexOfObject(lIndex);
//      if lIndexOf >= 0 then
//        DMStream.Table.IndexList.Strings[lIndexOf] := lIndex.Name;
//    end;
//
//    lIndex.ColumnList.Clear;
//    for i := 0 to cIndexColumns.Items.Count - 1 do
//    begin
//      lColName := cIndexColumns.Items.Strings[i];
//      lIndexOf := DMStream.Table.ColumnList.IndexOf(lColName);
//      lIndex.ColumnList.AddObject(lColName, DMStream.Table.ColumnList.Objects[lIndexOf]);
//    end;
//    lIndex.Unique := cUnique.Checked;
//    lIndex.Clustered := cClustered.Checked;
//    lIndex.IndexScope := TIndexScope(rgIndexScope.ItemIndex);
//
//    lIndex.IncludeList.Clear;
//    for i := 0 to cIncludeColumns.Items.Count - 1 do
//    begin
//       lColName := cIncludeColumns.Items.Strings[i];
//       lIndexOf := DMStream.Table.ColumnList.IndexOf(lColName);
//       lIndex.IncludeList.AddObject(lColName, DMStream.Table.ColumnList.Objects[lIndexOf]);
//    end;
//
//    if fDialogMode = dmNew then
//    begin
//      lNode := dDataModel.cTV.Items.AddChildObject(DMStreamTreeNode, lIndex.Description, lIndex);
//      if lIndex.IndexScope = isAll then
//      begin
//        lNode.ImageIndex := 3;
//        lNode.SelectedIndex := 3;
//      end
//      else if lIndex.IndexScope = isRMS then
//      begin
//        lNode.ImageIndex := 5;
//        lNode.SelectedIndex := 5;
//      end
//      else if lIndex.IndexScope = isSMS then
//      begin
//         lNode.ImageIndex := 7;
//         lNode.SelectedIndex := 7;
//      end;
//    end
//    else
//    begin
//      if lIndex.IndexScope = isAll then
//      begin
//        dDataModel.cTV.Selected.ImageIndex := 3;
//        dDataModel.cTV.Selected.SelectedIndex := 3;
//      end
//      else if lIndex.IndexScope = isRMS then
//      begin
//        dDataModel.cTV.Selected.ImageIndex := 5;
//        dDataModel.cTV.Selected.SelectedIndex := 5;
//      end
//      else if lIndex.IndexScope = isSMS then
//      begin
//        dDataModel.cTV.Selected.ImageIndex := 7;
//        dDataModel.cTV.Selected.SelectedIndex := 7;
//      end;
//      EditIndexTreeNode.Text := lIndex.Description;
//    end;
//    dDataModel.RefreshDMStreamNode(DMStreamTreeNode);
//    DMStream.SaveMode := smNative;
//    DMStream.SaveFile;
//    Result := True;
//  end;
end;

function TdDlgIndex.FieldsAreValid: Boolean;
//var
////   lTestInt:   Integer;
//   i:          Integer;
//	lIndex:     TFDMIndex;
begin
   Result := True;
//   try
//      if edtIndexName.Text = '' then
//         raise Exception.Create('You must enter an index name');
//      for i := 0 to DMStream.Table.IndexList.Count - 1 do
//      begin
//         lIndex := TFDMIndex(DMStream.Table.IndexList.Objects[i]);
//         if (LowerCase(lIndex.Name) = LowerCase(edtIndexName.Text)) and
//            ((fDialogMode = dmNew) or (EditIndex <> lIndex)) then
//            raise Exception.Create('This index already exists');
//         if ((fDialogMode = dmNew) or (EditIndex <> lIndex)) and cbClustered.Checked and lIndex.Clustered then
//            raise Exception.Create('This index cannot be clustered as index ' + lIndex.Name + ' is clustered');
//      end;
//      if ((fDialogMode = dmNew) or (EditIndex <> DMStream.Table.PrimKeyIndex)) and
//         cbClustered.Checked and (DMStream.Table.PrimKeyIndex <> nil) and DMStream.Table.PrimKeyIndex.Clustered then
//         raise Exception.Create('This index cannot be clustered as the Primary Key is clustered');
//      if cIndexColumns.Items.Count <= 0 then
//         raise Exception.Create('You must select at least one column for the index');
//   except
//      on E:Exception do
//      begin
//         Result := False;
//         sysutils.beep;
//         Application.MessageBox(PChar(E.Message), 'Error', MB_OK);
//      end;
//   end;
end;

procedure TdDlgIndex.SetCtrlEnabled(aControl: TEdit; aEnabled: Boolean);
begin
  aControl.Color := cAllColumns.Color;
  aControl.ParentColor := not aEnabled;
  aControl.Enabled := aEnabled;
  if not aEnabled then
    aControl.Text := '';
end;

procedure TdDlgIndex.FormShow(Sender: TObject);
{*******************************************************************************
|
| Description        :  Load the form to show
|
| Input Parameters   :  TObject - the sender
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 025349 20140826 BCD   Support for SMS Only indexes.
| 022682 20130813 BCD   Added "INCLUDE" columns
|
********************************************************************************}
//var
//  i:        Integer;
begin
  cAllColumns.Clear;
  SetCtrlEnabled(edtIndexName, True);
  cbUnique.Enabled := True;
  rgIndexScope.Enabled := True;
//  for i := 0 to DMStream.Table.ColumnList.Count - 1 do
//    cAllColumns.Items.Add(DMStream.Table.ColumnList.Strings[i]);
//  if fDialogMode = dmEdit then
//  begin
//    Caption := 'Edit Index';
//    edtIndexName.Text := EditIndex.Name;
//    cbUnique.Checked := EditIndex.Unique;
//    cbClustered.Checked := EditIndex.Clustered;
//    rgIndexScope.ItemIndex := Ord(EditIndex.IndexScope);
//    cIndexColumns.Clear;
//    for i := 0 to EditIndex.ColumnList.Count - 1 do
//      cIndexColumns.Items.Add(EditIndex.ColumnList.Strings[i]);
//
//    if not cbClustered.Checked then
//       for i := 0 to EditIndex.IncludeList.Count - 1 do
//          cIncludeColumns.Items.Add(EditIndex.IncludeList.Strings[i]);
//
//    btnAddAnother.Visible := False;
//    btnCancel.Default := False;
//    btnOK.Default := True;
//    if EditIndex = EditIndex.Table.PrimKeyIndex then
//    begin
//      SetCtrlEnabled(edtIndexName, False);
//      edtIndexName.Text := 'Primary Key';
//      cbUnique.Enabled := False;
//      rgIndexScope.ItemIndex := -1;
//      rgIndexScope.Enabled := False;
//    end;
//  end
//  else
//  begin
//    Caption := 'New Index';
//    cIndexColumns.Clear;
//    btnAddAnother.Visible := True;
//    btnCancel.Default := False;
//    btnOK.Default := False;
//    btnAddAnother.Default := True;
//    edtIndexName.Text := '';
//    cbUnique.Checked := False;
//    cbClustered.Checked := False;
//    rgIndexScope.ItemIndex := 0;
//  end;
//  fTempList.Assign(cAllColumns.Items);
//
//  if (EditIndex <> DMStream.Table.PrimKeyIndex) and
//     (DMStream.Table.PrimKeyIndex <> nil) and
//     (DMStream.Table.PrimKeyIndex.Clustered) then
//     fCheckForPriKeyFields := true;
end; // procedure FormShow

procedure TdDlgIndex.FormCreate(Sender: TObject);
begin
  fTempList := TStringList.Create;
end;

procedure TdDlgIndex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fTempList.Free;
end;

procedure TdDlgIndex.SortbyColumnName1Click(Sender: TObject);
begin
  cAllColumns.Sorted := not cAllColumns.Sorted;
  TMenuItem(Sender).Checked := cAllColumns.Sorted;
  if not cAllColumns.Sorted then
  begin
    cAllColumns.Clear;
    cAllColumns.Items.Assign(fTempList);
  end;
end;

procedure TdDlgIndex.cbDescendingClick(Sender: TObject);
begin
  ShowMessage('I don''t work yet.'#13'Just here for my good looks :-)');
  TCheckBox(Sender).Checked := False;
end;

procedure TdDlgIndex.sbClearClick(Sender: TObject);
begin
  cIndexColumns.Clear;
end;

procedure TdDlgIndex.sbAddClick(Sender: TObject);
{*******************************************************************************
|
| Description        :  Add an available column to the list of key fields for
|                       the index.
|
| Input Parameters   :  TObject - the sender
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 022682 20130813 BCD   Added a check to see if the selected column was already
|                       added to the "INCLUDE"s list or if it already exists in
|                       this list.
|
********************************************************************************}
var
   i: integer;  // index of the selected column in the list
begin
   i := cAllColumns.ItemIndex;
   if i > -1 then
   begin
      if cIncludeColumns.Items.IndexOf(cAllColumns.Items[i]) > -1 then
         Application.MessageBox('Key fields of the index cannot be "Included" fields. (see the left listbox)', 'Error', MB_OK)
      else if cIndexColumns.Items.IndexOf(cAllColumns.Items[i]) > -1 then
         Application.MessageBox('Columns can only be added once.', 'Error', MB_OK)
      else
         cIndexColumns.Items.Add(cAllColumns.Items[i]);
   end;
end; // procedure sbAddClick

procedure TdDlgIndex.sbRemoveClick(Sender: TObject);
var
  i:    Integer;  // index of the selected column in the list
begin
  i := cIndexColumns.ItemIndex;
  if i > -1 then
    cIndexColumns.Items.Delete(i);
end;

procedure TdDlgIndex.cbClusteredClick(Sender: TObject);
{*******************************************************************************
|
| Description        :  Set the clustered index on or off
|
|                       This method displays or hides the ability to include
|                       columns into the leaf level of the index
|
| Input Parameters   :  TObject - the sender
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 025349 20140826 BCD   Support for SMS Only indexes.
| 022682 20130813 BCD   Created
|
********************************************************************************}
begin
   inherited;

//   if cbClustered.Checked then
//   begin
//      dDlgIndex.Width            := 480;
//      Bevel1.Width               := 377;
//      edtIndexName.Width           := 285;
//      cAllColumns.Left           := 20;
//      gbIndexOptions.Left        := 20;
//      sbAdd.Left                 := 186;
//      sbRemove.Left              := 186;
//      sbClear.Left               := 186;
//      cIndexColumns.Left         := 214;
//      rgIndexScope.Left          := 214;
////      btnOK.Left                 := 396;
////      btnCancel.Left               := 396;
////      btnAddAnother.Left           := 396;
//
//      cIncludeColumns.Visible    := false;
//      sbAddInclude.Visible       := false;
//      sbRemoveInclude.Visible    := false;
//      sbClearInclude.Visible     := false;
//      lblIncludeTitle.Visible		:= false;
//      lblIncludeText.Visible     := false;
//
//      cIncludeColumns.Clear;
//   end
//   else
//   begin
//      dDlgIndex.Width            := 680;
//      Bevel1.Width               := 577;
//      edtIndexName.Width           := 485;
//      cAllColumns.Left           := 220;
//      gbIndexOptions.Left        := 220;
//      sbAdd.Left                 := 386;
//      sbRemove.Left              := 386;
//      sbClear.Left               := 386;
//      cIndexColumns.Left         := 414;
//      rgIndexScope.Left          := 414;
////      btnOK.Left                   := 596;
////      btnCancel.Left               := 596;
////      btnAddAnother.Left           := 596;
//
//      cIncludeColumns.Visible    := true;
//      sbAddInclude.Visible       := true;
//      sbRemoveInclude.Visible    := true;
//      sbClearInclude.Visible     := true;
//      lblIncludeTitle.Visible		:= true;
//      lblIncludeText.Visible     := true;
//   end;
end; // procedure cClusteredClick

procedure TdDlgIndex.sbAddIncludeClick(Sender: TObject);
{*******************************************************************************
|
| Description        :  Add an available column to the list of "INCLUDE"d
|                       columns.  Check that the column isn't already in this
|                       list or in the key fields list.
|
| Input Parameters   :  TObject - the sender
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 022682 20130813 BCD   Created
|
********************************************************************************}
//var
//   i: integer;  // index of the selected column in the list
begin
//   i := cAllColumns.ItemIndex;
//   if i > -1 then
//   begin
//      if cIndexColumns.Items.IndexOf(cAllColumns.Items[i]) > -1 then
//         Application.MessageBox('Included columns must not be a key field of this index. (see the right listbox)', 'Error', MB_OK)
//      else if cIncludeColumns.Items.IndexOf(cAllColumns.Items[i]) > -1 then
//         Application.MessageBox('Columns can only be added once.', 'Error', MB_OK)
//
//      else if fCheckForPriKeyFields and
//         (DMStream.Table.PrimKeyIndex.ColumnList.IndexOf(cAllColumns.Items[i]) > -1) then
//         Application.MessageBox('This column is already part of the clustered primary key and is superflous to the task and not required.' + CRLF +
//                                'That is to say, the primary key is already performing the same task for you and you don''t need the information duplicated.', 'Error', MB_OK)
//      else
//         cIncludeColumns.Items.Add(cAllColumns.Items[i]);
//   end;
end; // procedure sbAddIncludeClick

procedure TdDlgIndex.sbRemoveIncludeClick(Sender: TObject);
{*******************************************************************************
|
| Description        :  Remove an "INCLUDE"d column back to the available list.
|
| Input Parameters   :  TObject - the sender
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 022682 20130813 BCD   Created
|
********************************************************************************}
var
   i: integer;  // index of the selected column in the list
begin
   i := cIncludeColumns.ItemIndex;
   if i > -1 then
      cIncludeColumns.Items.Delete(i);
end; // procedure sbRemoveIncludeClick

procedure TdDlgIndex.sbClearIncludeClick(Sender: TObject);
{*******************************************************************************
|
| Description        :  Clare all "INCLUDE"d columns
|
| Input Parameters   :  TObject - the sender
|
| ******************************************************************************
| Maintenance Log
|
| Task   Date     Who   Description
| ------ -------- ---   --------------------------------------------------------
| 022682 20130813 BCD   Created
|
********************************************************************************}
begin
  cIncludeColumns.Clear;
end; // procedure sbClearIncludeClick

end.
