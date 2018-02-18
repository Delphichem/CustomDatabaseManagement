unit udCalls;
{
  May 2016 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, StdCtrls, ufDBEDatabase, DB, kbmMemTable,
  DBCGrids, Mask, DBCtrls, ExtCtrls, ComCtrls, ufISQLQuery, Menus;

type
  THackDBGrid = class(TSMDBGrid);

  TdCalls = class(TForm)
    dbgCalls: TSMDBGrid;
    btnRefresh: TButton;
    mtbCalls: TkbmMemTable;
    dsCalls: TDataSource;
    ctrlCallAction: TDBCtrlGrid;
    dsCallAction: TDataSource;
    mtbCallAction: TkbmMemTable;
    btnCallFolder: TButton;
    btnLastEmail: TButton;
    mmoDescription: TMemo;
    mtbCallscustomer_code: TStringField;
    mtbCallsdescription: TStringField;
    mtbCallscalltype_code: TStringField;
    mtbCallspriority: TIntegerField;
    mtbCallsrecorded_date_time: TDateTimeField;
    mtbCallssystem_ref: TStringField;
    mtbCallslast_callactiontype_code: TStringField;
    mtbCallspayroll_id: TStringField;
    mtbCallscall_code: TStringField;
    mtbCallActionaction_datetime: TDateTimeField;
    mtbCallActioncallactiontype_code: TStringField;
    mtbCallActionaction_details: TStringField;
    mtbCallActionacted_by: TStringField;
    mtbCallActionrefer_to: TStringField;
    mtbCallActiondescription: TStringField;
    mtbCallscall_details: TStringField;
    mtbCallscall_resolution: TStringField;
    mmoResolution: TMemo;
    mtbCallsfeedback_value: TStringField;
    cbClosed: TCheckBox;
    edtCall: TLabeledEdit;
    cboAssigned: TComboBox;
    lblDetails: TLabel;
    lblResolution: TLabel;
    mtbCallstotal_time: TFloatField;
    cboClient: TComboBox;
    cboPriority: TComboBox;
    cboStatus: TComboBox;
    mmoCallA: TMemo;
    mtbCallslast_action: TDateTimeField;
    mtbCallsrelease_mnemonic: TStringField;
    mtbCallscontact: TStringField;
    mtbCallsresolved_in_call_code: TStringField;
    cboCallType: TComboBox;
    btnClientDetails: TButton;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    lblTo: TLabel;
    pnlCallList: TPanel;
    pnlCallActions: TPanel;
    dbtxtActionDate: TDBText;
    dbtxtActionedBy: TDBText;
    dbtxtReferredTo: TDBText;
    btnFTP: TButton;
    poColumns: TPopupMenu;
    miSortAscending: TMenuItem;
    miSortDescending: TMenuItem;
    pnlProgress: TPanel;
    lblProgress: TLabel;
    pbProgress: TProgressBar;
    btnTimesheets: TButton;
    mtbCallsemail: TStringField;
    mtbCallsfirstname: TStringField;
    dbmmoCallActions: TDBMemo;
    lblActionedBy: TLabel;
    lbl1: TLabel;
    btnStats: TButton;
    mtbCallstask_number: TStringField;
    cbTSTOnly: TCheckBox;
    cbEmailDesc: TCheckBox;
    btnExcel: TButton;
    mtbCallscustomer_call_ref: TStringField;
    mtbCallsaccount_manager: TStringField;
    mtbCallsphone_number: TStringField;
    lblClient: TLabel;
    lblPriority: TLabel;
    lblAssigned: TLabel;
    lblStatus: TLabel;
    lblCallType: TLabel;
    cboSystem: TComboBox;
    lblSystem: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnLastEmailClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure fQueryAfterScroll(DataSet: TDataSet);
    procedure btnCallFolderClick(Sender: TObject);
    procedure dbgCallsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCallKeyPress(Sender: TObject; var Key: Char);
    procedure mmoDescriptionExit(Sender: TObject);
    procedure mmoDescriptionMouseLeave(Sender: TObject);
    procedure mmoResolutionExit(Sender: TObject);
    procedure mmoResolutionMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cboAssignedChange(Sender: TObject);
    procedure mmoDescriptionMouseEnter(Sender: TObject);
    procedure mmoResolutionMouseEnter(Sender: TObject);
    procedure cboClientChange(Sender: TObject);
    procedure fQuerypriorityGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure mmoCallAMouseLeave(Sender: TObject);
    procedure dbmmoCallActionMouseEnter(Sender: TObject);
    procedure cboPriorityChange(Sender: TObject);
    procedure cboStatusChange(Sender: TObject);
    procedure fQueryrecorded_date_timeGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure fQuerylast_actionGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cboCallTypeChange(Sender: TObject);
    procedure pnlCallListMouseEnter(Sender: TObject);
    procedure pnlCallActionsMouseEnter(Sender: TObject);
    procedure ctrlCallActionMouseEnter(Sender: TObject);
    procedure dbgCallsMouseEnter(Sender: TObject);
    procedure dbgCallsColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure btnClientDetailsClick(Sender: TObject);
    procedure btnFTPClick(Sender: TObject);
    procedure dbgCallsTitleClick(Column: TColumn);
    procedure miSortAscendingClick(Sender: TObject);
    procedure miSortDescendingClick(Sender: TObject);
    procedure btnTimesheetsClick(Sender: TObject);
    procedure dbgCallsFilterApply(Sender: TObject; Field: TField;
      const FilterString: string; var Accept: Boolean);
    procedure dbgCallsFilterChanged(Sender: TObject);
    procedure dbmmoCallActionsClick(Sender: TObject);
    procedure mmoDescriptionClick(Sender: TObject);
    procedure mmoResolutionClick(Sender: TObject);
    procedure btnStatsClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure cbEmailDescClick(Sender: TObject);
    procedure cboSystemChange(Sender: TObject);
  private
    fRefreshing, fColMoved : Boolean;
    fDB : TDBEDatabase;
    fQuery : ISQLQuery;
    fDescriptionH, fResolutionH : Integer;
    fFieldClicked : TField;
    procedure Refresh(aCall : string = '');
    function  SetupDevConnection : Boolean;
    procedure PopulateCallActions;
    procedure ShowCallFolder(aCall: string; aDesc : String);
    procedure OpenLastEmail(aCall: string; aDesc : String);
    function  FindMakeCallFolder(aCall: String; aDesc : String): string;
    procedure ExpandMemo(aMemo: TMemo; aOrigHeight: Integer);
    procedure ExpandCallAction(aMemo: TDBMemo);
    procedure RepositionControls;
    procedure FillDropdowns;
    procedure ShowCallActions;
    procedure ShowCallList;
    function  FindColIndex(aFieldName: String): Integer;
    procedure HideProgress;
    procedure ShowProgress;
    procedure UpdateFooter;
    function  GetEarliestOpenCallDate: TDateTime;
    procedure ExportQuery(aQry: TDataset; aGrid: TSMDBGrid; aFileName : String);
  public

  end;

var
  dCalls: TdCalls;

implementation

uses
   IniFiles, ShellAPI, StrUtils, Math, udWhoAmI, udTimesheets, udStats, uuGlobals,
  udExport;

{$R *.dfm}

//////////////////////START UP///////////////////////

procedure TdCalls.FormCreate(Sender: TObject);
   procedure ReadIni;
   var
      RDCallsIni : TIniFile;
      lUser : String;
      lCount : Integer;
   begin
      RDCallsIni := TIniFile.Create(gAppPath + RDCALLLIST_INI);
      try
         gPayrollId    := RDCallsIni.ReadString('General', 'PayrollId', '');
         gCallFolder   := RDCallsIni.ReadString('General', 'CallFolder', '');
         gServiceDesk  := RDCallsIni.ReadString('General', 'ServiceDesk', '');
         gServerName   := RDCallsIni.ReadString('RDHeadOffice', 'Server', '');
         gAliasName    := RDCallsIni.ReadString('RDHeadOffice', 'AliasName', '');
         gUserName     := RDCallsIni.ReadString('RDHeadOffice', 'Username', '');
         gPassword     := RDCallsIni.ReadString('RDHeadOffice', 'Password', '');
         gClientDetailsFolder := RDCallsIni.ReadString('ClientDetails', 'Folder', '');
         gFTPFolder    := RDCallsIni.ReadString('FTP', 'Folder', '');

         if Assigned(gTSTUsers) then
            FreeAndNil(gTSTUsers);
         gTSTUsers     := TStringList.Create;
         lUser := 'XXX';
         lCount := 1;
         while lUser <> '' do
         begin
            lUser := RDCallsIni.ReadString('TST', 'T' + IntToStr(lCount), '');
            if lUser <> '' then
               gTSTUsers.Add(lUser);
            Inc(lCount);
         end;
      finally
         RDCallsIni.Free;
      end;
   end;
begin
   pnlProgress.Visible := False;
   mtbCalls.ReadOnly := True;
   fColMoved := False;
   fFieldClicked := nil;
   fRefreshing := False;
   cbClosed.Checked := False;
   gAppPath := ExtractFilePath(ParamStr(0));
   gWin7 := CheckWin32Version(6,1); //Windows 7 or higher
   ReadIni;
   dtpFrom.Date := GetEarliestOpenCallDate;
   dtpTo.Date   := Date + 1;
end;

function TdCalls.GetEarliestOpenCallDate : TDateTime;
var
   lQuery : ISQLQuery;
begin
   Result := Date - 172; //Default to 9 months ago
   if not SetupDevConnection then Exit;

   try
      lQuery := fDB.NewQuery;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('select min(c.recorded_date_time) as mindate from call c (nolock)');
      lQuery.SQL.Add(' where (c.last_callactiontype_code <> ''CLOSED'')');
      try
         lQuery.Open;
         if not lQuery.eof then
         begin
            Result := lQuery.FieldByName('mindate').AsDateTime - 1;
         end;
      finally
         lQuery.Close;
      end;
   finally
      lQuery := nil;
   end;
end;

procedure TdCalls.FormActivate(Sender: TObject);
var
   lWhoAmI : TdWhoAmI;
   RDCallsIni : TIniFile;
begin
   RepositionControls;
   FillDropdowns;
   Refresh;
   if (gPayrollId = '') and Assigned(fDB) and fDB.Connected then
   begin
      lWhoAmI := TdWhoAmI.Create(nil);
      try
         lWhoAmI.SetUp(fDB);
         if lWhoAmI.ShowModal = mrOk then
         begin
            gPayrollId := lWhoAmI.PayrollId;
            if gPayrollId <> '' then
            begin
               RDCallsIni := TIniFile.Create(gAppPath + RDCALLLIST_INI);
               try
                  RDCallsIni.WriteString('General', 'PayrollId', gPayrollId);
               finally
                  RDCallsIni.Free;
               end;
            end;
         end;
      finally
         lWhoAmI.Free;
      end;
   end;
   cboAssigned.Text := gPayrollId;
   cboAssignedChange(self);
   edtCall.SetFocus;
end;

procedure TdCalls.RepositionControls;
begin
   fDescriptionH := mmoDescription.Height;
   fResolutionH  := mmoResolution.Height;
end;

/////////////////////////RETRIEVE DATA////////////////////

function TdCalls.SetupDevConnection : Boolean;
var
   RDCallsIni : TIniFile;
begin
   Result := True;
   if not Assigned(fDB) then
   begin
      Result := False;
      RDCallsIni := TIniFile.Create(gAppPath + RDCALLLIST_INI);
      fDB := TDBEDatabase.Create;
      try
         fDB.ServerName := gServerName;
         fDB.AliasName  := gAliasName;
         fDB.UserName   := gUserName;
         fDB.Password   := gPassword;
      finally
         RDCallsIni.Free;
      end;

      try
         fDB.Connected := True;
         fQuery := fDB.NewQuery;

         if Assigned(fQuery) then
         begin
            //fQuery.SetUniDir(False);
            //dsCalls.DataSet := fQuery.DataSet;
            dsCalls.DataSet := mtbCalls;
            Result := True;
         end;
      except
         on E : SysUtils.Exception do
         begin
            ShowMessage(E.Message);
            fDB.Free;
            Result := False;
         end;
      end;
   end;
end;

procedure TdCalls.btnRefreshClick(Sender: TObject);
begin
   Refresh;
   PopulateCallActions;
   UpdateFooter;
end;

procedure TdCalls.btnStatsClick(Sender: TObject);
var
   lStats : TdStats;
   lQry : ISQLQuery;
begin
   lStats := TdStats.Create(nil);
   try
      lQry := fDB.NewQuery;
      lStats.SetUp(lQry);
      lStats.ShowModal;
   finally
      if Assigned(lQry) then
         lQry := nil;
      FreeAndNil(lStats);
   end;
end;

procedure TdCalls.btnTimesheetsClick(Sender: TObject);
var
   lTimesheets : TdTimesheets;
   lQry : ISQLQuery;
begin
   if mtbCalls.Active and (mtbCallscall_code.AsString <> '') then
   begin
      lTimesheets := TdTimesheets.Create(nil);
      try
         lQry := fDB.NewQuery;
         lTimesheets.SetUp(lQry, mtbCallscall_code.AsString);
         lTimesheets.ShowModal;
      finally
         FreeAndNil(lTimesheets);
      end;
   end;
end;

procedure TdCalls.edtCallKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then //enter
   begin
      if Trim(edtCall.Text) <> '' then
         Refresh(Trim(edtCall.Text));
   end;
end;

procedure TdCalls.FillDropdowns;
var
   lQuery : ISQLQuery;
begin
   cboAssigned.Items.Clear;
   cboClient.Items.Clear;
   cboStatus.Items.Clear;
   cboCallType.Items.Clear;
   if not SetupDevConnection then
   begin
      Exit;
   end;

   try
      lQuery := fDB.NewQuery;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('select payroll_id from employee (nolock) where status_ind = ' + QuotedStr('Y') + ' order by payroll_id');
      try
         lQuery.Open;
         lQuery.First;
         while not lQuery.eof do
         begin
            cboAssigned.Items.Add(lQuery.FieldByName('payroll_id').AsString);
            lQuery.Next;
         end;
      finally
         lQuery.Close;
      end;

      lQuery.SQL.Clear;
      lQuery.SQL.Add('select customer_id from customer (nolock)');
      lQuery.SQL.Add(' where customer_status_ind = ''A''');
      lQuery.SQL.Add(' and customertype_ind = ''C''');
      lQuery.SQL.Add(' order by customer_id');
      try
         lQuery.Open;
         lQuery.First;
         while not lQuery.eof do
         begin
            cboClient.Items.Add(lQuery.FieldByName('customer_id').AsString);
            lQuery.Next;
         end;
      finally
         lQuery.Close;
      end;

      lQuery.SQL.Clear;
      lQuery.SQL.Add('select callactiontype_code from callactiontype (nolock)');
      lQuery.SQL.Add(' where active_ind = ''Y''');
      lQuery.SQL.Add(' order by callactiontype_code');
      try
         lQuery.Open;
         lQuery.First;
         while not lQuery.eof do
         begin
            cboStatus.Items.Add(lQuery.FieldByName('callactiontype_code').AsString);
            lQuery.Next;
         end;
      finally
         lQuery.Close;
      end;

      lQuery.SQL.Clear;
      lQuery.SQL.Add('select calltype_code from calltype (nolock)');
      lQuery.SQL.Add(' where active_ind = ''Y''');
      lQuery.SQL.Add(' order by calltype_code');
      try
         lQuery.Open;
         lQuery.First;
         while not lQuery.eof do
         begin
            cboCallType.Items.Add(lQuery.FieldByName('calltype_code').AsString);
            lQuery.Next;
         end;
      finally
         lQuery.Close;
      end;
   finally
      lQuery := nil;
   end;
end;

procedure TdCalls.ShowProgress;
begin
   pbProgress.Position := 0;
   pnlProgress.Visible := True;
   pnlProgress.BringToFront;
   Application.ProcessMessages;
end;

procedure TdCalls.HideProgress;
begin
   pnlProgress.Visible := False;
   pbProgress.Position := 0;
end;

procedure TdCalls.UpdateFooter;
begin
   if mtbCalls.Active then
      dbgCalls.Columns[0].FooterValue := mtbCalls.RecordCount;
end;

procedure TdCalls.Refresh(aCall : string = '');
var
   lCallsLoaded : Integer;
   I : Integer;
   lCallDesc : string;

   procedure StartRefresh;
   begin
      lCallsLoaded := 0;
      fRefreshing := True;
      mtbCalls.ReadOnly := False;
      mtbCalls.DisableControls;
   end;

   procedure EndRefresh;
   begin
      mtbCalls.ReadOnly := True;
      mtbCalls.EnableControls;
      fRefreshing := False;
   end;
begin
   StartRefresh;

   if not SetupDevConnection then Exit;
   if not Assigned(fQuery) then Exit;

   try
      if fQuery.Active then
         fQuery.Close;
      fQuery.SQL.Clear;
      fQuery.SQL.Add('select c.call_code, c.call_details, c.customer_call_ref, c.call_resolution, c.customer_code, c.description, c.calltype_code, c.last_callactiontype_code, ');
      fQuery.SQL.Add(' c.priority, c.recorded_date_time, c.system_ref, c.system_ref, c.version_number, c.resolved_in_call_code,');
      fQuery.SQL.Add(' e.payroll_id, cf.feedback_value, v.release_mnemonic, cc.firstname, cc.surname, cc.email, (cc.phone + '' '' + cc.mobile) as phone_number,');
      fQuery.SQL.Add(' (SELECT TOP 1 tc.task_number from taskcall tc (nolock) where tc.call_code = c.call_code) as task_number,');
      fQuery.SQL.Add(' (select max(ca.action_datetime) from callaction ca (nolock) where ca.call_code = c.call_code) as last_action, ');
      fQuery.SQL.Add(' (select ac.first_name + '' '' + ac.last_name from employee ac (nolock)');
      fQuery.SQL.Add('  where ac.employee_id = cu.introduced_by_empl_id)');
      fQuery.SQL.Add(' as account_manager,');
      fQuery.SQL.Add(' (SELECT SUM(convert(numeric(10,2),(((et.end_interval - et.start_interval) + 1) * 15)/60.00))');
      fQuery.SQL.Add(' from employeetimesheet et (nolock)');
      fQuery.SQL.Add(' where et.call_code = c.call_code');
      fQuery.SQL.Add(' ) as total_time');
      fQuery.SQL.Add(' from call c (nolock)');
      fQuery.SQL.Add(' left join customer cu (nolock) on (cu.customer_id = c.customer_code)');
      fQuery.SQL.Add(' left join employee e (nolock) on (e.employee_id = c.assigned_to_emp_id)');
      fQuery.SQL.Add(' left join customercontact cc (nolock) on (cc.customercontact_id = c.customercontact_id)');
      fQuery.SQL.Add(' left join systemrdversion v (nolock) on (v.systemrdversion_id = c.systemrdversion_id)');
      fQuery.SQL.Add(' left join callfeedback cf (nolock) on (c.call_code = cf.call_code)');

      if aCall = '' then
      begin
         fQuery.SQL.Add(' where (c.recorded_date_time between ' + fQuery.FormatDate(dtpFrom.DateTime) + ' and ' + fQuery.FormatDate(dtpTo.DateTime) + ')');
         if (cbTSTOnly.State in [cbUnchecked,cbChecked]) and (gTSTUsers.Count <> 0) then
         begin
            if cbTSTOnly.State in [cbChecked] then
               fQuery.SQL.Add(' and (e.payroll_id in (')
            else
               fQuery.SQL.Add(' and (e.payroll_id not in (');
            for I := 0 to gTSTUsers.Count - 1 do
            begin
               fQuery.SQL.Add(QuotedStr(gTSTUsers[I]));
               if I < gTSTUsers.Count - 1 then
                  fQuery.SQL.Add(',');
            end;
            fQuery.SQL.Add('))');
         end;

         if cbClosed.State in [cbChecked] then
            fQuery.SQL.Add(' and (c.last_callactiontype_code = ''CLOSED'')')
         else if cbClosed.State in [cbUnChecked] then
            fQuery.SQL.Add(' and (c.last_callactiontype_code <> ''CLOSED'')');
         fQuery.SQL.Add(' order by c.recorded_date_time');
      end
      else
      begin
         fQuery.SQL.Add(' where (c.call_code = ' + QuotedStr(aCall) + ')');
      end;
      
      //ShowMessage(fQuery.SQL.Text);

      lblProgress.Caption := 'Querying Calls...';
      ShowProgress;
      fQuery.Open;
      lblProgress.Caption := 'Loading Calls...0';
      Application.ProcessMessages;

      mtbCalls.Close;
      mtbCalls.Open;

      mtbCalls.AfterScroll := fQueryAfterScroll;
      mtbCalls.FieldByName('priority').OnGetText           := fQuerypriorityGetText;
      mtbCalls.FieldByName('recorded_date_time').OnGetText := fQueryrecorded_date_timeGetText;
      mtbCalls.FieldByName('last_action').OnGetText        := fQuerylast_actionGetText;

      try
         //pbProgress.Max := fQuery.RecordCount;
         fQuery.First;
         while not fQuery.eof do
         begin
            mtbCalls.Append;
            mtbCallscall_code.AsString                := fQuery.FieldByName('call_code').AsString;
            mtbCallscall_details.AsString             := fQuery.FieldByName('call_details').AsVariant;
            mtbCallscall_resolution.AsString          := fQuery.FieldByName('call_resolution').AsVariant;
            mtbCallscustomer_code.AsString            := fQuery.FieldByName('customer_code').AsString;
            mtbCallscustomer_call_ref.AsString        := fQuery.FieldByName('customer_call_ref').AsString;
            if cbEmailDesc.Checked then
               lCallDesc := mtbCallscustomer_call_ref.AsString +
                  ' CALL_OPEN_' + mtbCallscall_code.AsString + ' : ' +
                  fQuery.FieldByName('description').AsString
            else
               lCallDesc := fQuery.FieldByName('description').AsString;
            mtbCallsdescription.AsString              := lCallDesc;
            
            mtbCallscalltype_code.AsString            := fQuery.FieldByName('calltype_code').AsString;
            mtbCallspriority.AsInteger                := fQuery.FieldByName('priority').AsInteger;
            mtbCallsrecorded_date_time.AsDateTime     := fQuery.FieldByName('recorded_date_time').AsDateTime;
            mtbCallssystem_ref.AsString               := fQuery.FieldByName('system_ref').AsString;
            mtbCallspayroll_id.AsString               := fQuery.FieldByName('payroll_id').AsString;
            mtbCallslast_callactiontype_code.AsString := fQuery.FieldByName('last_callactiontype_code').AsString;
            mtbCallsfeedback_value.AsString           := fQuery.FieldByName('feedback_value').AsString;
            mtbCallstotal_time.AsFloat                := fQuery.FieldByName('total_time').AsFloat;
            mtbCallslast_action.AsDateTime            := fQuery.FieldByName('last_action').AsDateTime;
            mtbCallsrelease_mnemonic.AsString         := fQuery.FieldByName('release_mnemonic').AsString;
            mtbCallsresolved_in_call_code.AsString    := fQuery.FieldByName('resolved_in_call_code').AsString;
            mtbCallsemail.AsString                    := fQuery.FieldByName('email').AsString;
            mtbCallsphone_number.AsString             := fQuery.FieldByName('phone_number').AsString;
            mtbCallsfirstname.AsString                := fQuery.FieldByName('firstname').AsString;
            mtbCallscontact.AsString                  := mtbCallsfirstname.AsString + ' ' +
                                                         fQuery.FieldByName('surname').AsString;
            mtbCallstask_number.AsString              := fQuery.FieldByName('task_number').AsString;
            mtbCallsaccount_manager.AsString          := fQuery.FieldByName('account_manager').AsString;
            mtbCalls.Post;
            fQuery.Next;
            Inc(lCallsLoaded);
            lblProgress.Caption := 'Loading calls...' + IntToStr(lCallsLoaded);
//            pbProgress.StepBy(1);
            Application.ProcessMessages;
         end;
      finally
         fQuery.Close;
      end;

      mtbCalls.First;
//      PopulateCallActions;
   finally
      EndRefresh;
      HideProgress;
   end;
end;

procedure TdCalls.PopulateCallActions;
var
   lQuery : ISQLQuery;
   lLastActionType : string;
begin
   if not SetupDevConnection then
      Exit;

   if (not mtbCalls.Active) then
      Exit;

   mmoDescription.Text := mtbCalls.FieldByName('call_details').AsString;
   mmoResolution.Text  := mtbCalls.FieldByName('call_resolution').AsString;

   mtbCallAction.Close;
   mtbCallAction.Open;
   if mtbCalls.FieldByName('Call_code').AsString <> '' then
   begin
      mtbCallAction.DisableControls;
      try
         lQuery := fDB.NewQuery;
         lQuery.SQL.Add('select ca.action_datetime, ca.callactiontype_code, e.payroll_id as acted_by,');
         lQuery.SQL.Add(' ca.action_details, ca.description, (select payroll_id from employee where employee_id = ca.referred_to_emp_id) as refer_to');
         lQuery.SQL.Add(' from callaction ca with (nolock)');
         lQuery.SQL.Add(' left join employee e (nolock) on (e.employee_id = ca.acted_by_emp_id)');
         lQuery.SQL.Add(' where (ca.call_code = ' + QuotedStr(mtbCalls.FieldByName('Call_code').AsString) + ')');
         lQuery.SQL.Add(' order by ca.action_datetime');
         lQuery.Open;

         try
            lQuery.First;
            while not lQuery.eof do
            begin
               mtbCallAction.Append;
               mtbCallActionaction_datetime.AsDatetime     := lQuery.FieldByName('action_datetime').AsDatetime;
               mtbCallActioncallactiontype_code.AsString   := lQuery.FieldByName('callactiontype_code').AsString;
               mtbCallActionaction_details.AsString        := lQuery.FieldByName('action_details').AsString;
               mtbCallActionacted_by.AsString              := lQuery.FieldByName('acted_by').AsString;
               mtbCallActionrefer_to.AsString              := lQuery.FieldByName('refer_to').AsString;
               mtbCallActiondescription.AsString           := lQuery.FieldByName('description').AsString;
               mtbCallAction.Post;
               lLastActionType := mtbCallActioncallactiontype_code.AsString;
               lQuery.Next;
            end;

            //Update status of call
            if (lLastActionType <> '') and (lLastActionType <> mtbCalls.FieldByName('last_callactiontype_code').AsString) then
            begin
                mtbCalls.ReadOnly := False;
                mtbCalls.Edit;
                mtbCalls.FieldByName('last_callactiontype_code').AsString := lLastActionType;
                mtbCalls.Post;
                mtbCalls.ReadOnly := True;
            end;
         finally
            lQuery.Close;
         end;
      finally
         lQuery := nil;
         mtbCallAction.EnableControls;
      end;
   end;
end;

////////////////////////BUTTONS////////////////////////////

procedure TdCalls.btnCallFolderClick(Sender: TObject);
begin
   if mtbCallscall_code.AsString <> '' then
      ShowCallFolder(mtbCallscall_code.AsString, mtbCallsdescription.AsString);
end;

procedure TdCalls.btnClientDetailsClick(Sender: TObject);
var
   RDCallsIni : TIniFile;
   lFileName : string;
   lClientFileName : string;
begin
   if mtbCalls.Active and (mtbCallscustomer_code.AsString <> '') then
   begin
      if not DirectoryExists(gClientDetailsFolder) then
      begin
         ShowMessage('Can''t find ' + gClientDetailsFolder);
         Exit;
      end;

      RDCallsIni := TIniFile.Create(gAppPath + RDCALLLIST_INI);
      try
         lClientFileName := RDCallsIni.ReadString('ClientDetails', mtbCallscustomer_code.AsString, '');
      finally
         RDCallsIni.Free;
      end;

      if lClientFileName <> '' then
      begin
         lFileName := gClientDetailsFolder + '' + lClientFileName;
         if FileExists(lFileName) then
            ShellExecute(Application.Handle,PChar('open'),PChar(lFilename),nil,nil,SW_SHOWNORMAL)
         else
            ShowMessage('Can''t find ' + lFileName);
      end
      else
      begin
         ShowMessage('This client does not have a fact sheet set in RDCallList.ini');
      end;
   end;
end;

procedure TdCalls.btnExcelClick(Sender: TObject);
var
   lNowString : string;
   lNow : TDateTime;
   lYear, lMonth, lDay, lHour, lMin, lSec, lMSec : Word;
begin
   lNow := Now;
   DecodeDate(lNow, lYear, lMonth, lDay);
   DecodeTime(lNow, lHour, lMin, lSec, lMSec);
   lNowString :=  IntToStr(lDay) + '-' + IntToStr(lMonth) + '-' + IntToStr(lYear) + '-' + IntToStr(lHour) + '-' + IntToStr(lMin) + '-' + IntToStr(lSec);
   fRefreshing := True;
   ExportQuery(mtbCalls, dbgCalls, 'Calls ' + lNowString);
   fRefreshing := False;
end;

procedure TdCalls.btnFTPClick(Sender: TObject);
var
   RDCallsIni : TIniFile;
   lFolderName : string;
   lClientFTPFolder : string;
begin
   if mtbCalls.Active and (mtbCallscustomer_code.AsString <> '') then
   begin
      if not DirectoryExists(gFTPFolder) then
      begin
         ShowMessage('Can''t find ' + gClientDetailsFolder);
         Exit;
      end;

      RDCallsIni := TIniFile.Create(gAppPath + RDCALLLIST_INI);
      try
         lClientFTPFolder := RDCallsIni.ReadString('FTP', mtbCallscustomer_code.AsString, '');
      finally
         RDCallsIni.Free;
      end;

      if (lClientFTPFolder <> '') then
      begin
         lFolderName := gFTPFolder + lClientFTPFolder;
         if DirectoryExists(lFolderName) then
         begin
            ShellExecute(Application.Handle,PChar('open'),PChar(lFolderName),nil,nil,SW_SHOWNORMAL);
         end
         else
         begin
            ShowMessage('Can''t find ' + lFolderName);
         end;
      end
      else
      begin
         ShowMessage('This client does not have an FTP folder set in RDCallList.ini');
      end;
   end;
end;

procedure TdCalls.btnLastEmailClick(Sender: TObject);
begin
   if mtbCallscall_code.AsString <> '' then
      OpenLastEmail(mtbCallscall_code.AsString, mtbCallsdescription.AsString);
end;

procedure TdCalls.ShowCallFolder(aCall: string; aDesc : String);
var
   lFolder : string;
begin
   lFolder := FindMakeCallFolder(aCall, aDesc);
   if lFolder <> '' then
      ShellExecute(Application.Handle,PChar('explore'),PChar(lFolder),nil,nil,SW_SHOWNORMAL)
end;

function TdCalls.FindMakeCallFolder(aCall : String; aDesc : String) : string;
var
  sr: TSearchRec;
begin
   Result := '';
   if not DirectoryExists(gCallFolder) then
   begin
      ShowMessage('Can''t find ' + gCallFolder);
      Exit;
   end;

   //First check for call folder without a description
   Result := gCallFolder + aCall;
   if not DirectoryExists(Result) then //will need to find it with a description
   begin
      Result := '';
      lblProgress.Caption := 'Searching...';
      ShowProgress;
      Application.ProcessMessages;
      try
         if FindFirst(IncludeTrailingPathDelimiter(gCallFolder) + '*.*', faDirectory, sr) < 0 then
            Exit
         else
         repeat
            if ((sr.Attr and faDirectory <> 0) AND (sr.Name <> '.') AND (sr.Name <> '..')) then
            begin
               if AnsiStartsStr(aCall, sr.Name) then
               begin
                  Result := gCallFolder + sr.Name;
                  Break;
               end;
            end;
         until FindNext(sr) <> 0;
      finally
        SysUtils.FindClose(sr);
        HideProgress;
      end;
   end;

   if Result = '' then //Can't find the call folder, so create it
   begin
      Result := gCallFolder + aCall;
      if not CreateDir(Result) then
         Result := '';
   end;
end;

procedure TdCalls.OpenLastEmail(aCall: string; aDesc : String);
var
   lFolder : string;
   lFilename : string;
   sr : TSearchRec;
   lTime : Integer;

   procedure DisplayMail(aAddress, aSubject, aCC, aBody: string);
   var
      pCh: String;
   begin
     pCh := 'mailto:' + aAddress + '?subject=' + aSubject +'&cc=' + aCC + '&body=' + aBody;
     ShellExecute(0, 'open', PAnsiChar(pCh), nil, nil, SW_SHOWNORMAL);
   end;
begin
   lTime := 0;
   lFilename := '';
   lFolder := FindMakeCallFolder(aCall, aDesc);
   if lFolder <> '' then
   begin
      try
         //Find the most recent .eml file
         if FindFirst(lFolder + '\*.eml', faAnyFile, sr) = 0 then
         begin
            repeat
               if sr.Time > lTime then
               begin
                  lFilename := sr.Name;
               end;
            until FindNext(sr) <> 0;
         end;
      finally
        SysUtils.FindClose(sr) ;
      end;

      if lFilename <> '' then
         ShellExecute(Application.Handle,PChar('open'),PChar('"' + lFolder + '\' + lFilename + '"'),nil,nil,SW_SHOWNORMAL)
      else //Create email with subject
      begin
         DisplayMail(mtbCallsemail.AsString, 'CALL_OPEN_' + aCall + ' - ' + aDesc, gServiceDesk, 'Hi ' + mtbCallsfirstname.AsString + ',');
      end;
   end;
end;

////////////////////////CALL ACTIONS////////////////////////////

procedure TdCalls.ExpandMemo(aMemo : TMemo; aOrigHeight : Integer);
var
   lNoOfLines : Integer;
begin
   lNoOfLines := aMemo.Lines.Count;
   aMemo.Height := Max(aOrigHeight, (lNoOfLines * 17));
   aMemo.BringToFront;
end;

procedure TdCalls.ExpandCallAction(aMemo : TDBMemo);
begin
   if aMemo.Lines.Count > 5 then
   begin
      mmoCallA.Text := aMemo.Text;
      mmoCallA.Left := ctrlCallAction.Left + aMemo.Left;
      mmoCallA.Width := aMemo.Width;
      mmoCallA.Top := ctrlCallAction.Top;
      mmoCallA.Height := ctrlCallAction.Height;
      mmoCallA.BringToFront;
      mmoCallA.Visible := True;
      mmoCallA.SelStart := aMemo.SelStart;
      mmoCallA.SelLength := aMemo.SelLength;
      mmoCallA.SetFocus;
   end;
end;

procedure TdCalls.miSortAscendingClick(Sender: TObject);
begin
   mtbCalls.SortOn(fFieldClicked.FieldName, [mtcoCaseInsensitive]);
end;

procedure TdCalls.miSortDescendingClick(Sender: TObject);
begin
   mtbCalls.SortOn(fFieldClicked.FieldName, [mtcoCaseInsensitive, mtcoDescending]);
end;

procedure TdCalls.mmoCallAMouseLeave(Sender: TObject);
begin
   mmoCallA.Visible := False;
end;

procedure TdCalls.mmoDescriptionClick(Sender: TObject);
begin
   ExpandMemo(mmoDescription, fDescriptionH);
end;

procedure TdCalls.mmoDescriptionExit(Sender: TObject);
begin
   mmoDescription.Height := fDescriptionH;
end;

procedure TdCalls.mmoDescriptionMouseEnter(Sender: TObject);
begin
   ShowCallActions;
   ///ExpandMemo(mmoDescription, fDescriptionH);
end;

procedure TdCalls.mmoDescriptionMouseLeave(Sender: TObject);
begin
   mmoDescription.Height := fDescriptionH;
end;

procedure TdCalls.mmoResolutionClick(Sender: TObject);
begin
   ExpandMemo(mmoResolution, fResolutionH);
end;

procedure TdCalls.mmoResolutionExit(Sender: TObject);
begin
   mmoResolution.Height := fResolutionH;
end;

procedure TdCalls.mmoResolutionMouseEnter(Sender: TObject);
begin
   ShowCallActions;
//   ExpandMemo(mmoResolution, fResolutionH);
end;

procedure TdCalls.mmoResolutionMouseLeave(Sender: TObject);
begin
   mmoResolution.Height := fResolutionH;
end;

procedure TdCalls.ctrlCallActionMouseEnter(Sender: TObject);
begin
   ShowCallActions;
end;

procedure TdCalls.pnlCallActionsMouseEnter(Sender: TObject);
begin
   ShowCallActions;
end;

procedure TdCalls.ShowCallActions;
begin
   pnlCallActions.BringToFront;
   pnlCallList.SendToBack;
end;

procedure TdCalls.dbmmoCallActionMouseEnter(Sender: TObject);
begin
   ShowCallActions;
//   ExpandCallAction(Sender as TDBMemo);
end;

procedure TdCalls.dbmmoCallActionsClick(Sender: TObject);
begin
   ExpandCallAction(Sender as TDBMemo);
end;

procedure TdCalls.ShowCallList;
begin
   pnlCallList.BringToFront;
   pnlCallActions.SendToBack;
end;

procedure TdCalls.pnlCallListMouseEnter(Sender: TObject);
begin
   ShowCallList;
end;

///////////////////////GRID EVENTS//////////////////////

procedure TdCalls.dbgCallsColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   fColMoved := True;
end;

procedure TdCalls.dbgCallsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   lDataSet : TDataSet;
   lGrid : TSMDBGrid;
   lFeedbackV : string;
begin
   lGrid := (Sender as TSMDBGrid);
   lDataSet := lGrid.DataSource.DataSet;
   if Assigned(lDataSet) and lDataSet.Active then
   begin
      lFeedbackV := lDataSet.FieldByName('feedback_value').AsString;
      if lFeedbackV = 'above' then
         lGrid.Canvas.Brush.Color := $00D5FFD5  //green
      else if lFeedbackV = 'satisfactory' then
         lGrid.Canvas.Brush.Color := $00CCE6FF   //orange
      else if lFeedbackV = 'below' then
         lGrid.Canvas.Brush.Color := $00D7D7FF    //red
      else
         lGrid.Canvas.Brush.Color := clWindow;

      if lDataSet.FieldByName('last_callactiontype_code').AsString = 'CLOSED' then
         lGrid.Canvas.Font.Color := $00707070
      else
         lGrid.Canvas.Font.Color := clBlack;

      if (THackDBGrid(lGrid).DataLink.ActiveRecord + 1 = THackDBGrid(lGrid).Row) then
      begin
         with lGrid.Canvas.Font do
         begin
            Style := Style + [fsBold];
            if lDataSet.FieldByName('last_callactiontype_code').AsString = 'CLOSED' then
               Color := $00707070
            else
               Color := clBlack;
         end;
         if (gdSelected in State) then
            lGrid.Canvas.Brush.Color := $00FFDFDF;   //blue
      end;
   end;

   lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TdCalls.dbgCallsFilterApply(Sender: TObject; Field: TField;
  const FilterString: string; var Accept: Boolean);
begin
   UpdateFooter;
end;

procedure TdCalls.dbgCallsFilterChanged(Sender: TObject);
begin
   UpdateFooter;
end;

procedure TdCalls.dbgCallsMouseEnter(Sender: TObject);
begin
   ShowCallList;
end;

procedure TdCalls.dbgCallsTitleClick(Column: TColumn);
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

      //Show column pop up
      if fFieldClicked.FieldName <> '' then
      begin
         poColumns.Popup(lScreenPoint.x, lScreenPoint.y);
      end;
   end
   else
      fColMoved := False;
end;

///////////////////////DATASET EVENTS//////////////////////

procedure TdCalls.fQueryAfterScroll(DataSet: TDataSet);
begin
   if not fRefreshing then
      PopulateCallActions;
end;

procedure TdCalls.fQuerylast_actionGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
   lYear, lMonth, lDay : Word;
begin
   DecodeDate(Sender.AsDateTime, lYear, lMonth, lDay);
   Text := IntToStr(lDay) + '-' + MonthNoToStr(lMonth);
end;

procedure TdCalls.fQuerypriorityGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if Sender.AsString = '20' then
      Text := 'C'
   else if Sender.AsString = '10' then
      Text := 'B'
   else if Sender.AsString = '5' then
      Text := 'A'
   else
      Text := '';
end;

procedure TdCalls.fQueryrecorded_date_timeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
   lYear, lMonth, lDay : Word;
begin
   DecodeDate(Sender.AsDateTime, lYear, lMonth, lDay);
   Text := IntToStr(lDay) + '-' + MonthNoToStr(lMonth);
end;

////////////////////////EVENTS///////////////////////

procedure TdCalls.cbEmailDescClick(Sender: TObject);
var
   lBookMark : TBookmarkStr;
   lCallDesc : string;
   lPos : Integer;
begin
   fRefreshing := True;
   lBookMark := mtbCalls.Bookmark;
   mtbCalls.ReadOnly := False;
   mtbCalls.DisableControls;
   try
      mtbCalls.First;
      while not mtbCalls.eof do
      begin
         lCallDesc := '';
         mtbCalls.Edit;
         if cbEmailDesc.Checked then
         begin
            if mtbCalls.FieldByName('customer_call_ref').AsString <> '' then
               lCallDesc := mtbCalls.FieldByName('customer_call_ref').AsString + ' ';
            lCallDesc := lCallDesc +
               'CALL_OPEN_' + mtbCallscall_code.AsString + ' : ' +
               mtbCalls.FieldByName('description').AsString;
         end
         else
         begin
            lCallDesc := mtbCalls.FieldByName('description').AsString;
            lPos := AnsiPos('CALL_OPEN_' + mtbCallscall_code.AsString + ' : ', lCallDesc);
            lCallDesc := Copy(lCallDesc, lPos + 19, Length(lCallDesc));
         end;
         mtbCallsdescription.AsString  := lCallDesc;
         mtbCalls.Post;
         mtbCalls.Next;
      end;
   finally
      mtbCalls.Bookmark := lBookMark;
      mtbCalls.EnableControls;
      mtbCalls.ReadOnly := True;
      fRefreshing := False;
   end;
end;

procedure TdCalls.cboAssignedChange(Sender: TObject);
begin
   dbgCalls.Columns[FindColIndex('payroll_id')].FilterValue := cboAssigned.Text;
   dbgCalls.ApplyFilter;
end;

procedure TdCalls.cboCallTypeChange(Sender: TObject);
begin
   dbgCalls.Columns[FindColIndex('calltype_code')].FilterValue := cboCallType.Text;
   dbgCalls.ApplyFilter;
end;

procedure TdCalls.cboClientChange(Sender: TObject);
begin
   dbgCalls.Columns[FindColIndex('customer_code')].FilterValue := cboClient.Text;
   dbgCalls.ApplyFilter;
end;

procedure TdCalls.cboPriorityChange(Sender: TObject);
begin
   dbgCalls.Columns[FindColIndex('priority')].FilterValue := cboPriority.Text;
   dbgCalls.ApplyFilter;
end;

procedure TdCalls.cboStatusChange(Sender: TObject);
begin
   dbgCalls.Columns[FindColIndex('last_callactiontype_code')].FilterValue := cboStatus.Text;
   dbgCalls.ApplyFilter;
end;

procedure TdCalls.cboSystemChange(Sender: TObject);
begin
   dbgCalls.Columns[FindColIndex('system_ref')].FilterValue := cboSystem.Text;
   dbgCalls.ApplyFilter;
end;

////////////////////////UTILITY FUNCTIONS///////////////////////

function TdCalls.FindColIndex(aFieldName : String) : Integer;
var
   I : Integer;
begin
   Result := -1;
   for I := 0 to dbgCalls.Columns.Count - 1 do
   begin
      if dbgCalls.Columns[I].FieldName = aFieldName then
      begin
         Result := I;
         Break;
      end;
   end;
end;

procedure TdCalls.ExportQuery(aQry : TDataset; aGrid : TSMDBGrid; aFileName : String);
var
   lBookMark : TBookMarkStr;
   lExportForm : TdExport;
begin
   if Assigned(aQry) and aQry.Active then
   begin
      lBookMark := aQry.Bookmark;
      aQry.DisableControls;
      lExportForm := TdExport.Create(Self);
      try
         lExportForm.SetUp(aQry, aGrid, aFileName);
         lExportForm.ShowModal;
      finally
         FreeAndNil(lExportForm);
         aQry.Bookmark := lBookMark;
         aQry.EnableControls;
      end;
   end;
end;

/////////////////////////CLOSE////////////////////////////

procedure TdCalls.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(gTSTUsers) then
      FreeAndNil(gTSTUsers);
   if Assigned(fQuery) then
   begin
      fQuery.Close;
      fQuery := nil;
   end;
   mtbCalls.Close;
   if Assigned(fDB) then
      fDB.Free;
end;

end.
