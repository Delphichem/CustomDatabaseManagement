object dExport: TdExport
  Left = 0
  Top = 0
  Caption = 'Export'
  ClientHeight = 521
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  DesignSize = (
    312
    521)
  PixelsPerInch = 96
  TextHeight = 13
  object btnExport: TSpeedButton
    Left = 66
    Top = 464
    Width = 77
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = 'Export'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnExportClick
  end
  object dbgExport: TSMDBGrid
    Left = 8
    Top = 8
    Width = 294
    Height = 365
    Anchors = [akLeft, akTop, akRight]
    DataSource = dsExport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgExportDrawColumnCell
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
    ExOptions = [eoBooleanAsCheckBox, eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoAutoSave, eoBLOBEditor, eoTitleWordWrap, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 22
    ScrollBars = ssHorizontal
    Columns = <
      item
        Expanded = False
        FieldName = 'DisplayName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Column'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Include'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
        InplaceEditor = ieCheckbox
      end>
  end
  object btnSelectAll: TButton
    Left = 66
    Top = 379
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Select All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnSelectAllClick
  end
  object btnUnSelectAll: TButton
    Left = 147
    Top = 379
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'UnSelect All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnUnSelectAllClick
  end
  object edtDelimiter: TLabeledEdit
    Left = 131
    Top = 410
    Width = 39
    Height = 24
    Anchors = [akLeft, akBottom]
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'Delimiter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 3
    Text = ','
  end
  object btnCancel: TButton
    Left = 149
    Top = 464
    Width = 73
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
  end
  object mmoExport: TMemo
    Left = 346
    Top = 354
    Width = 33
    Height = 34
    TabOrder = 5
    Visible = False
    WordWrap = False
  end
  object pbExport: TProgressBar
    Left = 0
    Top = 504
    Width = 312
    Height = 17
    Align = alBottom
    Smooth = True
    TabOrder = 6
    ExplicitTop = 525
  end
  object cbExcel: TCheckBox
    Left = 96
    Top = 441
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Open in Excel'
    Checked = True
    State = cbChecked
    TabOrder = 7
    ExplicitTop = 462
  end
  object dsExport: TDataSource
    DataSet = mtbExport
    Left = 224
    Top = 96
  end
  object mtbExport: TkbmMemTable
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
    Left = 192
    Top = 96
    object mtbExportField: TStringField
      FieldName = 'Field'
      Size = 50
    end
    object mtbExportDisplayName: TStringField
      FieldName = 'DisplayName'
      Size = 32
    end
    object mtbExportInclude: TBooleanField
      FieldName = 'Include'
    end
  end
end
