program SMSDataEditor;

uses
  Forms,
  DataEditorCode in 'DataEditorCode.pas' {frmDataEditor},
  uuGlobals in 'uuGlobals.pas',
  udSQLParams in 'udSQLParams.pas' {dSQLParams},
  udRecordView in 'udRecordView.pas' {dRecordView},
  udSettings in 'udSettings.pas' {dSettings},
  udDataGenie in 'udDataGenie.pas' {dDataGenie},
  uuTab in 'uuTab.pas',
  ufISQLDatabase in 'Library\ufISQLDatabase.pas',
  ufISQLQuery in 'Library\ufISQLQuery.pas',
  ufNexusDatabase in 'Library\ufNexusDatabase.pas',
  ufNexusQuery in 'Library\ufNexusQuery.pas',
  ufPDXDatabase in 'Library\ufPDXDatabase.pas',
  ufPDXQuery in 'Library\ufPDXQuery.pas',
  ufTFQuery in 'Library\ufTFQuery.pas',
  ufBDELockHandler in 'Library\ufBDELockHandler.pas',
  udLocate in 'udLocate.pas' {dLocate},
  udSQLFavourites in 'udSQLFavourites.pas' {dSQLFavourites},
  udCreateAlias in 'udCreateAlias.pas' {dCreateAlias},
  udInsertSQL in 'udInsertSQL.pas' {dInsertSQL},
  udExport in 'udExport.pas' {dExport},
  ufDBEQuery in 'Library\ufDBEQuery.pas',
  ufDBEDatabase in 'Library\ufDBEDatabase.pas',
  udSMSLinks in 'udSMSLinks.pas' {dSMSLinks},
  udSMSTools in 'udSMSTools.pas' {dSMSTools},
  udColumnVisibility in 'udColumnVisibility.pas' {dColumnVisibility},
  udSelectOptions in 'udSelectOptions.pas' {dSelectOptions},
  udMSSQLConnect in 'udMSSQLConnect.pas' {dMSSQLConnect},
  udAddNewSQL in 'udAddNewSQL.pas' {dAddNewSQL},
  udRegistryPrompt in 'udRegistryPrompt.pas' {dRegistryPrompt},
  udDlgColumn in 'udDlgColumn.pas' {dDlgColumn},
  udDlgTable in 'udDlgTable.pas' {dDlgTable},
  udDlgIndex in 'udDlgIndex.pas' {dDlgIndex},
  uuSQLEditor in 'uuSQLEditor.pas',
  udRegisterServers in 'udRegisterServers.pas' {dRegisterServers},
  udCompareDB in 'udCompareDB.pas' {dCompareDB},
  uuServerList in 'uuServerList.pas',
  udChooseDB in 'udChooseDB.pas' {dChooseDB},
  udSMSConfigs in 'udSMSConfigs.pas' {dSMSConfigs},
  ufReference in 'Library\ufReference.pas',
  udSchemaChange in 'udSchemaChange.pas' {dSchemaChange};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SMS Data Editor';
  Application.CreateForm(TfrmDataEditor, frmDataEditor);
  Application.Run;
end.
