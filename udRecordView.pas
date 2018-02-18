unit udRecordView;
{
  Oct/Nov 2014 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, DB, StdCtrls, DBGrids, SMDBGrid, kbmMemTable,
  uuGlobals;

type
  THackDBGrid = class(TSMDBGrid);

//  TCopiedField = class
//    FieldName : String;
//    Value : String;
//    Null : Boolean;
//  end;

  TdRecordView = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    dbgRecord: TSMDBGrid;
    dsRecord: TDataSource;
    btnCopyRecord: TButton;
    btnPasteRecord: TButton;
    btnHint: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCopyRecordClick(Sender: TObject);
    procedure dbgRecordDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPasteRecordClick(Sender: TObject);
    procedure dbgRecordFilterChanged(Sender: TObject);
    procedure btnHintClick(Sender: TObject);
  private
    { Private declarations }
    fTableName, fPrimaryKey : string;
    function CanPaste: Boolean;
    procedure ClearGRecord;
  public
    { Public declarations }
    procedure SetUp(aFields : TkbmMemTable; aTableName : String; aPrimaryKey : String);
    procedure GetFields(var aFields: TkbmMemTable);
  end;

var
//   gCopiedRec : array of TCopiedField;
   gCopiedFieldNames : array of String;
   gCopiedFieldValues : array of String;
   gCopiedFieldNulls : array of Boolean;

implementation

procedure TdRecordView.SetUp(aFields : TkbmMemTable; aTableName : String; aPrimaryKey : String);
begin
   fTableName := aTableName;
   fPrimaryKey := aPrimaryKey;
   dsRecord.DataSet := aFields;
   dsRecord.DataSet.First;
   dbgRecord.SelectedField := dsRecord.DataSet.FieldByName('Value');
   btnPasteRecord.Enabled := CanPaste;
   dbgRecord.GridStyle.FilterColor := gSettings.ColFilter;
end;

procedure TdRecordView.ClearGRecord;
var
   I : Integer;
begin
   for I := 0 to Length(gCopiedFieldNames) - 1 do
   begin
      gCopiedFieldNames[I] := '';
      gCopiedFieldValues[I] := '';
      gCopiedFieldNulls[I] := False;
   end;
end;

procedure TdRecordView.btnCopyRecordClick(Sender: TObject);
var
   I : Integer;
   lBookMark : TBookMarkStr;
begin
   if Assigned(gCopiedFieldNames) and (gCopiedFieldNames[0] <> '') then
      ClearGRecord;

   dsRecord.DataSet.DisableControls;
   lBookMark := dsRecord.DataSet.Bookmark;
   SetLength(gCopiedFieldNames, dsRecord.DataSet.RecordCount);
   SetLength(gCopiedFieldValues, dsRecord.DataSet.RecordCount);
   SetLength(gCopiedFieldNulls, dsRecord.DataSet.RecordCount);
   try
      try
         dsRecord.DataSet.First;
         for I := 0 to dsRecord.DataSet.RecordCount - 1 do
         begin
            gCopiedFieldNames[I] := dsRecord.DataSet.FieldByName('Field').AsString;
            gCopiedFieldNulls[I] := dsRecord.DataSet.FieldByName('IsNull').AsBoolean;
            if not dsRecord.DataSet.FieldByName('IsNull').AsBoolean then
               gCopiedFieldValues[I] := dsRecord.DataSet.FieldByName('Value').AsString;
            dsRecord.DataSet.Next;
         end;
      except
         ClearGRecord;
      end;
   finally
      dsRecord.DataSet.Bookmark := lBookMark;
      dsRecord.DataSet.EnableControls;
   end;
end;

function TdRecordView.CanPaste : Boolean;
var
   I : Integer;
   lBookMark : TBookMarkStr;
begin
   if (not Assigned(gCopiedFieldNames)) or (gCopiedFieldNames[0] = '') then
   begin
      Result := False;
      Exit;
   end;

   Result := True;
   if dsRecord.DataSet.RecordCount <> Length(gCopiedFieldNames) then
   begin
      ShowMessage('Fields mismatch');
      Result := False;
   end
   else
   begin
      dsRecord.DataSet.DisableControls;
      lBookMark := dsRecord.DataSet.Bookmark;
      try
         dsRecord.DataSet.First;
         for I := 0 to Length(gCopiedFieldNames) - 1 do
         begin
            if gCopiedFieldNames[I] <> dsRecord.DataSet.FieldByName('Field').AsString then
            begin
               ShowMessage('Fields mismatch');
               Result := False;
            end;
            dsRecord.DataSet.Next;
         end;
      finally
         dsRecord.DataSet.Bookmark := lBookMark;
         dsRecord.DataSet.EnableControls;
      end;
   end;
end;

procedure TdRecordView.btnHintClick(Sender: TObject);
begin
   ShowMessage(dsRecord.DataSet.FieldByName('Hint').AsString)
end;

procedure TdRecordView.btnPasteRecordClick(Sender: TObject);
var
   I : Integer;
   lBookMark : TBookMarkStr;
begin
   if CanPaste then
   begin
      lBookMark := dsRecord.DataSet.Bookmark;
      dsRecord.DataSet.DisableControls;
      try
         dsRecord.DataSet.First;
         for I := 0 to dsRecord.DataSet.RecordCount - 1 do
         begin
            dsRecord.DataSet.Edit;
            dsRecord.DataSet.FieldByName('IsNull').AsBoolean := gCopiedFieldNulls[I];
            if not gCopiedFieldNulls[I] then            
               dsRecord.DataSet.FieldByName('Value').AsString := gCopiedFieldValues[I];
            dsRecord.DataSet.Post;
            dsRecord.DataSet.Next;
         end;
      finally
         dsRecord.DataSet.Bookmark := lBookMark;
         dbgRecord.SelectedField := dsRecord.DataSet.FieldByName('Value');
         dsRecord.DataSet.EnableControls;
         ClearGRecord;
      end;
   end;
end;

procedure TdRecordView.dbgRecordDrawColumnCell(Sender: TObject;
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

procedure TdRecordView.dbgRecordFilterChanged(Sender: TObject);
begin
   if not dbgRecord.FilterIsEmpty then
   begin
      btnCopyRecord.Enabled := False;
      btnPasteRecord.Enabled := False;
   end
   else
   begin
      btnCopyRecord.Enabled := True;
      btnPasteRecord.Enabled := CanPaste;
   end;
end;

procedure TdRecordView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdRecordView.FormShow(Sender: TObject);
begin
   dbgRecord.SetFocus;
end;

procedure TdRecordView.GetFields(var aFields: TkbmMemTable);
var
   I : Integer;
begin
   //get rid of the filter
   for I := 0 to dbgRecord.Columns.Count - 1 do
      dbgRecord.Columns[I].FilterValue := '';
   dbgRecord.ApplyFilter;
   aFields := dsRecord.DataSet as TkbmMemTable;
end;

{$R *.dfm}

end.
