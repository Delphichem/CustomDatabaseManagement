program TaskList;

uses
  Forms,
  udTaskList in 'udTaskList.pas' {dTaskList},
  udTaskMerge in 'udTaskMerge.pas' {dTaskMerge},
  udTaskSettings in 'udTaskSettings.pas' {dTaskSettings},
  uuTask in 'uuTask.pas',
  uuGlobals in 'uuGlobals.pas',
  ufDBEDatabase in 'Library\ufDBEDatabase.pas',
  ufDBEQuery in 'Library\ufDBEQuery.pas',
  ufISQLDatabase in 'Library\ufISQLDatabase.pas',
  ufISQLQuery in 'Library\ufISQLQuery.pas',
  udTaskCommit in 'udTaskCommit.pas' {dTaskCommit},
  udShowTask in 'udShowTask.pas' {dShowTask},
  udTaskComplete in 'udTaskComplete.pas' {dTaskComplete},
  udCheckout in 'udCheckout.pas' {dCheckout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Task List';
  Application.CreateForm(TdTaskList, dTaskList);
  Application.Run;
end.
