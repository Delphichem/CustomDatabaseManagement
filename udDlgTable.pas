unit udDlgTable;
{*******************************************************************************
|
| Description			:	DataGenie Main User Interface Module
|
|
| ******************************************************************************
| Maintenance Log
|
| Date		Who	Description
| --------	---	--------------------------------------------------------------
|****************************** v2.0.2.1 ***************************************
| 20120322  LSM   Disabled Temp Table checkbox - oddly it doesnt work... Wow.
|                 Actually corrupts the DDL file.. Bad implementation.
|****************************** v2.0.1.3 ***************************************
| 20080220	LSM	Address a major issue relating to the management of DataGenie
|						DDL files that has recently been noticed.
|						DataGenie does not correctly manage the 'RMS Only' and
|						'SMS & RMS' settings for tables. More specifically, tables
|						that are set to 'RMS Only' will be saved as 'SMS & RMS' after
|						a change to the table (which triggers a re-save of the table
|						data). The cause of this issue has  been found to be related
|						to the poor management of the RemediOnly properties that exit
|						on both the TFDMStream and TFDMTable objects.
| ******************************* In the beggining *****************************
| Created by early RD developers at the beggining of time.
|
*******************************************************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uuGlobals;

type
  TdDlgTable = class(TForm)
    bvl1: TBevel;
    lbl1: TLabel;
    lblCommentsLabel: TLabel;
    lblTableSize: TLabel;
    lblTableDate: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btnOK1: TButton;
    btnCancel1: TButton;
    edtTableName: TEdit;
    mmoComments: TMemo;
    cbTempTable: TCheckBox;
    cbbSchema: TComboBox;
    edtTableAlias: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtTableAliasExit(Sender: TObject);
   private
      { Private Declarations }
      fDialogMode:            TDialogMode;
      fSavedNew:					boolean;

   public
      //ConfFolder:             TFConfFolder;
      //ConfFolderTreeNode:     TTreeNode;
      Mode:                   String;
      //EditDMStream:           TFDMStream;
      function  DoIt: Boolean;
      function  FieldsAreValid: Boolean;
      procedure SetCtrlEnabled(aControl: TEdit; aEnabled: Boolean);

      property DialogMode:    TDialogMode read fDialogMode  write fDialogMode default dmNew;
      property SavedNew:      boolean     read fSavedNew    write fSavedNew;
  end;

implementation

{$R *.dfm}

procedure TdDlgTable.btnOKClick(Sender: TObject);
begin
   if DoIt then
   begin
      ModalResult := mrOK;
   end;
end;

procedure TdDlgTable.edtTableAliasExit(Sender: TObject);
begin
   // Validate Alias Name.
   // Force to lowercase
   edtTableAlias.Text := Trim(LowerCase(edtTableAlias.Text));

   // Cannot contain spaces
   edtTableAlias.Text := StringReplace(edtTableAlias.Text, ' ', '', [rfReplaceAll]);
end;

function TdDlgTable.DoIt: Boolean;
//var
//   lNode:            TTreeNode;
//   lDMStream:        TFDMStream;
//   lTable:           TFDMTable;
//   lColumn:          TFDMColumn;
//   lDummyNode:       TFDummyNode;
//   lExistingChild:   TTreeNode;
begin
  Result := False;
//   if FieldsAreValid then
//   begin
//      edtTableName.Text := LowerCase(edtTableName.Text);
//
//      if fDialogMode = dmNew then
//      begin
//         lDMStream := TFDMStream.Create(nil);
//         lDMStream.FolderName := ConfFolder.Name;
//         lDMStream.FileName := edtTableName.Text;
//         lTable := TFDMTable.Create(nil);
//         lDMStream.Table := lTable;
//         lTable.Name := edtTableName.Text;
//         lTable.IsTempTable := cbTempTable.Checked;
//         lColumn := lTable.AddColumn('dummy_key');
//         lColumn.DataTypeText := 'varchar';
//         lColumn.Length := 12;
//         lColumn.NullsAllowed := False;
//         lTable.PrimKeyIndex := TFDMIndex.Create(lTable);
//         lTable.PrimKeyIndex.Table := lTable;
//         lTable.PrimKeyIndex.AddColumn(lColumn.Name);
//         lTable.PrimKeyIndex.Unique := True;
//         lTable.PrimKeyIndex.Clustered := True;
//      end
//      else
//      begin
//         lDMStream := EditDMStream;
//         lTable := EditDMStream.Table;
//         lTable.IsTempTable := cbTempTable.Checked;
//      end;
//
//      lTable.Comments := mmoComments.Text;
//      lTable.RemediOnly := cbbSchema.ItemIndex = 0;//(rgSchema.ItemIndex = 0);
//      lDMStream.RemediOnly	:= lTable.RemediOnly;			// Make these two equal.
//      // LSM 20120320 - Table alias support
//      lTable.Alias          := edtTableAlias.Text;
//
//      if fDialogMode = dmNew then
//      begin
//         lNode := dDataModel.cTV.Items.AddChildObject(ConfFolderTreeNode, lDMStream.FileName, lDMStream);
//         lNode.ImageIndex := 1;
//         lNode.SelectedIndex := 1;
//         lDummyNode := TFDummyNode.Create(nil);
//         lNode := dDataModel.cTV.Items.AddChildObject(lNode, 'Table not found', lDummyNode);
//         lNode.ImageIndex := -1;
//         lNode.SelectedIndex := -1;
//         lExistingChild := ConfFolderTreeNode.GetFirstChild;
//         if lExistingChild <> nil then
//         begin
//            if TObject(lExistingChild.Data) is TFDummyNode then
//            begin
//               TFDummyNode(lExistingChild.Data).Free;
//               lExistingChild.Delete;
//            end;
//         end;
//      end;
//
//      lDMStream.SaveMode := smNative;
//      lDMStream.SaveFile;
//
//      if fDialogMode = dmNew then
//         fSavedNew := true;
//
//      if lTable.RemediOnly then
//      begin
//         dDataModel.cTV.Selected.ImageIndex :=1;
//         dDataModel.cTV.Selected.SelectedIndex :=1;
//      end
//      else
//      begin
//         dDataModel.cTV.Selected.ImageIndex :=4;
//         dDataModel.cTV.Selected.SelectedIndex :=4;
//      end;
//
//      Result := True;
//   end;
end;

function TdDlgTable.FieldsAreValid: Boolean;
//var
//   lChild:     TTreeNode;
begin
   Result := True;
//   try
//      if edtTableName.Text = '' then
//         raise Exception.Create('You must enter a table name');
//
//      if fDialogMode = dmNew then
//      begin
//         lChild := ConfFolderTreeNode.GetFirstChild;
//         while lChild <> nil do
//         begin
//            if (TObject(lChild.Data) is TFDMStream) and
//               (TFDMStream(lChild.Data).FileName = LowerCase(edtTableName.Text)) then
//               raise Exception.Create('This table already exists in this folder');
//            lChild := ConfFolderTreeNode.GetNextChild(lChild);
//         end;
//      end;
//
//   except
//      on E:Exception do
//      begin
//         Result := False;
//         sysutils.beep;
//         Application.MessageBox(PChar(E.Message), 'Error', MB_OK);
//      end;
//   end;
end;

procedure TdDlgTable.SetCtrlEnabled(aControl: TEdit; aEnabled: Boolean);
begin
   aControl.Color := mmoComments.Color;
   aControl.ParentColor := not aEnabled;
   aControl.Enabled := aEnabled;
   if not aEnabled then
      aControl.Text := '';
end;

procedure TdDlgTable.FormShow(Sender: TObject);
begin
   SetCtrlEnabled(edtTableName, True);
//   if fDialogMode = dmEdit then
//   begin
//      edtTableName.Text := '';
//      // LSM 20120320 - Table Alias support
//      edtTableAlias.Text := '';
//      mmoComments.Text  := '';
//      lblTableSize.Visible := true;
//      lblTableDate.Visible := true;
//
//      if not Assigned(EditDMStream.Table) then
//         EditDMStream.Parse;
//
//      edtTableName.Text := EditDMStream.Table.Name;
//      // addition on temporary tables...
//      cbTempTable.Checked := EditDMStream.Table.IsTempTable;
//      bCancel.Default := False;
//      bOK.Default := True;
//      mmoComments.Text := EditDMStream.Table.Comments;
//      lTableSize.Caption := Format('File Size: %d', [EditDMStream.TabSize]);
//      lTableDate.Caption := Format('Last Modification: %s:%s', [EditDMStream.TabDate, EditDMStream.TabTime]);
//      SetCtrlEnabled(edtTableName, False);
//      edtTableName.Text := EditDMStream.Table.name;
//      // LSM 20120320 - Table Alias support
//      edtTableAlias.Text := EditDMStream.Table.Alias;
//      if (EditDMStream.Table.RemediOnly) then
//      // checked box are defined in <procedure TFDMStream.ParseTableStatement;> of
//      // ufDataModel module !!!
//      begin
//         bCancel.Default := False;
//         bOK.Default := True;
//      end;
//
//      if edtTableName.CanFocus then
//         edtTableName.SetFocus;
//   end
//   else if (fDialogMode = dmNew) then
//   begin
//      edtTableName.Text := '';
//      mmoComments.Text  := '';
//      lblTableSize.Visible := false;
//      lblTableDate.Visible := false;
//   end;
end;

end.
