object dSMSConfigs: TdSMSConfigs
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'SMS Configuration Settings For This Register'
  ClientHeight = 528
  ClientWidth = 1139
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  ExplicitWidth = 320
  ExplicitHeight = 240
  DesignSize = (
    1139
    528)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TSpeedButton
    Left = 616
    Top = 499
    Width = 145
    Height = 29
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnOKClick
    ExplicitTop = 504
  end
  object btnNewConfig: TSpeedButton
    Left = 3
    Top = 499
    Width = 60
    Height = 29
    Hint = 'Create a new config in SMSDataEditor.ini'
    Anchors = [akLeft, akBottom]
    Caption = 'New'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnNewConfigClick
  end
  object btnRemove: TSpeedButton
    Left = 69
    Top = 499
    Width = 68
    Height = 29
    Hint = 'Remove this config from SMSDataEditor.ini'
    Anchors = [akLeft, akBottom]
    Caption = 'Remove'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnRemoveClick
  end
  object btnUpdate: TSpeedButton
    Left = 143
    Top = 499
    Width = 74
    Height = 29
    Hint = 
      'Find new configs from smsconfig then override descriptions and d' +
      'efault values from the test development MSSQL database'
    Anchors = [akLeft, akBottom]
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnUpdateClick
  end
  object pb1: TProgressBar
    Left = 223
    Top = 506
    Width = 387
    Height = 14
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object dbgConfigs: TSMDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1133
    Height = 495
    Margins.Bottom = 30
    Align = alClient
    DataSource = dsConfigs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgConfigsDrawColumnCell
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'Tahoma'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clInactiveBorder
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 40
    DefaultRowHeight = 18
    ScrollBars = ssHorizontal
    Columns = <
      item
        Expanded = False
        FieldName = 'smsconfig_mnemonic'
        Title.Caption = 'Smsconfig Mnemonic'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'default_value'
        Title.Caption = 'DB Value'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'low_value'
        Title.Caption = 'Low Value'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'high_value'
        Title.Caption = 'High Value'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMSdefault_value'
        Title.Caption = 'Default Value'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
        Title.Caption = 'Description'
        Visible = True
      end>
  end
  object mtbConfigs: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    AutoAddIndexes = True
    IndexDefs = <
      item
        Name = 'mtbConfigsIndex1'
        Fields = 'smsconfig_mnemonic'
        Options = [ixPrimary, ixUnique, ixCaseInsensitive]
      end>
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
    BeforePost = mtbConfigsBeforePost
    BeforeDelete = mtbConfigsBeforeDelete
    Left = 184
    Top = 168
    object mtbConfigssmsconfig_mnemonic: TStringField
      FieldName = 'smsconfig_mnemonic'
      Required = True
      Size = 24
    end
    object mtbConfigsdefault_value: TStringField
      FieldName = 'default_value'
      Size = 64
    end
    object mtbConfigslow_value: TStringField
      FieldName = 'low_value'
      Size = 64
    end
    object mtbConfigshigh_value: TStringField
      FieldName = 'high_value'
      Size = 64
    end
    object mtbConfigsdescription: TStringField
      FieldName = 'description'
      OnChange = mtbConfigsdescriptionChange
      Size = 2500
    end
    object mtbConfigsSMSdefault_value: TStringField
      FieldName = 'SMSdefault_value'
      OnChange = mtbConfigsSMSdefault_valueChange
      Size = 64
    end
    object mtbConfigsobsolete: TStringField
      FieldName = 'obsolete'
      Size = 1
    end
    object mtbConfigsexists: TBooleanField
      FieldName = 'exists'
    end
    object mtbConfigsIndex: TIntegerField
      FieldName = 'Index'
    end
  end
  object dsConfigs: TDataSource
    DataSet = mtbConfigs
    Left = 224
    Top = 168
  end
end
