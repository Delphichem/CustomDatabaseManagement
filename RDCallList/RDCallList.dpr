program RDCallList;

uses
  Forms,
  udCalls in 'udCalls.pas' {dCalls},
  ufBDELockHandler in 'Library\ufBDELockHandler.pas',
  ufDBEDatabase in 'Library\ufDBEDatabase.pas',
  ufDBEQuery in 'Library\ufDBEQuery.pas',
  ufISQLDatabase in 'Library\ufISQLDatabase.pas',
  ufISQLQuery in 'Library\ufISQLQuery.pas',
  ufTFQuery in 'Library\ufTFQuery.pas',
  udWhoAmI in 'udWhoAmI.pas' {dWhoAmI},
  udTimesheets in 'udTimesheets.pas' {dTimesheets},
  udStats in 'udStats.pas' {dStats},
  uuGlobals in 'uuGlobals.pas',
  udExport in 'udExport.pas' {dExport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdCalls, dCalls);
  Application.Run;
end.
