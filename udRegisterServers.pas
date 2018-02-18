unit udRegisterServers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TdRegisterServers = class(TForm)
    lbServers: TListBox;
    edtServer: TLabeledEdit;
    btnAdd: TButton;
    btnDelete: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
implementation

uses uuGlobals, IniFiles, uuServerList;

{$R *.dfm}

procedure TdRegisterServers.FormShow(Sender: TObject);
var
   PersonalIni : TIniFile;
   lDesc : String;
   lCount : Integer;
begin
   PersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);
   try
      lDesc := 'something';
      lCount := 1;
      while lDesc <> '' do
      begin
         lDesc := PersonalIni.ReadString('ServerList', 'Server' + IntToStr(lCount), '');
         if lDesc <> '' then
            lbServers.Items.Add(lDesc);
         Inc(lCount);
      end;
      lbServers.Update;
      edtServer.SetFocus;
   finally
      PersonalIni.Free;
   end;
end;

procedure TdRegisterServers.btnAddClick(Sender: TObject);
begin
   if Trim(edtServer.Text) <> '' then
   begin
      lbServers.Items.Add(Trim(edtServer.Text));
      lbServers.Update;
      edtServer.Text := '';
   end;
end;

procedure TdRegisterServers.btnDeleteClick(Sender: TObject);
begin
   if lbServers.Items.Count <> 0 then
   begin
      lbServers.Items.Delete(lbServers.ItemIndex);
      lbServers.Update;
   end;
end;

procedure TdRegisterServers.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   PersonalIni : TIniFile;
   I : Integer;
begin
   PersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);
   try
      //Clear what's in the ini file and rewrite them all
      PersonalIni.EraseSection('ServerList');
      for I := 0 to lbServers.Items.Count - 1 do
      begin
         PersonalIni.WriteString('ServerList', 'Server' + IntToStr(I + 1), lbServers.Items[I]);
      end;
   finally
      PersonalIni.Free;
   end;
end;

procedure TdRegisterServers.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

end.
