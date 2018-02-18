object dInsertSQL: TdInsertSQL
  Left = 0
  Top = 0
  Caption = 'Insert SQL'
  ClientHeight = 562
  ClientWidth = 584
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
  PixelsPerInch = 96
  TextHeight = 13
  object lblTable: TLabel
    Left = 167
    Top = 15
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
  object btnGenerateSQL: TSpeedButton
    Left = 230
    Top = 343
    Width = 115
    Height = 30
    Caption = 'Generate SQL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnGenerateSQLClick
  end
  object cboTable: TComboBox
    Left = 212
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
  object mmoSQL: TSynMemo
    Left = 8
    Top = 376
    Width = 561
    Height = 153
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 1
    Gutter.DigitCount = 3
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 0
    Gutter.ShowLineNumbers = True
    Gutter.Width = 10
    Highlighter = SynSQLSyn1
    FontSmoothing = fsmNone
  end
  object dbgInsertSQL: TSMDBGrid
    Left = 8
    Top = 47
    Width = 561
    Height = 293
    DataSource = dsInsertSQL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgInsertSQLDrawColumnCell
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
        FieldName = 'Value'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Include'
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
  object btnCancel: TButton
    Left = 295
    Top = 532
    Width = 83
    Height = 30
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object btnCopySQL: TButton
    Left = 136
    Top = 532
    Width = 153
    Height = 30
    Caption = 'Copy To SQL Editor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 4
  end
  object dsInsertSQL: TDataSource
    DataSet = mtbInsert
    Left = 72
    Top = 208
  end
  object SynSQLSyn1: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clGreen
    ConditionalCommentAttri.Foreground = clGreen
    DataTypeAttri.Foreground = clTeal
    FunctionAttri.Foreground = clPurple
    IdentifierAttri.Foreground = clMaroon
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMenuHighlight
    StringAttri.Foreground = clRed
    SymbolAttri.Foreground = clGray
    TableNameAttri.Foreground = clGreen
    VariableAttri.Foreground = clTeal
    Left = 376
    Top = 432
  end
  object SynCompletionProposal1: TSynCompletionProposal
    Options = [scoUsePrettyText, scoEndCharCompletion, scoCompleteWithTab, scoCompleteWithEnter]
    ItemList.UnicodeStrings = 'select'#13#10'insert'#13#10'update'
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <>
    ShortCut = 16416
    Editor = mmoSQL
    Left = 376
    Top = 400
    EndOfTokenChrW = '()[]. '
    TriggerCharsW = '.'
  end
  object mtbInsert: TkbmMemTable
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
    object mtbInsertField: TStringField
      FieldName = 'Field'
    end
    object mtbInsertValue: TStringField
      FieldName = 'Value'
      OnChange = mtbInsertValueChange
      Size = 200
    end
    object mtbInsertInclude: TBooleanField
      FieldName = 'Include'
    end
    object mtbInsertType: TStringField
      FieldName = 'Type'
    end
  end
end
