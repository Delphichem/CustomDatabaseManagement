object dColumnVisibility: TdColumnVisibility
  Left = 0
  Top = 0
  Caption = 'Visible Columns'
  ClientHeight = 485
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblTable: TLabel
    Left = 95
    Top = 16
    Width = 39
    Height = 19
    Caption = 'Table'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cboTable: TComboBox
    Left = 140
    Top = 8
    Width = 209
    Height = 33
    CharCase = ecLowerCase
    DropDownCount = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnChange = cboTableChange
  end
  object dbgVisibleColumns: TSMDBGrid
    Left = 8
    Top = 47
    Width = 427
    Height = 399
    DataSource = dsVisibleColumns
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgVisibleColumnsDrawColumnCell
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'Tahoma'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoBLOBEditor, eoTitleWordWrap, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 22
    ScrollBars = ssHorizontal
    Columns = <
      item
        Expanded = False
        FieldName = 'Field'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Visible'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 65
        Visible = True
        InplaceEditor = ieCheckbox
      end
      item
        Expanded = False
        FieldName = 'Type'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object btnSelectAll: TButton
    Left = 128
    Top = 452
    Width = 75
    Height = 25
    Caption = 'Select All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSelectAllClick
  end
  object btnUnSelectAll: TButton
    Left = 209
    Top = 452
    Width = 75
    Height = 25
    Caption = 'UnSelect All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnUnSelectAllClick
  end
  object btnOk: TButton
    Left = 376
    Top = 452
    Width = 59
    Height = 30
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 4
    OnClick = btnOkClick
  end
  object dsVisibleColumns: TDataSource
    DataSet = mtbVisibleColumns
    Left = 72
    Top = 208
  end
  object mtbVisibleColumns: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '7.18.00 Standard Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 104
    Top = 208
    object mtbVisibleColumnsField: TStringField
      FieldName = 'Field'
    end
    object mtbVisibleColumnsVisible: TBooleanField
      FieldName = 'Visible'
    end
    object mtbVisibleColumnsType: TStringField
      FieldName = 'Type'
    end
  end
end
