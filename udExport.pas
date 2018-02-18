unit udExport;
{
  Jan 2015 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, StdCtrls, Buttons, DB, ExtCtrls, ufISQLQuery,
  kbmMemTable, ComCtrls;

type
  THackDBGrid = class(TSMDBGrid);

  TdExport = class(TForm)
    dbgInsertSQL: TSMDBGrid;
    btnSelectAll: TButton;
    btnUnSelectAll: TButton;
    btnExport: TSpeedButton;
    dsExport: TDataSource;
    edtDelimiter: TLabeledEdit;
    rgMethod: TRadioGroup;
    mtbExport: TkbmMemTable;
    mtbExportField: TStringField;
    mtbExportInclude: TBooleanField;
    mtbExportType: TStringField;
    btnCancel: TButton;
    mmoExport: TMemo;
    pbExport: TProgressBar;
    procedure btnExportClick(Sender: TObject);
    procedure rgMethodClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnSelectAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgInsertSQLDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
     fTableName : String;
     fQry : ISQLQuery;
    procedure AllSelect(aSelect: Boolean);
  public
     procedure SetUp(aQry : ISQLQuery; aTableName : String);
  end;

implementation

uses uuGlobals, ShellAPI;

{$R *.dfm}

procedure TdExport.SetUp(aQry : ISQLQuery; aTableName : String);
var
   I : Integer;
begin
   fTableName := aTableName;
   dsExport.DataSet := mtbExport;
   fQry := aQry;

   //Populate memory table
   mtbExport.Close;
   mtbExport.Open;

   for I := 0 to aQry.Fields.Count - 1 do
   begin
      mtbExport.Append;
      mtbExportField.AsString := aQry.Fields[I].FieldName;
      mtbExportInclude.AsBoolean := True;
      mtbExportType.AsString := FieldTypeToString(aQry.Fields[I].DataType);
      mtbExport.Post;
   end;
   mtbExport.First;
end;

procedure TdExport.btnExportClick(Sender: TObject);
var
   lLine, lTotalLine : String;
   I : Integer;
   lFileName : String;
   lNotChosen : Boolean;
   lFirstIncluded : Boolean;
   lInsertStatementHeader : String;

   function IsFieldIncluded(aFieldName : String) : Boolean;
   begin
      Result := mtbExport.Locate('Field', aFieldName, []) and mtbExportInclude.AsBoolean;
   end;
begin
   if mtbExport.State in [dsEdit] then
      mtbExport.Post;

   mmoExport.Lines.Clear;
   pbExport.Position := 0;
   pbExport.Max := fQry.RecordCount;
   mtbExport.DisableControls;
   try
      if rgMethod.ItemIndex = 0 then //csv
      begin
         //TODO: This is not quite right, if the first column is not selected
         //it gives a blank first column

         //Field Titles
         lLine := '';
         if IsFieldIncluded(fQry.Fields[0].FieldName) then
            lLine := fQry.Fields[0].FieldName
         else
            lLine := '';

         for I := 1 to fQry.Fields.Count - 1 do
         begin
            if IsFieldIncluded(fQry.Fields[I].FieldName) then
               lLine := lLine + edtDelimiter.Text + fQry.Fields[I].FieldName;
         end;
         mmoExport.Lines.Add(lLine);

         //Data
         fQry.First;
         while not fQry.eof do
         begin
            if IsFieldIncluded(fQry.Fields[0].FieldName) then
               lLine := fQry.Fields[0].AsString
            else
               lLine := '';
            
            for I := 1 to fQry.Fields.Count - 1 do
            begin
               if IsFieldIncluded(fQry.Fields[I].FieldName) then
                  lLine := lLine + edtDelimiter.Text + fQry.Fields[I].AsString;
            end;
            mmoExport.Lines.Add(lLine);
            pbExport.StepBy(1);
            Application.ProcessMessages;
            fQry.Next;
         end;

         lFileName := SaveFile(True, lNotChosen, '', fTableName, self);

         if not lNotChosen then
         begin
            mmoExport.Lines.SaveToFile(lFileName);
            //Open it in Excel. It will depend on the file types default program
            ShellExecute(Handle, 'open', PChar(lFileName), nil, nil, SW_SHOWNORMAL);
         end;
      end
      else if rgMethod.ItemIndex = 1 then //insert statements
      begin
         lTotalLine := '';
         lInsertStatementHeader := DisplaySQL('INSERT INTO ' + fTableName + ' (' + #13#10);

         lFirstIncluded := True;
         mtbExport.First;
         while not mtbExport.eof do
         begin
            if mtbExportInclude.AsBoolean then
            begin
               if lFirstIncluded then
               begin
                  lInsertStatementHeader := lInsertStatementHeader + '  ' + DisplaySQL(mtbExportField.AsString) + #13#10;
                  lFirstIncluded := False;
               end
               else
               begin
                  lInsertStatementHeader := lInsertStatementHeader + ', ' + DisplaySQL(mtbExportField.AsString) + #13#10;
               end;
            end;
            mtbExport.Next;
         end;

         lInsertStatementHeader := lInsertStatementHeader + ')' + #13#10 + DisplaySQL('values (') + #13#10;

         fQry.First;
         while not fQry.eof do
         begin
            lFirstIncluded := True;
            lLine := lInsertStatementHeader;

            for I := 0 to fQry.Fields.Count - 1 do
            begin
               if IsFieldIncluded(fQry.Fields[I].FieldName) then
               begin
                  if lFirstIncluded then
                  begin
                     lLine := lLine + '  ' + QuotedStr(fQry.Fields[I].AsString) + #13#10;
                     lFirstIncluded := False;
                  end
                  else
                  begin
                     lLine := lLine + ', ' + QuotedStr(fQry.Fields[I].AsString) + #13#10;
                  end;
               end;
            end;

            lLine := lLine + ');';
            lTotalLine := lTotalLine + lLine + #13#10;
            fQry.Next;
         end;
         mmoExport.Text := lTotalLine;

         lFileName := SaveFile(False, lNotChosen, '', fTableName, self);

         if not lNotChosen then
         begin
            mmoExport.Lines.SaveToFile(lFileName);
         end;
      end;
   finally
      mtbExport.EnableControls;
      pbExport.Position := 0;
      Application.ProcessMessages;
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

procedure TdExport.dbgInsertSQLDrawColumnCell(Sender: TObject;
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

procedure TdExport.rgMethodClick(Sender: TObject);
begin
   edtDelimiter.Enabled := rgMethod.ItemIndex = 0;
end;

end.
