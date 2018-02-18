unit DataEditorCode;
{
  Oct/Nov 2014 Code By: Daniel Campbell 

  TODO:
        ******General**************
        -JvPageControl? Has nice rounded tabs. I think it can have a cross
        next to the tab captions to close the tab. Right click a tab to
        'Close all but this'. Private functions already written.
        Just need an event that knows the tab clicked, which jvpagecontrol might have.
        Update: Now that there is a JVPageControlNot sure if this is true but
        it still has more features than a TPageControl, currently unused
        Update: Bug in closetab procedure. Close a tab, then try to set a table
        -Get footer type from data type, so it can be used on select queries?
        -datetime mask in datetime columns. spinedit column.inplaceeditor form integers?
        -Importing from excel isn't working properly from saleline, error on line
        -Extra options to import/export from XML.
        *******SMS Tools********
        -Check For Print To File and more control over print settings, printer type dropdown
        -A checkbox to turn off marketing i.e. asking for postcode, etc on sale
        -Improve Search Schema by highlighting phrase in ddl file
        *******SQL Editor***********
        -Joins
        -RichEdit can change the text attributes of part of the line,
        rather than changing the font color of everything. Create function in uuTools.pas
        to be used by proposed sql and search schema
        -Ability to drag the sql panel
        *******SMS Links************
        -Provide more links...
        -Make the item tables more intelligent with different sql depending on input
        E.g. storeics either shows one record if ics_id was inputted or many records
        if item_code was inputted
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, DBTables, ExtCtrls, DBCtrls, Registry,
  ComCtrls, kbmMemTable, Buttons, StrUtils, SMDBGrid, SMDBFltr,
  Menus,uuTab, ufISQLDataBase, uuGlobals, ufISQLQuery,
  JvExComCtrls, JvComCtrls, ImgList, SynEditHighlighter, SynHighlighterSQL,
  SynEdit, SynMemo, SynCompletionProposal, kbmMemCSVStreamFormat, nxdb, Spin,
  udTaskList, uuSQLEditor, SynUnicode;

type
  THackDBGrid = class(TSMDBGrid);

  TfrmDataEditor = class(TForm)
    cboTable: TComboBox;
    lblTable: TLabel;
    lblAlias: TLabel;
    dnTable: TDBNavigator;
    btnSQL: TButton;
    pnlSQL: TPanel;
    mmoSQLFeedBack: TMemo;
    btnUpdate: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    pgTable: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    mtbSQL: TkbmMemTable;
    mtbSQLSQL: TMemoField;
    mtbSQLFeedBack: TMemoField;
    btnFilter: TSpeedButton;
    SMDBFilterDialog1: TSMDBFilterDialog;
    dbgTable1: TSMDBGrid;
    dbgTable2: TSMDBGrid;
    dbgTable3: TSMDBGrid;
    dbgTable4: TSMDBGrid;
    dbgTable5: TSMDBGrid;
    lblServerName: TLabel;
    btnWhere: TButton;
    btnExecute: TSpeedButton;
    btnBack: TSpeedButton;
    btnForward: TSpeedButton;
    btnLocate: TSpeedButton;
    btnRecordView: TSpeedButton;
    btnFunctions: TSpeedButton;
    btnGroupBy: TButton;
    mtbSQLError: TBooleanField;
    poFields: TPopupMenu;
    btnExport: TSpeedButton;
    btnSelect: TButton;
    btnJoin: TButton;
    btnDatabase: TSpeedButton;
    mmoExport: TMemo;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    dbgTable6: TSMDBGrid;
    dbgTable7: TSMDBGrid;
    dbgTable8: TSMDBGrid;
    btnOrderBy: TButton;
    btnEmptyTable: TSpeedButton;
    mtbSQLTime: TStringField;
    lblTime: TLabel;
    imgClock: TImage;
    btnOptions: TSpeedButton;
    rgFooter: TRadioGroup;
    mtbCSV: TkbmMemTable;
    CSVFormat: TkbmCSVStreamFormat;
    btnImport: TSpeedButton;
    poColumns: TPopupMenu;
    SetValueTo: TMenuItem;
    edtColumnValue: TEdit;
    pnlInfo: TPanel;
    btnDataGenie: TSpeedButton;
    mmoTableHint: TRichEdit;
    cboSQLTables: TComboBox;
    tblSQL: TTable;
    imgCommit: TImage;
    imgRollback: TImage;
    btnSMSLinks: TSpeedButton;
    btnLoadSQL: TSpeedButton;
    btnSaveSQL: TSpeedButton;
    mtbRecord: TkbmMemTable;
    mtbRecordField: TStringField;
    mtbRecordValue: TStringField;
    mtbRecordType: TStringField;
    mtbRecordIsNull: TBooleanField;
    mtbParams: TkbmMemTable;
    mtbParamsPField: TStringField;
    mtbParamsPValue: TStringField;
    mtbParamsPType: TStringField;
    mtbAllParams: TkbmMemTable;
    mtbAllParamsPField: TStringField;
    mtbAllParamsPValue: TStringField;
    mtbAllParamsPType: TStringField;
    SortAscending: TMenuItem;
    SortDescending: TMenuItem;
    Hint: TMenuItem;
    lblSQLConfirmCancel: TLabel;
    tvServerList: TJvTreeView;
    tbFont: TJvTrackBar;
    ilTreeView: TImageList;
    mtbRecordHint: TStringField;
    mmoSQL: TSynMemo;
    SynSQLSyn1: TSynSQLSyn;
    SynCompletionProposal1: TSynCompletionProposal;
    poServer: TPopupMenu;
    miCreateAlias: TMenuItem;
    poAlias: TPopupMenu;
    miConnect: TMenuItem;
    miWorkingDir: TMenuItem;
    miDeleteAlias: TMenuItem;
    poTable: TPopupMenu;
    miHint: TMenuItem;
    btnSQLFavourites: TSpeedButton;
    btnClear: TSpeedButton;
    miDisconnect: TMenuItem;
    lblZoomIn: TLabel;
    lblZoomOut: TLabel;
    lblRecordCount: TLabel;
    HideColumn: TMenuItem;
    DefineVisibleColumns: TMenuItem;
    PasteTimer: TTimer;
    btnRemoveDelphi: TSpeedButton;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    dbgTable9: TSMDBGrid;
    dbgTable10: TSMDBGrid;
    cboConfigs: TDBComboBox;
    btnTask: TSpeedButton;
    miRecover: TMenuItem;
    btnRegister: TButton;
    btnCompareDB: TSpeedButton;
    btnCallList: TSpeedButton;
    btnInfo: TSpeedButton;
    btnConfigs: TSpeedButton;
    btnSchemaChange: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnDatabaseClick(Sender: TObject);
    procedure cboTableExit(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnLocateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboTableKeyPress(Sender: TObject; var Key: Char);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnSQLClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgTableChange(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure dbgTableMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure dbgTableMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure SMSConfigNewRecord(DataSet: TDataSet);
    procedure btnFunctionsClick(Sender: TObject);
    procedure btnWhereClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure btnRecordViewClick(Sender: TObject);
    procedure mmoSQLChange(Sender: TObject);
    procedure dbgTableTitleClick(Column: TColumn);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure btnExportClick(Sender: TObject);
    procedure cboTableChange(Sender: TObject);
    procedure FieldClickEvent(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnGroupByClick(Sender: TObject);
    procedure btnOrderByClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnEmptyTableClick(Sender: TObject);
    procedure qryNewRecord(DataSet: TDataSet);
    procedure btnOptionsClick(Sender: TObject);
    procedure rgFooterClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure SetValueToClick(Sender: TObject);
    procedure edtColumnValueExit(Sender: TObject);
    procedure edtColumnValueKeyPress(Sender: TObject; var Key: Char);
    procedure qryRecalcFooter(DataSet: TDataSet);
    procedure dbgTableFilterChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDataGenieClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure tbFontChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cboSQLTablesExit(Sender: TObject);
    procedure cboSQLTablesChange(Sender: TObject);
    procedure cboSQLTablesKeyPress(Sender: TObject; var Key: Char);
    procedure imgCommitClick(Sender: TObject);
    procedure imgRollbackClick(Sender: TObject);
    procedure btnSMSLinksClick(Sender: TObject);
    procedure mmoSQLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnLoadSQLClick(Sender: TObject);
    procedure btnSaveSQLClick(Sender: TObject);
    procedure SortAscendingClick(Sender: TObject);
    procedure SortDescendingClick(Sender: TObject);
    procedure HintClick(Sender: TObject);
    procedure dbgTableColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure dbgTableMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvServerListDblClick(Sender: TObject);
    procedure pgTableDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure pgTableMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pgTableMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pgTableMouseLeave(Sender: TObject);
    procedure pgTableMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mtbRecordValueChange(Sender: TField);
    procedure SynCompletionProposal1AfterCodeCompletion(Sender: TObject;
      const Value: WideString; Shift: TShiftState; Index: Integer;
      EndToken: WideChar);
    procedure SynCompletionProposal1CodeCompletion (Sender: TObject;
      var Value: UnicodeString; Shift: TShiftState; Index: Integer;
      EndToken: WideChar);
    procedure btnSQLFavouritesClick(Sender: TObject);
    procedure tvServerListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miHintClick(Sender: TObject);
    procedure miCreateAliasClick(Sender: TObject);
    procedure miDeleteAliasClick(Sender: TObject);
    procedure miConnectClick(Sender: TObject);
    procedure miWorkingDirClick(Sender: TObject);
    procedure miDisconnectClick(Sender: TObject);
    procedure HideColumnClick(Sender: TObject);
    procedure DefineVisibleColumnsClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PasteTimerTimer(Sender: TObject);
    procedure btnRemoveDelphiClick(Sender: TObject);
    procedure SMSConfigColExit(Sender: TObject);
    procedure SMSConfigKeyPress(Sender: TObject; var Key: Char);
    procedure SMSConfigDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnTaskClick(Sender: TObject);
    procedure miRecoverClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnCompareDBClick(Sender: TObject);
    procedure btnCallListClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnConfigsClick(Sender: TObject);
    procedure btnSchemaChangeClick(Sender: TObject);
  private
    { Private declarations }
    qrySQL : ISQLQuery;
    qryDummy : ISQLQuery;
    fAlias : String;
    fServerName : String;
    Grids : array of TSMDBGrid;
    tab : array of TTab;
    fSelectHover : Boolean;
    fUpdateHover : Boolean;
    fInsertHover : Boolean;
    fDeleteHover : Boolean;
    fWhereHover : Boolean;
    fGroupByHover : Boolean;
    fOrderByHover : Boolean;
    fJoinHover : Boolean;
    fOrigSQL : TSQL;
    fTableSetByEnter : Boolean;
    fSelectTablesPopUp : Boolean;
    fUpdateTablesPopUp : Boolean;
    fInsertTablesPopUp : Boolean;
    fDeleteTablesPopUp : Boolean;
    fSelectFieldsPopUp : Boolean;
    fUpdateFieldsPopUp : Boolean;
    fWhereFieldsPopUp : Boolean;
    fGroupByFieldsPopUp : Boolean;
    fOrderByFieldsPopUp : Boolean;
    fSQLEditorShowing : Boolean;
    fSQLJustChanged : Boolean;
    fTypedSQLChange : Boolean;
    fImporting : Boolean;
    fInfoShowing : Boolean;
    fOldWidth, fOldHeight : Integer;
    fTablesAffected : TStringList; //used for locking tables in a sql transaction
    fFieldClicked : TField; //used for column operations
    fColumnHint : String;
    fFillingServers : Boolean;
    fColMoved : Boolean;
    fScrollLeftRight : Boolean;
    fJustSQLCompleted : Boolean;

    fCloseButtonsRect: array of TRect;
    fCloseButtonMouseDownIndex: Integer;
    fCloseButtonShowPushed: Boolean;

    fSavedWinProc : TWndMethod;

    function AddTablesToDropdown : Boolean;
    function SetTable: Boolean;
    function SetAlias(const aAlias, aServerName : String;
       aUserName : String = ''; aPassword : String = ''; aStartUp : Boolean = False) : Boolean;
    procedure CloseAllDataSets;
    procedure EnableTableControls(Val: Boolean);
    function GetProposedSQL(aFieldChosen : String; aTableChosen : String): TSQL;
    function GetNoOfActiveTables: Integer;
    function GetCursorPosForControl(aControl: TWinControl): TPoint;
    function PutSelectSQLIntoTab(aSQL: String; var aCancelledOnParams : Boolean;
       var aTimeEnteringParams : Int64; var aSQLFeedBack : String) : Boolean;
    function GetTableIndex(aTableName: String): Integer;
    procedure ShowFieldsPopUp(aFieldList : TStringList; p : TPoint; aType : String);
    procedure SQLClick(aColor: TColor);
    procedure ApplySettings;
    procedure RecalcFooter(aPageIndex: Integer);
    procedure ToggleSQL;
    procedure ToggleInfo;
    procedure ShowSQLTableChooser(x, y : Integer);
    procedure GoIntoTransaction;
    procedure GoOutOfTransaction;
    procedure RefreshAllTables;
    procedure ApplySQLParameters(aQry: ISQLQuery; var aTimeEnteringParams: Int64;
      var aCancelledOnParams: Boolean);
    procedure Commit;
    procedure RollBack;
    procedure CloseTab(aIndex: Integer);
    procedure CloseAllButThisTab(aIndex: Integer);
    procedure AssignDataSetEvents(aIndex : Integer);
    procedure SQLCancel;
    procedure SQLCommit;
    function CreateEditAlias(aServerName : String;
       var aAlias : String; var aWorkingDirectory : String;
       aAliasFixed : Boolean = False) : Boolean;
    function FindNextAvailableTab: Integer;
    procedure SetRecordCount;
    procedure ShowRegistryPrompt;
    procedure NewWinProc(var Msg: TMessage);
    procedure AttachConfigComboBox;
  public
    { Public declarations }
  end;


var
  frmDataEditor: TfrmDataEditor;

implementation

uses udSMSTools, udSQLParams, udRecordView, Math,
     udSMSLinks, ufNexusDataBase, ufPDXDataBase, udSettings, udLocate,
     UxTheme, Themes, udSQLFavourites, udCreateAlias, ufDBEDatabase,
     udInsertSQL, udExport, dbConnAdmin, IniFiles, udColumnVisibility,
     udSelectOptions, udMSSQLConnect, udRegistryPrompt, udTaskCommit,
     nxsdServerEngine, udTaskMerge, ShellAPI, nxdbBase, udRegisterServers,
  uuServerList, udCompareDB, udDataGenie, udAddNewSQL, udSMSConfigs,
  udSchemaChange;

{$R *.dfm}

procedure TfrmDataEditor.FormCreate(Sender: TObject);
var
   I : Integer;
   lPersonalIni : TextFile;
begin
//   fSavedWinProc := Self.WindowProc;
//   Self.WindowProc := NewWinProc;
   lblServerName.Caption := '';
   lblAlias.Caption := '';
   gAppPath := ExtractFilePath(ParamStr(0));

   if (ParamStr(1) <> ('-' + EDITOR_PASSWORD)) and (EDITOR_PASSWORD <> InputBox('Password', 'Password = ','')) then
   begin
      ShowMessage('Password incorrect');
      Application.Terminate;
   end;

   if not FileExists(PERSONAL_INI) then
   begin
      AssignFile(lPersonalIni, PERSONAL_INI);
      Rewrite(lPersonalIni);
      CloseFile(lPersonalIni);
   end;

   gWin7 := CheckWin32Version(6,1); //Windows 7 or higher

   LoadSettings;

   pgTable.ActivePageIndex := 0;

   for I := 1 to pgTable.PageCount - 1 do
   begin
      pgTable.Pages[I].TabVisible := False;
   end;

   fSQLEditorShowing := False;
   fInfoShowing := False;
   fTableSetByEnter := False;
   fSelectFieldsPopUp := False;
   fUpdateFieldsPopUp := False;
   fWhereFieldsPopUp := False;
   fGroupByFieldsPopUp := False;
   fOrderByFieldsPopUp := False;
   fTypedSQLChange := False;
   mmoSQL.Text := '';
   fTypedSQLChange := True;
   fSQLJustChanged := False;
   fFieldClicked := nil;
   fImporting := False;
   fSelectTablesPopUp := False;
   fUpdateTablesPopUp := False;
   fInsertTablesPopUp := False;
   fDeleteTablesPopUp := False;
   fColumnHint := '';
   fFillingServers := False;
   fColMoved := False;
   fScrollLeftRight := False;
   fJustSQLCompleted := False;
   fTablesAffected := TStringList.Create;

   SetLength(tab, NO_OF_TABS);

   SetLength(Grids, NO_OF_TABS);
   Grids[0] := dbgTable1;
   Grids[1] := dbgTable2;
   Grids[2] := dbgTable3;
   Grids[3] := dbgTable4;
   Grids[4] := dbgTable5;
   Grids[5] := dbgTable6;
   Grids[6] := dbgTable7;
   Grids[7] := dbgTable8;
   Grids[8] := dbgTable9;
   Grids[9] := dbgTable10;

   mtbSQL.Open;

   fOldWidth := Self.Width;
   fOldHeight := Self.Height;

   imgCommit.Visible := False;
   imgRollback.Visible := False;

   pgTable.TabWidth := 150;
   pgTable.OwnerDraw := True;

   //should be done on every change of the page count
   SetLength(FCloseButtonsRect, NO_OF_TABS);
   FCloseButtonMouseDownIndex := -1;

   for I := 0 to Length(FCloseButtonsRect) - 1 do
   begin
      FCloseButtonsRect[I] := Rect(0, 0, 0, 0);
   end;

   ApplySettings;
end;

procedure TfrmDataEditor.NewWinProc(var Msg : TMessage);
begin
   fSavedWinProc(Msg);
   case Msg.Msg of
      WM_PASTE:
      begin
         if Assigned(tab[pgTable.ActivePageIndex]) then
            tab[pgTable.ActivePageIndex].Grid.ApplyFilter;
      end;
   end;
end;

procedure TfrmDataEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   lAvailableTab : Integer;
begin
   if (ssCtrl in Shift) or (ssAlt in Shift) then
   begin
      if char(Key) in ['o','O'] then
      begin
         lAvailableTab := FindNextAvailableTab;
         if lAvailableTab <> -1 then
            pgTable.ActivePageIndex := lAvailableTab;
         pgTableChange(self);
         if cboTable.CanFocus then
            cboTable.SetFocus;
      end
      else if char(Key) in ['s','S'] then
      begin
         ToggleSQL;
      end
      else if char(Key) in ['l','L'] then
      begin
         btnSMSLinksClick(self);
      end
      else if char(Key) in ['r','R'] then
      begin
         btnRecordViewClick(self);
      end
      else if char(Key) in ['t','T'] then
      begin
         btnFunctionsClick(self);
      end
      else if char(Key) in ['i','I'] then
      begin
         btnInfoClick(self);
      end
      else if char(Key) in ['f','F'] then
      begin
         btnFilterClick(self);
      end
      else if char(Key) in ['d','D'] then
      begin
         btnDataBaseClick(self);
      end
      else if char(Key) in ['g','G'] then
      begin
         btnDataGenieClick(self);
      end;
   end
   else
   begin
      if (Key = VK_ESCAPE) then
      begin
         if lblSQLConfirmCancel.Visible then
         begin
            SQLCancel;
            mmoSQL.SetFocus;
         end
         else if fSQLEditorShowing and btnExecute.Visible then
            ToggleSQL;
      end
      else if(Key = VK_F6) then
      begin
         if imgCommit.Visible then
            Commit;
      end
      else if (Key = VK_F7) then
      begin
         if imgRollback.Visible then
            RollBack;
      end;
   end;
end;

procedure TfrmDataEditor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//   lActiveTab : TTab;
begin
//   if (char(Key) in ['v', 'V']) and (ssCtrl in Shift) then
//   begin
//      lActiveTab := tab[pgTable.ActivePageIndex];
//      if Assigned(lActiveTab) and lActiveTab.Grid.Focused then
//         PasteTimer.Enabled := True;
//   end;
end;

procedure TfrmDataEditor.FormResize(Sender: TObject);
var
   I : Integer;
   lWRatio, lHRatio : Double;
begin
   lWRatio := Self.Width/fOldWidth;
   lHRatio := Self.Height/fOldHeight;

   //loop through controls and resize them
   for I := 0 to ComponentCount - 1 do
   begin
      if Components[I] is TControl then
      begin
         TControl(Components[I]).Width := Round(lWRatio * TControl(Components[I]).Width);
         TControl(Components[I]).Height := Round(lHRatio * TControl(Components[I]).Height);
         TControl(Components[I]).Left := Round(lWRatio * TControl(Components[I]).Left);
         TControl(Components[I]).Top := Round(lHRatio * TControl(Components[I]).Top);
      end;                 

   end;

   fOldWidth := Self.Width;
   fOldHeight := Self.Height;
end;

function TfrmDataEditor.GetNoOfActiveTables : Integer;
var
  I: Integer;
begin
   Result := 0;
   for I := 0 to NO_OF_TABS - 1 do
   begin
      if Assigned(tab[I]) and tab[I].dSet.Active then
         Result := Result + 1;
   end;
end;

function TfrmDataEditor.AddTablesToDropdown : Boolean;
var
   lTableNames : TStringList;
   I : Integer;
begin
   if gDBType = dtMSSQL then
      lTableNames := GetTableNamesFromSchema
   else
      lTableNames := gDataBase.GetTableNames;
   cboTable.Items.Clear;
   cboSQLTables.Items.Clear;
   SynSQLSyn1.TableNames.Clear;
   Result := False;
   if lTableNames.Count <> 0 then
   begin
      for I := 0 to lTableNames.Count - 1 do
      begin
         cboTable.Items.Add(lTableNames[I]);
         cboSQLTables.Items.Add(lTableNames[I]);
         SynSQLSyn1.TableNames.Add(lTableNames[I]);
      end;
      Result := True;
   end;
   FreeAndNil(lTableNames);
end;

procedure TfrmDataEditor.FormShow(Sender: TObject);
var
   lDEFont : String;
begin
   pnlSQL.SendToBack;
   pnlInfo.SendToBack;

   fAlias := GetRegistry('DEAlias');
   fServerName := GetRegistry('DEServerName');
   gMyStoreCode := GetRegistry('location_code', POS_DIRECTORY);
   gMyRegisterCode := gMyStoreCode + GetRegistry('register_code', POS_DIRECTORY);

   if (fAlias <> '') and (fServerName <> ''){and AliasExists(fAlias)} then
   begin
      if SetAlias(fAlias, fServerName, '', '', True) then
      begin
         cboTable.Text := GetRegistry('DETable');
         fTableSetByEnter := True;
         SetTable;
         if Assigned(tab[pgTable.ActivePageIndex]) and
            (tab[pgTable.ActivePageIndex].TableName = 'smsconfig') then
         begin
            tab[pgTable.ActivePageIndex].Grid.SelectedIndex := 1;
            tab[pgTable.ActivePageIndex].Grid.FocusFilterBar;
         end
         else
            cboTable.SetFocus;
      end
      else
         btnDataBaseClick(Self);
   end
   else
   begin
      EnableTableControls(False);
      cboTable.Enabled := False;
      btnSQL.Enabled := False;
      btnSMSLinks.Enabled := False;
      btnDataBaseClick(Self);
   end;


   lDEFont := GetRegistry('DEFont');
   if lDEFont <> '' then
      tbFont.Position := StrToInt(lDEFont);

   btnBack.Enabled := False;
   btnForward.Enabled := False;
   btnWhere.Enabled := False;
   btnGroupBy.Enabled := False;
   btnOrderBy.Enabled := False;
   btnJoin.Enabled := False;

   //Maximise it to fullscreen
   Self.Width := Screen.Width;
   Self.Height := Screen.Height - 40;
end;

procedure TfrmDataEditor.btnCompareDBClick(Sender: TObject);
var
   lCompareDB : TdCompareDB;
begin
   lCompareDB := TdCompareDB.Create(Self);
   try
      lCompareDB.ShowModal;
   finally
      FreeAndNil(lCompareDB);
   end;
end;

procedure TfrmDataEditor.btnConfigsClick(Sender: TObject);
var
   lConfigs : TdSMSConfigs;
begin
   lConfigs := TdSMSConfigs.Create(Self);
   try
      lConfigs.ShowModal;
   finally
      FreeAndNil(lConfigs);
   end;
end;

procedure TfrmDataEditor.btnSchemaChangeClick(Sender: TObject);
var
   lSchemaChange : TdSchemaChange;
begin
   lSchemaChange := TdSchemaChange.Create(Self);
   try
      lSchemaChange.ShowModal;
   finally
      FreeAndNil(lSchemaChange);
   end;
end;

procedure TfrmDataEditor.btnInfoClick(Sender: TObject);
begin
   ToggleInfo;
end;

procedure TfrmDataEditor.btnBackClick(Sender: TObject);
begin
   if not fSQLJustChanged then
   begin
      mtbSQL.Prior;
      btnForward.Enabled := True;
   end
   else
      fSQLJustChanged := False;

   btnBack.Enabled := mtbSQL.RecNo > 1;
   fTypedSQLChange := False;
   mmoSQL.Text := mtbSQLSQL.AsString;
   fTypedSQLChange := True;
   mmoSQLFeedBack.Text := mtbSQLFeedBack.AsString;
   if mtbSQLError.AsBoolean then
      mmoSQLFeedBack.Font.Color := clRed
   else
      mmoSQLFeedBack.Font.Color := clBlack;
   lblTime.Caption := mtbSQLTime.AsString;
end;

procedure TfrmDataEditor.btnClearClick(Sender: TObject);
begin
   fTypedSQLChange := True;
   mmoSQL.Text := '';
   mmoSQLFeedBack.Text := '';
   lblTime.Caption := '';
   mmoSQL.SetFocus;
   btnClear.Enabled := False;
   if not mtbSQL.IsEmpty then
      btnBack.Enabled := True;
   fOrigSQL.Text := '';
   fOrigSQL.Cursor := 0;
end;

procedure TfrmDataEditor.RefreshAllTables;
var
  I: Integer;
begin
   for I := 0 to NO_OF_TABS - 1 do
   begin
      if Assigned(tab[I]) and tab[I].dSet.Active then      
         tab[I].dSet.Refresh;
   end;
end;

procedure TfrmDataEditor.btnDatabaseClick(Sender: TObject);
   procedure ExpandSelectedServerAndHighlightAlias;
   var
      I : Integer;
   begin
      for I := 0 to tvServerList.Items.Count - 1 do
      begin
         if (tvServerList.Items[I].Parent = nil) and (tvServerList.Items[I].Text = fServerName) then
         begin
            //#todo: Replace with left click
            //tvServerListChange(Self, tvServerList.Items[I]);
            break;
         end;
      end;
   end;
begin
   if not tvServerList.Visible then
   begin
      btnDatabase.Caption := 'Close';
      fFillingServers := True;
      tvServerList.Visible := True;
      btnRegister.Visible  := True;
      PopulateServerList(tvServerList);
      fFillingServers := False;
      if (fServerName <> '') and (fAlias <> '') then
         ExpandSelectedServerAndHighlightAlias;
   end
   else
   begin
      tvServerList.Visible := False;
      btnRegister.Visible  := False;
      btnDatabase.Caption := 'Database';
   end;
end;

procedure TfrmDataEditor.btnExecuteClick(Sender: TObject);
var
   lSQLStrList : TStringList;
   lCancelledOnParams : Boolean;
   I, K : Integer;
   lSQLStartTime, lSQLEndTime : Int64;
   lError : Boolean;
   lErrorMessage : String;
   lTimeEnteringParams : Int64;
   lSQLToAdd : String;
   lTableName : String;
   lAlreadyRolledback : Boolean;
   lSQLFeedback : String;
   lNoTransaction : Boolean;
   lTrimmedSQL : String;
   lExitFromSQL : Boolean;
   lExecuteAsOneStatement : Boolean;
begin
   lExitFromSQL := True;
   lTrimmedSQL := Trim(mmoSQL.Text);
   if lTrimmedSQL = '' then
      Exit;

   lExecuteAsOneStatement := False;
   lNoTransaction := False;
   if (AnsiPos('CREATE TABLE', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('CREATE INDEX', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('CREATE FUNCTION', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('CREATE PROCEDURE', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('DROP TABLE', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('DROP INDEX', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('DROP FUNCTION', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('DROP PROCEDURE', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('ALTER INDEX', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('ALTER TABLE', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('ALTER FUNCTION', Uppercase(lTrimmedSQL)) <> 0) or
     (AnsiPos('ALTER PROCEDURE', Uppercase(lTrimmedSQL)) <> 0)  then
   begin
      lNoTransaction := True;
      lExitFromSQL := False;
      if (AnsiPos('CREATE FUNCTION', Uppercase(lTrimmedSQL)) <> 0) or
         (AnsiPos('CREATE PROCEDURE', Uppercase(lTrimmedSQL)) <> 0) or
         (AnsiPos('ALTER FUNCTION', Uppercase(lTrimmedSQL)) <> 0) or
         (AnsiPos('ALTER PROCEDURE', Uppercase(lTrimmedSQL)) <> 0) or
         (AnsiPos('DROP FUNCTION', Uppercase(lTrimmedSQL)) <> 0) or
         (AnsiPos('DROP PROCEDURE', Uppercase(lTrimmedSQL)) <> 0) then
      begin
         lExecuteAsOneStatement := True;
      end
      else if (AnsiPos('UPDATE ', Uppercase(lTrimmedSQL)) <> 0) or
         (AnsiPos('INSERT INTO ', Uppercase(lTrimmedSQL)) <> 0) or
         (AnsiPos('DELETE FROM ', Uppercase(lTrimmedSQL)) <> 0) then
      begin
         ShowMessage('You cannot execute ddl statements with SQL that requires a transaction.');
         Exit;
      end;
   end;

   lSQLFeedback := '';
   lTimeEnteringParams := 0;
   lError := False;
   lAlreadyRolledback := False;
   lCancelledOnParams := False;
   lSQLStrList := TStringList.Create;
   fTablesAffected.Clear;
   mtbAllParams.Close;

   lSQLStartTime := GetTickCount;
   try
      if lExecuteAsOneStatement then
         lSQLStrList.Add(lTrimmedSQL)
      else
         //put statements into stringlist
         SplitSQL(lSQLStrList, lTrimmedSQL, ';', True);

      for I := 0 to lSQLStrList.Count - 1 do
      begin
         lSQLToAdd := Trim(lSQLStrList[I]);
         if lSQLToAdd <> '' then
         begin
            try
               if AnsiStartsStr(CUSTOM_SQL, Trim(Uppercase(lSQLToAdd))) then
               begin
                  lError := (not PutSelectSQLIntoTab(lSQLToAdd, lCancelledOnParams,
                     lTimeEnteringParams, lSQLFeedBack)) or lError;
               end
               else
               begin
                  qrySQL.SQL.Clear;
                  qrySQL.SQL.Add(lSQLToAdd);

                  if (not gDataBase.InTransaction) and (not lNoTransaction) then
                  begin
                     lExitFromSQL := False;
                     if gDBType = dtParadox then
                     begin
                        //For Paradox, must lock the tables to get around not being able
                        //to lock more than 255 records
                        for K := 0 to lSQLStrList.Count - 1 do
                        begin
                           lTableName := Trim(lSQLStrList[K]);
                           if lTableName <> '' then
                           begin
                              lTableName := GetTableName(Trim(lSQLStrList[K]));
                              if lTableName <> '' then
                                 fTablesAffected.Add(lTableName);
                           end;
                        end;
                        gDataBase.StartTransaction(fTablesAffected);
                     end
                     else
                        gDataBase.StartTransaction;
                  end;

                  qrySQL.Prepare;

                  if qrySQL.Params.Count <> 0 then
                  begin
                     ApplySQLParameters(qrySQL, lTimeEnteringParams,
                       lCancelledOnParams);
                  end;

                  qrySQL.ExecSQL;

                  if not lNoTransaction then //we don't want to call rowsaffected if they are created a table or index
                  begin
                     //RowsAffected can cause a stack overflow with Paradox
                     //Something to do with the table locking thing
//                        if gDBType <> dtParadox then
//                           lSQLFeedback := lSQLFeedback + 'Rows Affected: ' + IntToStr(qrySQL.RowsAffected) + #13#10
//                        else
//                           lSQLFeedback := lSQLFeedback + 'Rows Affected: Unknown' + #13#10;
                  end
                  else
                  begin
                     if AnsiPos('CREATE TABLE', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Table Created' + #13#10
                     else if AnsiPos('CREATE INDEX', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Index Created' + #13#10
                     else if AnsiPos('CREATE FUNCTION', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Stored Function Created' + #13#10
                     else if AnsiPos('CREATE PROCEDURE', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Stored Procedure Created' + #13#10
                     else if AnsiPos('DROP TABLE', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Table Dropped' + #13#10
                     else if AnsiPos('DROP INDEX', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Index Dropped' + #13#10
                     else if AnsiPos('ALTER TABLE', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Table Altered' + #13#10
                     else if AnsiPos('ALTER INDEX', Uppercase(qrySQL.SQL.Text)) <> 0 then
                        lSQLFeedback := lSQLFeedback + 'Index Altered' + #13#10
                  end;
               end;
            except
               on E : Exception do
               begin
                  lExitFromSQL := False;
                  if not lCancelledOnParams then
                  begin
                     lErrorMessage := E.Message;
                     lSQLFeedback := lSQLFeedback + lErrorMessage + #13#10;
                     lError := True;
                  end;
               end;
            end;
         end;
      end;
   finally
      if not lCancelledOnParams then
      begin
         lSQLEndTime := GetTickCount;
         mtbSQL.Last;
         mtbSQL.Append;
         mtbSQLSQL.Text := mmoSQL.Text;
         mtbSQLError.AsBoolean := lError;
         if lError then
         begin
            lExitFromSQL := False;
            mmoSQLFeedback.Font.Color := clRed;
            lblTime.Caption := '';
            if gSettings.RollbackSQL then
            begin
               if gDataBase.InTransaction then
               begin
                  gDataBase.Rollback;
                  lAlreadyRolledback := True;
                  GoOutOfTransaction;
                  lSQLFeedback := lSQLFeedback + 'Rolled back';
               end;
            end;
         end
         else
         begin
            mtbSQLTime.AsString := (msecToTime((lSQLEndTime-lSQLStartTime) - lTimeEnteringParams)) + 'ms';
            mmoSQLFeedback.Font.Color := clBlack;
            lblTime.Caption := mtbSQLTime.AsString;
         end;
         mmoSQLFeedBack.Text := lSQLFeedback;
         mtbSQL.Post;

         fSQLJustChanged := False;
         if mtbSQL.RecordCount > 1 then
           btnBack.Enabled := True;
         btnForward.Enabled := False;

         if (not lAlreadyRolledback) and gDataBase.InTransaction then
         begin
            lExitFromSQL := False;
            GoIntoTransaction;
         end;
      end
      else //cancelled on params but might still be in transaction
      begin
         lExitFromSQL := False;
         if gDataBase.InTransaction then
         begin
            gDataBase.Rollback;
            GoOutOfTransaction;
         end;
      end;
      FreeAndNil(lSQLStrList);
      mtbParams.Close;
      mtbAllParams.Close;
      if lExitFromSQL then
         ToggleSQL;
   end;
end;

procedure TfrmDataEditor.ApplySQLParameters(aQry : ISQLQuery;
  var aTimeEnteringParams : Int64; var aCancelledOnParams : Boolean);
var
   lTimeEnteringParamsStart : Int64;
   lParamsForm : TdSQLParams;
   W : Word;
begin
   lTimeEnteringParamsStart := GetTickCount;
   lParamsForm := TdSQLParams.Create(Self);
   if not mtbAllParams.Active then
      mtbAllParams.Open;
   mtbParams.Close;
   mtbParams.Open;

   try
      for W := 0 to aQry.Params.Count - 1 do
      begin
         //if the param hasn't been found in a previous sql statement
         if not mtbAllParams.Locate('PField', aQry.Params[W].Name, []) then
         begin
            mtbParams.Last;
            mtbParams.Append;
            mtbParamsPField.Value := aQry.Params[W].Name;
            mtbParamsPType.Value := FieldTypeToString(aQry.Params[W].DataType);
            mtbParamsPValue.Value := '';
            mtbParams.Post;

            mtbAllParams.Last;
            mtbAllParams.Append;
            mtbAllParamsPField.Value := aQry.Params[W].Name;
            mtbAllParamsPType.Value := FieldTypeToString(aQry.Params[W].DataType);
            mtbAllParamsPValue.Value := '';
            mtbAllParams.Post;
         end
         else if (not mtbParams.Locate('PField', aQry.Params[W].Name, [])) then //this covers the case of the same parameter's in the one SQL statement
         begin
            mtbParams.Last;
            mtbParams.Append;
            mtbParamsPField.Value := mtbAllParamsPField.Value;
            mtbParamsPType.Value := mtbAllParamsPType.Value;
            mtbParamsPValue.Value := mtbAllParamsPValue.Value;
            mtbParams.Post;
         end;
      end;
      lParamsForm.SetUp(mtbParams, aQry.SQL.Text);
      if lParamsForm.ShowModal = mrOk then
      begin
         lParamsForm.GetParams(mtbParams);
         mtbParams.First;
         for W := 0 to aQry.Params.Count - 1 do
         begin
            aQry.Params[W].Value := mtbParamsPValue.Value;
            if mtbAllParams.Locate('PField', mtbParamsPField.Value, []) then
            begin
               mtbAllParams.Edit;
               mtbAllParamsPValue.Value := mtbParamsPValue.Value;
               mtbAllParams.Post;
            end;
            mtbParams.Next;
         end;
         aTimeEnteringParams := aTimeEnteringParams + (GetTickCount - lTimeEnteringParamsStart);
      end
      else
         aCancelledOnParams := True;
   finally
      FreeAndNil(lParamsForm);
   end;
end;

procedure TfrmDataEditor.btnImportClick(Sender: TObject);
var
   I, J : Integer;
   lWords : TStringList;
   lFieldCount : Integer;
   lFileNotChosen : Boolean;
   lFileName : String;
   lQry : ISQLQuery;
   lBookMark : TBookMarkStr;
   lLine : String;
   lImportFile : TextFile;
begin
   if Assigned(tab[pgTable.ActivePageIndex]) and (tab[pgTable.ActivePageIndex].TableName <> CUSTOM_SQL) then
   begin
      lQry := tab[pgTable.ActivePageIndex].dSet;
      lBookMark := lQry.dataset.Bookmark;
      lFieldCount := lQry.Fields.Count;
      fImporting := True;
      lQry.DisableControls;
      I := 2; //line number
      lFileName := OpenFile(True, lFileNotChosen, '', '', self);
      try
         if not lFileNotChosen then
         begin
            AssignFile(lImportFile, lFileName);
            Reset(lImportFile);
            gDataBase.StartTransaction;
            try
               while not EOF(lImportFile) do
               begin
                  ReadLn(lImportFile, lLine);

                  //The problem I had with using a memo like this was that
                  //it didn't work with tables with lots of fields
                  //the memo seemed to truncate the first line
                  
                  //mmoExport.Lines.LoadFromFile(lFileName);
                  //for I := 0 to mmoExport.Lines.Count - 1 do
                  //begin
                  if I = 1 then
                  begin
                     //check fields match
                     lWords := TStringList.Create;
                     try
                        SplitSQL(lWords, lLine, ',', True);
                        if lWords.Count <> lFieldCount then
                        begin
                           ShowMessage('The number of fields do not match');
                           Abort;
                        end
                        else
                        begin
                           for J := 0 to lQry.Fields.Count - 1 do
                           begin
                              if lQry.Fields[J].FieldName <> lWords[J] then
                              begin
                                 ShowMessage('Field mismatch');
                                 Abort;
                              end;
                           end;
                        end;
                     finally
                        FreeAndNil(lWords);
                     end;
                  end
                  else
                  begin
                     lWords := TStringList.Create;
                     try
                        SplitSQL(lWords, lLine, ',', True);
                        if lFieldCount <> lWords.Count then
                        begin
                           ShowMessage('Error: Line ' + IntToStr(I) + ' FieldCount: ' + IntToStr(lFieldCount) + ' CSVFieldCount: ' + IntToStr(lWords.Count));
                           Abort;
                        end;

                        lQry.Append;
                        for J := 0 to lWords.Count - 1 do
                        begin
                           if (lWords[J] <> 'NULL') then
                           begin
                              if (lQry.Fields[J].DataType = ftDateTime) then
                              begin

                              end
                              else
                                 lQry.Fields[J].AsString := lWords[J];
                           end;
                        end;
                        lQry.Post;

                     finally
                        FreeAndNil(lWords);
                     end;
                  end;
                  I := I + 1; //line number
               end;
               gDataBase.Commit;
               CloseFile(lImportFile);
            except
               on E: Exception do
               begin
                  gDataBase.Rollback;
                  CloseFile(lImportFile);
                  ShowMessage(E.Message);
               end;
            end;
         end;
      finally
         lQry.dataset.Bookmark := lBookMark;
         lQry.EnableControls;
         fImporting := False;
         lQry.Refresh;
      end;
   end;
end;

procedure TfrmDataEditor.btnExportClick(Sender: TObject);
var
   lQry : ISQLQuery;
   lBookMark : TBookMarkStr;
   lExportForm : TdExport;
begin
   if Assigned(tab[pgTable.ActivePageIndex]) and tab[pgTable.ActivePageIndex].dSet.Active then
   begin
      lQry := tab[pgTable.ActivePageIndex].dSet;
      lBookMark := lQry.dataset.Bookmark;
      lQry.DisableControls;
      lExportForm := TdExport.Create(Self);
      try
         lExportForm.SetUp(lQry, tab[pgTable.ActivePageIndex].TableName);
         lExportForm.ShowModal;
      finally
         FreeAndNil(lExportForm);
         lQry.dataset.Bookmark := lBookMark;
         lQry.EnableControls;
      end;
   end;
end;

function TfrmDataEditor.FindNextAvailableTab : Integer;
var
   I : Integer;
begin
   Result := -1;
   for I := 0 to NO_OF_TABS - 1 do
   begin
      if (not Assigned(tab[I])) then
      begin
         Result := I;
         break;
      end;
   end;
end;

//Returns true if successful
function TfrmDataEditor.PutSelectSQLIntoTab(aSQL : String;
  var aCancelledOnParams : Boolean; var aTimeEnteringParams : Int64;
  var aSQLFeedBack : String) : Boolean;
var
   lTabIndex : Integer;
   lOrigPageIndex : Integer;
   I : Integer;
begin
   Result := False;
   //Use empty Tab, if there aren't choose the one they are on
   //or the next one or the next one, etc
   lOrigPageIndex := pgTable.ActivePageIndex;
   lTabIndex := FindNextAvailableTab;
   //if there are no empty tabs use the selected one
   if lTabIndex = -1 then
      lTabIndex := pgTable.ActivePageIndex;

   if Assigned(tab[lTabIndex]) then
      FreeAndNil(tab[lTabIndex]);

   //ignore no lock for Paradox or Nexus
   if gDBType <> dtMSSQL then
   begin
      aSQL := StringReplace(aSQL, ' with (nolock)', '', [rfReplaceAll, rfIgnoreCase]);
      aSQL := StringReplace(aSQL, ' (nolock)', '', [rfReplaceAll, rfIgnoreCase]);
   end;

   tab[lTabIndex] := TTab.Create(gDataBase, Grids[lTabIndex], 0, CUSTOM_SQL,
         aSQL, False);
   AssignDataSetEvents(lTabIndex);

   if tab[lTabIndex].dSet.Params.Count <> 0 then
   begin
      ApplySQLParameters(tab[lTabIndex].dSet, aTimeEnteringParams,
         aCancelledOnParams);
   end;

   try
      pgTable.ActivePage := pgTable.Pages[lTabIndex];
      tab[lTabIndex].dSet.Open;
      rgFooter.ItemIndex := 0; //Type
      //if only one table, should be able to updatefooters
      //tab[lTabIndex].UpdateFooter(0);
      Result := True;
      aSQLFeedBack := aSQLFeedBack + 'SELECT Successful' + #13#10;
   except
      on E:Exception do
      begin
         Result := False;
         FreeAndNil(tab[pgTable.ActivePageIndex]);
         aSQLFeedBack := aSQLFeedBack + E.Message + #13#10;
      end;
   end;

   if Result then
   begin
      for I := 0 to tab[lTabIndex].dSet.Fields.Count - 1 do
         tab[pgTable.ActivePageIndex].dSet.Fields[I].ReadOnly := True;
      pgTable.Pages[lTabIndex].Caption := CUSTOM_SQL;
      tab[lTabIndex].Info := Trim(aSQL);
      EnableTableControls(tab[lTabIndex].dSet.Active);
      dnTable.DataSource := tab[lTabIndex].Grid.DataSource;
      mmoTableHint.Text := Trim(aSQL);
      btnRecordView.Enabled := False;
      btnImport.Enabled := False;
      btnEmptyTable.Enabled := False;
      cboTable.Text := CUSTOM_SQL;
   end
   else
      pgTable.ActivePageIndex := lOrigPageIndex;
end;

procedure TfrmDataEditor.btnFilterClick(Sender: TObject);
begin
   if Assigned(tab[pgTable.ActivePageIndex]) and tab[pgTable.ActivePageIndex].dSet.Active then
   begin
      SMDBFilterDialog1.Dataset := tab[pgTable.ActivePageIndex].dSet.DataSet;
      SMDBFilterDialog1.Execute;
      //btnFilter.Down := SMDBFilterDialog1.GetCurrentFilter <> '';
   end;
end;

procedure TfrmDataEditor.btnForwardClick(Sender: TObject);
begin
   mtbSQL.Next;
   btnBack.Enabled := True;
   btnForward.Enabled := mtbSQL.RecNo < mtbSQL.RecordCount;
   fTypedSQLChange := False;
   mmoSQL.Text := mtbSQLSQL.AsString;
   mmoSQLFeedBack.Text := mtbSQLFeedBack.AsString;
   if mtbSQLError.AsBoolean then
      mmoSQLFeedBack.Font.Color := clRed
   else
      mmoSQLFeedBack.Font.Color := clBlack;
   lblTime.Caption := mtbSQLTime.AsString;   
end;

procedure TfrmDataEditor.btnFunctionsClick(Sender: TObject);
var
   lSMSTools : TdSMSTools;
begin
   lSMSTools := TdSMSTools.Create(Self);
   try
      lSMSTools.SetUp;
      lSMSTools.ShowModal;
   finally
      FreeAndNil(lSMSTools);
   end;
   gMyStoreCode := GetRegistry('location_code', POS_DIRECTORY);
   gMyRegisterCode := gMyStoreCode + GetRegistry('register_code', POS_DIRECTORY);
end;

procedure TfrmDataEditor.btnLoadSQLClick(Sender: TObject);
var
   lFileName : String;
   lNotChosen : Boolean;
begin
   lFileName := OpenFile(False, lNotChosen, 'Load SQL', '', self);

   if not lNotChosen then
   begin
      mmoSQL.Lines.Clear;
      mmoSQL.Lines.LoadFromFile(lFileName);
   end;
end;

procedure TfrmDataEditor.btnSaveSQLClick(Sender: TObject);
var
   lFileName : String;
   lNotChosen : Boolean;
begin
   lFileName := SaveFile(False, lNotChosen, 'Save SQL', '', self);

   if not lNotChosen then
   begin
      mmoSQL.Lines.SaveToFile(lFileName);
   end;
end;

procedure TfrmDataEditor.btnLocateClick(Sender: TObject);
var
   lFieldName : String;
   lQry : ISQLQuery;
   lPartial, lCaseInsensitive : Boolean;
   lLocateForm : TdLocate;
   lLocateValue : String;
begin
   if Assigned(tab[pgTable.ActivePageIndex]) and tab[pgTable.ActivePageIndex].dSet.Active then
   begin
      lQry := tab[pgTable.ActivePageIndex].dSet;
      lFieldName := lQry.dataset.FieldDefs[tab[pgTable.ActivePageIndex].Grid.SelectedIndex].Name;
      lLocateForm := TdLocate.Create(Self);
      try
         lLocateForm.SetUp(lFieldName + ' =');
         if lLocateForm.ShowModal = mrOk then
         begin
            lLocateForm.GetValue(lLocateValue, lPartial, lCaseInsensitive);
            if lPartial and lCaseInsensitive then
               lQry.dataset.Locate(lFieldName, lLocateValue, [loPartialKey, loCaseInsensitive])
            else if lPartial and (not lCaseInsensitive) then
               lQry.dataset.Locate(lFieldName, lLocateValue, [loPartialKey])
            else if (not lPartial) and lCaseInsensitive then
               lQry.dataset.Locate(lFieldName, lLocateValue, [loCaseInsensitive])
            else
               lQry.dataset.Locate(lFieldName, lLocateValue, [])
         end;
      finally
         FreeAndNil(lLocateForm);
      end;
   end;
end;

procedure TfrmDataEditor.btnRecordViewClick(Sender: TObject);
var
   lRecordViewForm : TdRecordView;
   I : Integer;
   lQry : TDataSet;
begin
   if Assigned(tab[pgTable.ActivePageIndex]) then
   begin
      lQry := tab[pgTable.ActivePageIndex].dSet.dataset;
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
               mtbRecordHint.Value := tab[pgTable.ActivePageIndex].ColHint[I];
               mtbRecordType.Value := FieldTypeToString(lQry.Fields[I].DataType);
               if not lQry.Fields[I].IsNull then
                  mtbRecordValue.Value := lQry.Fields[I].Value;
               mtbRecord.Post;
            end;
            lRecordViewForm.SetUp(mtbRecord, tab[pgTable.ActivePageIndex].TableName, tab[pgTable.ActivePageIndex].PrimaryKey);
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

procedure TfrmDataEditor.btnRegisterClick(Sender: TObject);
var
   lRegisterServers : TdRegisterServers;
begin
   lRegisterServers := TdRegisterServers.Create(Self);
   try
      lRegisterServers.ShowModal;
      //Reload server list in case they changed one

   finally
      FreeAndNil(lRegisterServers);
   end;
end;

procedure TfrmDataEditor.btnRemoveDelphiClick(Sender: TObject);
var
   lPos, I : Integer;
   lLine : string;
begin
   for I := 0 to mmoSQL.Lines.Count - 1 do
   begin
      lLine := mmoSQL.Lines[I];

      //delete from the start. They may have used a with statement
      lPos := AnsiPos('.SQL.ADD(', UpperCase(lLine));
      if lPos <> 0 then
         Delete(lLine, 1, lPos + 9);
      lPos := AnsiPos('SQL.ADD(', UpperCase(lLine));
      if lPos <> 0 then
         Delete(lLine, 1, lPos + 8);
      lPos := AnsiPos('ADD(', UpperCase(lLine));
      if lPos <> 0 then
         Delete(lLine, 1, lPos + 4);

      //delete from the end   
      lPos := AnsiPos(');', UpperCase(lLine));
      if lPos <> 0 then
         Delete(lLine,lPos - 1, 3);

      mmoSQL.Lines[I] := lLine;
   end;   

end;

procedure TfrmDataEditor.btnSQLClick(Sender: TObject);
begin
   ToggleSQL;
end;

procedure TfrmDataEditor.btnSQLFavouritesClick(Sender: TObject);
var
   lSQLFavouritesForm : TdSQLFavourites;
begin
   lSQLFavouritesForm := TdSQLFavourites.Create(Self);
   try
      lSQLFavouritesForm.SetUp(mmoSQL.Text);
      if lSQLFavouritesForm.ShowModal = mrOk then
      begin
         mmoSQL.Text := mmoSQL.Text + #13#10 + lSQLFavouritesForm.GetSQL;
      end;
   finally
      FreeAndNil(lSQLFavouritesForm);
   end;
end;

procedure TfrmDataEditor.ToggleSQL;
begin
   fSelectHover := False;
   fUpdateHover := False;
   fInsertHover := False;
   fDeleteHover := False;
   fWhereHover := False;
   fGroupByHover := False;
   fOrderByHover := False;
   fJoinHover := False;
   if not fSQLEditorShowing then
   begin
      btnSQLFavourites.Enabled := FileExists('SMSDataEditor.ini');
      
      pnlSQL.BringToFront;
      mmoSQL.SetFocus;
   end
   else
      pnlSQL.SendToBack;
   fSQLEditorShowing := not fSQLEditorShowing;
end;

procedure TfrmDataEditor.tvServerListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   lSelectedNode : TTreeNode;
   lScreenPoint : TPoint;
begin
   lSelectedNode := tvServerList.Selected;
   if lSelectedNode = nil then Exit;

   if Button = mbLeft then
   begin
      //This triggers when filling the list but also when they click on a new item
      if (not fFillingServers) then
      begin
         if lSelectedNode.Parent = nil then  //1st level: clicked on a server
         begin
            ExpandServer(lSelectedNode, tvServerList, fServerName, fAlias);
         end
         else if Assigned(lSelectedNode.Parent) and
               (lSelectedNode.Parent.Parent = nil) then //2nd level: clicked on an alias
         begin
            ExpandAlias(lSelectedNode, tvServerList, fServerName, fAlias);
         end
         else if Assigned(lSelectedNode.Parent.Parent) and
            (lSelectedNode.Parent.Parent.Parent = nil) then //3rd level: clicked on 'Tables' for Nexus
         begin
            if (UpperCase(lSelectedNode.Text) = 'TABLES') then
               ExpandTables(lSelectedNode, tvServerList, fServerName, fAlias, True)
            else if (UpperCase(lSelectedNode.Text) = 'STORED PROCS') then
               ExpandStoredProcFunc(lSelectedNode, tvServerList, fServerName, fAlias)
            else if (UpperCase(lSelectedNode.Text) = 'TRIGGERS') then
               ExpandTriggers(lSelectedNode, tvServerList, fServerName, fAlias)
            else if (UpperCase(lSelectedNode.Text) = 'VIEWS') then
               ExpandViews(lSelectedNode, tvServerList, fServerName, fAlias)

         end;
      end;
   end
   else if Button = mbRight then
   begin
     Windows.GetCursorPos(lScreenPoint);
     if lSelectedNode.Parent = nil then  //clicked on a server
     begin
        //Can only create an alias locally
        poServer.Items[0].Enabled := (lSelectedNode.Text = 'Paradox') or (lSelectedNode.Text = 'NexusDB');
        poServer.Popup(lScreenPoint.x, lScreenPoint.y);
     end
     else if Assigned(lSelectedNode.Parent) and (lSelectedNode.Parent.Parent = nil) then //clicked on an alias
     begin
        //Can disconnect from this alias?
        poAlias.Items[1].Enabled := (lSelectedNode.Parent.Text = fServerName) and
           (lSelectedNode.Text = fAlias);
        //Can connect to this alias?   
        poAlias.Items[0].Enabled := not poAlias.Items[1].Enabled;
        if not (lSelectedNode.Text = 'Any') then
        begin
           poAlias.Items[2].Enabled := not poAlias.Items[1].Enabled;
           poAlias.Items[3].Enabled := not poAlias.Items[1].Enabled;
        end
        else
        begin
           poAlias.Items[2].Enabled := False;
           poAlias.Items[3].Enabled := False;
        end;
        poAlias.Popup(lScreenPoint.x, lScreenPoint.y);
     end
     else if Assigned(lSelectedNode.Parent.Parent.Parent) and
           (lSelectedNode.Parent.Parent.Parent.Parent = nil) and
           (UpperCase(lSelectedNode.Parent.Text) = 'TABLES') then //clicked on a table
     begin
        poTable.Items[1].Visible := gDBType = dtNexus; //Recover Table
        poTable.Popup(lScreenPoint.x, lScreenPoint.y);
     end;
   end;
end;

procedure TfrmDataEditor.tvServerListDblClick(Sender: TObject);
var
   P : TPoint;
   lNode : TTreeNode;
   HT : THitTests;
   lConnectForm : TdMSSQLConnect;
   lServer, lAlias, lUserName, lPassword : String;
   lSQL : string;

   function ConnectIfNecessary(aServer, aAlias : String) : Boolean;
   begin
      Result := True;

      if (aServer = 'MSSQL') and (aAlias = 'Any') then
      begin
         lConnectForm := TdMSSQLConnect.Create(Self);
         try
            lConnectForm.SetUp('', '', '', '');
            if lConnectForm.ShowModal = mrOk then
            begin
               lConnectForm.GetConnection(lServer, lAlias, lUserName, lPassword);
            end
            else
               Exit;
         finally
            FreeAndNil(lConnectForm);
         end;
      end
      else
      begin
         lServer := lNode.Parent.Text;
         lAlias := lNode.Text;
      end;

      if SetAlias(aAlias, aServer, lUserName, lPassword) then
      begin
         SetRegistry(fAlias, 'DEAlias');
         SetRegistry(fServerName, 'DEServerName');
         ShowRegistryPrompt;
      end
      else
         Result := False;
   end;
begin
   if tvServerList.Selected = nil then Exit;

   P := GetCursorPosForControl(tvServerList);
   HT := tvServerList.GetHitTestInfoAt(P.x, P.y);
   lNode := tvServerList.GetNodeAt(P.x, P.y);
   if (lNode <> nil) and ((htOnItem in HT) or (htOnIcon in HT)) then
   begin
      if lNode.Parent <> nil then  //didn't click on a server
      begin
         if lNode.Parent.Parent = nil then //clicked on an alias
         begin
            if (lNode.Parent.Text <> fServerName) or
               (lNode.Text <> fAlias) then
            begin
               if ConnectIfNecessary(lNode.Parent.Text, lNode.Text) then
               begin
                  cboTable.SetFocus;
                  tvServerList.Visible := False;
                  btnRegister.Visible  := False;
                  btnDatabase.Caption := 'Database';
               end;
            end;
         end
         else if (Uppercase(lNode.Text) <> 'TABLES') and
                 (Uppercase(lNode.Text) <> 'STORED PROCS') and
                 (Uppercase(lNode.Text) <> 'TRIGGERS') and
                 (Uppercase(lNode.Text) <> 'VIEWS') then
         begin
            if Uppercase(lNode.Parent.Text) = 'TABLES' then  //double clicked on a table
            begin
               if (lNode.Parent.Parent.Text = fAlias) or
                  ConnectIfNecessary(lNode.Parent.Parent.Parent.Text, lNode.Parent.Parent.Text) then
               begin
                  cboTable.Text := lNode.Text;
                  cboTable.SetFocus;
                  SetTable;
                  tvServerList.Visible := False;
                  btnRegister.Visible  := False;
                  btnDatabase.Caption := 'Database';
               end;
            end
            else if Uppercase(lNode.Parent.Text) = 'STORED PROCS' then  //double clicked on a store procedure
            begin
               //Put the stored proc in the SQL Editor and show the SQL panel
               if ConnectIfNecessary(lNode.Parent.Parent.Parent.Text, lNode.Parent.Parent.Text) then
               begin
                  lSQL := gDataBase.GetStoredProcSQL(lNode.Text);
                  if lSQL <> '' then
                  begin
                     btnClear.OnClick(Self);
                     mmoSQL.Text := lSQL;
                     if not fSQLEditorShowing then
                        ToggleSQL;
                     tvServerList.Visible := False;
                     btnRegister.Visible  := False;
                     btnDatabase.Caption := 'Database';
                  end
                  else
                  begin
                     ShowMessage('This stored procedure/function is empty');
                  end;
               end;
            end
            else if Uppercase(lNode.Parent.Text) = 'TRIGGERS' then  //double clicked on a store procedure
            begin
               //Put the trigger in the SQL Editor and show the SQL panel
               if ConnectIfNecessary(lNode.Parent.Parent.Parent.Text, lNode.Parent.Parent.Text) then
               begin
                  lSQL := gDataBase.GetTriggerSQL(lNode.Text);
                  if lSQL <> '' then
                  begin
                     btnClear.OnClick(Self);
                     mmoSQL.Text := lSQL;
                     if not fSQLEditorShowing then
                        ToggleSQL;
                     tvServerList.Visible := False;
                     btnRegister.Visible  := False;
                     btnDatabase.Caption := 'Database';
                  end
                  else
                  begin
                     ShowMessage('This trigger is empty');
                  end;
               end;
            end
            else if Uppercase(lNode.Parent.Text) = 'VIEWS' then  //double clicked on a store procedure
            begin
               //Put the view in the SQL Editor and show the SQL panel
               if ConnectIfNecessary(lNode.Parent.Parent.Parent.Text, lNode.Parent.Parent.Text) then
               begin
                  lSQL := gDataBase.GetViewSQL(lNode.Text);
                  if lSQL <> '' then
                  begin
                     btnClear.OnClick(Self);
                     mmoSQL.Text := lSQL;
                     if not fSQLEditorShowing then
                        ToggleSQL;
                     tvServerList.Visible := False;
                     btnRegister.Visible  := False;
                     btnDatabase.Caption := 'Database';
                  end
                  else
                  begin
                     ShowMessage('This view is empty');
                  end;
               end;
            end;
         end;
      end;
   end;
end;

procedure TfrmDataEditor.ShowRegistryPrompt;
var
   lRegistryPrompt : TdRegistryPrompt;
   lStore, lRegister, lMyRegisterCode, lMyStoreCode : string;
   lQry : ISQLQuery;
begin
   if Assigned(gDataBase) and (gDataBase.GetTableNames.IndexOf('nextnum') <> -1) then
   begin
      lQry := gDataBase.NewQuery;
      lQry.SQL.Add('select prefix from nextnum where code_name = ''sale_code''');

      try
         lQry.Open;
         if not lQry.eof then
         begin
            lStore := lQry.FieldByName('prefix').AsString;
            lRegister := lStore;
            Delete(lStore, 5, 2);
            Delete(lRegister, 1, 4);
            lMyStoreCode := GetRegistry('location_code', POS_DIRECTORY);
            lMyRegisterCode := GetRegistry('register_code', POS_DIRECTORY);

            //only show registry prompt if its different to registry values
            if (lStore <> lMyStoreCode) or (lRegister <> lMyRegisterCode) then
            begin
               lRegistryPrompt := TdRegistryPrompt.Create(Self);
               try
                  lRegistryPrompt.SetUp(lStore, lRegister, lMyStoreCode, lMyRegisterCode);
                  lRegistryPrompt.ShowModal;
               finally
                  FreeAndNil(lRegistryPrompt);
               end;
            end;
         end;
      finally
         lQry.Close;
         lQry := nil;
      end;
   end;
end;

procedure TfrmDataEditor.cboTableChange(Sender: TObject);
begin
   fTableSetByEnter := False;
end;

procedure TfrmDataEditor.cboTableExit(Sender: TObject);
begin
   if (not fTableSetByEnter) and Assigned(tab[pgTable.ActivePageIndex]) and
      (tab[pgTable.ActivePageIndex].TableName <> cboTable.Text) and
      (cboTable.Text <> Lowercase(CUSTOM_SQL)) then
      SetTable;
   fTableSetByEnter := False;
end;

procedure TfrmDataEditor.cboTableKeyPress(Sender: TObject; var Key: Char);
begin
   //cboTable.AutoDropDown := False;
   if Key = #13 then
   begin
      if not SetTable then
         cboTable.SetFocus
      else if Assigned(tab[pgTable.ActivePageIndex]) and tab[pgTable.ActivePageIndex].dSet.Active then
      begin
         fTableSetByEnter := True;
         if tab[pgTable.ActivePageIndex].TableName = 'smsconfig' then
         begin
            tab[pgTable.ActivePageIndex].Grid.SelectedIndex := 1;
            tab[pgTable.ActivePageIndex].Grid.FocusFilterBar;
         end
         else
            tab[pgTable.ActivePageIndex].Grid.SetFocus;
      end;
   end;
   //cboTable.AutoDropDown := True;
end;

function TfrmDataEditor.SetTable: Boolean;
var
   lTableHint : String;
   lTableName : String;
   lField : TField;
   lSelOptionsForm : TdSelectOptions;
   lTopRows : Integer;
   lNoLock : Boolean;
   lSQL : String;
   I : Integer;
begin
   Result := False;
   lTableHint := '';
   lTableName := Trim(cboTable.Text);

   if (lTableName <> '') and (cboTable.Items.IndexOf(lTableName) = -1) then
   begin
      ShowMessage('Table not found: ' + cboTable.Text);
      cboTable.SetFocus;
      Exit;
   end;

   if gDBType = dtMSSQL then
   begin
      lSelOptionsForm := TdSelectOptions.Create(Self);
      try
         lTopRows := 1000;
         lNoLock := True;
         lSelOptionsForm.SetUp(lTopRows, lNoLock);
         if lSelOptionsForm.ShowModal = mrOk then
         begin
            lSelOptionsForm.GetOptions(lTopRows, lNoLock);
         end
         else
            Exit;
      finally
         FreeAndNil(lSelOptionsForm);
      end;
   end;

   //Close whatever table was open before
   if Assigned(tab[pgTable.ActivePageIndex]) then
      FreeAndNil(tab[pgTable.ActivePageIndex]);

   pgTable.ActivePage.Caption := '';


   if lTableName <> '' then
   begin
      try
         if gDBType = dtMSSQL then
         begin
            if lNoLock then
               lSQL := 'SELECT TOP ' + IntToStr(lTopRows) + ' * FROM "' + lTableName + '" ' + WITH_NO_LOCK
            else
               lSQL := 'SELECT TOP ' + IntToStr(lTopRows) + ' * FROM "' + lTableName + '"';
         end
         else
         begin
            lSQL := 'SELECT * FROM "' + lTableName + '"';
         end;
         tab[pgTable.ActivePageIndex] := TTab.Create(gDataBase, Grids[pgTable.ActivePageIndex],
            rgFooter.ItemIndex, lTableName, lSQL, False);
         AssignDataSetEvents(pgTable.ActivePageIndex);
         dnTable.DataSource := tab[pgTable.ActivePageIndex].dSource;
         tab[pgTable.ActivePageIndex].dSet.Open;
         tab[pgTable.ActivePageIndex].ApplyIniSettingsToGrid;

         if gSettings.AutoFilterReg then
         begin
            lField := tab[pgTable.ActivePageIndex].dSet.FindField('register_code');
            if Assigned(lField) then
            begin
               tab[pgTable.ActivePageIndex].Grid.Columns[lField.Index].FilterValue := gMyRegisterCode;
               tab[pgTable.ActivePageIndex].Grid.ApplyFilter;
            end;
         end;

         if gSettings.AutoFilterLoc then
         begin
            lField := tab[pgTable.ActivePageIndex].dSet.FindField('store_code');
            if Assigned(lField) then
            begin
               tab[pgTable.ActivePageIndex].Grid.Columns[lField.Index].FilterValue := gMyStoreCode;
               tab[pgTable.ActivePageIndex].Grid.ApplyFilter;
            end
            else
            begin
               lField := tab[pgTable.ActivePageIndex].dSet.FindField('location_code');
               if Assigned(lField) then
               begin
                  tab[pgTable.ActivePageIndex].Grid.Columns[lField.Index].FilterValue := gMyStoreCode;
                  tab[pgTable.ActivePageIndex].Grid.ApplyFilter;
               end
            end;
         end;
         Result := True;
      except
         on E:Exception do
         begin
            FreeAndNil(tab[pgTable.ActivePageIndex]);
            Result := False;
            ShowMessage(E.Message);
         end;
      end;

      if Assigned(tab[pgTable.ActivePageIndex].dSet) then
      begin
         if lTableName = 'smsconfig' then
         begin
            tab[pgTable.ActivePageIndex].dSet.dataset.OnNewRecord := SMSConfigNewRecord;
            AttachConfigComboBox;
         end
         else
         begin
            tab[pgTable.ActivePageIndex].dSet.dataset.OnNewRecord := qryNewRecord;
         end;

         for I := 0 to tab[pgTable.ActivePageIndex].dSet.Fields.Count - 1 do
            tab[pgTable.ActivePageIndex].dSet.Fields[I].ReadOnly := False;
         pgTable.ActivePage.Caption := lTableName;
         tab[pgTable.ActivePageIndex].PopulateInfoFromDDL(rgFooter.ItemIndex = 0);
         mmoTableHint.Text := tab[pgTable.ActivePageIndex].Info;

         if rgFooter.ItemIndex <> 0 then
            tab[pgTable.ActivePageIndex].UpdateFooter(rgFooter.ItemIndex);
      end;
   end;

   EnableTableControls(Result);
end;

procedure TfrmDataEditor.AttachConfigComboBox;
var
   SMSIni : TIniFile;
   I, lPos : Integer;
   lConfig : String;
   lConfigs : TStringList;
begin
   cboConfigs.Items.Clear;
   SMSIni := TIniFile.Create(gAppPath + MAIN_INI);
   lConfigs := TStringList.Create;
   try
      SMSIni.ReadSectionValues('smsconfigs', lConfigs);
      for I := 0 to lConfigs.Count - 1 do
      begin
         lPos := AnsiPos('=', lConfigs[I]);
         lConfig := lConfigs[I];
         Delete(lConfig, 1, lPos);
         cboConfigs.Items.Add(lConfig);
      end;
      cboConfigs.DataSource := tab[pgTable.ActivePageIndex].dSource;
      cboConfigs.DataField := 'smsconfig_mnemonic';
      tab[pgTable.ActivePageIndex].Grid.OnColExit := SMSConfigColExit;
      tab[pgTable.ActivePageIndex].Grid.OnKeyPress := SMSConfigKeyPress;
      tab[pgTable.ActivePageIndex].Grid.OnDrawColumnCell := SMSConfigDrawColumnCell;
   finally
      SMSIni.Free;
      FreeAndNil(lConfigs);
   end;
end;

procedure TfrmDataEditor.SMSConfigDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

      if (gDBType <> dtParadox) and Column.Field.IsNull then
      begin
         lGrid.Canvas.Font.Color := clGray;
         lGrid.Canvas.FillRect(Rect);
         lGrid.Canvas.TextOut(Rect.Left + 2, Rect.top + 2, 'NULL');
         lDontDefaultDraw := True;
      end;

      if (gdFocused in State) and (Column.Field.FieldName = cboConfigs.DataField) then
      begin
         with cboConfigs do
         begin
            Left := Rect.Left + pgTable.Left + pgTable.ActivePage.Left+ lGrid.Left + 2;
            Top := Rect.Top + pgTable.Top + + pgTable.ActivePage.Top + lGrid.Top + 2;
            Width := Rect.Right - Rect.Left;
            Height := Rect.Bottom - Rect.Top;
            Visible := True;
         end;
      end;
   end;

   if not lDontDefaultDraw then
      lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmDataEditor.SMSConfigColExit(Sender : TObject);
begin
   if tab[pgTable.ActivePageIndex].Grid.SelectedField.FieldName = cboConfigs.DataField then
      cboConfigs.Visible := False;
end;

procedure TfrmDataEditor.SMSConfigKeyPress(Sender : TObject; var Key:Char);
begin
   if Key = Chr(9) then Exit;
   if tab[pgTable.ActivePageIndex].Grid.SelectedField.FieldName = cboConfigs.DataField then
   begin
      cboConfigs.SetFocus;
      SendMessage(cboConfigs.Handle, WM_CHAR, Word(Key), 0);
   end;
end;

procedure TfrmDataEditor.AssignDataSetEvents(aIndex : Integer);
begin
   tab[aIndex].dSet.dataset.OnNewRecord  := qryNewRecord;
   tab[aIndex].dSet.dataset.AfterOpen    := qryAfterOpen;
   tab[aIndex].dSet.dataset.AfterDelete  := qryRecalcFooter;
   tab[aIndex].dSet.dataset.AfterPost    := qryRecalcFooter;
   tab[aIndex].dSet.dataset.AfterRefresh := qryRecalcFooter;
   tab[aIndex].dSet.dataset.AfterScroll  := qryAfterScroll;
end;

procedure TfrmDataEditor.pgTableChange(Sender: TObject);
var
   lIsAlive : Boolean;
begin
   lIsAlive := Assigned(tab[pgTable.ActivePageIndex]) and tab[pgTable.ActivePageIndex].dSet.Active;
   EnableTableControls(lIsAlive);
   if lIsAlive then
   begin
      dnTable.DataSource := tab[pgTable.ActivePageIndex].Grid.DataSource;
      cboTable.Text := tab[pgTable.ActivePageIndex].TableName;
      mmoTableHint.Text := tab[pgTable.ActivePageIndex].Info;
      rgFooter.ItemIndex := tab[pgTable.ActivePageIndex].FooterType;
      btnRecordView.Enabled := tab[pgTable.ActivePageIndex].TableName <> CUSTOM_SQL;
      btnImport.Enabled := btnRecordView.Enabled;
      btnEmptyTable.Enabled := btnRecordView.Enabled;
      if tab[pgTable.ActivePageIndex].TableName = 'smsconfig' then
      begin
         tab[pgTable.ActivePageIndex].Grid.SelectedIndex := 1;
         tab[pgTable.ActivePageIndex].Grid.FocusFilterBar;
      end
      else
         tab[pgTable.ActivePageIndex].Grid.SetFocus;
   end
   else
   begin
      dnTable.DataSource := nil;
      cboTable.Text := '';
      mmoTableHint.Text := '';
      rgFooter.ItemIndex := 0;
      cboTable.SetFocus;
   end;
   SetRecordCount;
   if (not lIsAlive) or (tab[pgTable.ActivePageIndex].TableName <> 'smsconfig') then
      cboConfigs.Visible := False;
end;

procedure TfrmDataEditor.SetRecordCount;
begin
   if Assigned(tab[pgTable.ActivePageIndex]) then
   begin
      lblRecordCount.Caption := IntToStr(tab[pgTable.ActivePageIndex].dSet.RecordCount) + '/' + IntToStr(tab[pgTable.ActivePageIndex].RecordCount) + ' records'
   end
   else
      lblRecordCount.Caption := '';
end;

//***********************CLOSING TABS************************

procedure TfrmDataEditor.pgTableDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
   CloseBtnSize: Integer;
   PageControl: TPageControl;
   TabCaption: TPoint;
   CloseBtnRect: TRect;
   CloseBtnDrawState: Cardinal;
   CloseBtnDrawDetails: TThemedElementDetails;
begin
   PageControl := Control as TPageControl;

   if InRange(TabIndex, 0, Length(fCloseButtonsRect) - 1) then
   begin
      CloseBtnSize := 14;
      TabCaption.Y := Rect.Top + 3;

      if Active then
      begin
         CloseBtnRect.Top := Rect.Top + 4;
         CloseBtnRect.Right := Rect.Right - 5;
         TabCaption.X := Rect.Left + 6;
      end
      else
      begin
         CloseBtnRect.Top := Rect.Top + 3;
         CloseBtnRect.Right := Rect.Right - 5;
         TabCaption.X := Rect.Left + 3;
      end;

      CloseBtnRect.Bottom := CloseBtnRect.Top + CloseBtnSize;
      CloseBtnRect.Left := CloseBtnRect.Right - CloseBtnSize;
      fCloseButtonsRect[TabIndex] := CloseBtnRect;
      //Uncomment this after fixing the close tab bug
      PageControl.Canvas.FillRect(Rect);
      PageControl.Canvas.TextOut(TabCaption.X, TabCaption.Y, PageControl.Pages[TabIndex].Caption);

      if Assigned(tab[TabIndex]) then
      begin
         if not UseThemes then
         begin
            if (FCloseButtonMouseDownIndex = TabIndex) and FCloseButtonShowPushed then
               CloseBtnDrawState := DFCS_CAPTIONCLOSE + DFCS_PUSHED
            else
               CloseBtnDrawState := DFCS_CAPTIONCLOSE;

            Windows.DrawFrameControl(PageControl.Canvas.Handle,
               fCloseButtonsRect[TabIndex], DFC_CAPTION, CloseBtnDrawState);
         end
         else
         begin
            Dec(fCloseButtonsRect[TabIndex].Left);

            if (fCloseButtonMouseDownIndex = TabIndex) and fCloseButtonShowPushed then
               CloseBtnDrawDetails := ThemeServices.GetElementDetails(twCloseButtonPushed)
            else
               CloseBtnDrawDetails := ThemeServices.GetElementDetails(twCloseButtonNormal);

            ThemeServices.DrawElement(PageControl.Canvas.Handle, CloseBtnDrawDetails,
               fCloseButtonsRect[TabIndex]);
         end;
      end;
   end;
end;

procedure TfrmDataEditor.pgTableMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
//  I: Integer;
  PageControl: TPageControl;
begin
  PageControl := Sender as TPageControl;

  if Button = mbLeft then
  begin
//Uncomment this when close tab bug is fixed
//    for I := 0 to Length(fCloseButtonsRect) - 1 do
//    begin
//      if PtInRect(fCloseButtonsRect[I], Point(X, Y)) then
//      begin
//        fCloseButtonMouseDownIndex := I;
//        fCloseButtonShowPushed := True;
//        PageControl.Repaint;
//      end;
//    end;
  end;
end;

procedure TfrmDataEditor.pgTableMouseLeave(Sender: TObject);
var
  PageControl: TPageControl;
begin
  PageControl := Sender as TPageControl;
  fCloseButtonShowPushed := False;
  PageControl.Repaint;
end;

procedure TfrmDataEditor.pgTableMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  PageControl: TPageControl;
  Inside: Boolean;
begin
  PageControl := Sender as TPageControl;

  if (ssLeft in Shift) and (fCloseButtonMouseDownIndex >= 0) then
  begin
    Inside := PtInRect(fCloseButtonsRect[fCloseButtonMouseDownIndex], Point(X, Y));

    if fCloseButtonShowPushed <> Inside then
    begin
      fCloseButtonShowPushed := Inside;
      PageControl.Repaint;
    end;
  end;
end;

procedure TfrmDataEditor.pgTableMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  PageControl: TPageControl;
begin
  PageControl := Sender as TPageControl;

  if (Button = mbLeft) and (fCloseButtonMouseDownIndex >= 0) then
  begin
//Uncomment this when close tab bug is fixed  
//    if PtInRect(fCloseButtonsRect[fCloseButtonMouseDownIndex], Point(X, Y)) then
//    begin
//      CloseTab(fCloseButtonMouseDownIndex);
//
//      fCloseButtonMouseDownIndex := -1;
//      PageControl.Repaint;
//    end;
  end;
end;

//not used yet
procedure TfrmDataEditor.CloseAllButThisTab(aIndex : Integer);
var
   I : Integer;
begin
   for I := 0 to NO_OF_TABS - 1 do
   begin
      if I <> aIndex then
         CloseTab(I);
   end;
end;

procedure TfrmDataEditor.CloseTab(aIndex : Integer);
var
   I : Integer;
   lTempGrid : TSMDBGrid;
begin
   if Assigned(tab[aIndex]) then
   begin
      lTempGrid := tab[pgTable.ActivePageIndex].Grid;
      FreeAndNil(tab[aIndex]); //close and destroy the query

      //placing this tab on the end will shift all other page tabs down
      pgTable.Pages[aIndex].Caption := '';
      pgTable.Pages[aIndex].PageIndex := NO_OF_TABS - 1;

      //shift all the arrays down by 1, keeping the datasets open
      for I := aIndex to NO_OF_TABS - 2 do
      begin
         if Assigned(tab[I + 1]) then
         begin
            tab[I]    := tab[I + 1];
            Grids[I]  := Grids[I + 1];
         end
         else //reached the end of the assigned tabs
         begin
            pgTable.Pages[I].TabVisible := False;
            Grids[I]       := Grids[I + 1];
         end;
      end;

      //put
      Grids[NO_OF_TABS - 1]      := lTempGrid;

      if aIndex <> (NO_OF_TABS - 1) then
         pgTable.ActivePageIndex := aIndex + 1
      else
         pgTable.ActivePageIndex := aIndex - 1;
      pgTableChange(self);
   end;
end;

procedure TfrmDataEditor.EnableTableControls(Val : Boolean);
begin
  btnRecordView.Enabled := Val;
  btnLocate.Enabled     := Val;
  btnFilter.Enabled     := Val;
  btnImport.Enabled     := Val;
  btnExport.Enabled     := Val;
  btnEmptyTable.Enabled := Val;
  rgFooter.Enabled      := Val;
  btnInfo.Enabled       := Val;
  dnTable.Enabled       := Val;
end;

///////////////SQL Button Events/////////////////////

procedure TfrmDataEditor.btnSelectClick(Sender: TObject);
begin
   fSelectHover := True;
   SQLClick(SELECT_COLOR);
end;

procedure TfrmDataEditor.btnUpdateClick(Sender: TObject);
begin
   fUpdateHover := True;
   SQLClick(UPDATE_COLOR);
end;

procedure TfrmDataEditor.btnInsertClick(Sender: TObject);
var
   lInsertForm : TdInsertSQL;
   lInsertSQL : String;
begin
   lInsertForm := TdInsertSQL.Create(Self);
   try
      if Uppercase(cboTable.Text) <> CUSTOM_SQL then
         lInsertForm.SetUp(cboTable.Text)
      else
         lInsertForm.SetUp('');
      if lInsertForm.ShowModal = mrOk then
      begin
         lInsertForm.GetSQL(lInsertSQL);
         mmoSQL.Text := mmoSQL.Text + lInsertSQL;
      end;
   finally
      FreeAndNil(lInsertForm);
   end;

//   fInsertHover := True;
//   SQLClick(INSERT_COLOR);
end;

procedure TfrmDataEditor.btnDeleteClick(Sender: TObject);
begin
   fDeleteHover := True;
   SQLClick(DELETE_COLOR);
end;

procedure TfrmDataEditor.btnWhereClick(Sender: TObject);
begin
   fWhereHover := True;
   SQLClick(WHERE_COLOR);
end;

procedure TfrmDataEditor.btnGroupByClick(Sender: TObject);
begin
   fGroupByHover := True;
   SQLClick(GROUP_BY_COLOR);
end;

procedure TfrmDataEditor.btnOrderByClick(Sender: TObject);
begin
   fOrderByHover := True;
   SQLClick(ORDER_BY_COLOR);
end;

procedure TfrmDataEditor.btnJoinClick(Sender: TObject);
begin
   fJoinHover := True;
   SQLClick(JOIN_COLOR);
end;

procedure TfrmDataEditor.SQLCancel;
begin
   lblSQLConfirmCancel.Visible := False;
   fTypedSQLChange := False;
   mmoSQL.Text := fOrigSQL.Text;
   MoveSQLCursorTo(fOrigSQL.Cursor, mmoSQL);
   fTypedSQLChange := True;
   mmoSQL.Font.Color := clWindowText;
   fSelectHover := False;
   fUpdateHover := False;
   fInsertHover := False;
   fDeleteHover := False;
   fWhereHover := False;
   fGroupByHover := False;
   fOrderByHover := False;
   fJoinHover := False;
   cboSQLTables.Text := '';
   cboSQLTables.Visible := False;
   fSelectTablesPopUp := False;
   fUpdateTablesPopUp := False;
   fInsertTablesPopUp := False;
   fDeleteTablesPopUp := False;
   mmoSQL.SetFocus;   
end;

procedure TfrmDataEditor.SQLCommit;
begin
   lblSQLConfirmCancel.Visible := False;
   fOrigSQL.Cursor := mmoSQL.Cursor;
   fOrigSQL.Text := mmoSQL.Text;
   mmoSQL.Font.Color := clWindowText;
   fSelectHover := False;
   fUpdateHover := False;
   fInsertHover := False;
   fDeleteHover := False;
   fWhereHover := False;
   fGroupByHover := False;
   fOrderByHover := False;
   fJoinHover := False;
   cboSQLTables.Visible := False;
   cboSQLTables.SendToBack;
   fSelectTablesPopUp := False;
   fUpdateTablesPopUp := False;
   fInsertTablesPopUp := False;
   fDeleteTablesPopUp := False;
   mmoSQL.SetFocus;
end;

procedure TfrmDataEditor.SynCompletionProposal1AfterCodeCompletion(
  Sender: TObject; const Value: WideString; Shift: TShiftState; Index: Integer;
  EndToken: WideChar);
begin
   fJustSQLCompleted := True;
end;

procedure TfrmDataEditor.SynCompletionProposal1CodeCompletion(
  Sender: TObject; var Value: UnicodeString; Shift: TShiftState; Index: Integer;
  EndToken: WideChar);
var
   lCurrentSelText: UnicodeString;
begin
   lCurrentSelText := (Sender as TSynCompletionProposal).Editor.SelText;
   if UnicodeString('.') =
      Copy(lCurrentSelText, Length(lCurrentSelText), Length(lCurrentSelText)) then
   begin
      Value := lCurrentSelText + Value;
   end;
end;

procedure TfrmDataEditor.SQLClick(aColor : TColor);
var
   lSQL : TSQL;
begin
   lblSQLConfirmCancel.Visible := True;
   fTypedSQLChange := True;
   lSQL := GetProposedSQL('','');
   mmoSQL.Text := lSQL.Text;
   MoveSQLCursorTo(lSQL.Cursor, mmoSQL);
   fTypedSQLChange := False;
   //change font
   if fOrigSQL.Text <> mmoSQL.Text then
      mmoSQL.Font.Color := aColor
   else
      mmoSQL.Font.Color := clWindowText;
end;

procedure TfrmDataEditor.cboSQLTablesChange(Sender: TObject);
var
   lSQL : TSQL;
begin
   lSQL := GetProposedSQL('', cboSQLTables.Text);
   mmoSQL.Text := lSQL.Text;
   //MoveSQLCursorTo(lSQL.Cursor, mmoSQL);
end;

procedure TfrmDataEditor.cboSQLTablesExit(Sender: TObject);
begin
   SQLCancel;
end;

procedure TfrmDataEditor.cboSQLTablesKeyPress(Sender: TObject; var Key: Char);
var
   lSQL : TSQL;
   lSelectHover, lUpdateHover : Boolean;
begin
  if Key = #13 then //press enter
  begin
     lSQL := GetProposedSQL('', cboSQLTables.Text);
     mmoSQL.Text := lSQL.Text;
     MoveSQLCursorTo(lSQL.Cursor, mmoSQL);
     lSelectHover := fSelectHover;
     lUpdateHover := fUpdateHover;
     SQLCommit;
     if lSelectHover then
        btnSelectClick(self)
     else if lUpdateHover then
        btnUpdateClick(self);
  end;
end;

procedure TfrmDataEditor.mtbRecordValueChange(Sender: TField);
begin
   mtbRecordIsNull.Value := False;
end;

procedure TfrmDataEditor.PasteTimerTimer(Sender: TObject);
//var
//   lActiveTab : TTab;
begin
//   PasteTimer.Enabled := False;
//   if Assigned(lActiveTab) and (not lActiveTab.Grid.FilterIsEmpty) then
//      lActiveTab.Grid.ApplyFilter;
end;

function TfrmDataEditor.GetProposedSQL(aFieldChosen : String;
   aTableChosen : String) : TSQL;
var
   lSQLStrList : TStringList;
   lLineStrList : TStringList;
   lLastLineResult : String;
   lCursorResult : Integer;
   I : Integer;
   P : TPoint;
   lPosOfOrderBy : Integer;
   lTableNamesInSelectSQL : TStringList;
   lSelectPopUpPoint : TPoint;
   lFromPosition : Integer;
   lSQLBeforeFrom, lSQLAfterFrom : String;
   lQuotes : String;
   lFieldList, lAliases : TStringList;

   function GetActiveTable : String;
   begin
      Result := '';
      if Assigned(tab[pgTable.ActivePageIndex]) and
         (tab[pgTable.ActivePageIndex].TableName <> CUSTOM_SQL) then
         Result := tab[pgTable.ActivePageIndex].TableName;
   end;
begin
   Result.Text := '';
   lQuotes := '';
   lCursorResult := -1;
   lSQLStrList := TStringList.Create;
   try
      //put statements into stringlist
      SplitSQL(lSQLStrList, fOrigSQL.Text, ';', True);

      if Trim(lSQLStrList[lSQLStrList.Count - 1]) = '' then
      begin
         if fSelectHover or fSelectTablesPopUp then         
         begin
            if aTableChosen = '' then
            begin
               ShowSQLTableChooser(btnSelect.Left, btnSelect.Top);
               fSelectTablesPopUp := True;
               aTableChosen := GetActiveTable;
            end;

            lLastLineResult := DisplaySQL('SELECT  FROM ') + aTableChosen;
            lCursorResult := 7;
         end
         else if fUpdateHover  or fUpdateTablesPopUp then
         begin
            if aTableChosen = '' then
            begin
               ShowSQLTableChooser(btnUpdate.Left, btnUpdate.Top);
               fUpdateTablesPopUp := True;
               aTableChosen := GetActiveTable;
            end;

            lLastLineResult := DisplaySQL('UPDATE ') + aTableChosen + DisplaySQL(' SET ');
         end
         else if fInsertHover  or fInsertTablesPopUp then
         begin
            if aTableChosen = '' then
            begin
               ShowSQLTableChooser(btnInsert.Left, btnInsert.Top);
               fInsertTablesPopUp := True;
               aTableChosen := GetActiveTable;
            end;

            lLastLineResult := DisplaySQL('INSERT INTO ') + aTableChosen + ^M + DisplaySQL('VALUES');
         end
         else if fDeleteHover  or fDeleteTablesPopUp then
         begin
            if aTableChosen = '' then
            begin
               ShowSQLTableChooser(btnDelete.Left, btnDelete.Top);
               fDeleteTablesPopUp := True;
               aTableChosen := GetActiveTable;
            end;

            lLastLineResult := DisplaySQL('DELETE FROM ') + aTableChosen;
         end;
      end
      else
      begin
         lLineStrList := TStringList.Create;
         lAliases := TStringList.Create;
         try
            //put words of last statement into stringlist
            lLastLineResult := lSQLStrList[lSQLStrList.Count - 1];
            SplitSQL(lLineStrList, lLastLineResult, ' ', False);

            if fSelectHover or fSelectFieldsPopUp then
            begin
               if (lLineStrList.Count > 2) and (Uppercase(lLineStrList[0]) = 'SELECT') then
               begin
                  //find all tables in fOrigSQL after 'from' and 'join'

                  lTableNamesInSelectSQL := GetTableNames(lLastLineResult, lAliases);
                  try
                     if aFieldChosen = '' then
                     begin
                        for I := 0 to lTableNamesInSelectSQL.Count - 1 do
                        begin
                           //either a field popup is due or they already have fields
                           //populate fields from open table
                           lFieldList := TStringList.Create;
                           try
                              GetFields(lFieldList, lTableNamesInSelectSQL[I]);
                              if lFieldList.Count <> 0 then
                              begin
                                 if I = 0 then
                                 begin
                                    Windows.GetCursorPos(P);
                                    lSelectPopUpPoint := P;
                                 end
                                 else
                                 begin
                                    lSelectPopUpPoint.X := lSelectPopUpPoint.X + 50; //what is the pop up width?
                                 end;
                                 //problem, a new pop up menu must be created
                                 ShowFieldsPopUp(lFieldList, lSelectPopUpPoint, 'S');
                              end;
                           finally
                              FreeAndNil(lFieldList);
                           end;
                        end;
                     end
                     else //a field has been chosen from the pop up
                     begin
                        if (Uppercase(lLineStrList[1]) = 'FROM') then  //first field
                        begin
                           lLastLineResult := lLineStrList[0] + ' ' + aFieldChosen;
                           for I := 1 to lLineStrList.Count - 1 do
                               lLastLineResult := lLastLineResult + ' ' + lLineStrList[I];
                        end
                        else //at least one field exists
                        begin
                           //need position of 'from'
                           lFromPosition := GetIndexOfWord(lLineStrList, 'FROM');
                           lSQLBeforeFrom := 'SELECT';
                           for I := 1 to lFromPosition - 1 do
                              lSQLBeforeFrom := lSQLBeforeFrom + ' ' + lLineStrList[I];
                           lSQLAfterFrom := 'FROM';
                           for I := (lFromPosition + 1) to lLineStrList.Count - 1 do
                              lSQLAfterFrom := lSQLAfterFrom + ' ' + lLineStrList[I];

                           if AnsiPos(',', lLineStrList[lFromPosition-1]) = Length(lLineStrList[lFromPosition-1]) then
                               lLastLineResult := lSQLBeforeFrom + ' ' + aFieldChosen + ' ' + lSQLAfterFrom
                           else
                               lLastLineResult := lSQLBeforeFrom + ', ' + aFieldChosen + ' ' + lSQLAfterFrom;
                        end;
                     
                        fSelectFieldsPopUp := False;
                     end;   
                  finally
                     FreeAndNil(lTableNamesInSelectSQL);
                  end;
               end;
            end
            else if fUpdateHover or fUpdateFieldsPopUp then
            begin
               if (lLineStrList.Count > 2) and (Uppercase(lLineStrList[0]) = 'UPDATE') and (Uppercase(lLineStrList[2]) = 'SET') then
               begin
                  //either a field popup is due or they already have fields
                  //populate fields from open table
                  lFieldList := TStringList.Create;
                  try
                     GetFields(lFieldList, lLineStrList[1]);

                     if lFieldList.Count <> 0 then
                     begin
                        if aFieldChosen = '' then
                        begin
                           Windows.GetCursorPos(P);
                           ShowFieldsPopUp(lFieldList, P, 'U');
                        end
                        else //otherwise it means a field menuitem clicked
                        begin
                           //check if field is string
                           if qryDummy.FieldByName(aFieldChosen).DataType = ftString then
                              lQuotes := QuotedStr('');

                           //find position of 'where'


                           //check if there are fields already there
                           if AnsiPos('=', lLastLineResult) <> 0 then
                           begin
                              if AnsiPos(',', lLastLineResult) = Length(lLastLineResult) then
                                  lLastLineResult := lLastLineResult + aFieldChosen + ' = ' + lQuotes
                              else
                                  lLastLineResult := lLastLineResult + ', ' + aFieldChosen + ' = ' + lQuotes
                           end
                           else
                              lLastLineResult := lLastLineResult + aFieldChosen + ' = ' + lQuotes;
                           fUpdateFieldsPopUp := False;
                        end;
                     end;
                  finally
                     FreeAndNil(lFieldList);
                     qryDummy.Close;
                  end;
               end;
            end
            else if fWhereHover or fWhereFieldsPopUp then
            begin
               lFieldList := TStringList.Create;
               try
                  GetFields(lFieldList, GetTableName(Trim(lLastLineResult)));
                  if lFieldList.Count <> 0 then
                  begin
                     if aFieldChosen = '' then
                     begin
                        Windows.GetCursorPos(P);
                        ShowFieldsPopUp(lFieldList, P, 'W');
                     end
                     else //otherwise it means a field menuitem clicked
                     begin
                        if not (AnsiPos('WHERE', Uppercase(lLastLineResult)) <> 0) then
                        begin
                           lLastLineResult := Trim(lLastLineResult) + ^M + DisplaySQL('WHERE (') + aFieldChosen + ' )';
                        end
                        else
                        begin
                           lLastLineResult := Trim(lLastLineResult) + ^M + DisplaySQL('AND (') + aFieldChosen + ' )';
                        end;
                        lQuotes := 'something';
                        fWhereFieldsPopUp := False;
                     end;
                  end;
               finally
                  FreeAndNil(lFieldList);
                  qryDummy.Close;
               end;
            end
            else if fGroupByHover or fGroupByFieldsPopUp then
            begin
               lFieldList := TStringList.Create;
               try
                  GetFields(lFieldList, GetTableName(Trim(lLastLineResult)));
                  if lFieldList.Count <> 0 then
                  begin
                     if aFieldChosen = '' then
                     begin
                        Windows.GetCursorPos(P);
                        ShowFieldsPopUp(lFieldList, P, 'G');
                     end
                     else //otherwise it means a field menuitem clicked
                     begin
                        lPosOfOrderBy := AnsiPos('ORDER BY', Uppercase(lLastLineResult));
                        if lPosOfOrderBy <> 0 then
                        begin
                           //place 'group by' the line before 'order by'
                           //lLastLineResult :=
                        end
                        else
                        begin
                           if AnsiPos('GROUP BY', Uppercase(lLastLineResult)) <> 0 then
                           begin
                              lLastLineResult := Trim(lLastLineResult) + ', ' + aFieldChosen;
                           end
                           else
                           begin
                              lLastLineResult := Trim(lLastLineResult) + ^M + DisplaySQL('GROUP BY ') + aFieldChosen;
                           end;
                        end;
                        fGroupByFieldsPopUp := False;
                     end;

                  end;
               finally
                  FreeAndNil(lFieldList);
                  qryDummy.Close;
               end;
            end
            else if fOrderByHover or fOrderByFieldsPopUp then
            begin
               lFieldList := TStringList.Create;
               try
                  GetFields(lFieldList, GetTableName(Trim(lLastLineResult)));
                  if lFieldList.Count <> 0 then
                  begin
                     if aFieldChosen = '' then
                     begin
                        Windows.GetCursorPos(P);
                        ShowFieldsPopUp(lFieldList, P, 'O');
                     end
                     else //otherwise it means a field menuitem clicked
                     begin
                        if not (AnsiPos('ORDER BY', lLastLineResult) <> 0) then
                        begin
                           lLastLineResult := Trim(lLastLineResult) + ^M + DisplaySQL('ORDER BY ') + aFieldChosen;
                        end
                        else
                        begin
                           lLastLineResult := Trim(lLastLineResult) + ', ' + aFieldChosen;
                        end;

                        fOrderByFieldsPopUp := False;
                     end;

                  end;
               finally
                  FreeAndNil(lFieldList);
                  qryDummy.Close;
               end;

            end;
         finally
            FreeAndNil(lLineStrList);
            FreeAndNil(lAliases);
         end;         

      end;

      if lSQLStrList.Count > 1 then
         for I := 0 to lSQLStrList.Count - 2 do
             Result.Text := Result.Text + lSQLStrList[I] + ';' + ^M;
      if lLastLineResult <> '' then
         Result.Text := Result.Text + lLastLineResult
      else
         Result.Text := fOrigSQL.Text;

      if lQuotes <> '' then
         Result.Cursor := Length(Result.Text) - 1
      else if lCursorResult = -1 then
         Result.Cursor := Length(Result.Text)
      else
         Result.Cursor := lCursorResult;
   finally
      FreeAndNil(lSQLStrList);
   end;
end;

procedure TfrmDataEditor.ShowFieldsPopUp(aFieldList : TStringList; p : TPoint; aType : String);
var
   I : Integer;
   lMenuItem : TMenuItem;
begin
   poFields.Items.Clear;
   for I := 0 to aFieldList.Count - 1 do
   begin
       lMenuItem := TMenuItem.Create(nil);
       lMenuItem.Caption := aFieldList[I];
       lMenuItem.OnClick := FieldClickEvent;
       poFields.Items.Add(lMenuItem);
   end;
   if aType = 'S' then
      fSelectFieldsPopUp := True
   else if aType = 'U' then
      fUpdateFieldsPopUp := True
   else if aType = 'W' then
      fWhereFieldsPopUp := True
   else if aType = 'G' then
      fGroupByFieldsPopUp := True
   else if aType = 'O' then
      fOrderByFieldsPopUp := True;
   poFields.Popup(p.x - 5, p.y - 5);
   lblSQLConfirmCancel.Visible := True;
end;

procedure TfrmDataEditor.FieldClickEvent(Sender : TObject);
var
   lSQL : TSQL;
begin
   lSQL := GetProposedSQL((TMenuItem(Sender)).Caption, '');
   fTypedSQLChange := True;
   mmoSQL.Text := lSQL.Text;
   MoveSQLCursorTo(lSQL.Cursor, mmoSQL);
   SQLCommit;
end;

procedure TfrmDataEditor.ShowSQLTableChooser(x, y : Integer);
begin
   if Assigned(tab[pgTable.ActivePageIndex]) and
      tab[pgTable.ActivePageIndex].dSet.Active and
      (tab[pgTable.ActivePageIndex].TableName <> CUSTOM_SQL) then
      cboSQLTables.Text := tab[pgTable.ActivePageIndex].TableName
   else
      cboSQLTables.Text := '';
   cboSQLTables.Left := pnlSQL.Left + x;
   cboSQLTables.Top := pnlSQL.Top +y;
   cboSQLTables.Visible := True;
   cboSQLTables.BringToFront;
   cboSQLTables.SetFocus;
   cboSQLTables.SelectAll;
   lblSQLConfirmCancel.Visible := True;
end;

procedure TfrmDataEditor.tbFontChange(Sender: TObject);
begin
   //For this grid only, change the font size
   pgTable.Font.Size := tbFont.Position;
end;

procedure TfrmDataEditor.edtColumnValueExit(Sender: TObject);
begin
   edtColumnValue.Visible := False;
end;

procedure TfrmDataEditor.edtColumnValueKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then //esc
   begin
      Grids[pgTable.ActivePageIndex].SetFocus;
      edtColumnValue.Visible := False;
   end
   else if Key = #13 then //enter
   begin
      edtColumnValue.Visible := False;
      tab[pgTable.ActivePageIndex].SetFieldToValue(fFieldClicked.FieldName, edtColumnValue.Text);
   end;
end;

function TfrmDataEditor.GetTableIndex(aTableName : String) : Integer;
var
   I : Integer;
begin
   Result := -1;
   for I := 0 to NO_OF_TABS - 1 do
      if (tab[I].TableName = aTableName) and tab[I].IsTable then
      begin
          Result := I;
          break;
      end;
end;

procedure TfrmDataEditor.mmoSQLChange(Sender: TObject);
var
   lSQLStrList : TStringList;
   lLastLine : String;
   lSQLStartWithSelect : Boolean;
   lSQLStartWithUpdate : Boolean;
   lSQLStartWithInsert : Boolean;
   lSQLStartWithDelete : Boolean;
   lWordBeforeCursor : String;
   lWordAfterDot : String;
   lDotPos, lAliasIndex : Integer;
   lTableNames, lAliases : TStringList;
begin
   if fTypedSQLChange then
   begin
      mmoSQLFeedback.Text := '';
      lblTime.Caption := '';
      if mtbSQL.RecordCount > 0 then
         btnBack.Enabled := True;
      btnClear.Enabled := mmoSQL.Text <> '';
      fSQLJustChanged := True;

      //if the character after the cursor is whitespace
      //and the character before is not whitespace
      //then get the word before the cursor and use that
      //to filter the proposal
      SynCompletionProposal1.ItemList.Clear;

      if not fJustSQLCompleted then
      begin
         lWordBeforeCursor := GetWordBeforeCursor(mmoSQL);
         if lWordBeforeCursor <> '' then
         begin
            lDotPos := LastDelimiter('.', lWordBeforeCursor);
            if lDotPos <> 0 then
            begin
               lWordAfterDot := Copy(lWordBeforeCursor, lDotPos + 1, Length(lWordBeforeCursor) - lDotPos);
               Delete(lWordBeforeCursor, Length(lWordBeforeCursor), 1);

               lAliases := TStringList.Create;
               try
                  lTableNames := GetTableNames(Trim(mmoSQL.Text), lAliases);
                  lAliasIndex := lAliases.IndexOf(lWordBeforeCursor);
                  if lAliasIndex <> -1 then
                     AddFieldNamesToCompletionList(lWordAfterDot, lTableNames[lAliasIndex], SynCompletionProposal1)
                  else
                     AddFieldNamesToCompletionList(lWordAfterDot, lWordBeforeCursor, SynCompletionProposal1);
               finally
                  FreeAndNil(lAliases);
                  FreeAndNil(lTableNames);
               end;
            end
            else
            begin
               AddSQLKeywordsToCompletionList(lWordBeforeCursor, SynCompletionProposal1);
               AddTableNamesToCompletionList(lWordBeforeCursor, cboTable, SynCompletionProposal1);
               AddFieldNamesFromAllOpenTabs(lWordBeforeCursor, tab, SynCompletionProposal1);
               AddFieldNamesFromTablesInSQLAndAliases(lWordBeforeCursor, mmoSQL, SynCompletionProposal1);
            end;
            SynCompletionProposal1.ActivateCompletion;
         end
         else
            SynCompletionProposal1.CancelCompletion;
      end
      else
         SynCompletionProposal1.CancelCompletion;

      fJustSQLCompleted := False;   
   end;

   //determine whether buttons should be enabled and add field names from tables in sql
   lSQLStrList := TStringList.Create;
   try
      SplitSQL(lSQLStrList, mmoSQL.Text, ';', True);
      lLastLine := lSQLStrList[lSQLStrList.Count - 1]; //only concerned with the last sql statement
      if Trim(lLastLine) = '' then
      begin
         btnSelect.Enabled := True;
         btnUpdate.Enabled := True;
         btnInsert.Enabled := True;
         btnDelete.Enabled := True;
         btnWhere.Enabled := False;
         btnGroupBy.Enabled := False;
         btnOrderBy.Enabled := False;
         btnJoin.Enabled := False;
      end
      else if not cboSQLTables.Visible then
      begin
         btnWhere.Enabled := True;
         lSQLStartWithSelect := AnsiStartsStr('SELECT ', Uppercase(lLastLine));
         lSQLStartWithUpdate := AnsiStartsStr('UPDATE ', Uppercase(lLastLine));
         lSQLStartWithInsert := AnsiStartsStr('INSERT ', Uppercase(lLastLine));
         lSQLStartWithDelete := AnsiStartsStr('DELETE ', Uppercase(lLastLine));
         if lSQLStartWithSelect then
         begin
            btnUpdate.Enabled := False;
            btnInsert.Enabled := False;
            btnDelete.Enabled := False;
         end
         else if lSQLStartWithUpdate then
         begin
            btnSelect.Enabled := False;
            btnInsert.Enabled := False;
            btnDelete.Enabled := False;
         end
         else if lSQLStartWithInsert then
         begin
            btnSelect.Enabled := False;
            btnUpdate.Enabled := False;
            btnDelete.Enabled := False;
         end
         else if lSQLStartWithDelete then
         begin
            btnSelect.Enabled := False;
            btnUpdate.Enabled := False;
            btnInsert.Enabled := False;
         end;

         btnGroupBy.Enabled := lSQLStartWithSelect;
         btnOrderBy.Enabled := lSQLStartWithSelect;
         //btnJoin.Enabled := lSQLStartWithSelect;
      end
      else
      begin
         btnGroupBy.Enabled := False;
         btnGroupBy.Enabled := False;
         btnOrderBy.Enabled := False;
         //btnJoin.Enabled := False;
      end;
   finally
      FreeAndNil(lSQLStrList);
   end;
end;

procedure TfrmDataEditor.mmoSQLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_F5) then
   begin
      if btnExecute.Visible then
         btnExecuteClick(Self);
   end;
end;

procedure TfrmDataEditor.dbgTableMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
   tab[pgTable.ActivePageIndex].MouseScrollDown(fScrollLeftRight);
end;

procedure TfrmDataEditor.dbgTableMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
   tab[pgTable.ActivePageIndex].MouseScrollUp(fScrollLeftRight);
end;

procedure TfrmDataEditor.dbgTableFilterChanged(Sender: TObject);
begin
   RecalcFooter(pgTable.ActivePageIndex);
   SetRecordCount;
end;

procedure TfrmDataEditor.dbgTableMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbMiddle then
      fScrollLeftRight := not fScrollLeftRight;
end;

procedure TfrmDataEditor.dbgTableColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   fColMoved := True;
end;

function TfrmDataEditor.SetAlias(const aAlias, aServerName : String;
   aUserName : String = ''; aPassword : String = ''; aStartUp : Boolean = False) : Boolean;

   procedure EnableDBControls(aVal : Boolean);
   begin
      EnableTableControls(aVal);
      cboTable.Enabled    := aVal;
      btnSQL.Enabled      := aVal;
      btnSMSLinks.Enabled := aVal;
      btnConfigs.Enabled  := aVal;
   end;

   procedure CantConnect;
   begin
      fServerName := '';
      fAlias := '';
      lblServerName.Caption := '';
      lblAlias.Caption := '';
      if Assigned(qrySQL) then
         qrySQL := nil;
      if Assigned(qryDummy) then
         qryDummy := nil;
      EnableDBControls(False);
      gDataBase.Connected := False;
      gDataBase := nil;
      if not aStartUp then
         ShowMessage('Working Directory Not Found');
      Result := False;
   end;
begin
   Result := False;

   CloseAllDataSets;
   if Assigned(gDataBase) then
      gDataBase.Connected := False;
   gDataBase := nil; //set interface to nil to destroy previous database

   SetRecordCount;

   if not mtbSQL.Active then
      mtbSQL.Open;

   if aServerName = 'Paradox' then
   begin
      gDBType := dtParadox;
      gDataBase := TPDXDataBase.Create;
      lblServerName.Font.Color := clGreen;
      SynSQLSyn1.SQLDialect := sqlStandard;
   end
   else if (Uppercase(aServerName) = 'MSSQL') and (aAlias = 'Any') then //MS SQL
   begin
      gDBType := dtMSSQL;
      gDataBase := TDBEDataBase.Create;
      lblServerName.Font.Color := clRed;
      SynSQLSyn1.SQLDialect := sqlMSSQL2K;
   end
   else //nexus
   begin
      gDBType := dtNexus;
      gDataBase := TNexusDataBase.Create;
      lblServerName.Font.Color := clBlue;
      SynSQLSyn1.SQLDialect := sqlNexus;
      //if IsNexusServerNamePiped(aServerName) then
      //   gDataBase.UsePipedTransport;
   end;


   //SMS Tools is dangerous when connected to head office
   btnFunctions.Enabled := gDBType <> dtMSSQL;

   try
      gDataBase.ServerName := aServerName;
      gDataBase.AliasName := aAlias;
      if (gDBType = dtMSSQL) then
      begin
         gDataBase.UserName := aUserName;
         gDataBase.Password := aPassword;
      end;
      gDataBase.Timeout := 1000*StrToInt(gSettings.DBTimeout);
      gDataBase.Connected := True;

      if AddTablesToDropdown then
      begin
         if gDBType <> dtMSSQL then
         begin
            fServerName := aServerName;
            fAlias := aAlias;
         end
         else //choosing not to remember a MSSQL connection
         begin
            fServerName := '';
            fAlias := '';
         end;
         lblServerName.Caption := aServerName;
         lblAlias.Caption := aAlias;

         if Assigned(qrySQL) then
            qrySQL := nil;
         qrySQL := gDataBase.NewQuery;

         if Assigned(qryDummy) then
            qryDummy := nil;
         qryDummy := gDataBase.NewQuery;

         EnableDBControls(True);
         Result := True;
      end
      else
      begin
         CantConnect;
      end;
   except
      on E : EnxDataBaseError do
      begin
         CantConnect;
      end;
      on E : Exception do
      begin
         ShowMessage(E.Message);
      end;
   end;
end;

procedure TfrmDataEditor.GoIntoTransaction;
begin
   btnExecute.Visible := False;
   imgCommit.Visible := True;
   imgRollback.Visible := True;
   EnableTableControls(False);
   btnDataBase.Enabled := False;
   btnSQL.Enabled := False;
   btnOptions.Enabled := False;
   btnFunctions.Enabled := False;
   cboTable.Enabled := False;
   mmoSQL.Enabled := False;
   pgTable.Enabled := False;
   btnSMSLinks.Enabled := False;

   btnSelect.Enabled := False;
   btnUpdate.Enabled := False;
   btnInsert.Enabled := False;
   btnDelete.Enabled := False;
   btnWhere.Enabled := False;
   btnGroupBy.Enabled := False;
   btnOrderBy.Enabled := False;
   btnJoin.Enabled := False;
   btnBack.Enabled := False;
   btnForward.Enabled := False;
   btnClear.Enabled := False;
end;

procedure TfrmDataEditor.GoOutOfTransaction;
begin
   btnExecute.Visible := True;
   imgCommit.Visible := False;
   imgRollBack.Visible := False;
   EnableTableControls(True);
   btnDataBase.Enabled := True;
   btnSQL.Enabled := True;
   btnOptions.Enabled := True;
   btnFunctions.Enabled := True;
   cboTable.Enabled := True;
   mmoSQL.Enabled := True;
   pgTable.Enabled := True;
   btnSMSLinks.Enabled := True;

   mmoSQLChange(mmoSQL);
end;

procedure TfrmDataEditor.RollBack;
begin
   gDataBase.Rollback;
   if (gDBType = dtParadox) and tblSQL.Active then
   begin
      tblSQL.UnLockTable(ltWriteLock);
      tblSQL.Close;
   end;
   mtbSQL.Edit;
   mtbSQLFeedBack.AsString := mtbSQLFeedBack.AsString + 'Rolled back';
   mtbSQL.Post;
   mmoSQLFeedback.Text := mtbSQLFeedBack.AsString;
   GoOutOfTransaction;
end;

procedure TfrmDataEditor.Commit;
begin
   gDataBase.Commit;
   if (gDBType = dtParadox) and tblSQL.Active then
   begin
      tblSQL.UnLockTable(ltWriteLock);
      tblSQL.Close;
   end;
   GoOutOfTransaction;
   if gSettings.AutoRefresh then
   begin
      RefreshAllTables;
   end;
end;

procedure TfrmDataEditor.imgCommitClick(Sender: TObject);
var
   P : TPoint;
   x, y : Double;
   distSqr : Double;
begin
   P := GetCursorPosForControl(pnlSQL);
   x := imgCommit.Left + 0.5*imgCommit.Width;
   y := imgCommit.Top + 0.5*imgCommit.Height;

   distSqr := ((P.x - x)*(P.x - x)) + ((P.y - y)*(P.y - y));

   if (distSqr < (0.25*imgCommit.Width*imgCommit.Width)) then
   begin
      Commit;
   end;
end;

procedure TfrmDataEditor.imgRollbackClick(Sender: TObject);
var
   P : TPoint;
   x, y : Double;
   distSqr : Double;
begin
   P := GetCursorPosForControl(pnlSQL);
   x := imgRollback.Left + 0.5*imgRollback.Width;
   y := imgRollback.Top + 0.5*imgRollback.Height;

   distSqr := ((P.x - x)*(P.x - x)) + ((P.y - y)*(P.y - y));

   if (distSqr < (0.25*imgRollback.Width*imgRollback.Width)) then
   begin
      RollBack;
   end;
end;

procedure TfrmDataEditor.qryAfterScroll(DataSet: TDataSet);
begin
   if gSettings.ShowRows then
   begin
      if DataSet.RecNo > 99 then
      begin
         Grids[pgTable.ActivePageIndex].WidthOfIndicator := 26 +
            (7*Floor(Log10(DataSet.RecNo)) - 7);
      end
      else
         Grids[pgTable.ActivePageIndex].WidthOfIndicator := 26
   end;
end;

procedure TfrmDataEditor.qryAfterOpen(DataSet: TDataSet);
begin
   if (pgTable.ActivePageIndex <> pgTable.PageCount - 1) and (not pgTable.Pages[pgTable.ActivePageIndex + 1].TabVisible) then
      pgTable.Pages[pgTable.ActivePageIndex + 1].TabVisible := True;

   if gSettings.ShowRows then
      Grids[pgTable.ActivePageIndex].WidthOfIndicator := 26
   else
      Grids[pgTable.ActivePageIndex].WidthOfIndicator := 11;

   tab[pgTable.ActivePageIndex].RecordCount := DataSet.RecordCount;
   SetRecordCount;   
end;

procedure TfrmDataEditor.qryNewRecord(DataSet: TDataSet);
var
   lPrimaryKey, lTableName : string;
begin
   if (not fImporting) then
   begin
      //Auto generate PK
//      lPrimaryKey := tab[pgTable.ActivePageIndex].PrimaryKey;
//      lTableName  := tab[pgTable.ActivePageIndex].TableName;
//      if (lPrimaryKey <> '') and (lTableName <> '') then
//      begin
//         DataSet.FieldByName(lPrimaryKey).AsString := gDatabase.GetNextPrimaryKey(lTableName, lPrimaryKey);
//      end;

      if gSettings.NewRecView then
         btnRecordViewClick(Self);
   end;
end;

procedure TfrmDataEditor.SMSConfigNewRecord(DataSet: TDataSet);
begin
   if not fImporting then
   begin
      //Auto generate PK
      //DataSet.FieldByName('smsconfig_id').Value := gDatabase.GetNextPrimaryKey('smsconfig', 'smsconfig_id');
      DataSet.FieldByName('active_ind').Value   := 'Y';
      DataSet.FieldByName('level_ind').Value    := 'R';
      DataSet.FieldByName('level_code').Value   := GetRegistry('location_code', POS_DIRECTORY) + GetRegistry('register_code', POS_DIRECTORY);
      if gSettings.NewRecView then
         btnRecordViewClick(Self);
   end;
end;

function TfrmDataEditor.GetCursorPosForControl(aControl : TWinControl) : TPoint;
var
   P : TPoint;
begin
   Windows.GetCursorPos(P);
   Windows.ScreenToClient(aControl.Handle,P);
   Result := P;
end;

//**********************COLUMN POP UP***************************

procedure TfrmDataEditor.dbgTableTitleClick(Column: TColumn);
var
   lScreenPoint : TPoint;
   lGridPoint : TPoint;
begin
   if not fColMoved then
   begin
      Windows.GetCursorPos(lScreenPoint);
      lGridPoint := lScreenPoint;
      Windows.ScreenToClient(Column.Grid.Handle,lGridPoint);

      //Which field/column have they clicked?
      fFieldClicked := Column.Field;
      fColumnHint := tab[pgTable.ActivePageIndex].ColHint[fFieldClicked.Index];

      //Show column pop up
      if fFieldClicked.FieldName <> '' then
      begin
         poColumns.Items[3].Enabled := fColumnHint <> '';
         poColumns.Items[2].Caption := 'Set ' + fFieldClicked.FieldName + ' To...';
         poColumns.Popup(lScreenPoint.x, lScreenPoint.y);
      end;
   end
   else
      fColMoved := False;
end;

procedure TfrmDataEditor.DefineVisibleColumnsClick(Sender: TObject);
var
   lColumnVisibilityForm : TdColumnVisibility;
begin
   lColumnVisibilityForm := TdColumnVisibility.Create(Self);
   try
      if Uppercase(cboTable.Text) <> CUSTOM_SQL then
         lColumnVisibilityForm.SetUp(cboTable.Text)
      else
         lColumnVisibilityForm.SetUp('');
      lColumnVisibilityForm.ShowModal;
   finally
      FreeAndNil(lColumnVisibilityForm);
   end;

   tab[pgTable.ActivePageIndex].ApplyIniSettingsToGrid;
end;

procedure TfrmDataEditor.SortAscendingClick(Sender: TObject);
begin
   tab[pgTable.ActivePageIndex].Sort(fFieldClicked, 'asc');
end;

procedure TfrmDataEditor.SortDescendingClick(Sender: TObject);
begin
   tab[pgTable.ActivePageIndex].Sort(fFieldClicked, 'desc');
end;

procedure TfrmDataEditor.SetValueToClick(Sender: TObject);
begin
  //Show tedit next to the menuitem to put value
  edtColumnValue.Top := poColumns.PopupPoint.Y - 20;
  edtColumnValue.Left := poColumns.PopupPoint.X;
  edtColumnValue.Text := '';
  edtColumnValue.Visible := True;
  edtColumnValue.BringToFront;
  edtColumnValue.SetFocus;
end;

procedure TfrmDataEditor.miConnectClick(Sender: TObject);
var
   lAlias, lServerName, lUserName, lPassword : String;
   lConnectForm : TdMSSQLConnect;
begin
   lAlias := tvServerList.Selected.Text;
   lServerName := tvServerList.Selected.Parent.Text;
   if (lServerName <> fServerName) or
      (lAlias <> fAlias) then
   begin
      if (lServerName = 'MSSQL') and (lAlias = 'Any') then
      begin
         lConnectForm := TdMSSQLConnect.Create(Self);
         try
            lConnectForm.SetUp('192.168.5.29', 'RMS', 'dcm', 'rmsbravo');
            if lConnectForm.ShowModal = mrOk then
            begin
               lConnectForm.GetConnection(lServerName, lAlias, lUserName, lPassword);
            end
            else
               Exit;
         finally
            FreeAndNil(lConnectForm);
         end;
      end;

      if SetAlias(lAlias, lServerName, lUserName, lPassword) then
      begin
         SetRegistry(fAlias, 'DEAlias');
         SetRegistry(fServerName, 'DEServerName');
         cboTable.SetFocus;
         tvServerList.Visible := False;
         btnRegister.Visible  := False;
         btnDatabase.Caption := 'Database';

         ShowRegistryPrompt;
      end;
   end;
end;

function TfrmDataEditor.CreateEditAlias(aServerName : String; var aAlias : String;
   var aWorkingDirectory : String; aAliasFixed : Boolean = False) : Boolean;
var
   lCreateAliasForm : TdCreateAlias;
   lNexusDataBase : TNexusDataBase;
   ldbParadox : TDatabase;
begin
   Result := True;
   lCreateAliasForm := TdCreateAlias.Create(Self);
   try
      lCreateAliasForm.SetUp(aAlias, aWorkingDirectory, aAliasFixed);
      if lCreateAliasForm.ShowModal = mrOk then
      begin
         lCreateAliasForm.GetAlias(aAlias, aWorkingDirectory);
         //Set up a temporary database, create the alias
         if (AnsiPos('Paradox', aServerName) <> 0) then
         begin
            ldbParadox := TDatabase.Create(nil);
            try
               try
                  if ldbParadox.Session.IsAlias(aAlias) then
                  begin
                     ldbParadox.Session.DeleteAlias(aAlias);
                     ldbParadox.Session.SaveConfigFile;
                  end;
                  ldbParadox.Session.AddStandardAlias(aAlias, aWorkingDirectory, 'PARADOX');
                  ldbParadox.Session.SaveConfigFile;
               except
                  on E : Exception do
                  begin
                     Result := False;
                     ShowMessage(E.Message);
                  end;
               end;
            finally
               ldbParadox.Free;
            end;
         end
         else
         begin
            lNexusDataBase := TNexusDataBase.Create;
            try
               try
                  lNexusDataBase.ServerName := aServerName;
                  lNexusDataBase.Session.Active := True;
                  if lNexusDataBase.Session.IsAlias(aAlias) then
                  begin
                     lNexusDataBase.Session.DeleteAlias(aAlias);
                  end;
                  lNexusDataBase.Session.AddAlias(aAlias, aWorkingDirectory);
               except
                  on E : Exception do
                  begin
                     Result := False;
                     ShowMessage(E.Message);
                  end;
               end;
            finally
               FreeAndNil(lNexusDataBase);
            end;
         end;
      end
      else
         Result := False;
   finally
      FreeAndNil(lCreateAliasForm);
   end;
end;

procedure TfrmDataEditor.miCreateAliasClick(Sender: TObject);
var
   lServerName, lAlias, lWorkingDirectory : String;
   lNewNode : TTreeNode;
begin
   lServerName := tvServerList.Selected.Text;
   lAlias := '';
   lWorkingDirectory := '';
   if CreateEditAlias(lServerName, lAlias, lWorkingDirectory) then
   begin
      //add it to the treeview
      fFillingServers := True;
      tvServerList.ReadOnly := False;
      tvServerList.Items.BeginUpdate;

      lNewNode := tvServerList.Items.AddChild(tvServerList.Selected, lAlias);
      if AnsiPos('Paradox', lServerName) <> 0 then
      begin
         lNewNode.ImageIndex := 1;
         lNewNode.SelectedIndex := 1;
      end
      else
      begin
         lNewNode.ImageIndex := 0;
         lNewNode.SelectedIndex := 0;
      end;

      tvServerList.Items.EndUpdate;
      tvServerList.ReadOnly := True;
      fFillingServers := False;
   end;
end;

procedure TfrmDataEditor.miDeleteAliasClick(Sender: TObject);
var
   lAlias, lServerName : String;
   lNexusDataBase : TNexusDataBase;
   ldbParadox : TDatabase;
begin
   lAlias := tvServerList.Selected.Text;
   lServerName := tvServerList.Selected.Parent.Text;
   if AnsiPos('Paradox', lServerName) <> 0 then
   begin
      ldbParadox := TDatabase.Create(nil);
      try
         try
            ldbParadox.Session.DeleteAlias(lAlias);
            ldbParadox.Session.SaveConfigFile;
         except
            on E : Exception do
            begin
               ShowMessage(E.Message);
            end;
         end;
      finally
         ldbParadox.Free;
      end;
   end
   else
   begin
      lNexusDataBase := TNexusDataBase.Create;
      try
         try
            lNexusDataBase.ServerName := lServerName;
            lNexusDataBase.DeleteAlias(lAlias);
            //lNexusDataBase.Session.SaveConfigFile;
         except
            on E : Exception do
            begin
               ShowMessage(E.Message);
            end;
         end;
      finally
         FreeAndNil(lNexusDataBase);
      end;
   end;

   //remove it from the treeview
   fFillingServers := True;
   tvServerList.ReadOnly := False;
   tvServerList.Items.BeginUpdate;

   tvServerList.Items.Delete(tvServerList.Selected);

   tvServerList.Items.EndUpdate;
   tvServerList.ReadOnly := True;
   fFillingServers := False;
end;

procedure TfrmDataEditor.miDisconnectClick(Sender: TObject);
begin
   CloseAllDataSets;
   if Assigned(gDataBase) then
      gDataBase.Connected := False;
   gDataBase := nil;

   //Unbold the font on the alias
   tvServerList.SetBold(tvServerList.Selected, False);

   lblServerName.Caption := '';
   lblAlias.Caption := '';
   fAlias := '';
   fServerName := '';

   EnableTableControls(False);
   btnSMSLinks.Enabled := False;
   btnSQL.Enabled := False;
end;

procedure TfrmDataEditor.miHintClick(Sender: TObject);
begin
   ShowMessage(GetTableHint(tvServerList.Selected.Text, gSettings.SchemaDir));
end;

procedure TfrmDataEditor.miRecoverClick(Sender: TObject);
var
   lTable, lAlias, lServerName : string;
   lNexusDatabase : TNexusDatabase;
begin
   lTable := tvServerList.Selected.Text;
   lAlias := tvServerList.Selected.Parent.Text;
   lServerName := tvServerList.Selected.Parent.Parent.Text;

   lNexusDatabase := TNexusDatabase.Create;
   try
      try
         lNexusDatabase.ServerName := lServerName;
         lNexusDatabase.AliasName := lAlias;
         lNexusDatabase.Connected := True;
         lNexusDatabase.DB.RecoverTable(lTable, '');
         //This will create 2 extra tables TableName_Recovered and TableName_Failed
         ShowMessage('Tables ' + lTable + '_Recovered and ' + lTable + '_Failed have been created.' + ^M + 'You may need to restart the program to see them, sorry.')
      except
         on E : Exception do
         begin
            ShowMessage(E.Message);
         end;
      end;
   finally
      lNexusDatabase.Connected := False;
      lNexusDatabase.Free;
   end;

   //Show the new tables
   tvServerList.Selected.Parent.DeleteChildren;
   //#todo: Replace with left click
   //tvServerListChange(self, tvServerList.Selected.Parent);
end;

procedure TfrmDataEditor.miWorkingDirClick(Sender: TObject);
var
   lServerName, lAlias, lWorkingDirectory : String;
   lNexusDatabase : TNexusDatabase;
   lPDEDataBase : TPDXDataBase;
begin
   lServerName := tvServerList.Selected.Parent.Text;
   lAlias := tvServerList.Selected.Text;
   if (AnsiPos('NexusDB', lServerName) <> 0) then //nexus
   begin
//      lNexusDataBase := TNexusDataBase.Create;
//      try
//         lNexusDataBase.ServerName := lServerName;
//         lNexusDataBase.AliasName  := lAlias;
//         lNexusDataBase.Connected := True;
//         lWorkingDirectory := lNexusDataBase.DatabaseDir;
//      finally
//         lNexusDataBase.Connected := False;
//         lNexusDataBase.Free;
//      end;
   end
   else if (AnsiPos('Paradox', lServerName) <> 0) then //nexus
   begin
      lPDEDataBase := TPDXDataBase.Create;
      try
         lPDEDataBase.ServerName := lServerName;
         lPDEDataBase.AliasName  := lAlias;
         lPDEDataBase.Connected := True;
         lWorkingDirectory := lPDEDataBase.Directory;
      finally
         lPDEDataBase.Connected := False;
         lPDEDataBase.Free;
      end;
   end;

   if CreateEditAlias(lServerName, lAlias, lWorkingDirectory, True) then
   begin
      //
   end;
end;

procedure TfrmDataEditor.HideColumnClick(Sender: TObject);
var
   PersonalIni : TIniFile;
begin
   tab[pgTable.ActivePageIndex].Grid.Columns[fFieldClicked.Index].Visible := False;
   
   if tab[pgTable.ActivePageIndex].TableName <> CUSTOM_SQL then
   begin
      PersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);
      PersonalIni.WriteString(tab[pgTable.ActivePageIndex].TableName, fFieldClicked.FieldName, 'N');
   end;
end;

procedure TfrmDataEditor.HintClick(Sender: TObject);
begin
   ShowMessage(fColumnHint);
end;

procedure TfrmDataEditor.btnSMSLinksClick(Sender: TObject);
var
   lSMSLinks : TdSMSLinks;
   lDefaultCodes : array of String;
   lUseRegistry : Boolean;
   lQry : ISQLQuery;
   I : Integer;
begin
   lUseRegistry := True;
   SetLength(lDefaultCodes, 16);
   for I := 0 to Length(lDefaultCodes) - 1 do
      lDefaultCodes[I] := '';

   if Assigned(tab[pgTable.ActivePageIndex]) then
   begin
      lQry := tab[pgTable.ActivePageIndex].dSet;

      if lQry.Active then
      begin
         lUseRegistry := True;
         if Assigned(lQry.FindField('sale_code')) then
         begin
            lDefaultCodes[0] := lQry.FieldByName('sale_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('itemcoloursize_id')) then
         begin
            lDefaultCodes[1] := lQry.FieldByName('itemcoloursize_id').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('itemcolour_id')) then
         begin
            lDefaultCodes[2] := lQry.FieldByName('itemcolour_id').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('item_code')) then
         begin
            lDefaultCodes[3] := lQry.FieldByName('item_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('grn_code')) then
         begin
            lDefaultCodes[4] := lQry.FieldByName('grn_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('locmove_code')) then
         begin
            lDefaultCodes[5] := lQry.FieldByName('locmove_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('stocktake_code')) then
         begin
            lDefaultCodes[6] := lQry.FieldByName('stocktake_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('virtualdrawer_code')) then
         begin
            lDefaultCodes[7] := lQry.FieldByName('virtualdrawer_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('promotion_code')) then
         begin
            lDefaultCodes[8] := lQry.FieldByName('promotion_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('location_code')) then
         begin
            lDefaultCodes[9] := lQry.FieldByName('location_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('store_code')) then
         begin
            lDefaultCodes[9] := lQry.FieldByName('store_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('remediuser_code')) then
         begin
            lDefaultCodes[10] := lQry.FieldByName('remediuser_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('employee_id')) then
         begin
            lDefaultCodes[11] := lQry.FieldByName('employee_id').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('customer_id')) then
         begin
            lDefaultCodes[12] := lQry.FieldByName('customer_id').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('layby_code')) then
         begin
            lDefaultCodes[13] := lQry.FieldByName('layby_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('layby_id')) then
         begin
            lDefaultCodes[13] := lQry.FieldByName('layby_id').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('bankdeposit_code')) then
         begin
            lDefaultCodes[14] := lQry.FieldByName('bankdeposit_code').AsString;
            lUseRegistry := False;
         end;
         if Assigned(lQry.FindField('adjustment_code')) then
         begin
            lDefaultCodes[15] := lQry.FieldByName('adjustment_code').AsString;
            lUseRegistry := False;
         end;
         //new master tab
      end
      else
         lUseRegistry := True;
   end;

   lSMSLinks := TdSMSLinks.Create(Self);
   try
      lSMSLinks.SetUp(lUseRegistry,
         lDefaultCodes, pgTable.Font.Size);
      lSMSLinks.ShowModal;
   finally
      FreeAndNil(lSMSLinks);
   end;
end;

procedure TfrmDataEditor.btnDataGenieClick(Sender: TObject);
var
   lDataGenie : TdDataGenie;
   lTableNames : TStringList;
begin
   lTableNames := TStringList.Create;
   lDataGenie := TdDataGenie.Create(Self);
   try
      lTableNames := gDataBase.GetTableNames;
      lDataGenie.SetUp(lTableNames);  //lTableNames is freed inside
      lDataGenie.ShowModal;
   finally
      FreeAndNil(lDataGenie);
      FreeAndNil(lTableNames);
   end;
end;

procedure TfrmDataEditor.ToggleInfo;
begin
   if not fInfoShowing then
   begin
      pnlInfo.BringToFront;
   end
   else
      pnlInfo.SendToBack;
   fInfoShowing := not fInfoShowing;
end;

procedure TfrmDataEditor.rgFooterClick(Sender: TObject);
begin
   if Assigned(tab[pgTable.ActivePageIndex]) then
      tab[pgTable.ActivePageIndex].UpdateFooter(rgFooter.ItemIndex);
end;

procedure TfrmDataEditor.btnEmptyTableClick(Sender: TObject);
var
   lPassword : String;
begin
  if Assigned(tab[pgTable.ActivePageIndex]) and
     tab[pgTable.ActivePageIndex].dSet.Active and
     (tab[pgTable.ActivePageIndex].TableName <> CUSTOM_SQL) then
  begin
     lPassword := InputBox('Empty Table', 'Enter the password to empty the ' + tab[pgTable.ActivePageIndex].TableName + ' table?', '');
     if lPassword = EMPTY_TABLE_PASSWORD then
     begin
        qrySQL.SQL.Clear;
        qrySQL.SQL.Add('delete from "' + tab[pgTable.ActivePageIndex].TableName + '"');
        qrySQL.ExecSQL;
        tab[pgTable.ActivePageIndex].dSet.Refresh;
     end;
  end;
end;

procedure TfrmDataEditor.btnOptionsClick(Sender: TObject);
var
   lSettings : TdSettings;
begin
   lSettings := TdSettings.Create(Self);
   try
      lSettings.LoadSettings;
      lSettings.ShowModal;
      lSettings.SetSettings;
      ApplySettings;
   finally
      FreeAndNil(lSettings);
   end;
end;

//Called in the FormCreate after loading the settings
//and also after they exit the Options form
procedure TfrmDataEditor.ApplySettings;
var
   I : Integer;
begin
   if Assigned(gDatabase) then
      gDatabase.Timeout := 1000*StrToInt(gSettings.DBTimeout);

   for I := 0 to Length(Grids) - 1 do
   begin
      if Assigned(tab[I]) then
         tab[I].ApplySettings;
   end;

   Self.Color := gSettings.ColBackGround;
   Self.Repaint;
end;

procedure TfrmDataEditor.qryRecalcFooter(DataSet: TDataSet);
   function GetQueryIndex : Integer;
   var
      I : Integer;
   begin
      Result := -1;
      for I := 0 to NO_OF_TABS - 1 do
      begin
         if tab[I].dSet.dataSet.Name = DataSet.Name then
         begin
            Result := I;
            break;
         end;
      end;
   end;
begin
   RecalcFooter(GetQueryIndex);
   SetRecordCount;
end;

procedure TfrmDataEditor.RecalcFooter(aPageIndex : Integer);
begin
   if not fImporting then
   begin
      if rgFooter.ItemIndex <> 0 then
         tab[aPageIndex].Grid.CalculateTotals;
   end;
end;

procedure TfrmDataEditor.btnTaskClick(Sender: TObject);
var
   lFileName : string;
begin
   lFileName := gAppPath + 'TaskList.exe';
   ShellExecute(Handle, 'open', PChar(lFileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmDataEditor.btnCallListClick(Sender: TObject);
var
   lFileName : string;
begin
   lFileName := gAppPath + 'RDCallList\RDCallList.exe';
   ShellExecute(Handle, 'open', PChar(lFileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmDataEditor.CloseAllDataSets;
var
   I : Integer;
begin
   for I := 0 to NO_OF_TABS - 1 do
   begin
      if Assigned(tab[I]) then
         FreeAndNil(tab[I]);
      pgTable.Pages[I].Caption := '';
      if I > 0 then
         pgTable.Pages[I].TabVisible := False;
   end;

   cboTable.Text := '';
   cboTable.Enabled := False;

   if Assigned(qrySQL) then
      qrySQL.SQL.Clear;
end;

procedure TfrmDataEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   try
      if Assigned(gDataBase) and gDataBase.InTransaction then
         gDataBase.RollBack;
   except
      // do nothing
   end;

   if Assigned(tab[pgTable.ActivePageIndex]) and
      tab[pgTable.ActivePageIndex].dSet.Active and
      (Uppercase(tab[pgTable.ActivePageIndex].TableName) <> CUSTOM_SQL) then
      SetRegistry(Lowercase(tab[pgTable.ActivePageIndex].TableName), 'DETable')
   else
      SetRegistry('', 'DETable');
   SetRegistry(IntToStr(tbFont.Position), 'DEFont');
   SetRegistry(fServerName, 'DEServerName');
   SetRegistry(fAlias, 'DEAlias');

   CloseAllDataSets;
   mtbSQL.Close;
   if Assigned(qrySQL) then
      qrySQL := nil;
   if Assigned(qryDummy) then
      qryDummy := nil;
   FreeAndNil(fTablesAffected);
end;

end.
