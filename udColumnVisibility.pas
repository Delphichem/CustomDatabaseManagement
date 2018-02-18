unit udColumnVisibility;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, SMDBGrid, DB, kbmMemTable, ufISQLQuery;

type
  THackDBGrid = class(TSMDBGrid);

  TdColumnVisibility = class(TForm)
    cboTable: TComboBox;
    lblTable: TLabel;
    dbgVisibleColumns: TSMDBGrid;
    dsVisibleColumns: TDataSource;
    mtbVisibleColumns: TkbmMemTable;
    mtbVisibleColumnsField: TStringField;
    mtbVisibleColumnsVisible: TBooleanField;
    mtbVisibleColumnsType: TStringField;
    btnSelectAll: TButton;
    btnUnSelectAll: TButton;
    btnOk: TButton;
    procedure cboTableChange(Sender: TObject);
    procedure dbgVisibleColumnsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnSelectAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    fFilling : Boolean;
    fQry : ISQLQuery;
    function PopulateMemoryTable(aTableName: String) : Boolean;
    procedure AllSelect(aSelect: Boolean);
  public
    { Public declarations }
    procedure SetUp(aTableName: String);
  end;


implementation

uses
   uuGlobals, IniFiles;

{$R *.dfm}

procedure TdColumnVisibility.SetUp(aTableName : String);
var
   lTableNames : TStringList;
   I : Integer;
begin
   //fill table dropdown
   fFilling := True;
   lTableNames := gDataBase.GetTableNames;
   cboTable.Items.Clear;
   if lTableNames.Count <> 0 then
   begin
      for I := 0 to lTableNames.Count - 1 do
      begin
         cboTable.Items.Add(lTableNames[I]);
      end;
   end;
   FreeAndNil(lTableNames);
   fFilling := False;

   dsVisibleColumns.DataSet := mtbVisibleColumns;
   fQry := gDataBase.NewQuery;
   cboTable.Text := aTableName;
   cboTableChange(cboTable);
end;

function TdColumnVisibility.PopulateMemoryTable(aTableName : String) : Boolean;
var
   I : Integer;
   lPersonalIni : TIniFile;
   lVisible : String;
begin
   mtbVisibleColumns.Close;
   mtbVisibleColumns.Open;

   lPersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);

   fQry.Close;
   fQry.SQL.Clear;
   fQry.SQL.Add('select * from ' + aTableName);
   try
      try
         fQry.Open;
         for I := 0 to fQry.Fields.Count - 1 do
         begin
            mtbVisibleColumns.Append;
            mtbVisibleColumnsField.AsString := fQry.Fields[I].FieldName;
            lVisible := lPersonalIni.ReadString(cboTable.Text, mtbVisibleColumnsField.AsString, 'Y');
            mtbVisibleColumnsVisible.AsBoolean := RegStrToBool(lVisible);
            mtbVisibleColumnsType.AsString := FieldTypeToString(fQry.Fields[I].DataType);
            mtbVisibleColumns.Post;
         end;
         mtbVisibleColumns.First;
         Result := True;
      except
         Result := False;
      end;
   finally
      fQry.Close;
   end;
end;

procedure TdColumnVisibility.btnOkClick(Sender: TObject);
var
   lPersonalIni : TIniFile;
begin
   //should check if cboTable.Text is in tablenames

   if mtbVisibleColumns.State in [dsEdit] then
      mtbVisibleColumns.Post;
   mtbVisibleColumns.DisableControls;
   lPersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);
   try
      mtbVisibleColumns.First;
      while not mtbVisibleColumns.eof do
      begin
         lPersonalIni.WriteString(cboTable.Text, mtbVisibleColumnsField.AsString, RegBoolToStr(mtbVisibleColumnsVisible.AsBoolean));
         mtbVisibleColumns.Next;
      end;
   finally
      lPersonalIni.Free;
      mtbVisibleColumns.EnableControls;
   end;
end;

procedure TdColumnVisibility.btnSelectAllClick(Sender: TObject);
begin
   AllSelect(True);
end;

procedure TdColumnVisibility.btnUnSelectAllClick(Sender: TObject);
begin
   AllSelect(False);
end;

procedure TdColumnVisibility.AllSelect(aSelect : Boolean);
var
   lBookMark : TBookMarkStr;
begin
   mtbVisibleColumns.DisableControls;
   lBookMark := mtbVisibleColumns.Bookmark;
   try
      mtbVisibleColumns.First;
      while not mtbVisibleColumns.eof do
      begin
         mtbVisibleColumns.Edit;
         mtbVisibleColumnsVisible.AsBoolean := aSelect;
         mtbVisibleColumns.Post;
         mtbVisibleColumns.Next;
      end;
   finally
      mtbVisibleColumns.Bookmark := lBookMark;
      mtbVisibleColumns.EnableControls;
   end;
end;

procedure TdColumnVisibility.cboTableChange(Sender: TObject);
begin
   if (not fFilling) and PopulateMemoryTable(cboTable.Text) then
      dbgVisibleColumns.SelectedField := dsVisibleColumns.DataSet.FieldByName('Visible');
end;

procedure TdColumnVisibility.dbgVisibleColumnsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   lDataSet : TDataSet;
   lGrid : TSMDBGrid;
begin
   lGrid := (Sender as TSMDBGrid);
   if gSettings.TypeColours then
   begin
      lDataSet := lGrid.DataSource.DataSet;
      if Assigned(lDataSet) then
      begin
         if gSettings.TypeColours and (not (gdSelected in State)) then
         begin
            if (DataCol <> 1) and (DataCol <> 2) then
            begin
               if lDataSet.FieldByName('Type').AsString = 'String' then
                  lGrid.Canvas.Brush.Color := gSettings.ColString
               else if lDataSet.FieldByName('Type').AsString = 'Integer' then
                  lGrid.Canvas.Brush.Color := gSettings.ColInteger
               else if lDataSet.FieldByName('Type').AsString = 'Float' then
                  lGrid.Canvas.Brush.Color := gSettings.ColFloat
               else if lDataSet.FieldByName('Type').AsString = 'DateTime' then
                  lGrid.Canvas.Brush.Color := gSettings.ColDateTime
               else if lDataSet.FieldByName('Type').AsString = 'Currency' then
                  lGrid.Canvas.Brush.Color := gSettings.ColCurrency
               else
                  lGrid.Canvas.Brush.Color := clWindow;
            end;
         end;

         if (THackDBGrid(lGrid).DataLink.ActiveRecord + 1 = THackDBGrid(lGrid).Row) then
         begin
            if gSettings.SelectedBold then
            begin
               with lGrid.Canvas.Font do
               begin
                  Style := Style + [fsBold];
                  Color := clBlack;
               end;
            end;
            if (gdSelected in State) then
               lGrid.Canvas.Brush.Color := gSettings.ColSelected;
         end;
      end;
   end;
   lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TdColumnVisibility.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   mtbVisibleColumns.Close;
   fQry := nil;
end;

procedure TdColumnVisibility.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

end.
