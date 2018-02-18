unit udExport;
{
  Jan 2015 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, StdCtrls, Buttons, DB, ExtCtrls,
  kbmMemTable, ComCtrls, IBODataset;

type
  THackDBGrid = class(TSMDBGrid);

  TdExport = class(TForm)
    dbgExport: TSMDBGrid;
    btnSelectAll: TButton;
    btnUnSelectAll: TButton;
    btnExport: TSpeedButton;
    dsExport: TDataSource;
    edtDelimiter: TLabeledEdit;
    mtbExport: TkbmMemTable;
    mtbExportField: TStringField;
    mtbExportInclude: TBooleanField;
    btnCancel: TButton;
    mmoExport: TMemo;
    pbExport: TProgressBar;
    cbExcel: TCheckBox;
    mtbExportDisplayName: TStringField;
    procedure btnExportClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnSelectAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgExportDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     fQry : TDataset;
     fFileName : string;
     fLoading : Boolean;
     procedure AllSelect(aSelect: Boolean);
     function SaveFile(aCSV : Boolean; var aNotChosen : Boolean;
        aCaption : String; aDefaultFile : String; aOwner: TComponent) : String;
  public
     procedure SetUp(aQry : TDataSet; aGrid : TSMDBGrid; aFileName : String);
  end;

implementation

uses uuGlobals, ShellAPI;

{$R *.dfm}

procedure TdExport.SetUp(aQry : TDataSet; aGrid : TSMDBGrid; aFileName : String);
var
   I : Integer;
begin
   dsExport.DataSet := mtbExport;
   fQry := aQry;
   fFileName := aFileName;
   //Populate memory table
   mtbExport.Close;
   mtbExport.Open;
   fLoading := True;
   for I := 0 to aGrid.Columns.Count - 1 do
   begin
      mtbExport.Append;
      mtbExportField.AsString := aGrid.Columns[I].FieldName;
      mtbExportDisplayName.AsString := aGrid.Columns[I].Title.Caption;
      mtbExportInclude.AsBoolean := True;
      mtbExport.Post;
   end;

   fLoading := False;
   mtbExport.First;
end;

procedure TdExport.btnExportClick(Sender: TObject);
var
   lLine : String;
   I : Integer;
   lFileName : String;
   lNotChosen : Boolean;
   lDelimiter : string;

   procedure AddDelimiter;
   begin
      if lLine <> '' then
         lLine := lLine + lDelimiter;
   end;

   function IsFieldIncluded(aFieldName : String) : Boolean;
   begin
      Result := mtbExport.Locate('Field', aFieldName, []) and mtbExportInclude.AsBoolean;
   end;

   function FieldDisplayName(aFieldName : String) : String;
   begin
      mtbExport.FieldByName('display_name').AsString;
   end;

begin
   if mtbExport.State in [dsEdit] then
      mtbExport.Post;

   lDelimiter := edtDelimiter.Text;
   mmoExport.Lines.Clear;
   pbExport.Position := 0;
   pbExport.Max := fQry.RecordCount;
   mtbExport.DisableControls;

   try
      //Field Titles
      lLine := '';
      for I := 0 to fQry.Fields.Count - 1 do
      begin
         if IsFieldIncluded(fQry.Fields[I].FieldName) then
         begin
            AddDelimiter;
            lLine := lLine + mtbExport.FieldByName('displayname').AsString
         end;
      end;

      mmoExport.Lines.Add(lLine);

      //Data
      fQry.First;
      while not fQry.eof do
      begin
         lLine := '';
         for I := 0 to fQry.Fields.Count - 1 do
         begin
            if IsFieldIncluded(fQry.Fields[I].FieldName) and (fQry.Fields[I].FieldName <> 'keywords') then
            begin
               AddDelimiter;
               lLine := lLine + fQry.Fields[I].AsString;
            end;
         end;

         mmoExport.Lines.Add(lLine);
         pbExport.StepBy(1);
         Application.ProcessMessages;
         fQry.Next;
      end;

      lFileName := SaveFile(True, lNotChosen, '', fFileName, self);

      if not lNotChosen then
      begin
         mmoExport.Lines.SaveToFile(lFileName);
         //Open it in Excel. It will depend on the file types default program
         if cbExcel.Checked then
            ShellExecute(Handle, 'open', PChar(lFileName), nil, nil, SW_SHOWNORMAL);
      end;
   finally
      mtbExport.EnableControls;
      pbExport.Position := 0;
      Application.ProcessMessages;
      ModalResult := mrOk;
   end;
end;

procedure TdExport.btnSelectAllClick(Sender: TObject);
begin
   AllSelect(True);
end;

procedure TdExport.btnUnSelectAllClick(Sender: TObject);
begin
   AllSelect(False);
end;

procedure TdExport.dbgExportDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   lDataSet : TDataSet;
   lGrid : TSMDBGrid;
begin
   lGrid := (Sender as TSMDBGrid);
   lDataSet := lGrid.DataSource.DataSet;
   if Assigned(lDataSet) then
   begin
      if (THackDBGrid(lGrid).DataLink.ActiveRecord + 1 = THackDBGrid(lGrid).Row) then
      begin
         with lGrid.Canvas.Font do
         begin
            Style := Style + [fsBold];
            Color := clBlack;
         end;
      end;
   end;

   lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TdExport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //
end;

procedure TdExport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdExport.AllSelect(aSelect : Boolean);
var
   lBookMark : TBookMarkStr;
begin
   mtbExport.DisableControls;
   lBookMark := mtbExport.Bookmark;
   try
      mtbExport.First;
      while not mtbExport.eof do
      begin
         mtbExport.Edit;
         mtbExportInclude.AsBoolean := aSelect;
         mtbExport.Post;
         mtbExport.Next;
      end;
   finally
      mtbExport.Bookmark := lBookMark;
      mtbExport.EnableControls;
   end;
end;

function TdExport.SaveFile(aCSV : Boolean; var aNotChosen : Boolean;
   aCaption : String; aDefaultFile : String; aOwner: TComponent) : String;
var
   SaveDialog: TFileSaveDialog;
   Dialog : TSaveDialog;
begin
   aNotChosen := True;
   Dialog := nil;
   SaveDialog := nil;

   if gWin7 then
      SaveDialog := TFileSaveDialog.Create(aOwner)
   else
      Dialog := TSaveDialog.Create(aOwner);

   try

      if gWin7 then
      begin
         if aCSV then
         begin
            SaveDialog.DefaultExtension := 'csv';
            with SaveDialog.FileTypes.Add do
            begin
               DisplayName := 'csv file';
               FileMask := '*.csv';
            end;
         end;
         SaveDialog.FileName := aDefaultFile;
         aNotChosen := not SaveDialog.Execute;
         Result := SaveDialog.FileName;
      end
      else
      begin
         //Dialog.Filter :=
         Dialog.InitialDir := aDefaultFile;
         aNotChosen := not Dialog.Execute;
         Result := Dialog.FileName;
      end;
   finally
      if gWin7 then
         SaveDialog.Free
      else
         Dialog.Free;
   end;

end;

end.
