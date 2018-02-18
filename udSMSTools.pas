unit udSMSTools;
{
  Oct/Nov 2014 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, nxdb, nxsdServerEngine,
  nxsrServerEngine, nxllComponent, nxsrSqlEngineBase, nxsqlEngine,
  nxseAutoComponent, uuGlobals, ufISQLDataBase, ufISQLQuery, ComCtrls,
  ufDBEDatabase;

type
  TdSMSTools = class(TForm)
    btnRegistry: TButton;
    btnDataCentre: TButton;
    edtStore: TLabeledEdit;
    edtRegister: TLabeledEdit;
    pnlRegistry: TPanel;
    btnRptsToFile: TButton;
    rgScreenAlignment: TRadioGroup;
    edtPrinterPort: TLabeledEdit;
    pnlReceipts: TPanel;
    cbMouse: TCheckBox;
    cbUserCredentials: TCheckBox;
    btnShell: TButton;
    btnTerminateExe: TButton;
    pnlCreateUser: TPanel;
    edtPassword: TLabeledEdit;
    edtUserCode: TLabeledEdit;
    btnCreateUser: TButton;
    pbCreateUser: TProgressBar;
    cbBypassLogin: TCheckBox;
    cbAllowReboot: TCheckBox;
    cbDevelopment: TCheckBox;
    gbRegistry: TGroupBox;
    gbDataBase: TGroupBox;
    cbEFTEnabled: TCheckBox;
    edtEFTType: TComboBox;
    lblEFTType: TLabel;
    btnRestoreDataCentre: TButton;
    btnNoPromotions: TButton;
    cbwsDebug: TCheckBox;
    cbDCMViewChild: TCheckBox;
    procedure btnRegistryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtStoreChange(Sender: TObject);
    procedure edtRegisterChange(Sender: TObject);
    procedure btnDataCentreClick(Sender: TObject);
    procedure btnRptsToFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgScreenAlignmentClick(Sender: TObject);
    procedure edtPrinterPortChange(Sender: TObject);
    procedure cbMouseClick(Sender: TObject);
    procedure cbUserCredentialsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnShellClick(Sender: TObject);
    procedure btnTerminateExeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtUserCodeChange(Sender: TObject);
    procedure btnCreateUserClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbBypassLoginClick(Sender: TObject);
    procedure cbAllowRebootClick(Sender: TObject);
    procedure cbDevelopmentClick(Sender: TObject);
    procedure edtEFTTypeChange(Sender: TObject);
    procedure cbEFTEnabledClick(Sender: TObject);
    procedure btnRestoreDataCentreClick(Sender: TObject);
    procedure btnNoPromotionsClick(Sender: TObject);
    procedure cbwsDebugClick(Sender: TObject);
    procedure cbDCMViewChildClick(Sender: TObject);
  private
    { Private declarations }
    fOrigStore, fOrigReg, fOrigPrinterPort : String;
    fDataCentreCode : String;
    qry : ISQLQuery;
    fShowMessage : String;
    procedure DetermineControlStatus;
    function DoesUserExist(UserCode: String): Boolean;
    procedure SetupDevConnection(var aDBEDatabase: TDBEDatabase);
  public
    procedure SetUp;
    { Public declarations }
  end;

implementation

uses
   udDataGenie, IniFiles;

const
   TERMINATE_DIR = 'C:\POS\';
   DEVELOPMENT = 'NoBackground|NoColourChange|ClosePOS';

{$R *.dfm}

procedure TdSMSTools.FormCreate(Sender: TObject);
begin
   fShowMessage := '';
   fOrigStore := '';
   fOrigReg := '';
   edtStore.Text := GetRegistry('location_code', POS_DIRECTORY);
   edtRegister.Text := GetRegistry('register_code', POS_DIRECTORY);
   fOrigStore := edtStore.Text;
   fOrigReg := edtRegister.Text;
   btnRegistry.Enabled := False;
   edtPrinterPort.Text := 'COM1';
   fOrigPrinterPort := edtPrinterPort.Text;
end;

procedure TdSMSTools.FormShow(Sender: TObject);
begin
   edtStore.SetFocus;
end;

procedure TdSMSTools.SetUp;
begin
   if Assigned(gDataBase) then
   begin
      qry := gDataBase.NewQuery;
   end;
   //Registry Shell
   btnShell.Enabled := GetRegistry('Shell', SHELL_DIRECTORY) <> 'explorer.exe';
   edtUserCode.Text := '1';
   edtPassword.Text := '1';
   DetermineControlStatus;
end;

procedure TdSMSTools.DetermineControlStatus;
var
   lRegistryPCCode : String;
   lDCEnabled : Boolean;
   lRcptPrintEnabled : Boolean;
   lUserChecksTicked : Boolean;
   lCanDeactivatePromos : Boolean;
begin
   lRegistryPCCode := GetRegistry('remedipc_id', POS_DIRECTORY);

   btnTerminateExe.Enabled := FileExists(TERMINATE_DIR + 'terminate.exe');
   
   cbBypassLogin.Checked := RegStrToBool(GetRegistry('bypass_login', POS_DIRECTORY));
   cbwsdebug.Checked := RegStrToBool(GetRegistry('webservice_debug', WS_DIRECTORY));
   cbAllowReboot.Checked := RegStrToBool(GetRegistry('allow_reboot', POS_DIRECTORY));
   cbDCMViewChild.Checked := RegStrToBool(GetRegistry('dcm_viewchild', POS_DIRECTORY));
   cbDevelopment.Checked := GetRegistry('Development', POS_DIRECTORY) = DEVELOPMENT;

   //create user
   btnCreateUser.Enabled := Assigned(gDataBase) and (not DoesUserExist(edtUserCode.Text));

   btnNoPromotions.Enabled := False;

   if Assigned(gDataBase) then
   begin
      //mouse cursor
      qry.SQL.Clear;
      qry.SQL.Add('select mouse_pointer_ind from remedipc');
      qry.SQL.Add(' where remedipc_id = ' + QuotedStr(lRegistryPCCode));
      try
         qry.Open;
         cbMouse.Checked := qry.FieldByName('mouse_pointer_ind').AsString = 'Y';
      finally
         qry.Close;
      end;

      //eft
      qry.SQL.Clear;
      qry.SQL.Add('select eft_enabled_ind from register');
      qry.SQL.Add(' where remedipc_id = ' + QuotedStr(lRegistryPCCode));
      try
         qry.Open;
         cbEFTEnabled.Checked := qry.FieldByName('eft_enabled_ind').AsString = 'Y';
      finally
         qry.Close;
      end;

      //eft type
      qry.SQL.Clear;
      qry.SQL.Add('select eft_process_type_ind from register');
      qry.SQL.Add(' where remedipc_id = ' + QuotedStr(lRegistryPCCode));
      try
         qry.Open;
         edtEFTType.Text := qry.FieldByName('eft_process_type_ind').AsString;
      finally
         qry.Close;
      end;

      //user credentials check
      lUserChecksTicked := False;
      qry.SQL.Clear;
      qry.SQL.Add('select require_key_ind from activity');
      try
         qry.Open;
         while not qry.eof do
         begin
            if qry.FieldByName('require_key_ind').AsString = 'Y' then
            begin
               lUserChecksTicked := True;
               break;
            end;
            qry.Next;
         end;
      finally
         qry.Close;
         cbUserCredentials.Checked := lUserChecksTicked;
      end;

      //promotions
      lCanDeactivatePromos := False;
      qry.SQL.Clear;
      qry.SQL.Add('select active_ind from promotion');
      try
         qry.Open;
         qry.First;
         while not qry.eof do
         begin
            if qry.FieldByName('active_ind').AsString = 'Y' then
            begin
               lCanDeactivatePromos := True;
            end;
            qry.Next;
         end;
         btnNoPromotions.Enabled := lCanDeactivatePromos;
      finally
         qry.Close;
      end;

      //Get datacentre_code
      qry.SQL.Clear;
      qry.SQL.Add('select datacentre_code from datacentre');
      qry.SQL.Add(' where datacentre_local_ref = ' + QuotedStr(edtRegister.Text));
      qry.SQL.Add(' and location_code = ' + QuotedStr(edtStore.Text));
      try
         qry.Open;
         if qry.RecordCount <> 0 then
            fDataCentreCode := qry.FieldByName('datacentre_code').AsString;
      finally
         qry.Close;
      end;

      //Reset DataCentre
      if fDataCentreCode <> '' then
      begin
         lDCEnabled := False;
         qry.SQL.Clear;
         qry.SQL.Add('select ip_address, datacentre_code from datacentre');
         try
            qry.Open;
            qry.First;
            while not qry.eof do
            begin
               if fDataCentreCode = qry.FieldByName('datacentre_code').AsString then
               begin
                  if qry.FieldByName('ip_address').AsString <> '127.0.0.1' then
                     lDCEnabled := True;
               end
               else
               begin
                  if qry.FieldByName('ip_address').AsString <> '1.1.1.1' then
                     lDCEnabled := True;
               end;
               qry.Next;
            end;
            btnDataCentre.Enabled := lDCEnabled;
         finally
            qry.Close;
         end;

         //Screen alignment
         qry.SQL.Clear;
         qry.SQL.Add('select screen_alignment_ind from register');
         qry.SQL.Add(' where datacentre_code = ' + QuotedStr(fDataCentreCode));
         try
            qry.Open;
            if qry.RecordCount > 0 then
            begin
               if qry.FieldByName('screen_alignment_ind').AsString = 'T' then
                  rgScreenAlignment.ItemIndex := 0
               else if qry.FieldByName('screen_alignment_ind').AsString = 'P' then
                  rgScreenAlignment.ItemIndex := 1
            end;
         finally
            qry.Close;
         end;

         //Printing Receipts
         lRcptPrintEnabled := False;
         qry.SQL.Clear;
         qry.SQL.Add('select prt_checking_ind, printer_type_ind from remediprintertype');
         qry.SQL.Add(' where remediprintertype_code = ' + QuotedStr('OPOS'));
         try
            qry.Open;
            if qry.RecordCount > 0 then
            begin
               lRcptPrintEnabled := (qry.FieldByName('prt_checking_ind').AsString <> 'N') or (qry.FieldByName('printer_type_ind').AsString <> 'W');
               if lRcptPrintEnabled then
               begin
                  qry.SQL.Clear;
                  qry.SQL.Add('select remediprintertype_code, receipt_printer_port from register');
                  qry.SQL.Add(' where datacentre_code = ' + QuotedStr(fDataCentreCode));
                  try
                     qry.Open;
                     lRcptPrintEnabled := (qry.RecordCount > 0) and
                        ((qry.FieldByName('remediprintertype_code').AsString <> 'OPOS') or
                        (qry.FieldByName('receipt_printer_port').AsString <> edtPrinterPort.Text));
                     //edtPrinterPort.Text := qry.FieldByName('receipt_printer_port').AsString;
                  finally
                     qry.Close;
                  end;
               end;
            end;
         finally
            btnRptsToFile.Enabled := lRcptPrintEnabled;
            qry.Close;
         end;
      end
      else
      begin
         btnDataCentre.Enabled := False;
         btnRestoreDataCentre.Enabled := False;
         rgScreenAlignment.Enabled := False;
         btnRptsToFile.Enabled := False;
         edtPrinterPort.Enabled := False;
         cbUserCredentials.Enabled := False;
         cbMouse.Enabled := False;
         cbEFTEnabled.Enabled := False;
         edtEFTType.Enabled := False;
         btnNoPromotions.Enabled := False;
         fShowMessage := 'datacentre_code not found.' + ^M +
            'You will need to set the registry first.';
      end;
   end
   else
   begin
      btnDataCentre.Enabled := False;
      btnRestoreDataCentre.Enabled := False;
      rgScreenAlignment.Enabled := False;
      btnRptsToFile.Enabled := False;
      edtPrinterPort.Enabled := False;
      cbUserCredentials.Enabled := False;
      cbMouse.Enabled := False;
      btnCreateUser.Enabled := False;
      edtUserCode.Enabled := False;
      edtPassword.Enabled := False;
      cbEFTEnabled.Enabled := False;
      edtEFTType.Enabled := False;
      btnNoPromotions.Enabled := False;
      fShowMessage := 'You are not connected to any database.' + ^M + 'Some features are disabled.';
   end;
end;

procedure TdSMSTools.btnShellClick(Sender: TObject);
begin
   SetRegistry('explorer.exe', 'Shell', SHELL_DIRECTORY);
   btnShell.Enabled := False;
end;

procedure TdSMSTools.btnTerminateExeClick(Sender: TObject);
begin
   if FileExists(TERMINATE_DIR + 'terminate.exe') and
      RenameFile(TERMINATE_DIR + 'terminate.exe', TERMINATE_DIR + '_terminate.exe')then
   begin
      btnTerminateExe.Enabled := False;
   end;
end;

procedure TdSMSTools.btnDataCentreClick(Sender: TObject);
begin
   if fDataCentreCode <> '' then
   begin
      qry.SQL.Clear;
      qry.SQL.Add('update datacentre set ip_address = ' + QuotedStr('1.1.1.1'));
      qry.SQL.Add(' where datacentre_code <> ' + QuotedStr(fDataCentreCode));
      qry.ExecSQL;

      qry.SQL.Clear;
      qry.SQL.Add('update datacentre set ip_address = ' + QuotedStr('127.0.0.1'));
      qry.SQL.Add(' where datacentre_code = ' + QuotedStr(fDataCentreCode));
      qry.ExecSQL;

      btnDataCentre.Enabled := False;
      btnRestoreDataCentre.Enabled := True;
   end
   else
      ShowMessage('datacentre_code not found');
end;

procedure TdSMSTools.btnNoPromotionsClick(Sender: TObject);
begin
   qry.SQL.Clear;
   qry.SQL.Add('update promotion set active_ind = ' + QuotedStr('N'));
   qry.ExecSQL;
   btnNoPromotions.Enabled := False;
end;

procedure TdSMSTools.btnRegistryClick(Sender: TObject);
begin
   //should use TryStrToInt
   SetRegistry(edtStore.Text, 'location_code', POS_DIRECTORY);
   SetRegistry(edtRegister.Text, 'register_code', POS_DIRECTORY);
   SetRegistry('POS' + edtStore.Text + edtRegister.Text, 'remedipc_id', POS_DIRECTORY);
   btnRegistry.Enabled := false;
   fOrigStore := edtStore.Text;
   fOrigReg := edtRegister.Text;

   if Assigned(gDatabase) then
   begin
      //get new datacentre code
      qry.SQL.Clear;
      qry.SQL.Add('select datacentre_code from datacentre');
      qry.SQL.Add(' where (datacentre_local_ref = ' + QuotedStr(fOrigReg));
      qry.SQL.Add(' and location_code = ' + QuotedStr(fOrigStore) + ')');
      try
         qry.Open;
         fDataCentreCode := qry.FieldByName('datacentre_code').AsString;
      finally
         qry.Close;
      end;

      DetermineControlStatus;
   end;
end;

procedure TdSMSTools.SetupDevConnection(var aDBEDatabase : TDBEDatabase);
var
   SMSDataEditorIni : TIniFile;
begin
   SMSDataEditorIni := TIniFile.Create(gAppPath + MAIN_INI);
   try
      aDBEDatabase.ServerName := SMSDataEditorIni.ReadString('dev', 'Server', '');
      aDBEDatabase.AliasName  := SMSDataEditorIni.ReadString('dev', 'AliasName', '');
      aDBEDatabase.UserName   := SMSDataEditorIni.ReadString('dev', 'Username', '');
      aDBEDatabase.Password   := SMSDataEditorIni.ReadString('dev', 'Password', '');
   finally
      SMSDataEditorIni.Free;
   end;
end;

procedure TdSMSTools.btnRestoreDataCentreClick(Sender: TObject);
var
   lDBEDatabase : TDBEDatabase;
   lQuery : ISQLQuery;
   I : Integer;
begin
   lDBEDatabase := TDBEDatabase.Create;
   try
      SetupDevConnection(lDBEDatabase);
      try
         lDBEDatabase.Connected := True;
      except
         on E : SysUtils.Exception do
         begin
            ShowMessage(E.Message);
            lDBEDatabase.Free;
            Exit;
         end;
      end;

      lQuery := lDBEDatabase.NewQuery;
      lQuery.SQL.Add('select * from datacentre with (nolock)');
      lQuery.Open;

      //empty local datcentre table
      qry.SQL.Clear;
      qry.SQL.Add('delete from datacentre');
      qry.ExecSQL;

      qry.SQL.Clear;
      qry.SQL.Add('select * from datacentre');
      qry.Open;
      try
         lQuery.First;
         while not lQuery.eof do
         begin
            qry.Append;
            for I := 0 to lQuery.Fields.Count - 1 do
            begin
               qry.Fields[I].Value := lQuery.Fields[I].Value;
            end;
            qry.Post;
            lQuery.Next;
         end;
         btnRestoreDataCentre.Enabled := False;
         btnDataCentre.Enabled := True;
      finally
         qry.Close;
         qry.SQL.Clear;
         lQuery.Close;
      end;
   finally
      lQuery := nil;
      lDBEDatabase.Free;
   end;
end;

procedure TdSMSTools.btnRptsToFileClick(Sender: TObject);
begin
   qry.SQL.Clear;
   qry.SQL.Add('update remediprintertype set prt_checking_ind = ' + QuotedStr('N') + ', printer_type_ind = ' + QuotedStr('W'));
   qry.SQL.Add(' where remediprintertype_code = ' + QuotedStr('OPOS'));
   qry.ExecSQL;

   qry.SQL.Clear;
   qry.SQL.Add('update register set remediprintertype_code = ' + QuotedStr('OPOS') + ', receipt_printer_port = ' + QuotedStr(edtPrinterPort.Text));
   qry.SQL.Add(' where datacentre_code = ' + QuotedStr(fDataCentreCode));
   qry.ExecSQL;

   fOrigPrinterPort := edtPrinterPort.Text;

   btnRptsToFile.Enabled := False;
end;

procedure TdSMSTools.cbBypassLoginClick(Sender: TObject);
begin
   SetRegistry(RegBoolToStr(cbBypassLogin.Checked), 'bypass_login', POS_DIRECTORY);
end;

procedure TdSMSTools.cbMouseClick(Sender: TObject);
begin
   qry.SQL.Clear;
   qry.SQL.Add('update remedipc set mouse_pointer_ind = ' + QuotedStr(RegBoolToStr(cbMouse.Checked)));
   qry.SQL.Add(' where remedipc_id = ' + QuotedStr(GetRegistry('remedipc_id', POS_DIRECTORY)));
   qry.ExecSQL;
end;

procedure TdSMSTools.cbDCMViewChildClick(Sender: TObject);
begin
   SetRegistry(RegBoolToStr(cbDCMViewChild.Checked), 'dcm_viewchild', POS_DIRECTORY);
end;

procedure TdSMSTools.cbDevelopmentClick(Sender: TObject);
begin
   if cbDevelopment.Checked then
      SetRegistry(DEVELOPMENT, 'Development', POS_DIRECTORY)
   else
      SetRegistry('', 'Development', POS_DIRECTORY);
end;

procedure TdSMSTools.cbEFTEnabledClick(Sender: TObject);
begin
   qry.SQL.Clear;
   qry.SQL.Add('update register set eft_enabled_ind = ' + QuotedStr(RegBoolToStr(cbEFTEnabled.Checked)));
   qry.SQL.Add(' where remedipc_id = ' + QuotedStr(GetRegistry('remedipc_id', POS_DIRECTORY)));
   qry.ExecSQL;
end;

procedure TdSMSTools.cbwsDebugClick(Sender: TObject);
begin
   SetRegistry(RegBoolToStr(cbwsDebug.Checked), 'webservice_debug', WS_DIRECTORY);
end;

procedure TdSMSTools.cbAllowRebootClick(Sender: TObject);
begin
   SetRegistry(RegBoolToStr(cbAllowReboot.Checked), 'allow_reboot', POS_DIRECTORY);
end;

procedure TdSMSTools.cbUserCredentialsClick(Sender: TObject);
begin
   qry.SQL.Clear;
   qry.SQL.Add('update activity set require_key_ind = ' + QuotedStr(RegBoolToStr(cbUserCredentials.Checked)));
   qry.ExecSQL;
end;

procedure TdSMSTools.edtEFTTypeChange(Sender: TObject);
begin
   qry.SQL.Clear;
   qry.SQL.Add('update register set eft_process_type_ind = ' + QuotedStr(edtEFTType.Text[1]));
   qry.SQL.Add(' where remedipc_id = ' + QuotedStr(GetRegistry('remedipc_id', POS_DIRECTORY)));
   qry.ExecSQL;
end;

procedure TdSMSTools.edtPrinterPortChange(Sender: TObject);
begin
   btnRptsToFile.Enabled := True;//(fOrigPrinterPort <> edtPrinterPort.Text);
end;

procedure TdSMSTools.edtRegisterChange(Sender: TObject);
begin
   if (fOrigStore <> '') and (fOrigReg <> '') then
   begin
      btnRegistry.Enabled := (fOrigReg <> edtRegister.Text) or (fOrigStore <> edtStore.Text);
      if Assigned(gDataBase) then
      begin
         btnDataCentre.Enabled := not btnRegistry.Enabled;
         rgScreenAlignment.Enabled := not btnRegistry.Enabled;
         pnlReceipts.Enabled := not btnRegistry.Enabled;
         cbMouse.Enabled := not btnRegistry.Enabled;
         cbUserCredentials.Enabled := not btnRegistry.Enabled;
      end;
   end;
end;

procedure TdSMSTools.edtStoreChange(Sender: TObject);
begin
   if (fOrigStore <> '') and (fOrigReg <> '') then
   begin
      btnRegistry.Enabled := (fOrigReg <> edtRegister.Text) or (fOrigStore <> edtStore.Text);
      if Assigned(gDataBase) then
      begin
         btnDataCentre.Enabled := not btnRegistry.Enabled;
         rgScreenAlignment.Enabled := not btnRegistry.Enabled;
         pnlReceipts.Enabled := not btnRegistry.Enabled;
         cbMouse.Enabled := not btnRegistry.Enabled;
         cbUserCredentials.Enabled := not btnRegistry.Enabled;
      end;
   end;
end;

procedure TdSMSTools.rgScreenAlignmentClick(Sender: TObject);
begin
   if fDataCentreCode <> '' then
   begin
      qry.SQL.Clear;
      if rgScreenAlignment.ItemIndex = 0 then
         qry.SQL.Add('update register set screen_alignment_ind = ' + QuotedStr('T'))
      else if rgScreenAlignment.ItemIndex = 1 then
         qry.SQL.Add('update register set screen_alignment_ind = ' + QuotedStr('P'));
      qry.SQL.Add(' where datacentre_code = ' + QuotedStr(fDataCentreCode));
      qry.ExecSQL;
   end;
end;

procedure TdSMSTools.edtUserCodeChange(Sender: TObject);
begin
   if edtUserCode.Text <> '' then
      btnCreateUser.Enabled := Assigned(gDataBase) and (not DoesUserExist(edtUserCode.Text))
   else
      btnCreateUser.Enabled := False;
end;

function TdSMSTools.DoesUserExist(UserCode : String) : Boolean;
begin
   Result := False;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('select remediuser_code from remediuser');
   qry.SQL.Add('where remediuser_code = ' + QuotedStr(UserCode));
   try
      qry.Open;
      if not qry.eof then
         Result := True;
   finally
      qry.Close;
   end;
end;

procedure TdSMSTools.btnCreateUserClick(Sender: TObject);
var
   qryActivity : ISQLQuery;
   lActivityId, lRemediKey, lRemediKeyAccess, lRemediUserKey, lEmployeeId, lEmployeeStoreId : String;
   lAccessCounter : Integer;
   lUser, lPassword : String;
begin
   lUser  := edtUserCode.Text;
   lPassword := edtPassword.Text;
   if (lUser <> '') and (lPassword <> '') then
   begin
      try
         qry.SQL.Clear;
         qry.SQL.Add('insert into remediuser (remediuser_code, remedipassword, description, active_ind, default_pcaccess_ind) ');
         qry.SQL.Add('values (' + QuotedStr(lUser) + ',' + QuotedStr(lPassword) + ',''dev'',''Y'',''Y'')');
         qry.ExecSQL;

         //create a unique remedikey
         lRemediKey := 'zzz' + lUser;
         qry.SQL.Clear;
         qry.SQL.Add('insert into remedikey (remedikey_id, description) ');
         qry.SQL.Add('values (' + QuotedStr(lRemediKey) + ',''dev'')');
         qry.ExecSQL;

         //create a unique remediuserkey
         lRemediUserKey := 'zzz' + lUser;
         qry.SQL.Clear;
         qry.SQL.Add('insert into remediuserkey (remediuserkey_id, remedikey_id, remediuser_code) ');
         qry.SQL.Add('values (' + QuotedStr(lRemediUserKey) + ',' + QuotedStr(lRemediKey) + ',' + QuotedStr(lUser) +')');
         qry.ExecSQL;

         //need to delete any employee records with remediuser = 1

         //create a unique employeeid
         lEmployeeId := 'zzz' + lUser;
         qry.SQL.Clear;
         qry.SQL.Add('insert into employee (employee_id, status_ind, remediuser_code, employee_title, first_name, last_name) ');
         qry.SQL.Add('values (' + QuotedStr(lEmployeeId) + ',' + QuotedStr('Y') + ',' + QuotedStr(lUser) + ',' + QuotedStr('dev') + ',' + QuotedStr('dev') + ',' + QuotedStr('dev') + ')');
         qry.ExecSQL;

         //create a unique employeestore
         lEmployeeStoreId := 'zzz' + lUser;
         qry.SQL.Clear;
         qry.SQL.Add('insert into employeestore (employeestore_id, store_code, employee_id) ');
         qry.SQL.Add('values (' + QuotedStr(lEmployeeStoreId) + ',' + QuotedStr(edtStore.Text) + ',' + QuotedStr(lEmployeeId) + ')');
         qry.ExecSQL;

         //for all 'A' activities, create a remedikeyaccess
         lAccessCounter := 1;
         qryActivity := gDataBase.NewQuery;
         qryActivity.SQL.Clear;
         qryActivity.SQL.Add('select * from activity where type_ind = ' + QuotedStr('A'));
         try
            qryActivity.Open;
            pbCreateUser.Position := 0;
            pbCreateUser.Max := qryActivity.RecordCount;
            pbCreateUser.Visible := True;

            qryActivity.First;
            while not qryActivity.eof do
            begin
               lRemediKeyAccess := 'z' + lUser + IntToStr(lAccessCounter);
               lActivityId := qryActivity.FieldByName('activity_id').AsString;

               qry.SQL.Clear;
               qry.SQL.Add('insert into remedikeyaccess (remedikeyaccess_id, activity_id, remedikey_id, access_type_ind) ');
               qry.SQL.Add('values (' + QuotedStr(lRemediKeyAccess) + ',' + QuotedStr(lActivityId) + ',' + QuotedStr(lRemediKey) + ', ''A'')');
               qry.ExecSQL;

               lAccessCounter := lAccessCounter + 1;
               qryActivity.Next;
               pbCreateUser.StepBy(1);
            end;
         finally
            if Assigned(qryActivity) then
            begin
               if qryActivity.Active then
                  qryActivity.Close;
               qryActivity := nil;
            end;
         end;
         pbCreateUser.Visible := False;
         btnCreateUser.Enabled := False;
      except
         on E: Exception do
         begin
            pbCreateUser.Visible := False;
            ShowMessage(E.Message);
         end;
      end;
   end
   else
      ShowMessage('Username and password required');
end;

procedure TdSMSTools.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdSMSTools.FormActivate(Sender: TObject);
begin
   if fShowMessage <> '' then   
      ShowMessage(fShowMessage);
end;

procedure TdSMSTools.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(qry) then
      qry := nil;
end;

end.
