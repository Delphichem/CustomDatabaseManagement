unit udDataGenie;
{
  Oct/Nov 2014 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, uuGlobals, ufISQLDataBase;

type
  TdDataGenie = class(TForm)
    edtPhrase: TLabeledEdit;
    btnSearch: TSpeedButton;
    tvSchema: TTreeView;
    mmoSchema: TRichEdit;
    pbSchema: TProgressBar;
    btnSchemaDir: TSpeedButton;
    lblSchemaDir: TLabel;
    cbSMSOnly: TCheckBox;
    cbFieldNamesOnly: TCheckBox;
    procedure btnSearchClick(Sender: TObject);
    procedure tvSchemaChange(Sender: TObject; Node: TTreeNode);
    procedure edtPhraseKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSchemaDirClick(Sender: TObject);
    procedure cboTableKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    fSearching : Boolean;
    fTableNames : TStringList;
    function FindRootNode(aTreeNode : TTreeNode): TTreeNode;
  public
    procedure SetUp(aTableNames : TStringList);
  end;

implementation

uses
   StrUtils;

{$R *.dfm}

procedure TdDataGenie.SetUp(aTableNames : TStringList);
var
   searchResult : TSearchRec;
   lCount : Integer;
   tblStr : string;
begin
   //do something with table names
   fTableNames := aTableNames;

   lblSchemaDir.Caption := gSettings.SchemaDir;
   fSearching := False;

   //progress bar max becomes number of .ddl files
   lCount := 0;
   if FindFirst(gSettings.SchemaDir + '\*.ddl', faAnyFile, searchResult) = 0 then
   begin
      repeat
         lCount := lCount + 1;
         tblStr := searchResult.Name;
         tvSchema.Items.Add(nil, tblStr);
      until FindNext(searchResult) <> 0;
      FindClose(searchResult);
   end;
   pbSchema.Max := lCount;
   pbSchema.Visible := False;
end;

procedure TdDataGenie.tvSchemaChange(Sender: TObject; Node: TTreeNode);
var
   lDDLFile : TextFile;
   lLine : String;
   tblStr : String;
   lIsChildNode : Boolean;
begin
   if (not fSearching) then
   begin
      mmoSchema.Lines.BeginUpdate;
      try
         mmoSchema.Lines.Clear;
         lIsChildNode := Node.Parent <> nil;
         if lIsChildNode then
            tblStr := FindRootNode(Node).Text
         else
            tblStr := Node.Text;

         //dump the file on the TRichEdit
         AssignFile(lDDLFile, IncludeTrailingBackslash(gSettings.SchemaDir) + tblStr);
         Reset(lDDLFile);
         while not EOF(lDDLFile) do
         begin
            ReadLn(lDDLFile, lLine);
            mmoSchema.Lines.Add(lLine);
            //highlight the relevant lines in the TRichEdit
            if lIsChildNode and (lLine = Node.Text) then
            begin
               //mmoSchema.Lines.
            end;
         end;
         CloseFile(lDDLFile);
      finally
         mmoSchema.Lines.EndUpdate;
      end;
   end;
end;

procedure TdDataGenie.edtPhraseKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
     btnSearchClick(self);
   end;
end;

function TdDataGenie.FindRootNode(aTreeNode : TTreeNode) : TTreeNode;
var
   lDummyTreeNode : TTreeNode;
begin
   Result := nil;
   lDummyTreeNode := aTreeNode; //paranoid about changing the parameter
   while Result = nil do
   begin
      if lDummyTreeNode.Parent = nil then
         Result := lDummyTreeNode
      else
         lDummyTreeNode := lDummyTreeNode.Parent;
   end;
end;

procedure TdDataGenie.FormShow(Sender: TObject);
begin
   edtPhrase.SetFocus;
end;

procedure TdDataGenie.btnSchemaDirClick(Sender: TObject);
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

procedure TdDataGenie.btnSearchClick(Sender: TObject);
var
  searchResult : TSearchRec;
  tblStr, tbl : String;
  lDDLFile : TextFile;
  lLine : String;
  lRootNode : TTreeNode;
  lTblAdded : Boolean;
  lInTable : Boolean;
begin
   pbSchema.Position := 0;
   pbSchema.Visible := True;
   tvSchema.Items.Clear;
   mmoSchema.Lines.Clear;
   lRootNode := nil;
   tvSchema.Items.BeginUpdate;

   if FindFirst(gSettings.SchemaDir + '\*.ddl', faAnyFile, searchResult) = 0 then
   begin
      fSearching := True;
      if edtPhrase.Text <> '' then
      begin
         repeat
            lInTable := False;
            lTblAdded := False;
            tblStr := searchResult.Name;
            tbl := tblStr;
            Delete(tbl, Length(tbl) - 3, 4); //Delete '.ddl'
            if (not cbSMSOnly.Checked) or (fTableNames.IndexOf(tbl) <> -1) then
            begin
               AssignFile(lDDLFile, gSettings.SchemaDir + '\' + tblStr);
               Reset(lDDLFile);
               while not EOF(lDDLFile) do
               begin
                  ReadLn(lDDLFile, lLine);

                  if (not lInTable) and AnsiContainsStr('create table ' + tbl + ' (', Trim(lLine)) then
                     lInTable := True
                  else if lInTable then
                  begin
                     if AnsiStartsStr(')', Trim(lLine)) then
                        lInTable := False
                  end;

                  if (not cbFieldNamesOnly.Checked) or lInTable then
                  begin
                     if (AnsiPos(edtPhrase.Text,lLine) <> 0) or (edtPhrase.Text = '') then
                     begin
                        if not lTblAdded then //add root node and first child
                        begin
                           lRootNode := tvSchema.Items.Add(nil, tblStr);
                           lTblAdded := True;
                           tvSchema.Items.AddChild(lRootNode, lLine);
                        end
                        else //add another child node
                        begin
                           tvSchema.Items.AddChild(lRootNode, lLine);
                        end;
                     end;
                  end;
               end;
               CloseFile(lDDLFile);
            end;
            pbSchema.StepBy(1);
            Application.ProcessMessages;
         until FindNext(searchResult) <> 0;
      end
      else //searched on empty string, show all
      begin
         if FindFirst(gSettings.SchemaDir + '\*.ddl', faAnyFile, searchResult) = 0 then
         begin
            repeat
               tblStr := searchResult.Name;
               tbl := tblStr;
               Delete(tbl, Length(tbl) - 3, 4); //Delete '.ddl'
               if (not cbSMSOnly.Checked) or (fTableNames.IndexOf(tbl) <> -1) then
               begin
                  tvSchema.Items.Add(nil, tblStr);
               end;
            until FindNext(searchResult) <> 0;
            FindClose(searchResult);
         end;
      end;
      FindClose(searchResult);
   end;
   tvSchema.Items.EndUpdate;
   fSearching := False;
   if tvSchema.Items.Count <> 0 then
      tvSchemaChange(self, tvSchema.Items[0]);
   pbSchema.Position := 0;
   pbSchema.Visible := False;   
end;

procedure TdDataGenie.cboTableKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnSearchClick(self);
  end;
end;

procedure TdDataGenie.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

end.
