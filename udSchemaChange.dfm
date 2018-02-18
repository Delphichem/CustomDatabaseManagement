object dSchemaChange: TdSchemaChange
  Left = 0
  Top = 0
  Caption = 'Schema Change'
  ClientHeight = 958
  ClientWidth = 1028
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    1028
    958)
  PixelsPerInch = 96
  TextHeight = 13
  object lblTask: TLabel
    Left = 8
    Top = 8
    Width = 27
    Height = 16
    Caption = 'Task'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLocalTaskBranch: TLabel
    Left = 182
    Top = 8
    Width = 171
    Height = 16
    Caption = 'Local SCR Task Branch Folder'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSchemaChangeFolder: TLabel
    Left = 182
    Top = 56
    Width = 281
    Height = 16
    Caption = 'New Schema Change Folder Containing .ddl Files'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSMSVersion: TLabel
    Left = 8
    Top = 56
    Width = 73
    Height = 16
    Caption = 'SMS Version'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnLocalSCRTaskBranch: TSpeedButton
    Left = 182
    Top = 24
    Width = 42
    Height = 33
    Glyph.Data = {
      BE080000424DBE0800000000000036000000280000001B0000001A0000000100
      18000000000088080000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F8F1F4F5FBFBFCFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEBEDEF88C8E33D7D95C2B8B2F7EFEFFFFFFFF7F9F8ECF1F2D9E3E6B5CBD3
      8CB8CBB1C9D2EDE9E7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE81BAD35DBBE45B92A798
      928E9FA6AAB9D7E1A0C7D87AB3CB61ACC957ACCF51ACD36E99A49CA2A2EDEFEF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF3F7F9ABD4E464B5D776C7EA5995AD5B8BA13E77914F9AB96ABDDF66
      B3D56CB9D86BBADB70BAD9B2B7B0B1B1ABFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF98CBDD24EAACD75BE
      DF80CEF05090AD347291326F8B599AB77CC9E670B8D773BBD96DB8D76EB9DBB4
      DDEEE0E9ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFDFDFC92C5D95CB0D477C2E182D2F35393AF3E78933B72
      8B5B9EBA7CCBEA70BBDA73BCDC6EB9DA6FBBDAB4DAE7FBFCFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      98CCE260B5D97AC6E686D7F9518FAD3C76913D748C5A9FBE81CFEF71BDDC74BF
      DF6EBCDC71BEDCAFD8E7FAFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE9ACEE463BBDE7DCAEA86D9FB
      599CB73C7690407B954885A174C0DE78C2E275C0DF73C0DE74C0E16CBCDEB9D9
      E5FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFD9CD1E766BFE47ECFEE80D0F184D5F7447F98407C983B748E
      68B0CF7CC8E975C0E076C2E26BBDDE8ECCE2EFF7F9FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD9ED4EA69
      C2EA82D1F47FD0F38EE2FF417E96417B973A77906AB1D17DCCEE76C2E175C4E4
      67BADCB5D6E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEA0D8EF6DC9F086D8FA84D6F98FE6FF43
      7E99417B923D76926BB4D47FCEEE78C5E678C6E969BADEB7D7E2FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFEFEFCA4DBEF71CDF188DBF989D8FC96EAFF437E963C78953E79906DB5D482
      D1F279C7E879C8E96BBFE0BBDBE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCA5DDF075D3F38DDE
      FA8BDEFB97F0FF427F973D78953E77936EB9D683D1F37AC8E97AC9EC6FC1E5BC
      DDE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFEFCFCA6DEF078D6F28FE2FA8EE2FD99F5FF4280983D78
      923D77926FB9D683D4F67DC9EA7BCBED72C4E7BFDEE8FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFC
      A7E1F17ADAF491E6FB90E5FD9EF8FF4381983F7994376F8A70B7D885D7F97ECB
      EC7BCBED75C7E9C2E1EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFCA9E3F27EDFF494EAFB92E8FD
      A2FDFF417D943267824B89A479C7E684D4F780CDEE7CCEF075C9ECC3E2EEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFDFCFCAAE4F481E3F597EDFB95EDFEA4FFFF4481975295B486D6F9
      84D6F881D1F280D0F37ED0F378CCEFC5E4F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFCABE5F383
      E7F79BF4FE9CF6FF9CF5F765ACC68CDFFF84D9FB7FD1F37ED1F57BD1F676CEF6
      71CAF2C2E5F3FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFCA9E6F47FE7F993EEFA84E0F479D3F177
      CFF67BD2F87AD1F67ED2F583D5F588D5F78CD8F795D8F4D5EDF7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFCFCFCA8E6F478DCF38CDAF391D7F4A0DEF8AFE6F9B8E6F7C7EAF8CEEEF8DB
      F2F9E4F5FAEAF8FAEEF8F9F8FBFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDEEF9FBE5F4FAEAF6
      FBF1FAFCF6FCFDF8FCFCFAFDFDFDFEFEFEFEFEFFFFFEFFFFFEFFFFFEFFFFFDFE
      FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFEFDFDFFFEFEFFFEFEFFFFFEFFFFFCFEFDFCFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFEFEFFFEFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFF
      FCFEFEFEFCFCFEFEFEFCFDFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000}
    OnClick = btnLocalSCRTaskBranchClick
  end
  object btnSchemaFolder: TSpeedButton
    Left = 182
    Top = 71
    Width = 42
    Height = 33
    Glyph.Data = {
      BE080000424DBE0800000000000036000000280000001B0000001A0000000100
      18000000000088080000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F8F1F4F5FBFBFCFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEBEDEF88C8E33D7D95C2B8B2F7EFEFFFFFFFF7F9F8ECF1F2D9E3E6B5CBD3
      8CB8CBB1C9D2EDE9E7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE81BAD35DBBE45B92A798
      928E9FA6AAB9D7E1A0C7D87AB3CB61ACC957ACCF51ACD36E99A49CA2A2EDEFEF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF3F7F9ABD4E464B5D776C7EA5995AD5B8BA13E77914F9AB96ABDDF66
      B3D56CB9D86BBADB70BAD9B2B7B0B1B1ABFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF98CBDD24EAACD75BE
      DF80CEF05090AD347291326F8B599AB77CC9E670B8D773BBD96DB8D76EB9DBB4
      DDEEE0E9ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFDFDFC92C5D95CB0D477C2E182D2F35393AF3E78933B72
      8B5B9EBA7CCBEA70BBDA73BCDC6EB9DA6FBBDAB4DAE7FBFCFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      98CCE260B5D97AC6E686D7F9518FAD3C76913D748C5A9FBE81CFEF71BDDC74BF
      DF6EBCDC71BEDCAFD8E7FAFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE9ACEE463BBDE7DCAEA86D9FB
      599CB73C7690407B954885A174C0DE78C2E275C0DF73C0DE74C0E16CBCDEB9D9
      E5FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFD9CD1E766BFE47ECFEE80D0F184D5F7447F98407C983B748E
      68B0CF7CC8E975C0E076C2E26BBDDE8ECCE2EFF7F9FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD9ED4EA69
      C2EA82D1F47FD0F38EE2FF417E96417B973A77906AB1D17DCCEE76C2E175C4E4
      67BADCB5D6E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEA0D8EF6DC9F086D8FA84D6F98FE6FF43
      7E99417B923D76926BB4D47FCEEE78C5E678C6E969BADEB7D7E2FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFEFEFCA4DBEF71CDF188DBF989D8FC96EAFF437E963C78953E79906DB5D482
      D1F279C7E879C8E96BBFE0BBDBE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCA5DDF075D3F38DDE
      FA8BDEFB97F0FF427F973D78953E77936EB9D683D1F37AC8E97AC9EC6FC1E5BC
      DDE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFEFCFCA6DEF078D6F28FE2FA8EE2FD99F5FF4280983D78
      923D77926FB9D683D4F67DC9EA7BCBED72C4E7BFDEE8FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFC
      A7E1F17ADAF491E6FB90E5FD9EF8FF4381983F7994376F8A70B7D885D7F97ECB
      EC7BCBED75C7E9C2E1EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFCA9E3F27EDFF494EAFB92E8FD
      A2FDFF417D943267824B89A479C7E684D4F780CDEE7CCEF075C9ECC3E2EEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFDFCFCAAE4F481E3F597EDFB95EDFEA4FFFF4481975295B486D6F9
      84D6F881D1F280D0F37ED0F378CCEFC5E4F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFCABE5F383
      E7F79BF4FE9CF6FF9CF5F765ACC68CDFFF84D9FB7FD1F37ED1F57BD1F676CEF6
      71CAF2C2E5F3FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFCA9E6F47FE7F993EEFA84E0F479D3F177
      CFF67BD2F87AD1F67ED2F583D5F588D5F78CD8F795D8F4D5EDF7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFCFCFCA8E6F478DCF38CDAF391D7F4A0DEF8AFE6F9B8E6F7C7EAF8CEEEF8DB
      F2F9E4F5FAEAF8FAEEF8F9F8FBFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDEEF9FBE5F4FAEAF6
      FBF1FAFCF6FCFDF8FCFCFAFDFDFDFEFEFEFEFEFFFFFEFFFFFEFFFFFEFFFFFDFE
      FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFEFDFDFFFEFEFFFEFEFFFFFEFFFFFCFEFDFCFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFEFEFFFEFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFF
      FCFEFEFEFCFCFEFEFEFCFDFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000}
    OnClick = btnSchemaFolderClick
  end
  object lblSQLWarning: TLabel
    Left = 11
    Top = 495
    Width = 486
    Height = 13
    Caption = 
      'RMS Changes: This SQL will be applied to (RMS on 192.168.5.29) a' +
      'nd (RDReference on 192.168.5.3)'
  end
  object lbl1: TLabel
    Left = 8
    Top = 102
    Width = 83
    Height = 16
    Caption = 'Your Payroll Id'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSMSChanges: TLabel
    Left = 11
    Top = 812
    Width = 786
    Height = 13
    Caption = 
      'SMS Changes: These changes will be applied to the SMS/DCM4/HODCM' +
      ' code in your local branch. It will also apply NexusDB SQL on 19' +
      '2.168.5.29 -> MasterSchema'
  end
  object lbl2: TLabel
    Left = 85
    Top = 508
    Width = 489
    Height = 13
    Caption = 
      'It will also be appended to schema_upgrade.sql in both your loca' +
      'l branch and the public schema folder'
  end
  object lbl3: TLabel
    Left = 8
    Top = 153
    Width = 486
    Height = 13
    Caption = 
      'DataGenie Changes: These .ddl files will be replaced in your loc' +
      'al branch and the public schema folder'
  end
  object cboTask: TComboBox
    Left = 8
    Top = 27
    Width = 129
    Height = 27
    DropDownCount = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 0
    OnChange = cboTaskChange
  end
  object edtLocalTaskBranch: TEdit
    Left = 230
    Top = 27
    Width = 787
    Height = 27
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = edtLocalTaskBranchChange
  end
  object edtSchemaChangeFolder: TEdit
    Left = 230
    Top = 74
    Width = 787
    Height = 27
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = edtSchemaChangeFolderChange
  end
  object btnPrepare: TButton
    Left = 416
    Top = 107
    Width = 89
    Height = 41
    Caption = 'Prepare'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnPrepareClick
  end
  object btnExecute: TButton
    Left = 536
    Top = 107
    Width = 89
    Height = 41
    Caption = 'Execute'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnExecuteClick
  end
  object pgcDDLS: TPageControl
    Left = 8
    Top = 168
    Width = 1009
    Height = 321
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
  end
  object sqlSQL: TSynMemo
    Left = 8
    Top = 527
    Width = 1009
    Height = 278
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 8
    Gutter.DigitCount = 3
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 0
    Gutter.ShowLineNumbers = True
    Gutter.Width = 10
    Highlighter = hl1
    FontSmoothing = fsmNone
  end
  object cboVersion: TComboBox
    Left = 8
    Top = 75
    Width = 134
    Height = 27
    DropDownCount = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 1
    OnChange = cboVersionChange
  end
  object cboPayrollId: TComboBox
    Left = 8
    Top = 121
    Width = 134
    Height = 27
    CharCase = ecUpperCase
    DropDownCount = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 2
    OnChange = cboVersionChange
    Items.Strings = (
      'ADT'
      'ALK'
      'DCL'
      'DKN'
      'JSN'
      'LSN'
      'TTS')
  end
  object dbgSMSChanges: TSMDBGrid
    Left = 8
    Top = 831
    Width = 1009
    Height = 120
    DataSource = dsSMSChanges
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 20
    ScrollBars = ssHorizontal
    Columns = <
      item
        Expanded = False
        FieldName = 'business_object'
        Title.Caption = 'Business Object'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'table_name'
        Title.Caption = 'Table'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'change_type'
        Title.Caption = 'Change Type'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'field_name'
        Title.Caption = 'Field Name'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'field_type'
        Title.Caption = 'Field Type'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'size'
        Title.Caption = 'Size'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SQL'
        Title.Caption = 'NexusDB SQL'
        Visible = True
      end>
  end
  object btnReset: TButton
    Left = 656
    Top = 107
    Width = 89
    Height = 41
    Caption = 'Reset'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnResetClick
  end
  object hl1: TSynSQLSyn
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
    SQLDialect = sqlMSSQL2K
    Left = 544
    Top = 664
  end
  object mtbSMSChanges: TkbmMemTable
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
    Left = 504
    Top = 896
    object mtbSMSChangesbusiness_object: TStringField
      FieldName = 'business_object'
      Size = 128
    end
    object mtbSMSChangestable_name: TStringField
      FieldName = 'table_name'
      Size = 128
    end
    object mtbSMSChangeschange_type: TStringField
      FieldName = 'change_type'
      Size = 128
    end
    object mtbSMSChangesfield_name: TStringField
      FieldName = 'field_name'
      Size = 128
    end
    object mtbSMSChangesfield_type: TStringField
      FieldName = 'field_type'
      Size = 128
    end
    object mtbSMSChangessize: TStringField
      FieldName = 'size'
      Size = 128
    end
    object mtbSMSChangesSQL: TStringField
      FieldName = 'SQL'
      Size = 300
    end
  end
  object dsSMSChanges: TDataSource
    DataSet = mtbSMSChanges
    Left = 472
    Top = 896
  end
end
