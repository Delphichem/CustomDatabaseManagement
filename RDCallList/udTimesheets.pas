unit udTimesheets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, DB, kbmMemTable, ufISQLQuery;

type
  TdTimesheets = class(TForm)
    dbgTimesheets: TSMDBGrid;
    dsTS: TDataSource;
    mtbTS: TkbmMemTable;
    mtbTSpayroll_id: TStringField;
    mtbTSday_datetime: TDateTimeField;
    mtbTSstart_interval: TIntegerField;
    mtbTSend_interval: TIntegerField;
    mtbTSfirst_name: TStringField;
    mtbTSlast_name: TStringField;
    mtbTSknown_as: TStringField;
    mtbTSstart_str: TStringField;
    mtbTSend_str: TStringField;
    mtbTShours: TFloatField;
    mtbTSchargeable_ind: TStringField;
    mtbTScharge_percentage: TFloatField;
    mtbTScomment_employee: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtbTSday_datetimeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgTimesheetsFilterChanged(Sender: TObject);
  private

  public
    procedure Setup(aQry : ISQLQuery; aCall : String);
  end;

  function MonthNoToStr(aMonth: Integer): string;

implementation

{$R *.dfm}

procedure TdTimesheets.mtbTSday_datetimeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
   lYear, lMonth, lDay : Word;
begin
   DecodeDate(Sender.AsDateTime, lYear, lMonth, lDay);
   Text := IntToStr(lDay) + '-' + MonthNoToStr(lMonth);
end;

procedure TdTimesheets.Setup(aQry : ISQLQuery; aCall : String);
   function ConvertIntervalToTime(aInterval : Integer) : string;
   var
      lHour, lMinutes : Integer;
      lTotalMinutes : Integer;
      lPM : string;
      function MyTimeToStr(aNo : Integer) : String;
      begin
          if aNo < 10 then
             Result := '0' + IntToStr(aNo)
          else
             Result := IntToStr(aNo);
      end;
   begin
      lTotalMinutes := (aInterval*15);
      lHour := Trunc(lTotalMinutes/60);
      lMinutes := lTotalMinutes mod 60;
      if lHour > 12 then
      begin
         lHour := lHour - 12;
         lPM := 'PM';
      end
      else
         lPM := 'AM';

      Result := MyTimeToStr(lHour) + ':' + MyTimeToStr(lMinutes) + ' ' + lPM;
   end;
begin
   mtbTS.ReadOnly := False;
   mtbTS.Close;
   mtbTS.Open;

   try
      aQry.SQL.Clear;
      aQry.SQL.Add('select e.payroll_id, e.first_name, e.last_name,');
      aQry.SQL.Add(' et.day_datetime, et.start_interval, et.end_interval, ');
      aQry.SQL.Add(' et.chargeable_ind, et.charge_percentage, et.comment_employee ');
      aQry.SQL.Add(' from employeetimesheet et (nolock)');
      aQry.SQL.Add(' left join employee e (nolock) on (e.employee_id = et.employee_id)');
      aQry.SQL.Add(' where call_code = ' + QuotedStr(aCall));
      aQry.SQL.Add(' order by et.day_datetime, et.start_interval');
      aQry.Open;
      aQry.First;
      while not aQry.eof do
      begin
         mtbTS.Append;
         mtbTSpayroll_id.AsString       := aQry.FieldByName('payroll_id').AsString;
         mtbTSfirst_name.AsString       := aQry.FieldByName('first_name').AsString;
         mtbTSlast_name.AsString        := aQry.FieldByName('last_name').AsString;
         mtbTSknown_as.AsString         := mtbTSfirst_name.AsString + ' ' + mtbTSlast_name.AsString;
         mtbTSday_datetime.AsDateTime   := aQry.FieldByName('day_datetime').AsDateTime;
         mtbTSstart_interval.AsInteger  := aQry.FieldByName('start_interval').AsInteger;
         mtbTSend_interval.AsInteger    := aQry.FieldByName('end_interval').AsInteger;
         mtbTSstart_str.AsString        := ConvertIntervalToTime(mtbTSstart_interval.AsInteger);
         mtbTSend_str.AsString          := ConvertIntervalToTime(mtbTSend_interval.AsInteger);
         mtbTShours.AsFloat             := (((mtbTSend_interval.AsInteger - mtbTSstart_interval.AsInteger) + 1)*15)/60;
         mtbTSchargeable_ind.AsString   := aQry.FieldByName('chargeable_ind').AsString;
         mtbTScomment_employee.AsString := aQry.FieldByName('comment_employee').AsString;
         mtbTScharge_percentage.AsFloat := aQry.FieldByName('charge_percentage').AsFloat;
         mtbTS.Post;
         aQry.Next;
      end;
   finally
      if Assigned(aQry) then
      begin
         aQry.Close;
         aQry := nil;
      end;
      mtbTS.ReadOnly := True;
      dbgTimesheets.CalculateTotals;
   end;
end;

procedure TdTimesheets.dbgTimesheetsFilterChanged(Sender: TObject);
begin
   dbgTimesheets.CalculateTotals;
end;

procedure TdTimesheets.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if mtbTS.Active then
     mtbTS.Close;
end;

function MonthNoToStr(aMonth : Integer) : string;
begin
   if aMonth = 1 then Result := 'Jan'
   else if aMonth = 2 then Result := 'Feb'
   else if aMonth = 3 then Result := 'Mar'
   else if aMonth = 4 then Result := 'Apr'
   else if aMonth = 5 then Result := 'May'
   else if aMonth = 6 then Result := 'Jun'
   else if aMonth = 7 then Result := 'Jul'
   else if aMonth = 8 then Result := 'Aug'
   else if aMonth = 9 then Result := 'Sep'
   else if aMonth = 10 then Result := 'Oct'
   else if aMonth = 11 then Result := 'Nov'
   else if aMonth = 12 then Result := 'Dec';
end;

end.
