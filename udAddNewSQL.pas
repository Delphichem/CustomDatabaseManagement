unit udAddNewSQL;
{
  May 2015 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SynEditHighlighter, SynHighlighterSQL, SynEdit, SynMemo,
  ExtCtrls;


type
  TdAddNewSQL = class(TForm)
    mmoSQL: TSynMemo;
    SynSQLSyn1: TSynSQLSyn;
    btnOK: TButton;
    btnCancel: TButton;
    rbPersonal: TRadioButton;
    rbEveryone: TRadioButton;
    edtDescription: TLabeledEdit;
    procedure rbPersonalClick(Sender: TObject);
    procedure rbEveryoneClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Setup(aSQL : String);
  end;


implementation

uses
   IniFiles, uuGlobals, ShellAPI;

{$R *.dfm}

procedure TdAddNewSQL.Setup(aSQL : String);
begin
   mmoSQL.Text := aSQL;
end;

procedure TdAddNewSQL.btnOKClick(Sender: TObject);
var
   SMSDataEditorIni : TIniFile;
   PersonalIni : TIniFile;
   lCount : Integer;
   lDesc : string;
   lIniSQL, lIniDesc : string;
   lBatFile : string;
begin
   if Trim(mmoSQL.Text) <> '' then
   begin
      if rbPersonal.Checked then
      begin
         PersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);
         try
            //Find the last one
            lDesc := 'something';
            lCount := 1;
            while lDesc <> '' do
            begin
               lDesc := PersonalIni.ReadString('Favourites', 'Desc' + IntToStr(lCount), '');
               if lDesc = '' then
               begin
                  //Write to the ini
                  lIniDesc := Trim(edtDescription.Text);
                  lIniSQL := StringReplace(Trim(mmoSQL.Text), #13#10, INI_ENTER, [rfReplaceAll]);
                  PersonalIni.WriteString('Favourites', 'Desc' + IntToStr(lCount), lIniDesc);
                  PersonalIni.WriteString('Favourites', 'SQL' + IntToStr(lCount), lIniSQL);
               end;
               Inc(lCount);
            end;
         finally
            PersonalIni.Free;
         end;
      end
      else
      begin
         SMSDataEditorIni := TIniFile.Create(gAppPath + MAIN_INI);
         try
            //Find the last one
            lDesc := 'something';
            lCount := 1;
            while lDesc <> '' do
            begin
               lDesc := SMSDataEditorIni.ReadString('Favourites', 'Desc' + IntToStr(lCount), '');
               if lDesc = '' then
               begin
                  //Write to the ini
                  lIniDesc := Trim(edtDescription.Text);
                  lIniSQL := StringReplace(Trim(mmoSQL.Text), #13#10, INI_ENTER, [rfReplaceAll]);
                  SMSDataEditorIni.WriteString('Favourites', 'Desc' + IntToStr(lCount), lIniDesc);
                  SMSDataEditorIni.WriteString('Favourites', 'SQL' + IntToStr(lCount), lIniSQL);

                  if FileExists('C:\svn\rd\SMS General\SMS Data Editor\SMSDataEditor.ini') then
                  begin
                     lBatFile := 'C:\svn\rd\SMS General\SMS Data Editor\SVNAutoCommitIni.bat';
                     if (FileExists(lBatFile)) then
                        ShellExecute(0, 'open', PAnsiChar(lBatFile), PChar(lBatFile), nil, SW_NORMAL);
                  end
                  else if FileExists('C:\dev\rd\SMS General\SMS Data Editor\SMSDataEditor.ini') then
                  begin
                     lBatFile := 'C:\dev\rd\SMS General\SMS Data Editor\SVNAutoCommitIni.bat';
                     if (FileExists(lBatFile)) then
                        ShellExecute(0, 'open', PAnsiChar(lBatFile), PChar(lBatFile), nil, SW_NORMAL);
                  end;
               end;
               Inc(lCount);
            end;

         finally
            SMSDataEditorIni.Free;
         end;
      end;
   end;
end;

procedure TdAddNewSQL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdAddNewSQL.rbEveryoneClick(Sender: TObject);
begin
   rbPersonal.Checked := False;
end;

procedure TdAddNewSQL.rbPersonalClick(Sender: TObject);
begin
   rbEveryone.Checked := False;
end;

end.
