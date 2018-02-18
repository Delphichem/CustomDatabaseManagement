unit uuSQLEditor;
{
  Jan 2015 Code By: Daniel Campbell
}
interface

uses
   SynCompletionProposal, SynMemo, Classes, StdCtrls, uuTab;

type
  //used as the original and proposed sql
  TSQL = record
     Text : String;
     Cursor : Integer;
  end;

  procedure AddToCompletionProposal(const aWord : String; aSCP : TSynCompletionProposal);
  procedure MoveSQLCursorTo(aCursorPos : Integer; ammoSQL : TSynMemo);
  procedure AddSQLKeywordsToCompletionList(const aWord : String; aSCP : TSynCompletionProposal);
  procedure GetFields(var aFieldList : TStringList; aTableName : String);
  procedure AddFieldNamesToCompletionList(const aWord : String; const aTableName : String; aSCP : TSynCompletionProposal);
  procedure AddTableNamesToCompletionList(const aWord : String; acboTable : TComboBox; aSCP : TSynCompletionProposal);
  procedure AddFieldNamesFromTablesInSQLAndAliases(const aWord : String; ammoSQL : TSynMemo; aSCP : TSynCompletionProposal);
  function  GetWordBeforeCursor(ammoSQL : TSynMemo) : String;
  procedure AddFieldNamesFromAllOpenTabs(const aWord : String; aTab : array of TTab; aSCP : TSynCompletionProposal);

implementation

uses
   uuGlobals, StrUtils, ufISQLQuery, SysUtils;

procedure AddToCompletionProposal(const aWord : String; aSCP : TSynCompletionProposal);
begin
   if aSCP.ItemList.IndexOf(aWord) = -1 then
      aSCP.ItemList.Add(aWord);
end;

procedure MoveSQLCursorTo(aCursorPos : Integer; ammoSQL : TSynMemo);
begin
   with ammoSQL do
   begin
      SelStart := aCursorPos;//Length(mmoSQL.Text);
      //Perform(EM_LINEINDEX, Lines.Count, 0) + Length(Lines[Lines.Count - 1]) + 1;
      SelLength := 0;
      //Perform(EM_SCROLLCARET, 0, 0);
      //SetFocus;
   end;
end;

procedure AddSQLKeywordsToCompletionList(const aWord : String; aSCP : TSynCompletionProposal);
   procedure AddKeyWord(aKeyWord : String);
   begin
      if AnsiStartsStr(aWord, aKeyWord) then
         AddToCompletionProposal(DisplaySQL(aKeyWord), aSCP);
   end;
begin
   AddKeyWord('select');
   AddKeyWord('update');
   AddKeyWord('insert');
   AddKeyWord('delete');
   AddKeyWord('from');
   AddKeyWord('into');
   AddKeyWord('values');
   AddKeyWord('create');
   AddKeyWord('drop');
   AddKeyWord('alter');
   AddKeyWord('table');
   AddKeyWord('index');
   AddKeyWord('distinct');
   AddKeyWord('unique');
   AddKeyWord('where');
   AddKeyWord('and');
   AddKeyWord('or');
   AddKeyWord('not');
   AddKeyWord('null');
   AddKeyWord('in');
   AddKeyWord('join');
   AddKeyWord('on');   
   AddKeyWord('left');
   AddKeyWord('right');
   AddKeyWord('sum');
   AddKeyWord('min');
   AddKeyWord('max');
   AddKeyWord('avg');
   AddKeyWord('count');   
   AddKeyWord('between');
   AddKeyWord('group');
   AddKeyWord('order');
   AddKeyWord('by');
   if gDBType <> dtParadox then
   begin
      AddKeyWord('with');
      AddKeyWord('(nolock)');
      AddKeyWord('top');
   end;
end;

procedure GetFields(var aFieldList : TStringList; aTableName : String);
var
   I : Integer;
   lTableNames : TStringList;
   lDummyQ : ISQLQuery;
begin
   //check table exists here
   //do I really have to open the table to get the fields names?
   //Whatever, it takes milliseconds
   lTableNames := TStringList.Create;
   try
      lTableNames := gDataBase.GetTableNames;
      if lTableNames.IndexOf(aTableName) = -1 then
         Exit;
   finally
      FreeAndNil(lTableNames);
   end;

   lDummyQ := gDataBase.NewQuery;
   if gDBType = dtParadox then
      lDummyQ.SQL.Add('select * from ' + aTableName)
   else
      lDummyQ.SQL.Add('select TOP 1 * from ' + aTableName);

   try
      lDummyQ.Open;
      for I := 0 to lDummyQ.Fields.Count - 1 do
         aFieldList.Add(lDummyQ.Fields[I].FieldName);
   finally
      lDummyQ.Close;
      lDummyQ := nil;
   end;
end;

procedure AddFieldNamesToCompletionList(const aWord : String; const aTableName : String; aSCP : TSynCompletionProposal);
var
   lFieldList : TStringList;
   I : Integer;
begin
   lFieldList := TStringList.Create;
   try
      GetFields(lFieldList, aTableName);
      for I := 0 to lFieldList.Count - 1 do
      begin
         if AnsiStartsStr(aWord, lFieldList[I]) then
             AddToCompletionProposal(lFieldList[I], aSCP);
      end;
   finally
      FreeAndNil(lFieldList);
   end;
end;

procedure AddTableNamesToCompletionList(const aWord : String; acboTable : TComboBox; aSCP : TSynCompletionProposal);
var
   I : Integer;
begin
   for I := 0 to acboTable.Items.Count - 1 do
   begin
      if AnsiStartsStr(aWord, acboTable.Items[I]) then
         AddToCompletionProposal(acboTable.Items[I], aSCP);
   end;
end;

procedure AddFieldNamesFromTablesInSQLAndAliases(const aWord : String; ammoSQL : TSynMemo; aSCP : TSynCompletionProposal);
var
   lSQLStrList, lTableNames, lAliases : TStringList;
   I, J : Integer;
   lAlias : string;
begin
   lSQLStrList := TStringList.Create;
   lAliases := TStringList.Create;
   try
      SplitSQL(lSQLStrList, Trim(ammoSQL.Text), ';', True);
      for I := 0 to lSQLStrList.Count - 1 do
      begin
         lTableNames := GetTableNames(Trim(lSQLStrList[I]), lAliases);
         for J := 0 to lTableNames.Count - 1 do
         begin
            AddFieldNamesToCompletionList(aWord, lTableNames[J], aSCP);
            if lAliases[J] <> '' then
            begin
               lAlias := lAliases[J];
               AddToCompletionProposal(Lowercase(lAlias), aSCP);
            end;
         end;

         FreeAndNil(lTableNames);
      end;
   finally
      FreeAndNil(lSQLStrList);
      FreeAndNil(lAliases);
   end;
end;

function GetWordBeforeCursor(ammoSQL : TSynMemo) : String;
var
   lCursor, I : Integer;
   lResult : String;
begin
   lResult := '';
   lCursor := ammoSQL.SelStart;
   if (Length(ammoSQL.Text) > 0) and (ammoSQL.Text[lCursor] <> ' ') and (Trim(ammoSQL.Text[lCursor + 1]) = '') then
   begin
      for I := lCursor downto 1 do
      begin
         if Trim(ammoSQL.Text[I]) = '' then
            break
         else
            lResult := Copy(ammoSQL.Text, I, lCursor - I + 1);
      end;
   end;
   Result := lResult;
end;

procedure AddFieldNamesFromAllOpenTabs(const aWord : String; aTab : array of TTab; aSCP : TSynCompletionProposal);
var
   I, J : Integer;
begin
   for I := 0 to Length(aTab) - 1 do
   begin
      if Assigned(aTab[I]) and aTab[I].dSet.Active and (aTab[I].TableName <> CUSTOM_SQL) then
      begin
         for J := 0 to aTab[I].dSet.FieldCount - 1 do
         begin
            if AnsiStartsStr(aWord, aTab[I].dSet.Fields[J].FieldName) then
                AddToCompletionProposal(aTab[I].dSet.Fields[J].FieldName, aSCP);
         end;
      end;
   end;
end;

end.
