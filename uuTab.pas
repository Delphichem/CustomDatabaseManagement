unit uuTab;

interface

uses
   SMDBGrid, DB, DBTables, nxDB, Classes, uuGlobals, ufISQLQuery,
   ufISQLDataBase, DBGrids, Types, Grids, Messages;

type
   THackDBGrid = class(TSMDBGrid);

   TTab = class
   private
      procedure dbgTableDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure SetSQL(aSQL : WideString);
      function  GetSQL : WideString;
   public
      Grid : TSMDBGrid;
      dSource : TDataSource;
      dSet : ISQLQuery;
      Info : String;
      TableName : String;
      FooterType : Integer;
      FontSize : Integer;
      IsTable : Boolean;
      RecordCount : Integer;
      ColHint : TStringList;
      PrimaryKey : String;
      constructor Create(aDataBase : ISQLDatabase; aGrid : TSMDBGrid;
         aFooterType : Integer; aTableName : String; aSQL : String; aOpenIt : Boolean);
      destructor Destroy; Override;
      procedure ApplySettings;
      function  NotEmpty: Boolean;
      procedure PopulateInfoFromDDL(IncludeFooter: Boolean = True);
      procedure Sort(aField : TField; aSortType: String);
      procedure SetFieldToValue(aFieldName : String; aValue : String);
      procedure MouseScrollUp(aScrollLeftRight: Boolean);
      procedure MouseScrollDown(aScrollLeftRight: Boolean);
      procedure UpdateFooter(aFooterType : Integer);
      procedure ApplyIniSettingsToGrid;
      property  SQL : WideString read GetSQL write SetSQL;
   end;

implementation

uses
   SysUtils, Math, StrUtils, Graphics, IniFiles;

constructor TTab.Create(aDataBase : ISQLDatabase; aGrid : TSMDBGrid; aFooterType : Integer;
   aTableName : String; aSQL : String; aOpenIt : Boolean);
begin
   inherited Create;
   ColHint := TStringList.Create;
   FooterType := aFooterType;
   Info := '';
   Grid := aGrid; //just a pointer, the form will create and destroy the grid
   dSource := TDataSource.Create(nil);
   TableName := aTableName;
   IsTable := aSQL = '';

   dSet := aDataBase.NewQuery;
   dSet.SetUniDir(False);
   dSet.SQL.Add(aSQL);
   //dSet.Prepare;

   dSource.DataSet := dSet.DataSet;
   Grid.DataSource := dSource;
   Grid.OnDrawColumnCell := dbgTableDrawColumnCell;

   ApplySettings;

   if aOpenIt then
   begin
      dSet.Open;
      RecordCount := dSet.RecordCount;
      UpdateFooter(FooterType);
   end;
end;

destructor TTab.Destroy;
begin
   dSet.Close;
   dSet := nil;
   FreeAndNil(dSource);
   FreeAndNil(ColHint);
   inherited;
end;

procedure TTab.ApplyIniSettingsToGrid;
var
   PersonalIni : TIniFile;
   I : Integer;
   lVisible : String;
begin
   if TableName <> CUSTOM_SQL then
   begin
      PersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);
      try
         for I := 0 to dSet.FieldCount - 1 do
         begin
            lVisible := PersonalIni.ReadString(TableName, dSet.Fields[I].FieldName, 'Y');
            Grid.Columns[I].Visible := RegStrToBool(lVisible);
         end;
      finally
         PersonalIni.Free;
      end;
   end;
end;

function TTab.NotEmpty : Boolean;
begin
   Result := dSet.Active and (not dSet.eof);
end;

procedure TTab.ApplySettings;
begin
   Grid.GridStyle.FilterColor := gSettings.ColFilter;
   Grid.GridStyle.OddColor := gSettings.ColOdd;
   Grid.FooterColor := gSettings.ColFooter;
   if gSettings.ShowRows then
   begin
      Grid.WidthOfIndicator := 26
   end
   else
      Grid.WidthOfIndicator := 11;
   Grid.Repaint;   
end;

procedure TTab.PopulateInfoFromDDL(IncludeFooter : Boolean = True);
var
  lDDLFile : TextFile;
  lLine : String;
  lInTable : Boolean;
  lLineStrList : TStringList;
  lField : TField;
  lPosOfFirstComma : Integer;
  lPrimaryKey : String;
  I : Integer;
  lIndexFound : Boolean;
  lIndexString : String;
begin
  lField := nil;
  lIndexFound := False;
  lIndexString := '********Indices********' + #13#10;
  
  //cycle through all columns and put default hint
  for I := 0 to Grid.Columns.Count - 1 do
  begin
      ColHint.Add(NO_COLUMN_HINT);
  end;

  if FileExists(gSettings.SchemaDir + '\' + TableName + '.ddl') then
  begin
    lInTable := False;
    AssignFile(lDDLFile, gSettings.SchemaDir + '\' + TableName + '.ddl');
    Reset(lDDLFile);
    lLineStrList := TStringList.Create;
    try
       while not EOF(lDDLFile) do
       begin
          ReadLn(lDDLFile, lLine);
          if (not lInTable) and AnsiContainsStr('create table ' + TableName + ' (', Trim(lLine)) then
             lInTable := True
          else if lInTable then
          begin
             if AnsiStartsStr(')', Trim(lLine)) then
                lInTable := False
             else
             begin
                //put words into stringlist
                SplitSQL(lLineStrList,lLine, ' ',True);
                if (Trim(lLineStrList[0]) = 'primary') and (lLineStrList[1] = 'key') then
                begin
                   lPrimaryKey := lLineStrList[2];
                   Delete(lPrimaryKey, 1, 1);
                   Delete(lPrimaryKey, Length(lPrimaryKey), 1);

                   lField := dSet.FindField(lPrimaryKey);
                   if Assigned(lField) then
                   begin
                      Grid.Columns[lField.Index].Title.Font.Style := [fsBold];
                      PrimaryKey := lPrimaryKey;
                   end;
                end
                else if (IncludeFooter) then //assign footer data types
                begin
                   lField := dSet.FindField(Trim(lLineStrList[0]));
                   if Assigned(lField) then
                   begin
                      if AnsiPos('numeric(', Trim(lLineStrList[1])) <> 0 then
                         Grid.Columns[lField.Index].FooterText := Trim(lLineStrList[1]) + Trim(lLineStrList[2])
                      else
                         Grid.Columns[lField.Index].FooterText := Trim(lLineStrList[1]);

                   end;
                end;
             end;
          end
          else if (not lInTable) then //table and column comments, aliases
          begin
             if AnsiStartsStr('%^column ', Trim(lLine)) then
             begin
                //put words into stringlist
                SplitSQL(lLineStrList,lLine, ' ',True);

                lPosOfFirstComma := AnsiPos('"', lLine);
                Delete(lLine, 1, lPosOfFirstComma);
                Delete(lLine, Length(lLine), 1);

                //store the column comment in the sort caption
                lField := dSet.FindField(lLineStrList[1]);
                if Assigned(lField) then
                begin
                   if ColHint[lField.Index] = NO_COLUMN_HINT then
                      ColHint[lField.Index] := lLine
                   else //alias already found
                      ColHint[lField.Index] := ColHint[lField.Index] + ' ' + lLine;
                end;
             end
             else if AnsiStartsStr('%^alias ', Trim(lLine)) then
             begin
                //put words into stringlist
                SplitSQL(lLineStrList,lLine, ' ',True);

                lPosOfFirstComma := AnsiPos('"', lLine);
                Delete(lLine, 1, lPosOfFirstComma);
                Delete(lLine, Length(lLine), 1);

                //store the column comment in the sort caption
                lField := dSet.FindField(lLineStrList[1]);
                if Assigned(lField) then
                begin
                   if ColHint[lField.Index] = NO_COLUMN_HINT then
                      ColHint[lField.Index] := '[' + lLine + ']'
                   else
                      ColHint[lField.Index] := '[' + lLine + '] ' + ColHint[lField.Index];
                end;
             end
             else if AnsiStartsStr('%^table comments = ', Trim(lLine)) then
             begin
                Delete(lLine, 1, 20);
                Delete(lLine, Length(lLine), 1);
                Info := lLine;
             end
             else if AnsiStartsStr('create index ', Trim(lLine)) then
             begin
                Delete(lLine, 1, 16);
                //put words into stringlist
                SplitSQL(lLineStrList,lLine, ' ',True);
                //sale_2 on sale (employee_id, transaction_date_time
                lIndexFound := True;
                lLine := lLineStrList[0]; //the index name
                for I := 3 to lLineStrList.Count - 1 do
                    lLine := lLine + lLineStrList[I];
                lIndexString := lIndexString + lLine + #13#10;
             end
             else if not AnsiStartsStr('%^', Trim(lLine)) then
             begin
                //assume that this line is a continuation of a column comment
                if Assigned(lField) then
                begin
                   ColHint[lField.Index] := ColHint[lField.Index] + ' ' + Trim(lLine);
                end;
             end;
          end;                  
       end; //read line loop

       if lIndexFound then
       begin
          Info := Info + #13#10 + #13#10 + lIndexString;
       end;
    finally
       FreeAndNil(lLineStrList);
       CloseFile(lDDLFile);
    end;
  end;
end;

procedure TTab.Sort(aField : TField; aSortType : String);
var
   lQry : ISQLQuery;
   lSQL : String;
   lFilterList : TStringList;
   lBookMark : TBookmarkStr;
   lParamList : TStringList;
   lFieldName : String;
   lPosOfOrderBy : Integer;

   procedure GetFilterList;
   var
      I : Integer;
   begin
      for I := 0 to Grid.Columns.Count - 1 do
         lFilterList.Add(Grid.Columns[I].FilterValue);
   end;

   procedure SetFilterList;
   var
      I : Integer;
   begin
      for I := 0 to Grid.Columns.Count - 1 do
         Grid.Columns[I].FilterValue := lFilterList[I];
   end;

   procedure GetParamList;
   var
      I : Integer;
   begin
      for I := 0 to lQry.Params.Count - 1 do
         lParamList.Add(lQry.Params[I].AsString);
   end;

   procedure SetParamList;
   var
      I : Integer;
   begin
      for I := 0 to lQry.Params.Count - 1 do
         lQry.Params[I].AsString := lParamList[I];
   end;
begin
   lQry := dSet;
   lFieldName := aField.FieldName;

   if lQry.Active and IsTable then
   begin
//      if aSortType = 'asc' then
//         Grid.SetSortField(aField, stAscending)
//      else if aSortType = 'desc' then
//         Grid.SetSortField(aField, stDescending);
   end
   else if lQry.Active and (not IsTable) then
   begin
      lQry.DisableControls;
      //lBookMark := lQry.dataset.BookMark;
      lFilterList := TStringList.Create;
      lParamList := TStringList.Create;

      try
         GetFilterList;
         GetParamList;

         lSQL := lQry.SQL.Text;
         lQry.Close;
         lPosOfOrderBy := AnsiPos('order by', Lowercase(lSQL));
         if (lPosOfOrderBy > 0) then
            Delete(lSQL, lPosOfOrderBy, Length(lSQL) - lPosOfOrderBy);
         lSQL := lSQL + ' order by ' + lFieldName + ' ' + aSortType;
         lQry.SQL.Text := lSQL;
         SetParamList;

         try
            lQry.Open;
            PopulateInfoFromDDL;
         except
            On E : Exception do
            lQry.Close;
         end;
      finally
         //lQry.dataset.BookMark := lBookMark;
         dSet.EnableControls;
         SetFilterList;
         Grid.ApplyFilter;
         FreeAndNil(lFilterList);
         FreeAndNil(lParamList);
      end;
   end;
end;

procedure TTab.SetFieldToValue(aFieldName : String; aValue : String);
var
   BM : TBookMarkStr;
begin
   with dSet do
   begin
      DisableControls;
      try
         if not eof then
         begin
            BM := dataset.Bookmark;
            First;
            while not eof do
            begin
               Edit;
               FieldByName(aFieldName).AsString := aValue;
               Post;
               Next;
            end;
            dataset.Bookmark := BM;
            Refresh;
         end;
      finally
         EnableControls;
      end;
   end;
end;

procedure TTab.MouseScrollUp(aScrollLeftRight : Boolean);
var
   I : Integer;
begin
   if dSet.Active then
   begin
      dSet.DisableControls;
      try
         if aScrollLeftRight and (Grid.SelectedIndex > 0) then
         begin
            Grid.SelectedIndex := Grid.SelectedIndex - 1;
            dSet.Next;
         end
         else
            for I := 0 to StrToInt(gSettings.MouseScroll) - 1 do
               dSet.Prior;
      finally
         dSet.EnableControls;
      end;
   end;
end;

procedure TTab.MouseScrollDown(aScrollLeftRight: Boolean);
var
   I : Integer;
begin
   if dSet.Active then
   begin
      dSet.DisableControls;
      try
         if aScrollLeftRight and (Grid.SelectedIndex < dSet.FieldCount) then
         begin
            Grid.SelectedIndex := Grid.SelectedIndex + 1;
            dSet.Prior;
         end
         else
            for I := 0 to StrToInt(gSettings.MouseScroll) - 1 do
               dSet.Next;
      finally
         dSet.EnableControls;
      end;
   end;
end;

procedure TTab.UpdateFooter(aFooterType : Integer);
var
   J : Integer;
   lFieldDataType : TFieldType;
   lTableHint : String;
begin
   lTableHint := '';
   FooterType := aFooterType;
   dSet.DisableControls;
   try
      if dSet.Active then
      begin
         //putting the if statement here should increase performance
         if aFooterType = 1{Sum} then
         begin
            for J := 0 to Grid.Columns.Count - 1 do
            begin
               lFieldDataType := Grid.Columns[J].Field.DataType;
               Grid.Columns[J].FooterText := '';
               if lFieldDataType <> ftString then
               begin
                  Grid.Columns[J].FooterType := ftSum;
                  Grid.Columns[J].FooterValue := Grid.Columns[J].Field.DataType;
               end;
            end;
         end
         else if aFooterType = 2{Avg} then
         begin
            for J := 0 to Grid.Columns.Count - 1 do
            begin
               lFieldDataType := Grid.Columns[J].Field.DataType;
               Grid.Columns[J].FooterText := '';
               if lFieldDataType <> ftString then
               begin
                  Grid.Columns[J].FooterType := ftAverage;
                  Grid.Columns[J].FooterValue := Grid.Columns[J].Field.DataType;
               end;
            end;
         end
         else if aFooterType = 3{Min} then
         begin
            for J := 0 to Grid.Columns.Count - 1 do
            begin
               lFieldDataType := Grid.Columns[J].Field.DataType;
               Grid.Columns[J].FooterText := '';
               if lFieldDataType <> ftString then
               begin
                  Grid.Columns[J].FooterType := ftMin;
                  Grid.Columns[J].FooterValue := Grid.Columns[J].Field.DataType;
               end;
            end;
         end
         else if aFooterType = 4{Max} then
         begin
            for J := 0 to Grid.Columns.Count - 1 do
            begin
               lFieldDataType := Grid.Columns[J].Field.DataType;
               Grid.Columns[J].FooterText := '';
               if lFieldDataType <> ftString then
               begin
                  Grid.Columns[J].FooterType := ftMax;
                  Grid.Columns[J].FooterValue := Grid.Columns[J].Field.DataType;
               end;
            end;
         end;

         if aFooterType <> 0 then
            Grid.CalculateTotals
         else
         begin
            if not (TableName = CUSTOM_SQL) then
               PopulateInfoFromDDL;
         end;

      end;
   finally
      dSet.EnableControls;
   end;
end;

procedure TTab.SetSQL(aSQL : WideString);
begin
   if dSet.Active then
      dSet.Close;
   dSet.SQL.Clear;
   dSet.SQL.Text := aSQL;
end;

function  TTab.GetSQL : WideString;
begin
   Result := dSet.SQL.Text;
end;

procedure TTab.dbgTableDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  KeyField, ActiveField : TField;
  lGrid : TSMDBGrid;
  lQry : TDataSet;
  lDontDefaultDraw : Boolean;
  lMyRegCode : string;
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

      if TableName = 'store' then
      begin
         KeyField := lQry.FindField('store_code');
         if Assigned(KeyField) and (KeyField.AsString = gMyStoreCode) then
            lGrid.Canvas.Font.Style := lGrid.Canvas.Font.Style + [fsUnderline];
      end
      else if TableName = 'location' then
      begin
         KeyField := lQry.FindField('location_code');
         if Assigned(KeyField) and (KeyField.AsString = gMyStoreCode) then
            lGrid.Canvas.Font.Style := lGrid.Canvas.Font.Style + [fsUnderline];
      end
      else if TableName = 'register' then
      begin
         KeyField := lQry.FindField('register_code');
         if Assigned(KeyField) and (KeyField.AsString = gMyRegisterCode) then
            lGrid.Canvas.Font.Style := lGrid.Canvas.Font.Style + [fsUnderline];
      end
      else if TableName = 'datacentre' then
      begin
         KeyField := lQry.FindField('location_code');
         if Assigned(KeyField) and (KeyField.AsString = gMyStoreCode) then
         begin
            KeyField := lQry.FindField('datacentre_local_ref');
            lMyRegCode := gMyRegisterCode;
            Delete(lMyRegCode, 1, 4);
            if Assigned(KeyField) and (KeyField.AsString = lMyRegCode) then
               lGrid.Canvas.Font.Style := lGrid.Canvas.Font.Style + [fsUnderline];
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

      if (gDBType <> dtParadox) and Column.Field.IsNull then
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
