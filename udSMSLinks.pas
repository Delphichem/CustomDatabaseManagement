unit udSMSLinks;
{
 Nov 2014 Code By: Daniel Campbell


 HOW TO ADD A NEW TABLE TO AN EXISTING MASTER TAB

 *DFM*
 1. Right click the sub TPageControl and create a new page
 2. Copy another SMDBGrid into the new tab
 3. Name the SMDBGrid dbgSomething and the tab tsSomething and give the tab a caption

 *PAS*
 4. Copy and paste 2 lines of code, something like this
   lSQL := 'select * from something where something_code = :something_code';
   tab[1][2] := TTab.Create(dbgSomething, 0, 'something', lSQL, False);
 5. Depending on the table, may need to do extra work in the Search button for the master
   tab and also linking from/to to other tables


 HOW TO ADD A NEW MASTER TAB

 *DFM*
 1. Right click the Master TPageControl and create a new page
 2. Copy the controls and the TPageControl from the last tab and rename everything
 with the same convention

 *PAS*
 1. Search all files in this project for  '//new master tab' to get the idea


}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, SMDBGrid, DB, DBTables,
  nxdb, Buttons, udRecordView, kbmMemTable, Menus, uuTab, DBCtrls,
  uuGlobals, ufISQLDataBase, ufISQLQuery;

type
  //This helps make the link from button automatic
  TMasterCode = record
     edt : TLabeledEdit;
     code : String;
     btnS : tSpeedButton;
  end;

  TMasterTab = record
     pc : TPageControl;
     dn : TDBNavigator;
  end;

  THackDBGrid = class(TSMDBGrid);

  TdSMSLinks = class(TForm)
    pgEnquiry: TPageControl;
    tsSale: TTabSheet;
    tsItem: TTabSheet;
    tsGRN: TTabSheet;
    tsLocMove: TTabSheet;
    tsStockTake: TTabSheet;
    pgSale: TPageControl;
    tsSaleSale: TTabSheet;
    tsSaleLine: TTabSheet;
    tsSaleBenefit: TTabSheet;
    tsSaleBenefitLine: TTabSheet;
    edtSaleCode: TLabeledEdit;
    edtReceiptNbr: TLabeledEdit;
    btnLastSale: TButton;
    pgItem: TPageControl;
    tsItemItem: TTabSheet;
    tsItemColour: TTabSheet;
    tsItemColourSize: TTabSheet;
    edtItemColourSize: TLabeledEdit;
    pgGRN: TPageControl;
    edtGRNCode: TLabeledEdit;
    tsGRNGRN: TTabSheet;
    tsGrnLine: TTabSheet;
    tsGrnCarton: TTabSheet;
    tsGrnSize: TTabSheet;
    dbgSale: TSMDBGrid;
    dbgSaleLine: TSMDBGrid;
    dbgSaleBenefit: TSMDBGrid;
    dbgSaleLineBenefit: TSMDBGrid;
    dbgItem: TSMDBGrid;
    dbgItemColour: TSMDBGrid;
    dbgItemColourSize: TSMDBGrid;
    dbgGrn: TSMDBGrid;
    dbgGrnLine: TSMDBGrid;
    dbgGrnCarton: TSMDBGrid;
    dbgGrnSize: TSMDBGrid;
    btnLastGRN: TButton;
    edtStockTakeCode: TLabeledEdit;
    pgStockTake: TPageControl;
    tsStockTakeStockTake: TTabSheet;
    tsStockTakeCount: TTabSheet;
    tsStockTakeCountLine: TTabSheet;
    dbgStockTake: TSMDBGrid;
    dbgStockTakeCount: TSMDBGrid;
    dbgStockTakeCountLine: TSMDBGrid;
    tsTenderLine: TTabSheet;
    dbgTenderLine: TSMDBGrid;
    btnLastStockTake: TButton;
    TabSheet8: TTabSheet;
    dbgSaleLineReturn: TSMDBGrid;
    edtLocMoveCode: TLabeledEdit;
    pgLocMove: TPageControl;
    btnLastLocMove: TButton;
    tsLocMoveLocMove: TTabSheet;
    tsLocMoveLine: TTabSheet;
    tsLocMoveCarton: TTabSheet;
    tsLocMoveSize: TTabSheet;
    tsLocMoveComment: TTabSheet;
    dbgLocMove: TSMDBGrid;
    dbgLocMoveLine: TSMDBGrid;
    dbgLocMoveCarton: TSMDBGrid;
    dbgLocMoveSize: TSMDBGrid;
    dbgLocMoveComment: TSMDBGrid;
    btnRecordView: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    mtbRecord: TkbmMemTable;
    mtbRecordField: TStringField;
    mtbRecordValue: TStringField;
    mtbRecordType: TStringField;
    mtbRecordIsNull: TBooleanField;
    btnSearchStockTake: TSpeedButton;
    btnSearchLocMove: TSpeedButton;
    btnGRNSearch: TSpeedButton;
    btnItemSearch: TSpeedButton;
    btnSaleSearch: TSpeedButton;
    btnItemLink: TButton;
    btnLocMoveLinkFrom: TButton;
    tsStoreICS: TTabSheet;
    dbgStoreICS: TSMDBGrid;
    tsVirtualDrawer: TTabSheet;
    SpeedButton5: TSpeedButton;
    edtVirtualDrawerCode: TLabeledEdit;
    btnSearchVirtualDrawer: TSpeedButton;
    pgVirtualDrawer: TPageControl;
    tsVirtualDrawerVirtualDrawer: TTabSheet;
    dbgVirtualDrawer: TSMDBGrid;
    tsVirtualDrawerTender: TTabSheet;
    dbgVirtualDrawerTender: TSMDBGrid;
    tsVirtualDrawerTransfer: TTabSheet;
    dbgVirtualDrawerTransfer: TSMDBGrid;
    btnVirtualDrawerLinkFrom: TButton;
    btnInfo: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    pnlInfo: TPanel;
    mmoTableHint: TRichEdit;
    dnSale: TDBNavigator;
    dnItem: TDBNavigator;
    dnGrn: TDBNavigator;
    dnLocMove: TDBNavigator;
    dnStockTake: TDBNavigator;
    dnVirtualDrawer: TDBNavigator;
    poColumns: TPopupMenu;
    SortAscending: TMenuItem;
    SortDescending: TMenuItem;
    SetValueTo: TMenuItem;
    Hint: TMenuItem;
    edtColumnValue: TEdit;
    tsPromotion: TTabSheet;
    dnPromotion: TDBNavigator;
    SpeedButton11: TSpeedButton;
    edtPromotionCode: TLabeledEdit;
    btnSearchPromotion: TSpeedButton;
    btnPromotionLinkFrom: TButton;
    SpeedButton13: TSpeedButton;
    pgPromotion: TPageControl;
    tsPromotionPromotion: TTabSheet;
    dbgPromotion: TSMDBGrid;
    tsPromotionItem: TTabSheet;
    dbgPromotionItem: TSMDBGrid;
    tsPromotionTier: TTabSheet;
    dbgPromotionTier: TSMDBGrid;
    tsStore: TTabSheet;
    dnStore: TDBNavigator;
    SpeedButton12: TSpeedButton;
    edtStoreCode: TLabeledEdit;
    btnSearchStore: TSpeedButton;
    btnStoreLinkFrom: TButton;
    SpeedButton15: TSpeedButton;
    pgStore: TPageControl;
    tsStoreStore: TTabSheet;
    dbgStore: TSMDBGrid;
    tsStoreNeighbour: TTabSheet;
    dbgStoreNeighbour: TSMDBGrid;
    tsSaleDelivery: TTabSheet;
    dbgSaleDelivery: TSMDBGrid;
    tsTransCustomer: TTabSheet;
    dbgTransCustomer: TSMDBGrid;
    tsSaleGiftVoucher: TTabSheet;
    dbgSaleGiftVoucher: TSMDBGrid;
    tsGiftCardTransaction: TTabSheet;
    dbgGiftCardTransaction: TSMDBGrid;
    btnRefreshAll: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    tsGrnComment: TTabSheet;
    dbgGrnComment: TSMDBGrid;
    mtbRecordHint: TStringField;
    edtItemColour: TLabeledEdit;
    edtItem: TLabeledEdit;
    tsPrice: TTabSheet;
    tsSellCode: TTabSheet;
    dbgPrice: TSMDBGrid;
    dbgSellCode: TSMDBGrid;
    tsStoreICSTran: TTabSheet;
    tsStoreIC: TTabSheet;
    dbgStoreICSTran: TSMDBGrid;
    dbgStoreIC: TSMDBGrid;
    tsLocation: TTabSheet;
    dbgLocation: TSMDBGrid;
    tsDataCentre: TTabSheet;
    dbgDataCentre: TSMDBGrid;
    tsItemColourSupplier: TTabSheet;
    dbgItemColourSupplier: TSMDBGrid;
    tsRetailChain: TTabSheet;
    dbgRetailChain: TSMDBGrid;
    tsCompany: TTabSheet;
    dbgCompany: TSMDBGrid;
    tsCountry: TTabSheet;
    dbgCountry: TSMDBGrid;
    tsTimeZone: TTabSheet;
    dbgTimeZone: TSMDBGrid;
    tsUser: TTabSheet;
    dnUser: TDBNavigator;
    SpeedButton14: TSpeedButton;
    edtUserCode: TLabeledEdit;
    btnSearchUser: TSpeedButton;
    btnUserLinkFrom: TButton;
    Button9: TButton;
    SpeedButton17: TSpeedButton;
    pgUser: TPageControl;
    tsRemediUser: TTabSheet;
    dbgRemediUser: TSMDBGrid;
    tsRemediUserKey: TTabSheet;
    edtEmployeeID: TLabeledEdit;
    dbgRemediUserKey: TSMDBGrid;
    tsEmployee: TTabSheet;
    dbgEmployee: TSMDBGrid;
    tsEmployeeStore: TTabSheet;
    dbgEmployeeStore: TSMDBGrid;
    tsStocktakeInit: TTabSheet;
    dbgStocktakeInit: TSMDBGrid;
    tsStocktakeAdjustment: TTabSheet;
    dbgStocktakeAdjustment: TSMDBGrid;
    tsStocktakeOmit: TTabSheet;
    dbgStocktakeOmit: TSMDBGrid;
    tsStocktakeLocation: TTabSheet;
    dbgStocktakeLocation: TSMDBGrid;
    tsStocktakeCategory: TTabSheet;
    dbgStocktakeCategory: TSMDBGrid;
    tsStocktakeError: TTabSheet;
    dbgStocktakeError: TSMDBGrid;
    tsDivision: TTabSheet;
    dbgDivision: TSMDBGrid;
    tsCategory: TTabSheet;
    dbgCategory: TSMDBGrid;
    tsDepartment: TTabSheet;
    dbgDepartment: TSMDBGrid;
    tsColour: TTabSheet;
    dbgColour: TSMDBGrid;
    tsSize: TTabSheet;
    dbgSize: TSMDBGrid;
    tsRegister: TTabSheet;
    dbgRegister: TSMDBGrid;
    tsRemediPc: TTabSheet;
    dbgRemediPc: TSMDBGrid;
    poLinkFrom: TPopupMenu;
    tsEmployeeStoreDisc: TTabSheet;
    dbgEmployeeStoreDisc: TSMDBGrid;
    tsSaleSignature: TTabSheet;
    tsSaleNote: TTabSheet;
    dbgSaleSignature: TSMDBGrid;
    dbgSaleNote: TSMDBGrid;
    tsCustomer: TTabSheet;
    dnCustomer: TDBNavigator;
    SpeedButton16: TSpeedButton;
    edtCustomerId: TLabeledEdit;
    btnSearchCustomer: TSpeedButton;
    btnCustomerLinkFrom: TButton;
    Button10: TButton;
    SpeedButton19: TSpeedButton;
    pgCustomer: TPageControl;
    tsCustomerCustomer: TTabSheet;
    dbgCustomer: TSMDBGrid;
    tsLoyaltyCustomer: TTabSheet;
    dbgLoyaltyCustomer: TSMDBGrid;
    tsLoyaltyCustMember: TTabSheet;
    dbgLoyaltyCustMember: TSMDBGrid;
    tsLoyaltyCustTran: TTabSheet;
    dbgLoyaltyCustTran: TSMDBGrid;
    tsLoyaltyCustPeriod: TTabSheet;
    dbgLoyaltyCustPeriod: TSMDBGrid;
    tsLoyalty: TTabSheet;
    tsLoyaltyProgram: TTabSheet;
    dbgLoyalty: TSMDBGrid;
    dbgLoyaltyProgram: TSMDBGrid;
    tsCustomerType: TTabSheet;
    dbgCustomerType: TSMDBGrid;
    tsCustomerPoints: TTabSheet;
    dbgCustomerPoints: TSMDBGrid;
    tsLayby: TTabSheet;
    tsBankDeposit: TTabSheet;
    dnLayby: TDBNavigator;
    SpeedButton18: TSpeedButton;
    edtLaybyId: TLabeledEdit;
    btnSearchLayby: TSpeedButton;
    btnLaybyLinkFrom: TButton;
    Button11: TButton;
    SpeedButton21: TSpeedButton;
    dnBankDeposit: TDBNavigator;
    SpeedButton22: TSpeedButton;
    edtBankDepositCode: TLabeledEdit;
    btnSearchBankDeposit: TSpeedButton;
    btnBankDepositLinkFrom: TButton;
    Button13: TButton;
    SpeedButton24: TSpeedButton;
    pgLayby: TPageControl;
    tsLaybyLayby: TTabSheet;
    dbgLayby: TSMDBGrid;
    pgBankDeposit: TPageControl;
    tsBankDepositBankDeposit: TTabSheet;
    dbgBankDeposit: TSMDBGrid;
    btnLastBankDeposit: TButton;
    tsLaybyLine: TTabSheet;
    tsLaybyTrans: TTabSheet;
    tsLaybyNote: TTabSheet;
    tsLaybyBalance: TTabSheet;
    dbgLaybyLine: TSMDBGrid;
    dbgLaybyTrans: TSMDBGrid;
    dbgLaybyNote: TSMDBGrid;
    dbgLaybyBalance: TSMDBGrid;
    tsBankDepositCheque: TTabSheet;
    tsBankDepositVoucher: TTabSheet;
    tsBankDepositTransfer: TTabSheet;
    dbgBankDepositCheque: TSMDBGrid;
    dbgBankDepositVoucher: TSMDBGrid;
    dbgBankDepositTransfer: TSMDBGrid;
    tsBankAccount: TTabSheet;
    dbgBankAccount: TSMDBGrid;
    tsBankAccountStore: TTabSheet;
    dbgBankAccountStore: TSMDBGrid;
    tsVdMovement: TTabSheet;
    dbgVdMovement: TSMDBGrid;
    tsvdrawerevent: TTabSheet;
    dbgVDrawerEvent: TSMDBGrid;
    tsVdrawerrecline: TTabSheet;
    dbgVDrawerRecLine: TSMDBGrid;
    tsVdrawerrecdenom: TTabSheet;
    dbgVDrawerRecDenom: TSMDBGrid;
    tsVdrawerrecvoucher: TTabSheet;
    dbgVDrawerRecVoucher: TSMDBGrid;
    tsPromotionItemGroup: TTabSheet;
    dbgPromotionItemGroup: TSMDBGrid;
    tsPromotionStore: TTabSheet;
    dbgPromotionStore: TSMDBGrid;
    tsPromotionCustomer: TTabSheet;
    tsPromotionCustomerType: TTabSheet;
    dbgPromotionCustomer: TSMDBGrid;
    dbgPromotionCustomerType: TSMDBGrid;
    tsPromotionLoyaltyGroup: TTabSheet;
    dbgPromotionLoyaltyGroup: TSMDBGrid;
    tsPromotionBeneficiary: TTabSheet;
    dbgPromotionBeneficiary: TSMDBGrid;
    tsSaleTaxCustomer: TTabSheet;
    tsSaleTaxExempt: TTabSheet;
    dbgSaleTaxCustomer: TSMDBGrid;
    dbgSaleTaxExempt: TSMDBGrid;
    tsDocketMessageLine: TTabSheet;
    dbgDocketMessageLine: TSMDBGrid;
    tsDataCentreStatus: TTabSheet;
    dbgDataCentreStatus: TSMDBGrid;
    tsDataCentreLastTask: TTabSheet;
    dbgDataCentreLastTask: TSMDBGrid;
    tsScript: TTabSheet;
    dbgScript: TSMDBGrid;
    tsStoreJournal: TTabSheet;
    dbgStoreJournal: TSMDBGrid;
    tsCustomerPayment: TTabSheet;
    dbgCustomerPayment: TSMDBGrid;
    tsCustomerPayment1: TTabSheet;
    dbgCustomerPayment2: TSMDBGrid;
    tstimeattenddayhour: TTabSheet;
    dbgTimeAttendDayHour: TSMDBGrid;
    tsTimeAttendTrans: TTabSheet;
    dbgTimeAttendTrans: TSMDBGrid;
    tsPrintRequest: TTabSheet;
    dbgPrintRequest: TSMDBGrid;
    tsStoreICSTran2: TTabSheet;
    dbgStoreICSTran2: TSMDBGrid;
    tsStoreICSTran3: TTabSheet;
    dbgStoreICSTran3: TSMDBGrid;
    tsAdjustment: TTabSheet;
    dnAdjustment: TDBNavigator;
    btn1: TSpeedButton;
    edtAdjustmentCode: TLabeledEdit;
    btnSearchAdjustment: TSpeedButton;
    btnLastAdjustment: TButton;
    btnAdjustmentLinkFrom: TButton;
    btn5: TButton;
    btn6: TSpeedButton;
    pgAdjustment: TPageControl;
    tsAdjustmentAdjustment: TTabSheet;
    dbgAdjustment: TSMDBGrid;
    tsAdjustmentLine: TTabSheet;
    dbgAdjustmentLine: TSMDBGrid;
    tsAdjustmentSize: TTabSheet;
    dbgAdjustmentSize: TSMDBGrid;
    tsStoreICSTran4: TTabSheet;
    dbgStoreICSTran4: TSMDBGrid;
    tsStocktakeSku: TTabSheet;
    dbgStocktakeSku: TSMDBGrid;
    tsCustIdentification: TTabSheet;
    dbgCustIdentification: TSMDBGrid;
    tsSalelineReference: TTabSheet;
    dbgSalelineReference: TSMDBGrid;
    tsUnitload: TTabSheet;
    dbgUnitload: TSMDBGrid;
    tsUnitloadContent: TTabSheet;
    dbgUnitloadcontent: TSMDBGrid;
    tsUnitloadcontentlog: TTabSheet;
    dbgUnitloadcontentlog: TSMDBGrid;
    tsItemColourImage: TTabSheet;
    dbgItemColourImage: TSMDBGrid;
    tsImage: TTabSheet;
    dbgImage: TSMDBGrid;
    tsFixedItemColourSize: TTabSheet;
    dbgFixedItemColourSize: TSMDBGrid;
    tsRemediPwdHist: TTabSheet;
    dbgRemediPwdHist: TSMDBGrid;
    tsLocationRetailChain: TTabSheet;
    dbgLocationRetailChain: TSMDBGrid;
    tsRemediEvent: TTabSheet;
    dbgRemediEvent: TSMDBGrid;
    tsRemediPrinterType: TTabSheet;
    dbgRemediPrinterType: TSMDBGrid;
    tsCurrencyLocation: TTabSheet;
    dbgCurrencyLocation: TSMDBGrid;
    tsCurrencyRate: TTabSheet;
    dbgCurrencyRate: TSMDBGrid;
    tsCurrency: TTabSheet;
    dbgCurrency: TSMDBGrid;
    tsitemretailchain: TTabSheet;
    dbgItemRetailChain: TSMDBGrid;
    tsRetailChain2: TTabSheet;
    dbgRetailChain2: TSMDBGrid;
    tsSaleLine2: TTabSheet;
    dbgSaleline2: TSMDBGrid;
    tsLaybyTerms: TTabSheet;
    dbgLaybyTerms: TSMDBGrid;
    tsLaybyTermsLine: TTabSheet;
    dbgLaybyTermsLine: TSMDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaleSearchClick(Sender: TObject);
    procedure btnItemSearcClick(Sender: TObject);
    procedure btnGRNSearchClick(Sender: TObject);
    procedure btnSearchStockTakeClick(Sender: TObject);
    procedure btnLastSaleClick(Sender: TObject);
    procedure btnSearchLocMovClick(Sender: TObject);
    procedure dbgTableMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure dbgTableMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure btnRecordViewClick(Sender: TObject);
    procedure btnItemLinkClick(Sender: TObject);
    procedure btnLocMoveLinkFromClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnLastGRNClick(Sender: TObject);
    procedure btnLastLocMoveClick(Sender: TObject);
    procedure btnLastStockTakeClick(Sender: TObject);
    procedure btnSearchVirtualDrawerClick(Sender: TObject);
    procedure btnVirtualDrawerLinkFromClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure pgChange(Sender: TObject);
    procedure edtColumnValueKeyPress(Sender: TObject; var Key: Char);
    procedure edtColumnValueExit(Sender: TObject);
    procedure dbgTableTitleClick(Column: TColumn);
    procedure HintClick(Sender: TObject);
    procedure SortAscendingClick(Sender: TObject);
    procedure SortDescendingClick(Sender: TObject);
    procedure SetValueToClick(Sender: TObject);
    procedure dbgTableColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure btnSearchPromotionClick(Sender: TObject);
    procedure btnSearchStoreClick(Sender: TObject);
    procedure btnRefreshAllClick(Sender: TObject);
    procedure btnPromotionLinkFromClick(Sender: TObject);
    procedure dbgTableMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSearchUserClick(Sender: TObject);
    procedure btnUserLinkFromClick(Sender: TObject);
    procedure pgTableDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure LinkFromClick(Sender: TObject);
    procedure mtbRecordValueChange(Sender: TField);
    procedure btnCustomerLinkFromClick(Sender: TObject);
    procedure btnSearchCustomerClick(Sender: TObject);
    procedure btnLaybyLinkFromClick(Sender: TObject);
    procedure btnBankDepositLinkFromClick(Sender: TObject);
    procedure btnSearchBankDepositClick(Sender: TObject);
    procedure btnSearchLaybyClick(Sender: TObject);
    procedure btnLastBankDepositClick(Sender: TObject);
    procedure btnStoreLinkFromClick(Sender: TObject);
    procedure btnAdjustmentLinkFromClick(Sender: TObject);
    procedure btnSearchAdjustmentClick(Sender: TObject);
    procedure btnLastAdjustmentClick(Sender: TObject);
    procedure edtSaleCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemColourSizeKeyPress(Sender: TObject; var Key: Char);
    procedure edtGRNCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocMoveCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtStockTakeCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtVirtualDrawerCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtPromotionCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtStoreCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmployeeIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCustomerIdKeyPress(Sender: TObject; var Key: Char);
    procedure edtLaybyIdKeyPress(Sender: TObject; var Key: Char);
    procedure edtBankDepositCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtAdjustmentCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemColourSizeChange(Sender: TObject);
    procedure edtItemColourChange(Sender: TObject);
    procedure edtItemChange(Sender: TObject);
  private
    { Private declarations }
    tab : array of array of TTab;
    mCode : array of TMasterCode;
    mTab : array of TMasterTab;
    fInfoShowing : Boolean;
    fFieldClicked : TField;
    fColMoved : Boolean;
    fColumnHint : String;
    fScrollLeftRight : Boolean;
    qryUtil : ISQLQuery;
    function SetParamOpenAndDDL(I, J: Integer; ParamName,
      ParamValue: String): Boolean;
    function GetActiveSubPageIndex: Integer;
    function ActiveTab: TTab;
    procedure CreateMasterTab(aIndex: Integer);
    function OpenEmployeeTables(aEmployeeId: String): String;
    procedure OpenUserTables(aUserCode: String);
    procedure ShowLinkFrom(aMasterTabIndex: Integer);
    procedure SetMasterTabs;
    procedure SingleCodeSearch(aCode: String; aMasterCodeIndex,
      aTabIndex: Integer);
    procedure AdjustTabSQLForICSearch;
    procedure AdjustTabSQLForICSSearch;
    procedure AdjustTabSQLForItemSearch;
  public
    { Public declarations }
    procedure SetUp(aUseRegistry : Boolean;
       aDefaultCodes : array of String; aFont : Integer);
  end;

implementation

uses
   TypInfo, Math;

//creating all the tab objects in FormCreate created a delay, so instead
//only creating the tab objects for the active tab in formshow
//then create if neccesary when changing tabs


procedure TdSMSLinks.CreateMasterTab(aIndex : Integer);
var
   lSQL : String;
begin
   if (aIndex = 0) and (not Assigned(tab[0][0])) then  //SALE
   begin
      lSQL := 'select * from sale where sale_code = :sale_code';
      tab[0][0] := TTab.Create(gDataBase, dbgSale, 0, 'sale', lSQL, False);
      lSQL := 'select * from saleline where sale_code = :sale_code';
      tab[0][1] := TTab.Create(gDataBase, dbgSaleLine, 0, 'saleline', lSQL, False);
      lSQL := 'select * from tenderline where source_doc_code = :sale_code';
      tab[0][2] := TTab.Create(gDataBase, dbgTenderLine, 0, 'tenderline', lSQL, False);
      lSQL := 'select * from storeicstran where (document_type = ' + QuotedStr('S') + ') and document_line_id in (select saleline_id from saleline where sale_code = :sale_code)';
      tab[0][3] := TTab.Create(gDataBase, dbgStoreICSTran3, 0, 'storeicstran', lSQL, False);
      lSQL := 'select * from salebenefit where sale_code = :sale_code';
      tab[0][4] := TTab.Create(gDataBase, dbgSaleBenefit, 0, 'salebenefit', lSQL, False);
      lSQL := 'select * from salelinebenefit where saleline_id in (select saleline_id from saleline where sale_code = :sale_code)';
      tab[0][5] := TTab.Create(gDataBase, dbgSaleLineBenefit, 0, 'salelinebenefit', lSQL, False);
      lSQL := 'select * from salelinereturn where return_saleline_id in (select saleline_id from saleline where sale_code = :sale_code)';
      tab[0][6] := TTab.Create(gDataBase, dbgSaleLineReturn, 0, 'salelinereturn', lSQL, False);
      lSQL := 'select * from saledelivery where sale_code = :sale_code';
      tab[0][7] := TTab.Create(gDataBase, dbgSaleDelivery, 0, 'saledelivery', lSQL, False);
      lSQL := 'select * from transcustomer where sale_code = :sale_code';
      tab[0][8] := TTab.Create(gDataBase, dbgTransCustomer, 0, 'transcustomer', lSQL, False);
      lSQL := 'select * from salegiftvoucher where saleline_id in (select saleline_id from saleline where sale_code = :sale_code)';
      tab[0][9] := TTab.Create(gDataBase, dbgSaleGiftVoucher, 0, 'salegiftvoucher', lSQL, False);
      lSQL := 'select * from giftcardtransaction where sale_code = :sale_code';
      tab[0][10] := TTab.Create(gDataBase, dbgGiftCardTransaction, 0, 'giftcardtransaction', lSQL, False);
      lSQL := 'select * from salesignature where sale_code = :sale_code';
      tab[0][11] := TTab.Create(gDataBase, dbgSaleSignature, 0, 'salesignature', lSQL, False);
      lSQL := 'select * from salenote where sale_code = :sale_code';
      tab[0][12] := TTab.Create(gDataBase, dbgSaleNote, 0, 'salenote', lSQL, False);
      lSQL := 'select * from saletaxcustomer where sale_code = :sale_code';
      tab[0][13] := TTab.Create(gDataBase, dbgSaleTaxCustomer, 0, 'saletaxcustomer', lSQL, False);
      lSQL := 'select * from saletaxexempt where sale_code = :sale_code';
      tab[0][14] := TTab.Create(gDataBase, dbgSaleTaxExempt, 0, 'saletaxexempt', lSQL, False);
      lSQL := 'select * from "script" where sale_code = :sale_code';
      tab[0][15] := TTab.Create(gDataBase, dbgScript, 0, 'script', lSQL, False);
      lSQL := 'select * from customerpayment where sale_code = :sale_code';
      tab[0][16] := TTab.Create(gDataBase, dbgCustomerPayment, 0, 'customerpayment', lSQL, False);
      lSQL := 'select * from salelinereference where saleline_id in (select saleline_id from saleline where sale_code = :sale_code)';
      tab[0][17] := TTab.Create(gDataBase, dbgSalelineReference, 0, 'salelinereference', lSQL, False);
   end
   else if (aIndex = 1) and (not Assigned(tab[1][0])) then //ITEM
   begin
      //The SQL here is determined dynamically when searching
      tab[1][0] := TTab.Create(gDataBase, dbgItem, 0, 'item', 'xxx', False);
      tab[1][1] := TTab.Create(gDataBase, dbgItemColour, 0, 'itemcolour', 'xxx', False);
      tab[1][2] := TTab.Create(gDataBase, dbgItemColourSize, 0, 'itemcoloursize', 'xxx', False);
      tab[1][3] := TTab.Create(gDataBase, dbgStoreICS, 0, 'storeics', 'xxx', False);
      tab[1][4] := TTab.Create(gDataBase, dbgPrice, 0, 'price', 'xxx', False);
      tab[1][5] := TTab.Create(gDataBase, dbgSellCode, 0, 'sellcode', 'xxx', False);
      tab[1][6] := TTab.Create(gDataBase, dbgStoreICSTran, 0, 'storeicstran', 'xxx', False);
      tab[1][7] := TTab.Create(gDataBase, dbgStoreIC, 0, 'storeic', 'xxx', False);
      tab[1][8] := TTab.Create(gDataBase, dbgItemColourSupplier, 0, 'itemcoloursupplier', 'xxx', False);
      tab[1][9] := TTab.Create(gDataBase, dbgDivision, 0, 'division', 'xxx', False);
      tab[1][10] := TTab.Create(gDataBase, dbgDepartment, 0, 'department', 'xxx', False);
      tab[1][11] := TTab.Create(gDataBase, dbgCategory, 0, 'category', 'xxx', False);
      tab[1][12] := TTab.Create(gDataBase, dbgColour, 0, 'colour', 'xxx', False);
      tab[1][13] := TTab.Create(gDataBase, dbgSize, 0, 'size', 'xxx', False);
      tab[1][14] := TTab.Create(gDataBase, dbgItemColourImage, 0, 'itemcoloursize', 'xxx', False);
      tab[1][15] := TTab.Create(gDataBase, dbgImage, 0, 'image', 'xxx', False);
      tab[1][16] := TTab.Create(gDataBase, dbgFixedItemColourSize, 0, 'fixeditemcoloursize', 'xxx', False);
      tab[1][17] := TTab.Create(gDataBase, dbgItemRetailChain, 0, 'itemretailchain', 'xxx', False);
      tab[1][18] := TTab.Create(gDataBase, dbgRetailChain2, 0, 'retailchain', 'xxx', False);
   end
   else if (aIndex = 2) and (not Assigned(tab[2][0])) then   //GRN
   begin
      lSQL := 'select * from grn where grn_code = :grn_code';
      tab[2][0] := TTab.Create(gDataBase, dbgGrn, 0, 'grn', lSQL, False);
      lSQL := 'select * from grnline where grn_code = :grn_code';
      tab[2][1] := TTab.Create(gDataBase, dbgGrnLine, 0, 'grnline', lSQL, False);
      lSQL := 'select * from grncarton where grn_code = :grn_code';
      tab[2][2] := TTab.Create(gDataBase, dbgGrnCarton, 0, 'grncarton', lSQL, False);
      lSQL := 'select * from grnsize where grn_code = :grn_code';
      tab[2][3] := TTab.Create(gDataBase, dbgGrnSize, 0, 'grnsize', lSQL, False);
      lSQL := 'select * from grncomment where grn_code = :grn_code';
      tab[2][4] := TTab.Create(gDataBase, dbgGrnComment, 0, 'grncomment', lSQL, False);
      lSQL := 'select * from storeicstran where (document_type = ' + QuotedStr('G') + ') and document_line_id in (select grnline_id from grnline where grn_code = :grn_code)';
      tab[2][5] := TTab.Create(gDataBase, dbgStoreICSTran2, 0, 'storeicstran', lSQL, False);
   end
   else if (aIndex = 3) and (not Assigned(tab[3][0])) then //LOCMOVE
   begin
      lSQL := 'select * from locmove where locmove_code = :locmove_code';
      tab[3][0] := TTab.Create(gDataBase, dbgLocMove, 0, 'locmove', lSQL, False);
      lSQL := 'select * from locmoveline where locmove_code = :locmove_code';
      tab[3][1] := TTab.Create(gDataBase, dbgLocMoveLine, 0, 'locmoveline', lSQL, False);
      lSQL := 'select * from locmovecarton where locmove_code = :locmove_code';
      tab[3][2] := TTab.Create(gDataBase, dbgLocMoveCarton, 0, 'locmovecarton', lSQL, False);
      lSQL := 'select * from locmovesize where locmove_code = :locmove_code';
      tab[3][3] := TTab.Create(gDataBase, dbgLocMoveSize, 0, 'locmovesize', lSQL, False);
      lSQL := 'select * from locmovecomment where locmove_code = :locmove_code';
      tab[3][4] := TTab.Create(gDataBase, dbgLocMoveComment, 0, 'locmovecomment', lSQL, False);
      lSQL := 'select * from unitload where doc_type_ind = ''D'' and document_code = :locmove_code';
      tab[3][5] := TTab.Create(gDataBase, dbgUnitload, 0, 'unitload', lSQL, False);
      lSQL := 'select * from unitloadcontent where unitload_id in (select unitload_id from unitload where doc_type_ind = ''D'' and document_code = :locmove_code)';
      tab[3][6] := TTab.Create(gDataBase, dbgUnitloadContent, 0, 'unitloadcontent', lSQL, False);
      lSQL := 'select * from unitloadcontentlog where unitload_id in (select unitload_id from unitload where doc_type_ind = ''D'' and document_code = :locmove_code)';
      tab[3][7] := TTab.Create(gDataBase, dbgUnitloadContentLog, 0, 'unitloadcontentlog', lSQL, False);
   end
   else if (aIndex = 4) and (not Assigned(tab[4][0])) then  //STOCKTAKE
   begin
      lSQL := 'select * from stocktake where stocktake_code = :stocktake_code';
      tab[4][0] := TTab.Create(gDataBase, dbgStocktake, 0, 'stocktake', lSQL, False);
      lSQL := 'select * from stocktakecount where stocktake_code = :stocktake_code';
      tab[4][1] := TTab.Create(gDataBase, dbgStocktakeCount, 0, 'stocktakecount', lSQL, False);
      lSQL := 'select * from stocktakecountline where stocktakecount_code in (select stocktakecount_code from stocktakecount where stocktake_code = :stocktake_code)';
      tab[4][2] := TTab.Create(gDataBase, dbgStocktakeCountLine, 0, 'stocktakecountline', lSQL, False);
      lSQL := 'select * from stocktakeinit where stocktake_code = :stocktake_code';
      tab[4][3] := TTab.Create(gDataBase, dbgStocktakeInit, 0, 'stocktakeinit', lSQL, False);
      lSQL := 'select * from stocktakeadjustment where stocktake_code = :stocktake_code';
      tab[4][4] := TTab.Create(gDataBase, dbgStocktakeAdjustment, 0, 'stocktakeadjustment', lSQL, False);
      lSQL := 'select * from stocktakeomit where stocktake_code = :stocktake_code';
      tab[4][5] := TTab.Create(gDataBase, dbgStocktakeOmit, 0, 'stocktakeomit', lSQL, False);
      lSQL := 'select * from stocktakelocation where stocktake_code = :stocktake_code';
      tab[4][6] := TTab.Create(gDataBase, dbgStocktakeLocation, 0, 'stocktakelocation', lSQL, False);
      lSQL := 'select * from stocktakecategory where stocktake_code = :stocktake_code';
      tab[4][7] := TTab.Create(gDataBase, dbgStocktakeCategory, 0, 'stocktakecategory', lSQL, False);
      lSQL := 'select * from stocktakeerror where stocktake_code = :stocktake_code';
      tab[4][8] := TTab.Create(gDataBase, dbgStocktakeError, 0, 'stocktakeerror', lSQL, False);
      lSQL := 'select * from stocktakesku where stocktake_code = :stocktake_code';
      tab[4][9] := TTab.Create(gDataBase, dbgStocktakeSku, 0, 'stocktakesku', lSQL, False);
   end
   else if (aIndex = 5) and (not Assigned(tab[5][0])) then //VIRTUALDRAWER
   begin
      lSQL := 'select * from virtualdrawer where virtualdrawer_code = :virtualdrawer_code';
      tab[5][0] := TTab.Create(gDataBase, dbgVirtualDrawer, 0, 'virtualdrawer', lSQL, False);
      lSQL := 'select * from virtualdrawertender where virtualdrawer_code = :virtualdrawer_code';
      tab[5][1] := TTab.Create(gDataBase, dbgVirtualDrawerTender, 0, 'virtualdrawertender', lSQL, False);
      lSQL := 'select * from virtualdrawertransfer where virtualdrawer_code = :virtualdrawer_code';
      tab[5][2] := TTab.Create(gDataBase, dbgVirtualDrawerTransfer, 0, 'virtualdrawertransfer', lSQL, False);
      lSQL := 'select * from vdmovement where virtualdrawer_code = :virtualdrawer_code';
      tab[5][3] := TTab.Create(gDataBase, dbgVdMovement, 0, 'vdmovement', lSQL, False);
      lSQL := 'select * from vdrawerevent where virtualdrawer_code = :virtualdrawer_code';
      tab[5][4] := TTab.Create(gDataBase, dbgVdrawerEvent, 0, 'vdrawerevent', lSQL, False);
      lSQL := 'select * from storejournal where virtualdrawer_code = :virtualdrawer_code';
      tab[5][5] := TTab.Create(gDataBase, dbgStoreJournal, 0, 'storejournal', lSQL, False);
      lSQL := 'select * from vdrawerrecline where virtualdrawer_code = :virtualdrawer_code';
      tab[5][6] := TTab.Create(gDataBase, dbgVdrawerrecline, 0, 'vdrawerrecline', lSQL, False);
      lSQL := 'select * from vdrawerrecdenom where vdrawerrecline_id in (select vdrawerrecline_id from vdrawerrecline where virtualdrawer_code = :virtualdrawer_code)';
      tab[5][7] := TTab.Create(gDataBase, dbgVdrawerrecdenom, 0, 'vdrawerrecdenom', lSQL, False);
      lSQL := 'select * from vdrawerrecvoucher where vdrawerrecline_id in (select vdrawerrecline_id from vdrawerrecline where virtualdrawer_code = :virtualdrawer_code)';
      tab[5][8] := TTab.Create(gDataBase, dbgVdrawerrecvoucher, 0, 'vdrawerrecvoucher', lSQL, False);
   end
   else if (aIndex = 6) and (not Assigned(tab[6][0])) then //PROMOTION
   begin
      lSQL := 'select * from promotion where promotion_code = :promotion_code';
      tab[6][0] := TTab.Create(gDataBase, dbgPromotion, 0, 'promotion', lSQL, False);
      lSQL := 'select * from promotiontier where promotion_code = :promotion_code';
      tab[6][1] := TTab.Create(gDataBase, dbgPromotionTier, 0, 'promotiontier', lSQL, False);
      lSQL := 'select * from promotionitem where promotion_code = :promotion_code';
      tab[6][2] := TTab.Create(gDataBase, dbgPromotionItem, 0, 'promotionitem', lSQL, False);
      lSQL := 'select * from promotionitemgroup where promotion_code = :promotion_code';
      tab[6][3] := TTab.Create(gDataBase, dbgPromotionItemGroup, 0, 'promotionitemgroup', lSQL, False);
      lSQL := 'select * from promotionstore where promotion_code = :promotion_code';
      tab[6][4] := TTab.Create(gDataBase, dbgPromotionStore, 0, 'promotionstore', lSQL, False);
      lSQL := 'select * from promotioncustomer where promotion_code = :promotion_code';
      tab[6][5] := TTab.Create(gDataBase, dbgPromotionCustomer, 0, 'promotioncustomer', lSQL, False);
      lSQL := 'select * from promotioncustomertype where promotion_code = :promotion_code';
      tab[6][6] := TTab.Create(gDataBase, dbgPromotionCustomerType, 0, 'promotioncustomertype', lSQL, False);
      lSQL := 'select * from promotionloyaltygroup where promotion_code = :promotion_code';
      tab[6][7] := TTab.Create(gDataBase, dbgPromotionLoyaltyGroup, 0, 'promotionloyaltygroup', lSQL, False);
      lSQL := 'select * from promotionbeneficiary where promotion_code = :promotion_code';
      tab[6][8] := TTab.Create(gDataBase, dbgPromotionBeneficiary, 0, 'promotionbeneficiary', lSQL, False);
   end
   else if (aIndex = 7) and (not Assigned(tab[7][0])) then //STORE
   begin
      lSQL := 'select * from store where store_code = :store_code';
      tab[7][0] := TTab.Create(gDataBase, dbgStore, 0, 'store', lSQL, False);
      lSQL := 'select * from storeneighbour where store_code = :store_code';
      tab[7][1] := TTab.Create(gDataBase, dbgStoreNeighbour, 0, 'storeneighbour', lSQL, False);
      lSQL := 'select * from location where store_code = :store_code';
      tab[7][2] := TTab.Create(gDataBase, dbgLocation, 0, 'location', lSQL, False);
      lSQL := 'select * from retailchain where retailchain_code in (select retailchain_code from location where location_code = :store_code)';
      tab[7][3] := TTab.Create(gDataBase, dbgRetailChain, 0, 'retailchain', lSQL, False);
      lSQL := 'select * from company where company_code in (select company_code from location where location_code = :store_code)';
      tab[7][4] := TTab.Create(gDataBase, dbgCompany, 0, 'company', lSQL, False);
      lSQL := 'select * from country where country_code in (select country_code from location where location_code = :store_code)';
      tab[7][5] := TTab.Create(gDataBase, dbgCountry, 0, 'country', lSQL, False);
      lSQL := 'select * from timezone where timezone_code in (select timezone_code from location where location_code = :store_code)';
      tab[7][6] := TTab.Create(gDataBase, dbgTimeZone, 0, 'timezone', lSQL, False);
      lSQL := 'select * from register where store_code = :store_code';
      tab[7][7] := TTab.Create(gDataBase, dbgRegister, 0, 'register', lSQL, False);
      lSQL := 'select * from remedipc where location_code = :store_code';
      tab[7][8] := TTab.Create(gDataBase, dbgRemediPc, 0, 'remedipc', lSQL, False);
      lSQL := 'select * from docketmessageline where store_code = :store_code';
      tab[7][9] := TTab.Create(gDataBase, dbgDocketMessageLine, 0, 'docketmessageline', lSQL, False);
      lSQL := 'select * from datacentre where location_code = :store_code';
      tab[7][10] := TTab.Create(gDataBase, dbgDataCentre, 0, 'datacentre', lSQL, False);
      lSQL := 'select * from datacentrestatus where datacentre_code in (select datacentre_code from datacentre where location_code = :store_code)';
      tab[7][11] := TTab.Create(gDataBase, dbgDatacentreStatus, 0, 'datacentrestatus', lSQL, False);
      lSQL := 'select * from datacentrelasttask where local_datacentre_code in (select datacentre_code from datacentre where location_code = :store_code)';
      tab[7][12] := TTab.Create(gDataBase, dbgDatacentreLastTask, 0, 'datacentrelasttask', lSQL, False);
      lSQL := 'select * from locationretailchain where location_code = :store_code';
      tab[7][13] := TTab.Create(gDataBase, dbgLocationRetailChain, 0, 'locationretailchain', lSQL, False);
      lSQL := 'select * from remedievent where location_code = :store_code';
      tab[7][14] := TTab.Create(gDataBase, dbgRemediEvent, 0, 'remedievent', lSQL, False);
      lSQL := 'select * from remediprintertype where remediprintertype_code in (select remediprintertype_code from register where store_code = :store_code)';
      tab[7][15] := TTab.Create(gDataBase, dbgRemediPrinterType, 0, 'remediprintertype', lSQL, False);
      lSQL := 'select * from currencylocation where location_code = :store_code';
      tab[7][16] := TTab.Create(gDataBase, dbgCurrencyLocation, 0, 'currencylocation', lSQL, False);
      lSQL := 'select * from currency where currency_code in (select currency_code from currencylocation where location_code = :store_code)';
      tab[7][17] := TTab.Create(gDataBase, dbgCurrency, 0, 'currency', lSQL, False);
      lSQL := 'select * from currencyrate where (from_currency_code in (select currency_code from currencylocation where location_code = :store_code)) or (to_currency_code in (select currency_code from currencylocation where location_code = :store_code))';
      tab[7][18] := TTab.Create(gDataBase, dbgCurrencyRate, 0, 'currencyrate', lSQL, False);
      lSQL := 'select * from laybyterms where (store_code = :store_code) or (store_code is null)';
      tab[7][19] := TTab.Create(gDataBase, dbgLaybyTerms, 0, 'laybyterms', lSQL, False);
      lSQL := 'select * from laybytermsline where laybyterms_id in (select laybyterms_id from laybyterms where (store_code = :store_code) or (store_code is null))';
      tab[7][20] := TTab.Create(gDataBase, dbgLaybyTermsLine, 0, 'laybytermsline', lSQL, False);
   end
   else if (aIndex = 8) and (not Assigned(tab[8][0])) then //USER/EMPLOYEE
   begin
      lSQL := 'select * from remediuser where remediuser_code = :remediuser_code';
      tab[8][0] := TTab.Create(gDataBase, dbgRemediUser, 0, 'remediuser', lSQL, False);
      lSQL := 'select * from remediuserkey where remediuser_code = :remediuser_code';
      tab[8][1] := TTab.Create(gDataBase, dbgRemediUserKey, 0, 'remediuserkey', lSQL, False);
      lSQL := 'select * from employee where employee_id = :employee_id';
      tab[8][2] := TTab.Create(gDataBase, dbgEmployee, 0, 'employee', lSQL, False);
      lSQL := 'select * from employeestore where employee_id = :employee_id';
      tab[8][3] := TTab.Create(gDataBase, dbgEmployeeStore, 0, 'employeestore', lSQL, False);
      lSQL := 'select * from employeestoredisc where employee_id = :employee_id';
      tab[8][4] := TTab.Create(gDataBase, dbgEmployeeStoreDisc, 0, 'employeestoredisc', lSQL, False);
      lSQL := 'select * from timeattenddayhour where employee_id = :employee_id';
      tab[8][5] := TTab.Create(gDataBase, dbgTimeAttendDayHour, 0, 'timeattenddayhour', lSQL, False);
      lSQL := 'select * from timeattendtrans where employee_id = :employee_id';
      tab[8][6] := TTab.Create(gDataBase, dbgTimeAttendTrans, 0, 'timeattendtrans', lSQL, False);
      lSQL := 'select * from printrequest where employee_id = :employee_id';
      tab[8][7] := TTab.Create(gDataBase, dbgPrintRequest, 0, 'printrequest', lSQL, False);
      lSQL := 'select * from remedipwdhist where remediuser_code = :remediuser_code';
      tab[8][8] := TTab.Create(gDataBase, dbgRemedipwdhist, 0, 'remedipwdhist', lSQL, False);
   end
   else if (aIndex = 9) and (not Assigned(tab[9][0])) then //CUSTOMER
   begin
      lSQL := 'select * from customer where customer_id = :customer_id';
      tab[9][0] := TTab.Create(gDataBase, dbgCustomer, 0, 'customer', lSQL, False);
      lSQL := 'select * from customertype where customertype_id in (select customertype_id from customer where customer_id = :customer_id)';
      tab[9][1] := TTab.Create(gDataBase, dbgCustomerType, 0, 'customertype', lSQL, False);
      lSQL := 'select * from customerpoints where customer_code = :customer_id';
      tab[9][2] := TTab.Create(gDataBase, dbgCustomerPoints, 0, 'customerpoints', lSQL, False);
      lSQL := 'select * from loyaltycustomer where customer_id = :customer_id';
      tab[9][3] := TTab.Create(gDataBase, dbgLoyaltyCustomer, 0, 'loyaltycustomer', lSQL, False);
      lSQL := 'select * from loyaltycustmember where loyaltycustomer_id in (select loyaltycustomer_id from loyaltycustomer where customer_id = :customer_id)';
      tab[9][4] := TTab.Create(gDataBase, dbgLoyaltyCustMember, 0, 'loyaltycustmember', lSQL, False);
      lSQL := 'select * from loyaltycusttran where loyaltycustomer_id in (select loyaltycustomer_id from loyaltycustomer where customer_id = :customer_id)';
      tab[9][5] := TTab.Create(gDataBase, dbgLoyaltyCustTran, 0, 'loyaltycusttran', lSQL, False);
      lSQL := 'select * from loyaltycustperiod where loyaltycustomer_id in (select loyaltycustomer_id from loyaltycustomer where customer_id = :customer_id)';
      tab[9][6] := TTab.Create(gDataBase, dbgLoyaltyCustPeriod, 0, 'loyaltycustperiod', lSQL, False);
      lSQL := 'select * from loyalty where loyalty_code in (select loyalty_code from loyaltycustomer where customer_id = :customer_id)';
      tab[9][7] := TTab.Create(gDataBase, dbgLoyalty, 0, 'loyalty', lSQL, False);
      lSQL := 'select * from loyaltyprogram where loyalty_code in (select loyalty_code from loyaltycustomer where customer_id = :customer_id)';
      tab[9][8] := TTab.Create(gDataBase, dbgLoyaltyProgram, 0, 'loyaltyprogram', lSQL, False);
      lSQL := 'select * from custidentification where customer_id = :customer_id';
      tab[9][9] := TTab.Create(gDataBase, dbgCustIdentification, 0, 'custidentification', lSQL, False);
   end
   else if (aIndex = 10) and (not Assigned(tab[10][0])) then //LAYBY
   begin
      lSQL := 'select * from layby where layby_id = :layby_id';
      tab[10][0] := TTab.Create(gDataBase, dbgLayby, 0, 'layby', lSQL, False);
      lSQL := 'select * from laybyline where layby_code = :layby_id';
      tab[10][1] := TTab.Create(gDataBase, dbgLaybyLine, 0, 'laybyline', lSQL, False);
      lSQL := 'select * from laybytrans where layby_code = :layby_id';
      tab[10][2] := TTab.Create(gDataBase, dbgLaybyTrans, 0, 'laybytrans', lSQL, False);
      lSQL := 'select * from laybynote where layby_code = :layby_id';
      tab[10][3] := TTab.Create(gDataBase, dbgLaybyNote, 0, 'laybynote', lSQL, False);
      lSQL := 'select * from laybybalance where layby_id = :layby_id';
      tab[10][4] := TTab.Create(gDataBase, dbgLaybyBalance, 0, 'laybybalance', lSQL, False);
      lSQL := 'select * from customerpayment where layby_id = :layby_id';
      tab[10][5] := TTab.Create(gDataBase, dbgCustomerPayment2, 0, 'customerpayment', lSQL, False);
      lSQL := 'select * from saleline where layby_code = :layby_id';
      tab[10][6] := TTab.Create(gDataBase, dbgSaleLine2, 0, 'saleline', lSQL, False);
   end
   else if (aIndex = 11) and (not Assigned(tab[11][0])) then //BANK DEPOSIT
   begin
      lSQL := 'select * from bankdeposit where bankdeposit_code = :bankdeposit_code';
      tab[11][0] := TTab.Create(gDataBase, dbgBankDeposit, 0, 'bankdeposit', lSQL, False);
      lSQL := 'select * from bankdepositcheque where bankdeposit_code = :bankdeposit_code';
      tab[11][1] := TTab.Create(gDataBase, dbgBankDepositCheque, 0, 'bankdepositcheque', lSQL, False);
      lSQL := 'select * from bankdepositvoucher where bankdeposit_code = :bankdeposit_code';
      tab[11][2] := TTab.Create(gDataBase, dbgBankDepositVoucher, 0, 'bankdepositvoucher', lSQL, False);
      lSQL := 'select * from bankdeposittransfer where bankdeposit_code = :bankdeposit_code';
      tab[11][3] := TTab.Create(gDataBase, dbgBankDepositTransfer, 0, 'bankdeposittransfer', lSQL, False);
      lSQL := 'select * from bankaccount where bankaccount_id in (select bankaccount_id from bankdeposit where bankdeposit_code = :bankdeposit_code)';
      tab[11][4] := TTab.Create(gDataBase, dbgBankAccount, 0, 'bankaccount', lSQL, False);
      lSQL := 'select * from bankaccountstore where bankaccount_id in (select bankaccount_id from bankdeposit where bankdeposit_code = :bankdeposit_code)';
      tab[11][5] := TTab.Create(gDataBase, dbgBankAccountStore, 0, 'bankaccountstore', lSQL, False);
   end
   else if (aIndex = 12) and (not Assigned(tab[12][0])) then //ADJUSTMENT
   begin
      lSQL := 'select * from adjustment where adjustment_code = :adjustment_code';
      tab[12][0] := TTab.Create(gDataBase, dbgAdjustment, 0, 'adjustment', lSQL, False);
      lSQL := 'select * from adjustmentline where adjustment_code = :adjustment_code';
      tab[12][1] := TTab.Create(gDataBase, dbgAdjustmentLine, 0, 'adjustmentline', lSQL, False);
      lSQL := 'select * from adjustmentsize where adjustment_code = :adjustment_code';
      tab[12][2] := TTab.Create(gDataBase, dbgAdjustmentSize, 0, 'adjustmentsize', lSQL, False);
      lSQL := 'select * from storeicstran where (document_type = ' + QuotedStr('A') + ') and document_line_id in (select adjustmentline_id from adjustmentline where adjustment_code = :adjustment_code)';
      tab[12][3] := TTab.Create(gDataBase, dbgStoreICSTran4, 0, 'storeicstran', lSQL, False);
   end;
   //new master tab
end;

procedure TdSMSLinks.AdjustTabSQLForItemSearch;
begin
   tab[1][0].SQL  := 'select * from item where item_code = :item_code';
   tab[1][1].SQL  := 'select * from itemcolour where item_code = :item_code';
   tab[1][2].SQL  := 'select * from itemcoloursize where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code)';
   tab[1][3].SQL  := 'select * from storeics where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code))';
   tab[1][4].SQL  := 'select * from price where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code)';
   tab[1][5].SQL  := 'select * from sellcode where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code))';
   tab[1][6].SQL  := 'select * from storeicstran where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code))';
   tab[1][7].SQL  := 'select * from storeic where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code)';
   tab[1][8].SQL  := 'select * from itemcoloursupplier where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code)';
   tab[1][9].SQL  := 'select * from division where division_code in (select division_code from item where item_code = :item_code)';
   tab[1][10].SQL := 'select * from department where department_code in (select department_code from item where item_code = :item_code)';
   tab[1][11].SQL := 'select * from category where category_code in (select category_code from item where item_code = :item_code)';
   tab[1][12].SQL := 'select * from colour where colour_code in (select colour_code from itemcolour where item_code = :item_code)';
   tab[1][13].SQL := 'select * from "size" where "size" in (select size from itemcoloursize where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code))';
   tab[1][14].SQL := 'select * from itemcolourimage where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code)';
   tab[1][15].SQL := 'select * from "image" where image_code in (select image_code from itemcolourimage where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code))';
   tab[1][16].SQL := 'select * from fixeditemcoloursize where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id in (select itemcolour_id from itemcolour where item_code = :item_code))';
   tab[1][17].SQL := 'select * from itemretailchain where item_code = :item_code';
   tab[1][18].SQL := 'select * from retailchain where retailchain_code in (select retailchain_code from itemretailchain where item_code = :item_code)';
end;

procedure TdSMSLinks.AdjustTabSQLForICSearch;
begin
   tab[1][0].SQL  := 'select * from item where item_code = (select item_code from itemcolour where itemcolour_id = :itemcolour_id)';
   tab[1][1].SQL  := 'select * from itemcolour where itemcolour_id = :itemcolour_id';
   tab[1][2].SQL  := 'select * from itemcoloursize where itemcolour_id = :itemcolour_id';
   tab[1][3].SQL  := 'select * from storeics where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id = :itemcolour_id)';
   tab[1][4].SQL  := 'select * from price where itemcolour_id = :itemcolour_id';
   tab[1][5].SQL  := 'select * from sellcode where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id = :itemcolour_id)';
   tab[1][6].SQL  := 'select * from storeicstran where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id = :itemcolour_id)';
   tab[1][7].SQL  := 'select * from storeic where itemcolour_id = :itemcolour_id';
   tab[1][8].SQL  := 'select * from itemcoloursupplier where itemcolour_id = :itemcolour_id';
   tab[1][9].SQL  := 'select * from division where division_code in (select division_code from item where item_code = (select item_code from itemcolour where itemcolour_id = :itemcolour_id))';
   tab[1][10].SQL := 'select * from department where department_code in (select department_code from item where item_code = (select item_code from itemcolour where itemcolour_id = :itemcolour_id))';
   tab[1][11].SQL := 'select * from category where category_code in (select category_code from item where item_code = (select item_code from itemcolour where itemcolour_id = :itemcolour_id))';
   tab[1][12].SQL := 'select * from colour where colour_code in (select colour_code from itemcolour where itemcolour_id = :itemcolour_id)';
   tab[1][13].SQL := 'select * from "size" where "size" in (select size from itemcoloursize where itemcolour_id = :itemcolour_id)';
   tab[1][14].SQL := 'select * from itemcolourimage where itemcolour_id = :itemcolour_id';
   tab[1][15].SQL := 'select * from "image" where image_code in (select image_code from itemcolourimage where itemcolour_id = :itemcolour_id)';
   tab[1][16].SQL := 'select * from fixeditemcoloursize where itemcoloursize_id in (select itemcoloursize_id from itemcoloursize where itemcolour_id = :itemcolour_id)';
   tab[1][17].SQL := 'select * from itemretailchain where item_code = (select item_code from itemcolour where itemcolour_id = :itemcolour_id)';
   //Whoops :( This is longer than 255 chars
   //tab[1][18].SQL := 'select * from retailchain where retailchain_code in (select retailchain_code from itemretailchain where item_code = (select item_code from itemcolour where itemcolour_id = :itemcolour_id))';
   tab[1][18].SQL := 'select * from retailchain';
end;

procedure TdSMSLinks.AdjustTabSQLForICSSearch;
begin
   tab[1][0].SQL  := 'select * from item where item_code = (select item_code from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id))';
   tab[1][1].SQL  := 'select * from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)';
   tab[1][2].SQL  := 'select * from itemcoloursize where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)';
   tab[1][3].SQL  := 'select * from storeics where itemcoloursize_id = :itemcoloursize_id';
   tab[1][4].SQL  := 'select * from price where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)';
   tab[1][5].SQL  := 'select * from sellcode where itemcoloursize_id = :itemcoloursize_id';
   tab[1][6].SQL  := 'select * from storeicstran where itemcoloursize_id = :itemcoloursize_id';
   tab[1][7].SQL  := 'select * from storeic where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)';
   tab[1][8].SQL  := 'select * from itemcoloursupplier where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)';
   tab[1][9].SQL  := 'select * from division where division_code in (select division_code from item where item_code = (select item_code from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)))';
   tab[1][10].SQL := 'select * from department where department_code in (select department_code from item where item_code = (select item_code from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)))';
   tab[1][11].SQL := 'select * from category where category_code in (select category_code from item where item_code = (select item_code from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)))';
   tab[1][12].SQL := 'select * from colour where colour_code in (select colour_code from itemcolour where item_code = (select item_code from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)))';
   tab[1][13].SQL := 'select * from "size" where "size" in (select size from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)';
   tab[1][14].SQL := 'select * from itemcolourimage where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)';
   tab[1][15].SQL := 'select * from "image" where image_code in (select image_code from itemcolourimage where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id))';
   tab[1][16].SQL := 'select * from fixeditemcoloursize where itemcoloursize_id = :itemcoloursize_id';
   tab[1][17].SQL := 'select * from itemretailchain where item_code = (select item_code from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id))';
   //Whoops :( This is longer than 255 chars
   //tab[1][18].SQL := 'select * from retailchain where retailchain_code in (select retailchain_code from itemretailchain where item_code = (select item_code from itemcolour where itemcolour_id = (select itemcolour_id from itemcoloursize where itemcoloursize_id = :itemcoloursize_id)))';
   tab[1][18].SQL := 'select * from retailchain';
end;

procedure TdSMSLinks.SetMasterTabs;
begin
   SetLength(mCode, 17); //determined by the number of TEdits for the codes
   mCode[0].edt := edtSaleCode;
   mCode[0].btnS := btnSaleSearch;
   mCode[0].code := 'sale_code';

   mCode[1].edt := edtReceiptNbr;
   mCode[1].btnS := btnSaleSearch;
   mCode[1].code := 'receipt_ref';

   mCode[2].edt := edtItemColourSize;
   mCode[2].btnS := btnItemSearch;
   mCode[2].code := 'itemcoloursize_id';

   mCode[3].edt := edtItemColour;
   mCode[3].btnS := btnItemSearch;
   mCode[3].code := 'itemcolour_id';

   mCode[4].edt := edtItem;
   mCode[4].btnS := btnItemSearch;
   mCode[4].code := 'item_code';

   mCode[5].edt := edtGRNCode;
   mCode[5].btnS := btnGRNSearch;
   mCode[5].code := 'grn_code';

   mCode[6].edt := edtLocMoveCode;
   mCode[6].btnS := btnSearchLocMove;
   mCode[6].code := 'locmove_code';

   mCode[7].edt := edtStocktakeCode;
   mCode[7].btnS := btnSearchStocktake;
   mCode[7].code := 'stocktake_code';

   mCode[8].edt := edtVirtualDrawerCode;
   mCode[8].btnS := btnSearchVirtualDrawer;
   mCode[8].code := 'virtualdrawer_code';

   mCode[9].edt := edtPromotionCode;
   mCode[9].btnS := btnSearchPromotion;
   mCode[9].code := 'promotion_code';

   mCode[10].edt := edtStoreCode;
   mCode[10].btnS := btnSearchStore;
   mCode[10].code := 'store_code';
   
   mCode[11].edt := edtEmployeeId;
   mCode[11].btnS := btnSearchUser;
   mCode[11].code := 'employee_id';

   mCode[12].edt := edtUserCode;
   mCode[12].btnS := btnSearchUser;
   mCode[12].code := 'remediuser_code';

   mCode[13].edt := edtCustomerId;
   mCode[13].btnS := btnSearchCustomer;
   mCode[13].code := 'customer_id';

   mCode[14].edt := edtLaybyId;
   mCode[14].btnS := btnSearchLayby;
   mCode[14].code := 'layby_id';

   mCode[15].edt := edtBankDepositCode;
   mCode[15].btnS := btnSearchBankDeposit;
   mCode[15].code := 'bankdeposit_code';

   mCode[16].edt := edtAdjustmentCode;
   mCode[16].btnS := btnSearchAdjustment;
   mCode[16].code := 'adjustment_code';
   //new master tab

   SetLength(mTab, pgEnquiry.PageCount);
   mTab[0].pc := pgSale;
   mTab[0].dn := dnSale;

   mTab[1].pc := pgItem;
   mTab[1].dn := dnItem;

   mTab[2].pc := pgGRN;
   mTab[2].dn := dnGRN;

   mTab[3].pc := pgLocMove;
   mTab[3].dn := dnLocMove;

   mTab[4].pc := pgStocktake;
   mTab[4].dn := dnStocktake;

   mTab[5].pc := pgVirtualDrawer;
   mTab[5].dn := dnVirtualDrawer;

   mTab[6].pc := pgPromotion;
   mTab[6].dn := dnPromotion;

   mTab[7].pc := pgStore;
   mTab[7].dn := dnStore;

   mTab[8].pc := pgUser;
   mTab[8].dn := dnUser;

   mTab[9].pc := pgCustomer;
   mTab[9].dn := dnCustomer;

   mTab[10].pc := pgLayby;
   mTab[10].dn := dnLayby;

   mTab[11].pc := pgBankDeposit;
   mTab[11].dn := dnBankDeposit;

   mTab[12].pc := pgAdjustment;
   mTab[12].dn := dnAdjustment;
   //new master tab
end;

procedure TdSMSLinks.FormCreate(Sender: TObject);
var
   I : Integer;
begin
   SetMasterTabs;

   SetLength(tab, pgEnquiry.PageCount);
   for I := 0 to Length(mTab) - 1 do
   begin
      mTab[I].pc.OwnerDraw := True;
      SetLength(tab[I], mTab[I].pc.PageCount);
      mTab[I].pc.ActivePageIndex := 0;
   end;

   fInfoShowing := False;
   pnlInfo.SendToBack;

   fFieldClicked := nil;
   fColMoved := False;
   fScrollLeftRight := False;
end;

procedure TdSMSLinks.SetUp(aUseRegistry : Boolean;
   aDefaultCodes : array of String; aFont : Integer);
var
   lLastEnquiry : String;
   lActivePageIndex : Integer;
   I : Integer;
begin
   for I := 0 to Length(mTab) - 1 do
   begin
      mTab[I].pc.Font.Size := aFont;
   end;

   Self.Color := gSettings.ColBackGround;

   qryUtil := gDataBase.NewQuery;

   if aUseRegistry then
   begin
      lLastEnquiry := GetRegistry('DEEnquiry');
      if lLastEnquiry <> '' then
         pgEnquiry.ActivePageIndex := StrToInt(lLastEnquiry)
      else
         pgEnquiry.ActivePageIndex := 0;
   end
   else
   begin
      lActivePageIndex := -1;
      if aDefaultCodes[0] <> '' then
      begin
         edtSaleCode.Text := aDefaultCodes[0];
         if lActivePageIndex = -1 then
            lActivePageIndex := 0;
      end;
      if aDefaultCodes[1] <> '' then
      begin
         edtItemColourSize.Text := aDefaultCodes[1];
         if lActivePageIndex = -1 then
            lActivePageIndex := 1;
      end;
      if aDefaultCodes[2] <> '' then
      begin
         edtItemColour.Text := aDefaultCodes[2];
         if lActivePageIndex = -1 then
            lActivePageIndex := 1;
      end;
      if aDefaultCodes[3] <> '' then
      begin
         edtItem.Text := aDefaultCodes[3];
         if lActivePageIndex = -1 then
            lActivePageIndex := 1;
      end;
      if aDefaultCodes[4] <> '' then
      begin
         edtGRNCode.Text := aDefaultCodes[4];
         if lActivePageIndex = -1 then
            lActivePageIndex := 2;
      end;
      if aDefaultCodes[5] <> '' then
      begin
         edtLocMoveCode.Text := aDefaultCodes[5];
         if lActivePageIndex = -1 then
            lActivePageIndex := 3;
      end;
      if aDefaultCodes[6] <> '' then
      begin
         edtStocktakeCode.Text := aDefaultCodes[6];
         if lActivePageIndex = -1 then
            lActivePageIndex := 4;
      end;
      if aDefaultCodes[7] <> '' then
      begin
         edtVirtualDrawerCode.Text := aDefaultCodes[7];
         if lActivePageIndex = -1 then
            lActivePageIndex := 5;
      end;
      if aDefaultCodes[8] <> '' then
      begin
         edtPromotionCode.Text := aDefaultCodes[8];
         if lActivePageIndex = -1 then
            lActivePageIndex := 6;
      end;
      if aDefaultCodes[9] <> '' then
      begin
         edtStoreCode.Text := aDefaultCodes[9];
         if lActivePageIndex = -1 then
            lActivePageIndex := 7;
      end;
      if aDefaultCodes[10] <> '' then
      begin
         edtUserCode.Text := aDefaultCodes[10];
         if lActivePageIndex = -1 then
            lActivePageIndex := 8;
      end;
      if aDefaultCodes[11] <> '' then
      begin
         edtEmployeeId.Text := aDefaultCodes[11];
         if lActivePageIndex = -1 then
            lActivePageIndex := 8;
      end;
      if aDefaultCodes[12] <> '' then
      begin
         edtCustomerId.Text := aDefaultCodes[12];
         if lActivePageIndex = -1 then
            lActivePageIndex := 9;
      end;
      if aDefaultCodes[13] <> '' then
      begin
         edtLaybyId.Text := aDefaultCodes[13];
         if lActivePageIndex = -1 then
            lActivePageIndex := 10;
      end;
      if aDefaultCodes[14] <> '' then
      begin
         edtBankDepositCode.Text := aDefaultCodes[14];
         if lActivePageIndex = -1 then
            lActivePageIndex := 11;
      end;
      if aDefaultCodes[15] <> '' then
      begin
         edtAdjustmentCode.Text := aDefaultCodes[15];
         if lActivePageIndex = -1 then
            lActivePageIndex := 12;
      end;
      //new master tab

      if lActivePageIndex = -1 then
         pgEnquiry.ActivePageIndex := 0
      else
         pgEnquiry.ActivePageIndex := lActivePageIndex
   end;

   CreateMasterTab(pgEnquiry.ActivePageIndex);
end;

procedure TdSMSLinks.pgChange(Sender: TObject);
begin
   CreateMasterTab(pgEnquiry.ActivePageIndex);
   mmoTableHint.Text := ActiveTab.Info;
   mTab[pgEnquiry.ActivePageIndex].dn.DataSource := tab[pgEnquiry.ActivePageIndex][GetActiveSubPageIndex].dSource;
end;

procedure TdSMSLinks.pgTableDrawTab(Control: TCustomTabControl;
   TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
   PageControl: TPageControl;
   TabCaption: TPoint;
   MasterTabIndex : Integer;
  I: Integer;
begin
   PageControl := Control as TPageControl;

   MasterTabIndex := -1;
   for I := 0 to Length(mTab) - 1 do
   begin
      if PageControl.Name = mTab[I].pc.Name then
         MasterTabIndex := I;
   end;

   if InRange(TabIndex, 0, PageControl.PageCount - 1) then
   begin
      TabCaption.Y := Rect.Top + 3;
      TabCaption.X := Rect.Left + 6;

      PageControl.Canvas.FillRect(Rect);
      if Assigned(tab[MasterTabIndex][TabIndex]) and tab[MasterTabIndex][TabIndex].dSet.Active and (not tab[MasterTabIndex][TabIndex].dSet.eof) then
         PageControl.Canvas.Font.Color := clBlack
      else
         PageControl.Canvas.Font.Color := clGray;
      PageControl.Canvas.TextOut(TabCaption.X, TabCaption.Y, PageControl.Pages[TabIndex].Caption);
   end;
end;

//**********************LINKING FROM ONE TAB TO ANOTHER***********************

procedure TdSMSLinks.ShowLinkFrom(aMasterTabIndex : Integer);
var
   lScreenPoint : TPoint;
   lMenuItem : TMenuItem;
   I, J : Integer;
   lField : TField;
begin
   poLinkFrom.Items.Clear;
   for I := 0 to Length(tab) - 1 do
   begin
      if I <> pgEnquiry.ActivePageIndex then //dont show links from active tab
      begin
         for J := 0 to Length(tab[I]) - 1 do
         begin
            if Assigned(tab[I][J]) and tab[I][J].dSet.Active and (not tab[I][J].dSet.eof) then
            begin
               lField := tab[I][J].dSet.FindField(mCode[aMasterTabIndex].Code);
               if Assigned(lField) then
               begin
                  lMenuItem := TMenuItem.Create(nil);
                  lMenuItem.Caption := tab[I][J].TableName;
                  lMenuItem.Hint := IntToStr(I) + ' ' + IntToStr(J) + ' ' + IntToStr(aMasterTabIndex);
                  lMenuItem.OnClick := LinkFromClick;
                  poLinkFrom.Items.Add(lMenuItem);
               end;
            end;
         end;
      end;
   end;
   if poLinkFrom.Items.Count <> 0 then
   begin
      Windows.GetCursorPos(lScreenPoint);
      poLinkFrom.Popup(lScreenPoint.x, lScreenPoint.y);
   end;
end;

procedure TdSMSLinks.LinkFromClick(Sender: TObject);
var
   lHint : String;
   I, J, K : Integer;
   lHintStrList : TStringList;
begin
   //decode the hint = 'I J'
   lHint := (Sender as TMenuItem).Hint;
   lHintStrList := TStringList.Create;
   try
      SplitSQL(lHintStrList, lHint, ' ', True);
      I := StrToInt(lHintStrList[0]);
      J := StrToInt(lHintStrList[1]);
      K := StrToInt(lHintStrList[2]);  //this is the master code index
      mCode[K].edt.Text := tab[I][J].dSet.FieldByName(mCode[K].code).AsString;
      mCode[K].btnS.Click;
   finally
      FreeAndNil(lHintStrList);
   end;
end;

procedure TdSMSLinks.mtbRecordValueChange(Sender: TField);
begin
   mtbRecordIsNull.Value := False;
end;

procedure TdSMSLinks.btnItemLinkClick(Sender: TObject);
begin
   ShowLinkFrom(2);
end;

procedure TdSMSLinks.btnLocMoveLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(6);
end;

procedure TdSMSLinks.btnVirtualDrawerLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(8);
end;

procedure TdSMSLinks.btnPromotionLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(9);
end;

procedure TdSMSLinks.btnStoreLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(10);
end;

procedure TdSMSLinks.btnUserLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(11);
end;

procedure TdSMSLinks.btnCustomerLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(13);
end;

procedure TdSMSLinks.btnLaybyLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(14);
end;

procedure TdSMSLinks.btnBankDepositLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(15);
end;

procedure TdSMSLinks.btnAdjustmentLinkFromClick(Sender: TObject);
begin
   ShowLinkFrom(16);
end;

//new master tab

//*******************SEARCH BUTTONS***********************

function TdSMSLinks.SetParamOpenAndDDL(I : Integer; J : Integer;
  ParamName : String; ParamValue : String) : Boolean;
begin
   Result := True;
   tab[I][J].dSet.Close;
   if tab[I][J].dSet.Params.Count > 0 then
      tab[I][J].dSet.ParamByName(ParamName).AsString := ParamValue;
   tab[I][J].Grid.OnColumnMoved := dbgTableColumnMoved;
   tab[I][J].Grid.OnTitleClick := dbgTableTitleClick;
   tab[I][J].Grid.OnMouseDown := dbgTableMouseDown;
   tab[I][J].dSet.Open;
   if (J = 0) and tab[I][J].dSet.eof then
   begin
      tab[I][J].dSet.Close;
      ShowMessage(ParamName + ' not found');
      Result := False;
   end;
   if Result then
   begin
      tab[I][J].PopulateInfoFromDDL;
      tab[I][J].ApplyIniSettingsToGrid;
   end;
end;

procedure TdSMSLinks.btnSaleSearchClick(Sender: TObject);
var
   J: Integer;
   lQry : ISQLQuery;
begin
   if (edtReceiptNbr.Text <> '') and (edtSaleCode.Text = '') then
   begin
      lQry := qryUtil;
      qryUtil.SQL.Clear;
      qryUtil.SQL.Add('select sale_code from sale');
      qryUtil.SQL.Add('where receipt_ref = ' + QuotedStr(edtReceiptNbr.Text));

      try
         lQry.Open;
         if not lQry.eof then
         begin
            edtSaleCode.Text := lQry.FieldByName('sale_code').AsString;
         end;
      finally
         lQry.Close;
      end;
   end
   else
      edtReceiptNbr.Text := '';

   if edtSaleCode.Text <> '' then
   begin
      for J := 0 to Length(tab[0]) - 1 do
      begin
         if not SetParamOpenAndDDL(0, J, 'sale_code', edtSaleCode.Text) then
            break;
      end;
      mmoTableHint.Text := tab[pgEnquiry.ActivePageIndex][pgSale.ActivePageIndex].Info;
      dnSale.DataSource := tab[pgEnquiry.ActivePageIndex][pgSale.ActivePageIndex].dSource;
      pgSale.Repaint;
      tab[pgEnquiry.ActivePageIndex][pgSale.ActivePageIndex].Grid.SetFocus;
   end;
end;

procedure TdSMSLinks.btnItemSearcClick(Sender: TObject);
begin
   if edtItemColourSize.Text <> '' then
   begin
      AdjustTabSQLForICSSearch;
      SingleCodeSearch('itemcoloursize_id', 2, 1);
   end
   else if edtItemColour.Text <> '' then
   begin
      AdjustTabSQLForICSearch;
      SingleCodeSearch('itemcolour_id', 3, 1);
   end
   else if edtItem.Text <> '' then
   begin
      AdjustTabSQLForItemSearch;
      SingleCodeSearch('item_code', 4, 1);
   end;
end;

procedure TdSMSLinks.btnGRNSearchClick(Sender: TObject);
begin
   SingleCodeSearch('grn_code', 5, 2);
end;

procedure TdSMSLinks.btnSearchLocMovClick(Sender: TObject);
begin
   SingleCodeSearch('locmove_code', 6, 3);
end;

procedure TdSMSLinks.btnSearchStockTakeClick(Sender: TObject);
begin
   SingleCodeSearch('stocktake_code', 7, 4);
end;

procedure TdSMSLinks.btnSearchVirtualDrawerClick(Sender: TObject);
begin
   SingleCodeSearch('virtualdrawer_code', 8, 5);
end;

procedure TdSMSLinks.btnSearchPromotionClick(Sender: TObject);
begin
   SingleCodeSearch('promotion_code', 9, 6);
end;

procedure TdSMSLinks.btnSearchStoreClick(Sender: TObject);
begin
   SingleCodeSearch('store_code', 10, 7);
end;

procedure TdSMSLinks.btnSearchUserClick(Sender: TObject);
var
   J : Integer;
   lUserCode : String;
begin
   for J := 0 to Length(tab[pgEnquiry.ActivePageIndex]) - 1 do
   begin
      tab[pgEnquiry.ActivePageIndex][J].dSet.Close;
   end;

   if edtEmployeeId.Text <> '' then
   begin
      lUserCode := OpenEmployeeTables(edtEmployeeId.Text);
      if lUserCode <> '' then
      begin
         OpenUserTables(lUserCode);
      end;
      mmoTableHint.Text := tab[pgEnquiry.ActivePageIndex][pgUser.ActivePageIndex].Info;
      dnUser.DataSource := tab[pgEnquiry.ActivePageIndex][pgUser.ActivePageIndex].dSource;
      pgUser.Repaint;
   end
   else if edtUserCode.Text <> '' then
   begin
      OpenUserTables(edtUserCode.Text);
      mmoTableHint.Text := tab[pgEnquiry.ActivePageIndex][pgUser.ActivePageIndex].Info;
      dnUser.DataSource := tab[pgEnquiry.ActivePageIndex][pgUser.ActivePageIndex].dSource;
      pgUser.Repaint;
      tab[pgEnquiry.ActivePageIndex][GetActiveSubPageIndex].Grid.SetFocus;
   end;
end;

procedure TdSMSLinks.OpenUserTables(aUserCode : String);
begin
   SetParamOpenAndDDL(8, 0, 'remediuser_code', aUserCode);
   SetParamOpenAndDDL(8, 1, 'remediuser_code', aUserCode);
   SetParamOpenAndDDL(8, 8, 'remediuser_code', aUserCode);
end;

function TdSMSLinks.OpenEmployeeTables(aEmployeeId : String) : String;
begin
   Result := '';
   if not SetParamOpenAndDDL(8, 2, 'employee_id', aEmployeeId) then
   begin
      Exit;
   end;
   SetParamOpenAndDDL(8, 3, 'employee_id', aEmployeeId);
   SetParamOpenAndDDL(8, 4, 'employee_id', aEmployeeId);
   SetParamOpenAndDDL(8, 5, 'employee_id', aEmployeeId);
   SetParamOpenAndDDL(8, 6, 'employee_id', aEmployeeId);
   SetParamOpenAndDDL(8, 7, 'employee_id', aEmployeeId);
   if not tab[8][2].dSet.eof then
      Result := tab[8][2].dSet.FieldByName('remediuser_code').AsString;
end;

procedure TdSMSLinks.btnSearchCustomerClick(Sender: TObject);
begin
   SingleCodeSearch('customer_id', 13, 9);
end;

procedure TdSMSLinks.btnSearchLaybyClick(Sender: TObject);
begin
   SingleCodeSearch('layby_id', 14, 10);
end;

procedure TdSMSLinks.btnSearchBankDepositClick(Sender: TObject);
begin
   SingleCodeSearch('bankdeposit_code', 15, 11);
end;

procedure TdSMSLinks.btnSearchAdjustmentClick(Sender: TObject);
begin
   SingleCodeSearch('adjustment_code', 16, 12);
end;

//new master tab

procedure TdSMSLinks.SingleCodeSearch(aCode : String; aMasterCodeIndex : Integer; aTabIndex : Integer);
var
   J : Integer;
begin
   if mCode[aMasterCodeIndex].edt.Text <> '' then
   begin
      for J := 0 to Length(tab[aTabIndex]) - 1 do
      begin
         if not SetParamOpenAndDDL(aTabIndex, J, aCode, mCode[aMasterCodeIndex].edt.Text) then
            break;
      end;
      mmoTableHint.Text := tab[pgEnquiry.ActivePageIndex][GetActiveSubPageIndex].Info;
      mTab[aTabIndex].dn.DataSource := tab[pgEnquiry.ActivePageIndex][GetActiveSubPageIndex].dSource;
      tab[pgEnquiry.ActivePageIndex][GetActiveSubPageIndex].Grid.SetFocus;
      mTab[aTabIndex].pc.Repaint;
   end;
end;

procedure TdSMSLinks.btnLastSaleClick(Sender: TObject);
var
   lRegisterCode : String;
   lReceiptRef : string;
begin
   lRegisterCode := GetRegistry('location_code', POS_DIRECTORY) + GetRegistry('register_code', POS_DIRECTORY);
   edtSaleCode.Text := gDatabase.GetLastCode('sale_code', 'sale', 'insert_date_time', lReceiptRef, lRegisterCode);
   if edtSaleCode.Text <> '' then
   begin
      btnSaleSearchClick(self);
      edtReceiptNbr.Text := lReceiptRef;
   end;
end;

procedure TdSMSLinks.btnLastStockTakeClick(Sender: TObject);
var
   lDummy : string;
begin
   edtStockTakeCode.Text := gDatabase.GetLastCode('stocktake_code', 'stocktake', 'insert_date_time', lDummy);
   if edtStockTakeCode.Text <> '' then
      btnSearchStockTakeClick(self)
end;

procedure TdSMSLinks.btnLastGRNClick(Sender: TObject);
var
   lDummy : string;
begin
   edtGRNCode.Text := gDatabase.GetLastCode('grn_code', 'grn', 'insert_datetime', lDummy);
   if edtGRNCode.Text <> '' then
      btnGRNSearchClick(self);
end;

procedure TdSMSLinks.btnLastLocMoveClick(Sender: TObject);
var
   lDummy : string;
begin
   edtLocMoveCode.Text := gDatabase.GetLastCode('locmove_code', 'locmove', 'insert_date_time', lDummy);
   if edtLocMoveCode.Text <> '' then
      btnSearchLocMovClick(self);
end;

procedure TdSMSLinks.btnLastBankDepositClick(Sender: TObject);
var
   lDummy : string;
begin
   edtBankDepositCode.Text := gDatabase.GetLastCode('bankdeposit_code', 'bankdeposit', 'insert_date_time', lDummy);
   if edtBankDepositCode.Text <> '' then
      btnSearchBankDepositClick(self);
end;

procedure TdSMSLinks.btnLastAdjustmentClick(Sender: TObject);
var
   lDummy : string;
begin
   edtAdjustmentCode.Text := gDatabase.GetLastCode('adjustment_code', 'adjustment', 'insert_datetime', lDummy);
   if edtAdjustmentCode.Text <> '' then
      btnSearchAdjustmentClick(self);
end;

//new master tab

//****************GRID EVENTS***********************

procedure TdSMSLinks.dbgTableMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
   ActiveTab.MouseScrollDown(fScrollLeftRight);
end;

procedure TdSMSLinks.dbgTableMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
   ActiveTab.MouseScrollUp(fScrollLeftRight);
end;

procedure TdSMSLinks.btnRecordViewClick(Sender: TObject);
var
   lRecordViewForm : TdRecordView;
   I : Integer;
   lQry : TDataSet;
begin
   lQry := ActiveTab.dSet.dataset;
   if ActiveTab.NotEmpty then
   begin
      lRecordViewForm := TdRecordView.Create(Self);
      mtbRecord.Close;
      try
         mtbRecord.Open;
         for I := 0 to lQry.Fields.Count - 1 do
         begin
            mtbRecord.Append;
            mtbRecordField.Value := lQry.Fields[I].FieldName;
            mtbRecordIsNull.Value := lQry.Fields[I].IsNull;
            mtbRecordHint.Value := ActiveTab.ColHint[I];
            if not lQry.Fields[I].IsNull then
               mtbRecordValue.Value := lQry.Fields[I].Value;
            mtbRecordType.Value := FieldTypeToString(lQry.Fields[I].DataType);

            mtbRecord.Post;
         end;
         lRecordViewForm.SetUp(mtbRecord, ActiveTab.TableName, ActiveTab.PrimaryKey);
         if lRecordViewForm.ShowModal = mrOk then
         begin
            lRecordViewForm.GetFields(mtbRecord);
            if not (lQry.State in [dsInsert,dsEdit]) then
               lQry.Edit;
            for I := 0 to lQry.FieldCount - 1 do
            begin
               if (not mtbRecordIsNull.AsBoolean) then
                  lQry.Fields[I].Value := mtbRecordValue.Value
               else
                  lQry.Fields[I].Clear;
               mtbRecord.Next;
            end;
            lQry.Post;
         end;
      finally
         FreeAndNil(lRecordViewForm);
      end;
   end;
end;

procedure TdSMSLinks.btnRefreshAllClick(Sender: TObject);
var
   I : Integer;
begin
   for I := 0 to Length(tab[pgEnquiry.ActivePageIndex]) - 1 do
   begin
      if tab[pgEnquiry.ActivePageIndex][I].dSet.Active then      
         tab[pgEnquiry.ActivePageIndex][I].dSet.Refresh;
   end;
end;

procedure TdSMSLinks.btnInfoClick(Sender: TObject);
begin
  if not fInfoShowing then
  begin
     pnlInfo.BringToFront;
  end
  else
     pnlInfo.SendToBack;
  fInfoShowing := not fInfoShowing;
end;

//**********************COLUMN POP UP***************************

procedure TdSMSLinks.dbgTableTitleClick(Column: TColumn);
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
      fColumnHint := ActiveTab.ColHint[fFieldClicked.Index];

      //Show column pop up
      if fFieldClicked.FieldName <> '' then
      begin
         poColumns.Items[3].Enabled := fColumnHint <> '';
         poColumns.Items[2].Caption := 'Set ' + fFieldClicked.FieldName + ' To...';
         poColumns.Popup(lScreenPoint.x, lScreenPoint.y);
      end;
   end
   else
      fColMoved := False;
end;

procedure TdSMSLinks.dbgTableMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbMiddle then
      fScrollLeftRight := not fScrollLeftRight;
end;

procedure TdSMSLinks.dbgTableColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   fColMoved := True;
end;

procedure TdSMSLinks.SortAscendingClick(Sender: TObject);
begin
   ActiveTab.Sort(fFieldClicked, 'asc');
end;

procedure TdSMSLinks.SortDescendingClick(Sender: TObject);
begin
   ActiveTab.Sort(fFieldClicked, 'desc');
end;

procedure TdSMSLinks.SetValueToClick(Sender: TObject);
begin
  //Show tedit next to the menuitem to put value
  edtColumnValue.Top := poColumns.PopupPoint.Y - 20;
  edtColumnValue.Left := poColumns.PopupPoint.X;
  edtColumnValue.Text := '';
  edtColumnValue.Visible := True;
  edtColumnValue.BringToFront;
  edtColumnValue.SetFocus;
end;

procedure TdSMSLinks.HintClick(Sender: TObject);
begin
   ShowMessage(fColumnHint);
end;

procedure TdSMSLinks.edtAdjustmentCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchAdjustmentClick(self);
   end;
end;

procedure TdSMSLinks.edtBankDepositCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchBankDepositClick(self);
   end;
end;

procedure TdSMSLinks.edtColumnValueExit(Sender: TObject);
begin
   edtColumnValue.Visible := False;
end;

procedure TdSMSLinks.edtColumnValueKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then //esc
   begin
      ActiveTab.Grid.SetFocus;
      edtColumnValue.Visible := False;
   end
   else if Key = #13 then //enter
   begin
      edtColumnValue.Visible := False;
      ActiveTab.SetFieldToValue(fFieldClicked.FieldName, edtColumnValue.Text);
   end;
end;

procedure TdSMSLinks.edtCustomerIdKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchCustomerClick(self);
   end;
end;

procedure TdSMSLinks.edtEmployeeIDKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchUserClick(self);
   end;
end;

procedure TdSMSLinks.edtGRNCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnGRNSearchClick(self);
   end;
end;

procedure TdSMSLinks.edtItemChange(Sender: TObject);
begin
   if (edtItem.Text <> '') and (edtItemColour.Text = '') and (edtItemColourSize.Text = '') then
   begin
      edtItemColourSize.Font.Color := clWindowText;
      edtItemColour.Font.Color     := clWindowText;
      edtItem.Font.Color           := clWindowText;
   end;
end;

procedure TdSMSLinks.edtItemColourChange(Sender: TObject);
begin
   if (edtItemColour.Text <> '') and (edtItemColourSize.Text = '') then
   begin
      edtItemColourSize.Font.Color := clWindowText;
      edtItemColour.Font.Color     := clWindowText;
      edtItem.Font.Color           := clGrayText;
   end
   else
      edtItemChange(Self);
end;

procedure TdSMSLinks.edtItemColourSizeChange(Sender: TObject);
begin
   if edtItemColourSize.Text <> '' then
   begin
      edtItemColourSize.Font.Color := clWindowText;
      edtItemColour.Font.Color     := clGrayText;
      edtItem.Font.Color           := clGrayText;
   end
   else
      edtItemColourChange(Self);
end;

procedure TdSMSLinks.edtItemColourSizeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnItemSearcClick(self);
   end;
end;

procedure TdSMSLinks.edtLaybyIdKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchLaybyClick(self);
   end;
end;

procedure TdSMSLinks.edtLocMoveCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchLocMovClick(self);
   end;
end;

procedure TdSMSLinks.edtPromotionCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchPromotionClick(self);
   end;
end;

procedure TdSMSLinks.edtSaleCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSaleSearchClick(self);
   end;
end;

procedure TdSMSLinks.edtStockTakeCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchStockTakeClick(self);
   end;
end;

procedure TdSMSLinks.edtStoreCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchStoreClick(self);
   end;
end;

procedure TdSMSLinks.edtVirtualDrawerCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      btnSearchVirtualDrawerClick(self);
   end;
end;

function TdSMSLinks.ActiveTab : TTab;
begin
   Result := tab[pgEnquiry.ActivePageIndex][GetActiveSubPageIndex];
end;

function TdSMSLinks.GetActiveSubPageIndex : Integer;
begin
   Result := mTab[pgEnquiry.ActivePageIndex].pc.ActivePageIndex;
end;

procedure TdSMSLinks.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TdSMSLinks.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I, J : Integer;
begin
   SetRegistry(IntToStr(pgEnquiry.ActivePageIndex), 'DEEnquiry');
   for I := 0 to Length(tab) - 1 do
      for J := 0 to Length(tab[I]) - 1 do
      begin
         if Assigned(tab[I][J]) then
            FreeAndNil(tab[I][J]);
      end;
   if Assigned(qryUtil) then
      qryUtil := nil;
end;

{$R *.dfm}

end.
