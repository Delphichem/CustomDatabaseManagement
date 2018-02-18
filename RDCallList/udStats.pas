unit udStats;
{
  July 2016 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, DB, kbmMemTable, StdCtrls, ComCtrls, ufISQLQuery,
  ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Spin, Series;

type
  TdStats = class(TForm)
    dbgCalls: TSMDBGrid;
    dsClosed: TDataSource;
    mtbClosed: TkbmMemTable;
    mtbClosedpayroll_id: TStringField;
    mtbClosedclosed: TIntegerField;
    dtpFrom: TDateTimePicker;
    lblTo: TLabel;
    dtpTo: TDateTimePicker;
    btnRefresh: TButton;
    chtCalls: TDBChart;
    mtbCalls: TkbmMemTable;
    mtbCallsDATE: TDateTimeField;
    mtbClosedtasks: TIntegerField;
    edtInterval: TSpinEdit;
    lbl1: TLabel;
    cboSystem: TComboBox;
    lblSystem: TLabel;
    cboClient: TComboBox;
    lblClient: TLabel;
    pb1: TProgressBar;
    lnsrsCallsCreated: TLineSeries;
    lnsrsCallsClosed: TLineSeries;
    mtbClosedtask_perc: TIntegerField;
    cboPayroll: TComboBox;
    lbl2: TLabel;
    lnsrsPayrollId: TLineSeries;
    btnTrend: TButton;
    btnHistory: TButton;
    lnsrsOpen: TLineSeries;
    btnSmooth: TButton;
    mtbCallsCALLS_CREATED: TFloatField;
    mtbCallsCALLS_CLOSED: TFloatField;
    mtbCallsPAYROLL_CLOSED: TFloatField;
    mtbCallsCALLS_OPEN: TFloatField;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure dtpFromChange(Sender: TObject);
    procedure dtpToChange(Sender: TObject);
    procedure cboPayrollChange(Sender: TObject);
    procedure btnTrendClick(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
    procedure btnSmoothClick(Sender: TObject);
  private
    fQry : ISQLQuery;
    fTrendView : Boolean;
    procedure UpdatePayrollClosed;
    procedure UpdateGraph;
    procedure AddCallsCreatedClosed(aFromDate, aToDate: TDateTime);
    procedure FillDropdowns;
    procedure UpdateGraphPayroll;
    procedure SetTrendView(aTrend : Boolean);
  public
    procedure Setup(aQry : ISQLQuery);
    property  TrendView : Boolean read fTrendView write SetTrendView;
  end;

implementation

uses
   IniFiles, ufDBEDatabase, uuGlobals;

{$R *.dfm}

procedure TdStats.SetTrendView(aTrend: Boolean);
begin
   fTrendView := aTrend;
   lnsrsOpen.Active         := fTrendView;
   lnsrsCallsCreated.Active := not fTrendView;
   lnsrsCallsClosed.Active  := not fTrendView;
   lnsrsPayrollId.Active    := not fTrendView;
   btnTrend.Enabled         := not fTrendView;
   btnHistory.Enabled       := fTrendView;
end;

procedure TdStats.Setup(aQry : ISQLQuery);
begin
   fQry := aQry;
   TrendView := False;
end;

procedure TdStats.FormShow(Sender: TObject);
begin
   if LongDayNames[DayOfWeek(Date)] = 'Friday' then
      dtpFrom.Date    := Date - 4
   else
      dtpFrom.Date    := Date;

   dtpTo.DateTime  := Date + 0.99999;
   dtpFrom.MaxDate := Date;
   dtpTo.MaxDate   := Date + 1;
   FillDropdowns;
end;

procedure TdStats.FillDropdowns;
begin
   cboClient.Items.Clear;
   try
      fQry.SQL.Clear;
      fQry.SQL.Add('select customer_id from customer');
      fQry.SQL.Add('where customer_status_ind = ''A''');
      fQry.SQL.Add('and customertype_ind = ''C''');
      fQry.SQL.Add('order by customer_id');
      try
         fQry.Open;
         fQry.First;
         while not fQry.eof do
         begin
            cboClient.Items.Add(fQry.FieldByName('customer_id').AsString);
            fQry.Next;
         end;
      finally
         fQry.Close;
      end;

      fQry.SQL.Clear;
      fQry.SQL.Add('select payroll_id from employee (nolock) where status_ind = ' + QuotedStr('Y') + ' order by payroll_id');
      try
         fQry.Open;
         fQry.First;
         while not fQry.eof do
         begin
            cboPayroll.Items.Add(fQry.FieldByName('payroll_id').AsString);
            fQry.Next;
         end;
      finally
         fQry.Close;
      end;

   finally
      if fQry.Active then
         fQry.Close;
   end;
end;

procedure TdStats.FormActivate(Sender: TObject);
begin
   btnRefreshClick(Self);
end;

procedure TdStats.btnRefreshClick(Sender: TObject);
begin
   if edtInterval.Value > ((dtpTo.DateTime - dtpFrom.DateTime) + 0.11111) then
   begin
      ShowMessage('Interval must be less than or equal to the date range');
      edtInterval.SetFocus;
      Exit;
   end;

   if Trunc((dtpTo.DateTime - dtpFrom.DateTime)/edtInterval.Value) > 50 then
   begin
      ShowMessage('Interval is too short for this date range');
      edtInterval.SetFocus;
      Exit;
   end;

   UpdatePayrollClosed;
   UpdateGraph;
   UpdateGraphPayroll;
end;

procedure TdStats.btnSmoothClick(Sender: TObject);
var
   lClosed, lCreated, lPayroll, lOpen : TStringList;
begin
   if mtbCalls.RecordCount > 1 then
   begin
      lClosed  := TStringList.Create;
      lCreated := TStringList.Create;
      lPayroll := TStringList.Create;
      lOpen    := TStringList.Create;
      mtbCalls.DisableControls;
      try
         mtbCalls.First;
         while not mtbCalls.eof do
         begin
            lClosed.Add(FloatToStr(mtbCallsCALLS_CLOSED.AsFloat));
            lCreated.Add(FloatToStr(mtbCallsCALLS_CREATED.AsFloat));
            lOpen.Add(FloatToStr(mtbCallsCALLS_OPEN.AsFloat));
            lPayroll.Add(FloatToStr(mtbCallsPAYROLL_CLOSED.AsFloat));
            mtbCalls.Next;
         end;

         pb1.Position := 0;
         pb1.Visible := True;
         pb1.Max := mtbCalls.RecordCount;

         mtbCalls.First;
         while not mtbCalls.eof do
         begin
            mtbCalls.Edit;
            if mtbCalls.RecNo = 1 then
            begin
               mtbCallsCALLS_CLOSED.AsFloat   := (StrToFloat(lClosed[mtbCalls.RecNo - 1])  + StrToFloat(lClosed[mtbCalls.RecNo]))/2;
               mtbCallsCALLS_CREATED.AsFloat  := (StrToFloat(lCreated[mtbCalls.RecNo - 1]) + StrToFloat(lCreated[mtbCalls.RecNo]))/2;
               mtbCallsCALLS_OPEN.AsFloat     := (StrToFloat(lOpen[mtbCalls.RecNo - 1])    + StrToFloat(lOpen[mtbCalls.RecNo]))/2;
               mtbCallsPAYROLL_CLOSED.AsFloat := (StrToFloat(lPayroll[mtbCalls.RecNo - 1]) + StrToFloat(lPayroll[mtbCalls.RecNo]))/2;
            end
            else if mtbCalls.RecNo = mtbCalls.RecordCount then
            begin
               mtbCallsCALLS_CLOSED.AsFloat   := (StrToFloat(lClosed[mtbCalls.RecNo - 2])  + StrToFloat(lClosed[mtbCalls.RecNo - 1]))/2;
               mtbCallsCALLS_CREATED.AsFloat  := (StrToFloat(lCreated[mtbCalls.RecNo - 2]) + StrToFloat(lCreated[mtbCalls.RecNo - 1]))/2;
               mtbCallsCALLS_OPEN.AsFloat     := (StrToFloat(lOpen[mtbCalls.RecNo - 2])    + StrToFloat(lOpen[mtbCalls.RecNo - 1]))/2;
               mtbCallsPAYROLL_CLOSED.AsFloat := (StrToFloat(lPayroll[mtbCalls.RecNo - 2]) + StrToFloat(lPayroll[mtbCalls.RecNo - 1]))/2;
            end
            else
            begin
               mtbCallsCALLS_CLOSED.AsFloat   := (StrToFloat(lClosed[mtbCalls.RecNo - 2])  + StrToFloat(lClosed[mtbCalls.RecNo - 1])  + StrToFloat(lClosed[mtbCalls.RecNo]))/3;
               mtbCallsCALLS_CREATED.AsFloat  := (StrToFloat(lCreated[mtbCalls.RecNo - 2]) + StrToFloat(lCreated[mtbCalls.RecNo - 1]) + StrToFloat(lCreated[mtbCalls.RecNo]))/3;
               mtbCallsCALLS_OPEN.AsFloat     := (StrToFloat(lOpen[mtbCalls.RecNo - 2])    + StrToFloat(lOpen[mtbCalls.RecNo - 1])    + StrToFloat(lOpen[mtbCalls.RecNo]))/3;
               mtbCallsPAYROLL_CLOSED.AsFloat := (StrToFloat(lPayroll[mtbCalls.RecNo - 2]) + StrToFloat(lPayroll[mtbCalls.RecNo - 1]) + StrToFloat(lPayroll[mtbCalls.RecNo]))/3;
            end;
            mtbCalls.Post;
            mtbCalls.Next;
            pb1.StepBy(1);
            Application.ProcessMessages;
         end;         
      finally
         mtbCalls.EnableControls;
         chtCalls.RefreshData;
         pb1.Position := 0;
         pb1.Visible := False;
         lClosed.Free;
         lCreated.Free;
         lPayroll.Free;
         lOpen.Free;
      end;
   end;
end;

procedure TdStats.btnTrendClick(Sender: TObject);
begin
   TrendView := True;
end;

procedure TdStats.btnHistoryClick(Sender: TObject);
begin
   TrendView := False;
end;

procedure TdStats.cboPayrollChange(Sender: TObject);
begin
   UpdateGraphPayroll;
end;

procedure TdStats.dtpFromChange(Sender: TObject);
begin
  if dtpFrom.Date > dtpTo.Date then
    dtpTo.DateTime := dtpFrom.Date + 0.99999;
end;

procedure TdStats.dtpToChange(Sender: TObject);
begin
  if dtpFrom.Date > dtpTo.Date then
    dtpFrom.Date := dtpTo.Date;
  dtpTo.DateTime := dtpTo.Date + 0.99999;
end;

procedure TdStats.AddCallsCreatedClosed(aFromDate, aToDate : TDateTime);
var
   lCallsCreated, lCallsClosed, lCallsOpen : Integer;
begin
   try
      //Calls created in interval
      fQry.SQL.Clear;
      fQry.SQL.Add('select count(c.call_code) as calls_created from call c (nolock)');
      fQry.SQL.Add(' where recorded_date_time between ' + fQry.FormatDate(aFromDate) + ' and ' + fQry.FormatDate(aToDate));
      if Trim(cboClient.Text) <> '' then
         fQry.SQL.Add(' and c.customer_code = ' + QuotedStr(Trim(cboClient.Text)));
      if Trim(cboSystem.Text) <> '' then
         fQry.SQL.Add(' and c.system_ref = ' + QuotedStr(Trim(cboSystem.Text)));
      fQry.Open;
      lCallsCreated := fQry.FieldByName('calls_created').AsInteger;
      fQry.Close;

      //Calls closed in interval
      fQry.SQL.Clear;
      fQry.SQL.Add('select count(c.call_code) as calls_closed from call c (nolock)');
      fQry.SQL.Add(' where c.last_callactiontype_code = ''CLOSED''');
      if Trim(cboClient.Text) <> '' then
         fQry.SQL.Add(' and c.customer_code = ' + QuotedStr(Trim(cboClient.Text)));      
      if Trim(cboSystem.Text) <> '' then
         fQry.SQL.Add(' and c.system_ref = ' + QuotedStr(Trim(cboSystem.Text)));
      fQry.SQL.Add(' and ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) > ' + fQry.FormatDate(aFromDate) + ')');
      fQry.SQL.Add(' and ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) < ' + fQry.FormatDate(aToDate) + ')');
      fQry.Open;
      lCallsClosed := fQry.FieldByName('calls_closed').AsInteger;
      fQry.Close;

      //Calls open at DATE
      fQry.SQL.Clear;
      fQry.SQL.Add('select count(c.call_code) as calls_closed from call c (nolock)');
      fQry.SQL.Add(' where (c.recorded_date_time < ' + fQry.FormatDate(aToDate) + ')');
      fQry.SQL.Add(' and ((c.last_callactiontype_code <> ''CLOSED'') or ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) > ' + fQry.FormatDate(aToDate) + '))');
      if Trim(cboClient.Text) <> '' then
         fQry.SQL.Add(' and c.customer_code = ' + QuotedStr(Trim(cboClient.Text)));
      if Trim(cboSystem.Text) <> '' then
         fQry.SQL.Add(' and c.system_ref = ' + QuotedStr(Trim(cboSystem.Text)));
      fQry.Open;
      lCallsOpen := fQry.FieldByName('calls_closed').AsInteger;
      fQry.Close;

      mtbCalls.Append;
      mtbCallsDATE.AsDateTime        := aToDate;
      mtbCallsCALLS_CREATED.AsFloat  := lCallsCreated;
      mtbCallsCALLS_CLOSED.AsFloat   := lCallsClosed;
      mtbCallsCALLS_OPEN.AsFloat     := lCallsOpen;
      mtbCalls.Post;
   finally
      if fQry.Active then
         fQry.Close;
   end;
end;

procedure TdStats.UpdateGraph;
var
   lCurrStartDate : TDateTime;
begin
   chtCalls.BottomAxis.Increment    := StrToInt(edtInterval.Text);
   if (dtpTo.Date - dtpFrom.Date) > 600 then
      (mtbCalls.FieldByName('DATE') as TDateTimeField).DisplayFormat := 'dd/mm/yy'
   else
      (mtbCalls.FieldByName('DATE') as TDateTimeField).DisplayFormat := 'dd/mm';
   pb1.Position := 0;
   pb1.Visible := True;
   pb1.Max := Round((dtpTo.DateTime - dtpFrom.DateTime)/edtInterval.Value);
   lCurrStartDate := dtpTo.DateTime - edtInterval.Value*(pb1.Max);
   mtbCalls.Close;
   mtbCalls.Open;
   mtbCalls.DisableControls;
   try
      while ((lCurrStartDate + edtInterval.Value) <= dtpTo.DateTime) do
      begin
         AddCallsCreatedClosed(lCurrStartDate, lCurrStartDate + edtInterval.Value);
         lCurrStartDate := lCurrStartDate + edtInterval.Value;
         pb1.StepBy(1);
         Application.ProcessMessages;
      end;
   finally
      mtbCalls.EnableControls;
      pb1.Position := 0;
      pb1.Visible := False;
      chtCalls.RefreshData;
   end;
end;

procedure TdStats.UpdateGraphPayroll;
begin
   if Trim(cboPayroll.Text) = '' then
   begin
      lnsrsPayrollId.Active := False;
      Exit;
   end
   else
   begin
      lnsrsPayrollId.Active := not TrendView;
      lnsrsPayrollId.Title  := Trim(cboPayroll.Text);
   end;

   pb1.Position := 0;
   pb1.Visible := True;
   pb1.Max := mtbCalls.RecordCount;
   mtbCalls.DisableControls;
   try
      mtbCalls.First;
      while not mtbCalls.eof do
      begin
         try
            fQry.SQL.Clear;
            fQry.SQL.Add('select count(c.call_code) as calls_closed from call c (nolock)');
            fQry.SQL.Add(' left join employee e (nolock) on (e.employee_id = c.assigned_to_emp_id)');
            fQry.SQL.Add(' where c.last_callactiontype_code = ''CLOSED''');
            fQry.SQL.Add(' and e.payroll_id = ' + QuotedStr(Trim(cboPayroll.Text)));
            if Trim(cboClient.Text) <> '' then
               fQry.SQL.Add(' and c.customer_code = ' + QuotedStr(Trim(cboClient.Text)));
            if Trim(cboSystem.Text) <> '' then
               fQry.SQL.Add(' and c.system_ref = ' + QuotedStr(Trim(cboSystem.Text)));
            fQry.SQL.Add(' and ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) > ' + fQry.FormatDate(mtbCallsDATE.AsDateTime - edtInterval.Value) + ')');
            fQry.SQL.Add(' and ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) < ' + fQry.FormatDate(mtbCallsDATE.AsDateTime) + ')');
            fQry.Open;
            mtbCalls.Edit;
            if not fQry.eof then
            begin
               mtbCallsPAYROLL_CLOSED.AsFloat := fQry.FieldByName('calls_closed').AsInteger;
            end
            else
            begin
               mtbCallsPAYROLL_CLOSED.AsFloat := 0;
            end;
            mtbCalls.Post;
         finally
            fQry.Close;
         end;
         pb1.StepBy(1);
         Application.ProcessMessages;
         mtbCalls.Next;
      end;
   finally
      mtbCalls.EnableControls;
      pb1.Position := 0;
      pb1.Visible := False;
      chtCalls.RefreshData;
   end;
end;

procedure TdStats.UpdatePayrollClosed;
begin
   mtbClosed.Close;
   mtbClosed.Open;
   mtbClosed.DisableControls;
   try
      //tasks closed
      fQry.SQL.Clear;
      fQry.SQL.Add('select e.payroll_id, count(c.call_code) as callcount');
      fQry.SQL.Add(' from call c (nolock)');
      fQry.SQL.Add(' join employee e (nolock) on (e.employee_id = c.assigned_to_emp_id)');
      fQry.SQL.Add(' where c.last_callactiontype_code = ''CLOSED''');
      if Trim(cboClient.Text) <> '' then
         fQry.SQL.Add(' and c.customer_code = ' + QuotedStr(Trim(cboClient.Text)));
      if Trim(cboSystem.Text) <> '' then
         fQry.SQL.Add(' and c.system_ref = ' + QuotedStr(Trim(cboSystem.Text)));
      fQry.SQL.Add(' and ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) > ' + fQry.FormatDate(dtpFrom.Date) + ')');
      fQry.SQL.Add(' and ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) < ' + fQry.FormatDate(dtpTo.Date) + ')');
      fQry.SQL.Add(' group by e.payroll_id');
      fQry.SQL.Add(' order by callcount desc');
      fQry.Open;
      fQry.First;
      while not fQry.eof do
      begin
         mtbClosed.Append;
         mtbClosedpayroll_id.AsString  := fQry.FieldByName('payroll_id').AsString;
         mtbClosedclosed.AsInteger     := fQry.FieldByName('callcount').AsInteger;
         mtbClosed.Post;
         fQry.Next;
      end;

      //'Defects' (linked tasks)
      fQry.Close;
      fQry.SQL.Clear;
      fQry.SQL.Add('select e.payroll_id, count(c.call_code) as tasks');
      fQry.SQL.Add(' from call c (nolock)');
      fQry.SQL.Add(' join employee e (nolock) on (e.employee_id = c.assigned_to_emp_id)');
      fQry.SQL.Add(' where ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) > ' + fQry.FormatDate(dtpFrom.Date) + ')');
      fQry.SQL.Add(' and   ((select max(ca.action_datetime) from callaction ca (nolock) where (ca.call_code = c.call_code)) < ' + fQry.FormatDate(dtpTo.Date) + ')');
      if Trim(cboClient.Text) <> '' then
         fQry.SQL.Add(' and c.customer_code = ' + QuotedStr(Trim(cboClient.Text)));
      if Trim(cboSystem.Text) <> '' then
         fQry.SQL.Add(' and c.system_ref = ' + QuotedStr(Trim(cboSystem.Text)));
      fQry.SQL.Add(' and (((c.last_callactiontype_code = ''CLOSED'') and (exists (SELECT TOP 1 tc.task_number from taskcall tc (nolock) where tc.call_code = c.call_code)))');
      fQry.SQL.Add('      or (c.last_callactiontype_code = ''AWAIT_DEVFIX''))');
      fQry.SQL.Add(' group by e.payroll_id');
      fQry.SQL.Add(' order by tasks desc');
      //ShowMessage(fQry.SQL.Text);
      fQry.Open;
      fQry.First;
      while not fQry.eof do
      begin
         if mtbClosed.Locate('payroll_id', fQry.FieldByName('payroll_id').AsString, []) then
         begin
            mtbClosed.Edit;
            mtbClosedtasks.AsInteger      := fQry.FieldByName('tasks').AsInteger;
            mtbClosedtask_perc.AsInteger  := Trunc(100*fQry.FieldByName('tasks').AsInteger/mtbClosed.FieldByName('closed').AsInteger);
            mtbClosed.Post;
         end;
         fQry.Next;
      end;

      mtbClosed.First;
      dbgCalls.CalculateTotals;
      if dbgCalls.Columns[1].FooterValue <> 0 then
         dbgCalls.Columns[3].FooterValue := Round(100*dbgCalls.Columns[2].FooterValue/dbgCalls.Columns[1].FooterValue)
      else
         dbgCalls.Columns[3].FooterValue := 0;
   finally
      if fQry.Active then
         fQry.Close;
      mtbClosed.EnableControls;
   end;
end;

procedure TdStats.FormClose(Sender: TObject; var Action: TCloseAction);
var
   I: Integer;
begin
   for I := chtCalls.SeriesCount -1 downto 0 do
      chtCalls.Series[I].Free;
   if fQry.Active then
      fQry.Close;
   if mtbClosed.Active then
      mtbClosed.Close;
   if mtbCalls.Active then
      mtbCalls.Close;
end;

end.
