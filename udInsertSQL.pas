unit udInsertSQL;
{
  Jan 2015 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, SynEdit, SynMemo, StdCtrls, Grids, DBGrids, SMDBGrid, DB,
  SynCompletionProposal, SynEditHighlighter, SynHighlighterSQL, kbmMemTable,
  ufISQLQuery, ufISQLDataBase;

type
  THackDBGrid = class(TSMDBGrid);

  TdInsertSQL = class(TForm)
    cboTable: TComboBox;
    lblTable: TLabel;
    mmoSQL: TSynMemo;
    btnGenerateSQL: TSpeedButton;
    dbgInsertSQL: TSMDBGrid;
    dsInsertSQL: TDataSource;
    SynSQLSyn1: TSynSQLSyn;
    SynCompletionProposal1: TSynCompletionProposal;
    btnCancel: TButton;
    mtbInsert: TkbmMemTable;
    mtbInsertField: TStringField;
    mtbInsertValue: TStringField;
    mtbInsertType: TStringField;
    mtbInsertInclude: TBooleanField;
    btnCopySQL: TButton;
    procedure btnGenerateSQLClick(Sender: TObject);
    procedure dbgInsertSQLDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboTableChange(Sender: TObject);
    procedure mtbInsertValueChange(Sender: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    fQry : ISQLQuery;
    fFilling : Boolean;
    fPopulating : Boolean;
    function PopulateMemoryTable(aTableName: String) : Boolean;
  public
    { Public declarations }
    procedure SetUp(aTableName : String);
    procedure GetSQL(var aSQL: String);
  end;


implementation

uses uuGlobals;

{$R *.dfm}

procedure TdInsertSQL.SetUp(aTableName : String);
var
   lTableNames : TStringList;
   I : Integer;
begin
   //fill table dropdown
   fPopulating := False;
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

   dsInsertSQL.DataSet := mtbInsert;
   fQry := gDataBase.NewQuery;
   cboTable.Text := aTableName;
   cboTableChange(cboTable);
end;

function TdInsertSQL.PopulateMemoryTable(aTableName : String) : Boolean;
var
   I : Integer;
begin
   fPopulating := True;
   mtbInsert.Close;
   mtbInsert.Open;

   fQry.Close;
   fQry.SQL.Clear;
   fQry.SQL.Add('select * from ' + aTableName);
   try
      fQry.Open;
      for I := 0 to fQry.Fields.Count - 1 do
      begin
         mtbInsert.Append;
         mtbInsertField.AsString := fQry.Fields[I].FieldName;
         mtbInsertValue.AsString := '';
         mtbInsertInclude.AsBoolean := False;
         mtbInsertType.AsString := FieldTypeToString(fQry.Fields[I].DataType);
         mtbInsert.Post;
      end;
      mtbInsert.First;
      fQry.Close;
      fPopulating := False;
      Result := True;
   except
      Result := False;
      fPopulating := False;
      fQry.Close;
   end;
end;

procedure TdInsertSQL.cboTableChange(Sender: TObject);
begin
   if (not fFilling) and PopulateMemoryTable(cboTable.Text) then
      dbgInsertSQL.SelectedField := dsInsertSQL.DataSet.FieldByName('Value');
end;

procedure TdInsertSQL.dbgInsertSQLDrawColumnCell(Sender: TObject;
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

procedure TdInsertSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   mtbInsert.Close;
   fQry := nil;
end;

procedure TdInsertSQL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdInsertSQL.GetSQL(var aSQL: String);
begin
   aSQL := mmoSQL.Text;
end;

procedure TdInsertSQL.mtbInsertValueChange(Sender: TField);
begin
   if not fPopulating then
      mtbInsertInclude.AsBoolean := True;
end;

procedure TdInsertSQL.btnGenerateSQLClick(Sender: TObject);
var
   lSQL : String;
   lFirstIncluded : Boolean;
begin
   if mtbInsert.State in [dsEdit] then
      mtbInsert.Post;

   mtbInsert.DisableControls;

   mmoSQL.Clear;

   lSQL := DisplaySQL('INSERT INTO ' + cboTable.Text + ' (' + #13#10);

   lFirstIncluded := True;
   mtbInsert.First;
   while not mtbInsert.eof do
   begin
      if mtbInsertInclude.AsBoolean then
      begin
         if lFirstIncluded then
         begin
            lSQL := lSQL + '  ' + DisplaySQL(mtbInsertField.AsString) + #13#10;
            lFirstIncluded := False;
         end
         else
         begin
            lSQL := lSQL + ', ' + DisplaySQL(mtbInsertField.AsString) + #13#10;
         end;
      end;
      mtbInsert.Next;
   end;

   lSQL := lSQL + ')' + #13#10 + DisplaySQL('values (') + #13#10;

   lFirstIncluded := True;
   mtbInsert.First;
   while not mtbInsert.eof do
   begin
      if mtbInsertInclude.AsBoolean then
      begin
         if lFirstIncluded then
         begin
            lSQL := lSQL + '  ' + QuotedStr(DisplaySQL(mtbInsertValue.AsString)) + #13#10;
            lFirstIncluded := False;
         end
         else
         begin
            lSQL := lSQL + ', ' + QuotedStr(DisplaySQL(mtbInsertValue.AsString)) + #13#10;
         end;
      end;
      mtbInsert.Next;
   end;
   lSQL := lSQL + ');';

   mmoSQL.Text := lSQL;
   mtbInsert.EnableControls;
end;

end.
