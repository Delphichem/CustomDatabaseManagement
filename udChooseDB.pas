unit udChooseDB;
{
  March 2016 Code By: Daniel Campbell
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvComCtrls, StdCtrls, ImgList;

type
  TdChooseDB = class(TForm)
    tvServerList1: TJvTreeView;
    tvServerList2: TJvTreeView;
    btnConnect: TButton;
    ilTreeView: TImageList;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tvServerListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnConnectClick(Sender: TObject);
  private
    fFillingServers : Boolean;
    fServer1, fAlias1, fServer2, fAlias2 : string;
  public
    property Server1 : string read fServer1 write fServer1;
    property Alias1  : string read fAlias1 write fAlias1;
    property Server2 : string read fServer2 write fServer2;
    property Alias2  : string read fAlias2 write fAlias2;
  end;

implementation

uses uuServerList;

{$R *.dfm}

procedure TdChooseDB.btnConnectClick(Sender: TObject);
var
   lSelectedNode1, lSelectedNode2 : TTreeNode;
begin
   lSelectedNode1 := tvServerList1.Selected;
   if (lSelectedNode1 = nil) or (lSelectedNode1.Parent = nil) then Exit;
   lSelectedNode2 := tvServerList2.Selected;
   if (lSelectedNode2 = nil) or (lSelectedNode2.Parent = nil) then Exit;

   Server1 := lSelectedNode1.Parent.Text;
   Alias1  := lSelectedNode1.Text;
   Server2 := lSelectedNode2.Parent.Text;
   Alias2  := lSelectedNode2.Text;

   ModalResult := mrOK;
end;

procedure TdChooseDB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdChooseDB.FormShow(Sender: TObject);
begin
   fFillingServers := True;
   PopulateServerList(tvServerList1);
   PopulateServerList(tvServerList2);
   fFillingServers := False;
end;

procedure TdChooseDB.tvServerListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   lSelectedNode : TTreeNode;
   ltvServerList : TJvTreeView;
begin
   ltvServerList := (Sender as TJvTreeView);
   lSelectedNode := ltvServerList.Selected;
   if lSelectedNode = nil then Exit;

   if Button = mbLeft then
   begin
      //This triggers when filling the list but also when they click on a new item
      if (not fFillingServers) then
      begin
         if lSelectedNode.Parent = nil then  //clicked on a server
         begin
            ExpandServer(lSelectedNode, ltvServerList, '', '');
         end;
      end;
   end
end;

end.
