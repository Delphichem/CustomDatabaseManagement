unit udCompareDB;
{
  Mar 2016 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, DB, kbmMemTable, StdCtrls, Buttons,
  ufISQLDatabase, ComCtrls, uuTab, ExtCtrls, DBCtrls;

type
  THackDBGrid = class(TSMDBGrid);
  TdCompareDB = class(TForm)
    dbgTables: TSMDBGrid;
    dsTables: TDataSource;
    mtbTables: TkbmMemTable;
    btnChooseDBs: TSpeedButton;
    mtbTablestable_name: TStringField;
    mtbTablesdb_recs_1: TIntegerField;
    mtbTablesdb_recs_2: TIntegerField;
    dbgTable2: TSMDBGrid;
    lblServer1: TLabel;
    lblAlias1: TLabel;
    lblServer2: TLabel;
    lblAlias2: TLabel;
    btnSelectAll: TButton;
    btnUnSelectAll: TButton;
    btnCompare: TSpeedButton;
    mtbTablesselected: TBooleanField;
    pb1: TProgressBar;
    dn1: TDBNavigator;
    dn2: TDBNavigator;
    btnRecordView1: TSpeedButton;
    btnRecordView2: TSpeedButton;
    mtbRecord: TkbmMemTable;
    mtbRecordField: TStringField;
    mtbRecordValue: TStringField;
    mtbRecordType: TStringField;
    mtbRecordIsNull: TBooleanField;
    mtbRecordHint: TStringField;
    mtbDB1: TkbmMemTable;
    mtbDB2: TkbmMemTable;
    dbgTable1: TSMDBGrid;
    lblRecordCount1: TLabel;
    lblRecordCount2: TLabel;
    procedure btnChooseDBsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCompareClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnSelectAllClick(Sender: TObject);
    procedure dbgTablesDblClick(Sender: TObject);
    procedure btnRecordView1Click(Sender: TObject);
    procedure btnRecordView2Click(Sender: TObject);
    procedure diffDrawColumnCell1(Sender: TObject; const Rect: TRect;
       DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure diffDrawColumnCell2(Sender: TObject; const Rect: TRect;
       DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgTablesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure dbgTable1FilterChanged(Sender: TObject);
    procedure dbgTable2FilterChanged(Sender: TObject);
  private
    fTab1, fTab2 : TTab;
    fTableNames1, fTableNames2 : TStringList;
    fDB1, fDB2 : ISQLDatabase;
    fSelectedTable : string;
    procedure ConnectToBothDatabases(aServer1, aAlias1, aServer2, aAlias2 : String);
    procedure CloseDBs;
    procedure AllSelect(aSelect: Boolean);
    procedure OpenSelectedTable;
    procedure RecordView(aTab: TTab);
    procedure SetupMemTable(aMemTable : TkbmMemTable; aTab : TTab);
    procedure PopulateMemTables;
    procedure SetRecordCount(aTab: TTab; aLbl : TLabel);
  public

  end;

  const
     H_HEIGHT = 48;

implementation

uses udChooseDB, uuGlobals, ufPDXDataBase, ufNexusDatabase, ufISQLQuery,
  udRecordView, ufPdxQuery;

{$R *.dfm}

procedure TdCompareDB.FormShow(Sender: TObject);
begin
   fSelectedTable := '';
   CloseDBs;
   dsTables.DataSet := mtbTables;
   dbgTables.DataSource := dsTables;

   btnChooseDBsClick(self);
end;

procedure TdCompareDB.btnChooseDBsClick(Sender: TObject);
var
   lChooseDB : TdChooseDB;
begin
   lChooseDB := TdChooseDB.Create(Self);
   try
      if lChooseDB.ShowModal = mrOk then
      begin
         ConnectToBothDatabases(lChooseDB.Server1, lChooseDB.Alias1, lChooseDB.Server2, lChooseDB.Alias2);
      end;
   finally
      FreeAndNil(lChooseDB);
   end;
end;

procedure TdCompareDB.ConnectToBothDatabases(aServer1, aAlias1, aServer2, aAlias2 : String);

   function SetupDB(aLBLServer, aLBLAlias : TLabel; aServer, aAlias : String) : ISQLDatabase;
   begin
      if aServer = 'Paradox' then
      begin
         Result := TPDXDataBase.Create;
         aLBLServer.Font.Color := clGreen;
      end
      else if (AnsiPos('NEXUSDB', Uppercase(aServer)) <> 0) then
      begin
         Result := TNexusDataBase.Create;
         aLBLServer.Font.Color := clBlue;
         //if IsNexusServerNamePiped(aServer) then
         //   Result.UsePipedTransport;
      end;

      if Assigned(Result) then
      begin
         try
            Result.ServerName := aServer;
            Result.AliasName := aAlias;
            Result.Timeout := 1000*StrToInt(gSettings.DBTimeout);
            Result.Connected := True;

            aLBLServer.Caption := aServer;
            aLBLAlias.Caption := aAlias;
         except
            on E: Exception do
            begin
               CloseDBs;
               ShowMessage(E.Message);
            end;
         end;
      end;
   end;

   function AddTablesFromDB(aDB : ISQLDatabase) : TStringList;
   var
      lTableNames : TStringList;
      I : Integer;
   begin
      lTableNames := aDB.GetTableNames;
      if lTableNames.Count <> 0 then
      begin
         for I := 0 to lTableNames.Count - 1 do
         begin
            if not mtbTables.Locate('table_name', lTableNames[I], []) then
            begin
               mtbTables.Append;
               mtbTablesselected.AsBoolean := True;
               mtbTablestable_name.AsString := lTableNames[I];
               mtbTablesdb_recs_1.AsInteger := 0;
               mtbTablesdb_recs_2.AsInteger := 0;
               mtbTables.Post;
            end;
         end;
      end;
      Result := lTableNames;
   end;
begin
   CloseDBs;
   fDB1 := SetupDB(lblServer1, lblAlias1, aServer1, aAlias1);
   fDB2 := SetupDB(lblServer2, lblAlias2, aServer2, aAlias2);
   mtbTables.Close;
   mtbTables.Open;
   if Assigned(fDB1) and Assigned(fDB2) then
   begin
      fTableNames1 := AddTablesFromDB(fDB1);
      fTableNames2 := AddTablesFromDB(fDB2);
      mtbTables.First;
   end
   else
   begin
      btnChooseDBsClick(self);
   end;
end;

procedure TdCompareDB.dbgTable1FilterChanged(Sender: TObject);
begin
   SetRecordCount(fTab1, lblRecordCount1);
end;

procedure TdCompareDB.dbgTable2FilterChanged(Sender: TObject);
begin
   SetRecordCount(fTab2, lblRecordCount2);
end;

procedure TdCompareDB.dbgTablesDblClick(Sender: TObject);
begin
   OpenSelectedTable;
   pb1.Visible := True;
   pb1.Max := 2*fTab1.dSet.RecordCount + 2*fTab2.dSet.RecordCount;
   pb1.Position := 0;
   SetupMemTable(mtbDB1, fTab1);
   SetupMemTable(mtbDB2, fTab2);
   PopulateMemTables;
   pb1.Visible := False;
   dbgTables.Repaint;
end;

procedure TdCompareDB.SetRecordCount(aTab : TTab; aLbl : TLabel);
begin
   if Assigned(aTab) then
   begin
      aLbl.Caption := IntToStr(aTab.dSet.RecordCount) + '/' + IntToStr(aTab.RecordCount) + ' records';
   end
   else
      aLbl.Caption := '';
end;

procedure TdCompareDB.SetupMemTable(aMemTable : TkbmMemTable; aTab : TTab);
var
   I : Integer;
begin
   if aMemTable.Active then
      aMemTable.Close;

   aMemTable.FieldDefs.Clear;
   aMemTable.FieldDefs.Add('primary_key', ftString, 32);
   aMemTable.FieldDefs.Add('not_in_other', ftBoolean);
   aMemTable.FieldDefs.Add('different', ftBoolean);
   aMemTable.FieldDefs.Add('same', ftBoolean);
   //the following fields represent a difference in the field i.e. different = True
   for I := 0 to aTab.dSet.FieldCount - 1 do
   begin
      aMemTable.FieldDefs.Add(aTab.dSet.Fields[I].FieldName, ftBoolean);
   end;
   aMemTable.CreateTable;

   aMemTable.Open;
   aMemTable.DisableControls;
   aTab.dSet.DisableControls;
   try
      aTab.dSet.First;
      while not aTab.dSet.eof do
      begin
         aMemTable.Append;
         aMemTable.FieldByName('primary_key').AsString := aTab.dSet.FieldByName(aTab.PrimaryKey).AsString;
         aMemTable.FieldByName('not_in_other').AsBoolean := False;
         aMemTable.FieldByName('different').AsBoolean := False;
         aMemTable.FieldByName('same').AsBoolean := False;
         for I := 0 to aTab.dSet.Fields.Count - 1 do
         begin
            aMemTable.FieldByName(aTab.dSet.Fields[I].FieldName).AsBoolean := False;
         end;
         aMemTable.Post;
         aTab.dSet.Next;
         pb1.StepBy(1);
         Application.ProcessMessages;
      end;
   finally
      aMemTable.EnableControls;
      aTab.dSet.EnableControls
   end;
end;

procedure TdCompareDB.PopulateMemTables;
var
   lDifferent : Boolean;
   I : Integer;
begin
   fTab1.dSet.DisableControls;
   mtbDB1.DisableControls;
   fTab2.dSet.DisableControls;
   mtbDB2.DisableControls;
   try
     //Cycle through fTab1.dSet, while locating in the other fTab2.dSet based
     //on the primary key
     //If not found, mark as not_in_other = True
     //If found, cycle through fields of fTab1.dSet and fTab2.dSet and mark
     //as different if they are on both datasets. If one of the fields is different mark the
     //whole record as different on both datasets.
      fTab1.dSet.First;
      mtbDB1.First;
      while not fTab1.dSet.eof do
      begin
         mtbDB1.RecNo := fTab1.dSet.dataset.RecNo;
         lDifferent := False;
         if fTab2.dSet.dataset.Locate(fTab1.PrimaryKey, fTab1.dSet.FieldByName(fTab1.PrimaryKey).Value, []) then
         begin
            //here we use the fact that the recno must be the smae in the memory table
            mtbDB2.RecNo := fTab2.dSet.dataset.RecNo;

            for I := 0 to fTab1.dSet.Fields.Count - 1 do
            begin
               if fTab1.dSet.Fields[I].Value <> fTab2.dSet.Fields[I].Value then
               begin
                  if not (mtbDB1.State in [dsEdit]) then
                     mtbDB1.Edit;
                  mtbDB1.FieldByName(fTab1.dSet.Fields[I].FieldName).AsBoolean := True;
                  if not (mtbDB2.State in [dsEdit]) then
                     mtbDB2.Edit;
                  mtbDB2.FieldByName(fTab1.dSet.Fields[I].FieldName).AsBoolean := True;
                  lDifferent := True;
               end;
            end;
            if lDifferent then
            begin
               if not (mtbDB1.State in [dsEdit]) then
                  mtbDB1.Edit;
               mtbDB1.FieldByName('different').AsBoolean := True;
               if not (mtbDB2.State in [dsEdit]) then
                  mtbDB2.Edit;
               mtbDB2.FieldByName('different').AsBoolean := True;
            end
            else
            begin
               if not (mtbDB1.State in [dsEdit]) then
                  mtbDB1.Edit;
               mtbDB1.FieldByName('same').AsBoolean := True;
               if not (mtbDB2.State in [dsEdit]) then
                  mtbDB2.Edit;
               mtbDB2.FieldByName('same').AsBoolean := True;
            end;
            if (mtbDB2.State in [dsEdit]) then
               mtbDB2.Post;
         end
         else
         begin
            if not (mtbDB1.State in [dsEdit]) then
               mtbDB1.Edit;
            mtbDB1.FieldByName('not_in_other').AsBoolean := True;
         end;
         if (mtbDB1.State in [dsEdit]) then
            mtbDB1.Post;
         fTab1.dSet.Next;
         pb1.StepBy(1);
         Application.ProcessMessages;
      end;

      //Cycle through fTab2.dSet, while locating in the other fTab2.dSet based
      //on the primary key
      //If not found, mark as not_in_other = True
      fTab2.dSet.First;
      while not fTab2.dSet.eof do
      begin
         //here we use the fact that the recno must be the smae in the memory table
         mtbDB2.RecNo := fTab2.dSet.dataset.RecNo;
         if (not mtbDB2.FieldByName('same').AsBoolean) and (not mtbDB2.FieldByName('different').AsBoolean) and
            (not fTab1.dSet.dataset.Locate(fTab2.PrimaryKey, fTab2.dSet.FieldByName(fTab2.PrimaryKey).Value, [])) then
         begin
            mtbDB2.Edit;
            mtbDB2.FieldByName('not_in_other').AsBoolean := True;
            mtbDB2.Post;
         end;
         fTab2.dSet.Next;
         pb1.StepBy(1);
         Application.ProcessMessages;
      end;
   finally
      pb1.Position := 0;
      pb1.Visible := False;
      mtbDB1.EnableControls;
      fTab1.dSet.EnableControls;
      fTab2.dSet.EnableControls;
      mtbDB2.EnableControls;
      fTab1.dSet.First;
      fTab2.dSet.First;
   end;
end;

procedure TdCompareDB.btnCompareClick(Sender: TObject);
var
   lQry1 : ISQLQuery;
   lQry2 : ISQLQuery;
begin
   pb1.Visible := True;
   pb1.Position := 0;
   pb1.Max := mtbTables.RecordCount;
   mtbTables.DisableControls;
   lQry1 := fDB1.NewQuery;
   lQry2 := fDB2.NewQuery;
   try
      mtbTables.First;
      while not mtbTables.eof do
      begin
         if mtbTablesselected.AsBoolean then
         begin
            mtbTables.Edit;

            if fTableNames1.IndexOf(mtbTablestable_name.AsString) <> -1 then
            begin
               lQry1.SQL.Clear;
               lQry1.SQL.Add('select count(*) as rcount from "' + mtbTablestable_name.AsString + '"');
               lQry1.Open;
               mtbTablesdb_recs_1.AsInteger := lQry1.FieldByName('rcount').AsInteger;
               lQry1.Close;
            end;

            if fTableNames2.IndexOf(mtbTablestable_name.AsString) <> -1 then
            begin
               lQry2.SQL.Clear;
               lQry2.SQL.Add('select count(*) as rcount from "' + mtbTablestable_name.AsString + '"');
               lQry2.Open;
               mtbTablesdb_recs_2.AsInteger := lQry2.FieldByName('rcount').AsInteger;
               lQry2.Close;
            end;

            mtbTables.Post;
         end;
         pb1.StepBy(1);
         Application.ProcessMessages;
         mtbTables.Next;
      end;
   finally
      lQry1 := nil;
      lQry2 := nil;
      pb1.Position := 0;
      pb1.Visible := False;
      mtbTables.First;
      mtbTables.EnableControls;
   end;
end;

procedure TdCompareDB.btnRecordView2Click(Sender: TObject);
begin
   RecordView(fTab2);
end;

procedure TdCompareDB.RecordView(aTab: TTab);
var
   lRecordViewForm : TdRecordView;
   I : Integer;
   lQry : TDataSet;
begin
   if Assigned(aTab) then
   begin
      lQry := aTab.dSet.dataset;
      if lQry.Active and (lQry.RecordCount > 0) then
      begin
         lRecordViewForm := TdRecordView.Create(Self);
         mtbRecord.Close;
         try
            mtbRecord.Open;
            for I := 0 to lQry.Fields.Count - 1 do
            begin
               mtbRecord.Append;
               mtbRecordField.Value := lQry.Fields[I].FieldName;
               mtbRecordIsNull.Value := lQry.Fields[I].IsNull;
               mtbRecordHint.Value := aTab.ColHint[I];
               mtbRecordType.Value := FieldTypeToString(lQry.Fields[I].DataType);
               if not lQry.Fields[I].IsNull then
                  mtbRecordValue.Value := lQry.Fields[I].Value;
               mtbRecord.Post;
            end;
            lRecordViewForm.SetUp(mtbRecord, aTab.TableName, aTab.PrimaryKey);
            if lRecordViewForm.ShowModal = mrOk then
            begin
               lRecordViewForm.GetFields(mtbRecord);
               if not (lQry.State in [dsInsert,dsEdit]) then
                  lQry.Edit;
               mtbRecord.First;
               for I := 0 to lQry.FieldCount - 1 do
               begin
                  if (not mtbRecordIsNull.AsBoolean) then
                     lQry.Fields[I].Value := mtbRecordValue.Value
                  else
                     lQry.Fields[I].Clear;
                  mtbRecord.Next;
               end;
               lQry.Post;
            end;
         finally
            FreeAndNil(lRecordViewForm);
         end;
      end;
   end;
end;

procedure TdCompareDB.btnRecordView1Click(Sender: TObject);
begin
   RecordView(fTab1);
end;

procedure TdCompareDB.OpenSelectedTable;
begin
   if Assigned(fTab1) then
      FreeAndNil(fTab1);
   if Assigned(fTab2) then
      FreeAndNil(fTab2);

   dn1.DataSource := nil;
   dn2.DataSource := nil;
   try
      mtbTables.Edit;
      if fTableNames1.IndexOf(mtbTablestable_name.AsString) <> -1 then
      begin
         fTab1 := TTab.Create(fDB1, dbgTable1, 0, mtbTablestable_name.AsString,
            'select * from "' + mtbTablestable_name.AsString + '"', True);
         dn1.DataSource := fTab1.Grid.DataSource;
         fTab1.Grid.OnDrawColumnCell := DiffDrawColumnCell1;
         SetRecordCount(fTab1, lblRecordCount1);
         mtbTablesdb_recs_1.AsInteger := fTab1.dSet.RecordCount;
      end;
      if fTableNames2.IndexOf(mtbTablestable_name.AsString) <> -1 then
      begin
         fTab2 := TTab.Create(fDB2, dbgTable2, 0, mtbTablestable_name.AsString,
            'select * from "' + mtbTablestable_name.AsString + '"', True);
         dn2.DataSource := fTab2.Grid.DataSource;
         fTab2.Grid.OnDrawColumnCell := DiffDrawColumnCell2;
         SetRecordCount(fTab2, lblRecordCount2);
         mtbTablesdb_recs_2.AsInteger := fTab2.dSet.RecordCount;
      end;
      mtbTables.Post;
      fSelectedTable := mtbTablestable_name.AsString;
   except
      if Assigned(fTab1) then
         FreeAndNil(fTab1);
      if Assigned(fTab2) then
         FreeAndNil(fTab2);
   end;
end;

procedure TdCompareDB.btnSelectAllClick(Sender: TObject);
begin
   AllSelect(True);
end;

procedure TdCompareDB.btnUnSelectAllClick(Sender: TObject);
begin
   AllSelect(False);
end;

procedure TdCompareDB.AllSelect(aSelect : Boolean);
var
   lBookMark : TBookMarkStr;
begin
   mtbTables.DisableControls;
   lBookMark := mtbTables.Bookmark;
   try
      mtbTables.First;
      while not mtbTables.eof do
      begin
         mtbTables.Edit;
         mtbTablesselected.AsBoolean := aSelect;
         mtbTables.Post;
         mtbTables.Next;
      end;
   finally
      mtbTables.Bookmark := lBookMark;
      mtbTables.EnableControls;
   end;
end;

procedure TdCompareDB.CloseDBs;
begin
   dn1.DataSource := nil;
   dn2.DataSource := nil;

   if Assigned(fTab1) then
      FreeAndNil(fTab1);

   if Assigned(fDB1) then
      fDB1.Connected := False;
   fDB1 := nil;

   if Assigned(fTab2) then
      FreeAndNil(fTab2);

   if Assigned(fDB2) then
      fDB2.Connected := False;
   fDB2 := nil;

   if Assigned(fTableNames1) then
      FreeAndNil(fTableNames1);
   if Assigned(fTableNames2) then
      FreeAndNil(fTableNames2);

   mtbTables.Close;

   lblServer1.Caption := '';
   lblAlias1.Caption := '';
   lblServer2.Caption := '';
   lblAlias2.Caption := '';
end;

procedure TdCompareDB.FormActivate(Sender: TObject);
var
   lGridHeight : Integer;
   lGridWidth : Integer;
   lHalfHeight : Integer;
begin
   lHalfHeight := Trunc(Self.Height/2) - 18;
   lGridHeight := lHalfHeight - H_HEIGHT - 3;
   lGridWidth  := Self.Width - dbgTables.Width - 35;

   dbgTable1.Top      := H_HEIGHT;
   dbgTable1.Height   := lGridHeight;
   dbgTable1.Width    := lGridWidth;

   lblServer2.Top     := lblServer1.Top + lHalfHeight;
   lblAlias2.Top      := lblAlias1.Top + lHalfHeight;
   dn2.Top            := dn1.Top + lHalfHeight;
   btnRecordView2.Top := btnRecordView1.Top + lHalfHeight;
   lblRecordCount2.Top := lblRecordCount1.Top + lHalfHeight;

   dbgTable2.Top      := 2*H_HEIGHT + lGridHeight;
   dbgTable2.Height   := lGridHeight;
   dbgTable2.Width    := lGridWidth;
end;

procedure TdCompareDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CloseDBs;
end;

procedure TdCompareDB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdCompareDB.dbgTablesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  lGrid : TSMDBGrid;
  lQry : TDataSet;
begin
   lGrid := (Sender as TSMDBGrid);
   lQry := nil;
   if fSelectedTable <> '' then
   begin
      if Assigned(lGrid.DataSource) then
         lQry := lGrid.DataSource.DataSet;

      if lQry.FieldByName('table_name').AsString = fSelectedTable then
         lGrid.Canvas.Brush.Color := gSettings.ColSelected;
   end;
   lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TdCompareDB.DiffDrawColumnCell1(Sender: TObject; const Rect: TRect;
   DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  ActiveField : TField;
  lGrid : TSMDBGrid;
  lQry : TDataSet;
  lDontDefaultDraw : Boolean;
begin
   lDontDefaultDraw := False;
   lGrid := (Sender as TSMDBGrid);
   lQry := nil;
   if Assigned(lGrid.DataSource) then
      lQry := lGrid.DataSource.DataSet;

   if Assigned(lQry) and lQry.Active then
   begin
      if gSettings.TypeColours and (not (gdSelected in State)) then
      begin
         if Column.Field.DataType = ftString then
            lGrid.Canvas.Brush.Color := gSettings.ColString
         else if (Column.Field.DataType = ftInteger) or (Column.Field.DataType = ftSmallInt) then
            lGrid.Canvas.Brush.Color := gSettings.ColInteger
         else if Column.Field.DataType = ftFloat then
            lGrid.Canvas.Brush.Color := gSettings.ColFloat
         else if Column.Field.DataType = ftDateTime then
            lGrid.Canvas.Brush.Color := gSettings.ColDateTime
         else if Column.Field.DataType = ftCurrency then
            lGrid.Canvas.Brush.Color := gSettings.ColCurrency
         else
            lGrid.Canvas.Brush.Color := clWindow;
      end;

      ActiveField := lQry.FindField('active_ind');
      if Assigned(ActiveField) and (ActiveField.AsString = 'N') then
      begin
         lGrid.Canvas.Brush.Color := gSettings.ColInactive;
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

      //purple font if different, red font if not_in_other
      if mtbDB1.Active then
      begin
         mtbDB1.RecNo := lQry.RecNo;
         if mtbDB1.FieldByName('not_in_other').AsBoolean then
         begin
            lGrid.Canvas.Font.Color := clRed;
         end
         else if mtbDB1.FieldByName('different').AsBoolean then
         begin
            if mtbDB1.FieldByName(Column.FieldName).AsBoolean then
               lGrid.Canvas.Font.Color := clPurple;
         end;
      end;

      if (not (lQry is TPdxQuery)) and Column.Field.IsNull then
      begin
         lGrid.Canvas.Font.Color := clGray;
         lGrid.Canvas.FillRect(Rect);
         lGrid.Canvas.TextOut(Rect.Left + 2, Rect.top + 2, 'NULL');
         lDontDefaultDraw := True;
      end;
   end;

   if not lDontDefaultDraw then
      lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TdCompareDB.DiffDrawColumnCell2(Sender: TObject; const Rect: TRect;
   DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  ActiveField : TField;
  lGrid : TSMDBGrid;
  lQry : TDataSet;
  lDontDefaultDraw : Boolean;
begin
   lDontDefaultDraw := False;
   lGrid := (Sender as TSMDBGrid);
   lQry := nil;
   if Assigned(lGrid.DataSource) then
      lQry := lGrid.DataSource.DataSet;

   if Assigned(lQry) and lQry.Active then
   begin
      if gSettings.TypeColours and (not (gdSelected in State)) then
      begin
         if Column.Field.DataType = ftString then
            lGrid.Canvas.Brush.Color := gSettings.ColString
         else if (Column.Field.DataType = ftInteger) or (Column.Field.DataType = ftSmallInt) then
            lGrid.Canvas.Brush.Color := gSettings.ColInteger
         else if Column.Field.DataType = ftFloat then
            lGrid.Canvas.Brush.Color := gSettings.ColFloat
         else if Column.Field.DataType = ftDateTime then
            lGrid.Canvas.Brush.Color := gSettings.ColDateTime
         else if Column.Field.DataType = ftCurrency then
            lGrid.Canvas.Brush.Color := gSettings.ColCurrency
         else
            lGrid.Canvas.Brush.Color := clWindow;
      end;

      ActiveField := lQry.FindField('active_ind');
      if Assigned(ActiveField) and (ActiveField.AsString = 'N') then
      begin
         lGrid.Canvas.Brush.Color := gSettings.ColInactive;
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

      //purple font if different, red font if not_in_other
      if mtbDB2.Active then
      begin
         mtbDB2.RecNo := lQry.RecNo;
         if mtbDB2.FieldByName('not_in_other').AsBoolean then
         begin
            lGrid.Canvas.Font.Color := clRed;
         end
         else if mtbDB2.FieldByName('different').AsBoolean then
         begin
            if mtbDB2.FieldByName(Column.FieldName).AsBoolean then
               lGrid.Canvas.Font.Color := clPurple;
         end;
      end;

      if (not (lQry is TPdxQuery)) and Column.Field.IsNull then
      begin
         lGrid.Canvas.Font.Color := clGray;
         lGrid.Canvas.FillRect(Rect);
         lGrid.Canvas.TextOut(Rect.Left + 2, Rect.top + 2, 'NULL');
         lDontDefaultDraw := True;
      end;
   end;

   if not lDontDefaultDraw then
      lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
