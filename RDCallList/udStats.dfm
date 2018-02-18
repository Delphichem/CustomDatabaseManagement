object dStats: TdStats
  Left = 0
  Top = 0
  Caption = 'Call Statistics'
  ClientHeight = 493
  ClientWidth = 1130
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
  OnShow = FormShow
  DesignSize = (
    1130
    493)
  PixelsPerInch = 96
  TextHeight = 13
  object lblTo: TLabel
    Left = 119
    Top = 8
    Width = 14
    Height = 19
    Caption = 'to'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 232
    Top = 466
    Width = 103
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Interval (days)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSystem: TLabel
    Left = 447
    Top = 8
    Width = 51
    Height = 19
    Caption = 'System'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblClient: TLabel
    Left = 615
    Top = 8
    Width = 40
    Height = 19
    Caption = 'Client'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 775
    Top = 8
    Width = 70
    Height = 19
    Caption = 'Payroll ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbgCalls: TSMDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 35
    Width = 223
    Height = 453
    Margins.Top = 35
    Margins.Bottom = 5
    Align = alLeft
    DataSource = dsClosed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
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
    ExOptions = [eoBooleanAsCheckBox, eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoTitleLines]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 20
    ScrollBars = ssHorizontal
    Columns = <
      item
        Expanded = False
        FieldName = 'payroll_id'
        Title.Alignment = taCenter
        Title.Caption = 'Payroll ID'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'closed'
        Title.Alignment = taCenter
        Title.Caption = 'Closed'
        Width = 43
        Visible = True
        FooterValue = 0
        FooterType = ftSum
      end
      item
        Expanded = False
        FieldName = 'tasks'
        Title.Caption = 'Defects'
        Width = 40
        Visible = True
        FooterValue = 0
        FooterType = ftSum
      end
      item
        Expanded = False
        FieldName = 'task_perc'
        Title.Caption = 'Defect %'
        Width = 50
        Visible = True
      end>
  end
  object dtpFrom: TDateTimePicker
    Left = 8
    Top = 5
    Width = 105
    Height = 27
    Date = 42481.000000000000000000
    Time = 42481.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = dtpFromChange
  end
  object dtpTo: TDateTimePicker
    Left = 139
    Top = 5
    Width = 105
    Height = 27
    Date = 42481.999988425920000000
    Time = 42481.999988425920000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = dtpToChange
  end
  object btnRefresh: TButton
    Left = 328
    Top = 7
    Width = 85
    Height = 25
    Caption = 'Refresh'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnRefreshClick
  end
  object chtCalls: TDBChart
    Left = 232
    Top = 38
    Width = 890
    Height = 419
    Title.Text.Strings = (
      '')
    BottomAxis.DateTimeFormat = 'dtShort'
    LeftAxis.MaximumOffset = 5
    LeftAxis.MinimumOffset = 5
    View3D = False
    TabOrder = 4
    Anchors = [akLeft, akTop, akRight, akBottom]
    PrintMargins = (
      15
      27
      15
      27)
    object lnsrsCallsCreated: TLineSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = False
      DataSource = mtbCalls
      Title = 'Calls Created'
      XLabelsSource = 'DATE'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'CALLS_CREATED'
    end
    object lnsrsCallsClosed: TLineSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = False
      DataSource = mtbCalls
      Title = 'Calls Closed'
      XLabelsSource = 'DATE'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'CALLS_CLOSED'
    end
    object lnsrsPayrollId: TLineSeries
      Active = False
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = False
      DataSource = mtbCalls
      SeriesColor = 12615680
      Title = 'Payroll Id'
      XLabelsSource = 'DATE'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'PAYROLL_CLOSED'
    end
    object lnsrsOpen: TLineSeries
      Active = False
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = False
      DataSource = mtbCalls
      SeriesColor = clBlue
      Title = 'Calls Open'
      XLabelsSource = 'DATE'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'CALLS_OPEN'
    end
  end
  object edtInterval: TSpinEdit
    Left = 341
    Top = 463
    Width = 43
    Height = 29
    Anchors = [akLeft, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 100
    MinValue = 1
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Value = 1
  end
  object cboSystem: TComboBox
    Left = 504
    Top = 5
    Width = 89
    Height = 27
    DropDownCount = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 6
    Items.Strings = (
      'BC'
      'Corporate'
      'DCM'
      'DCM4'
      'DG'
      'EWS'
      'HODCM'
      'RDCP'
      'RDDIS'
      'RDEX'
      'RDLMG'
      'RDLNK'
      'RDMXS'
      'RDTPS'
      'RDWS'
      'RMS'
      'RMSmx'
      'SC'
      'Schema'
      'SMS'
      'SMSmx'
      'SMSSS'
      'SYNC'
      'Translator'
      'WebShop')
  end
  object cboClient: TComboBox
    Left = 661
    Top = 5
    Width = 89
    Height = 27
    DropDownCount = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 7
  end
  object pb1: TProgressBar
    Left = 408
    Top = 468
    Width = 409
    Height = 17
    Anchors = [akLeft, akRight, akBottom]
    Smooth = True
    TabOrder = 8
    Visible = False
  end
  object cboPayroll: TComboBox
    Left = 851
    Top = 5
    Width = 81
    Height = 27
    DropDownCount = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 9
    OnChange = cboPayrollChange
  end
  object btnTrend: TButton
    Left = 1040
    Top = 463
    Width = 82
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Trend'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnTrendClick
  end
  object btnHistory: TButton
    Left = 949
    Top = 463
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'History'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnHistoryClick
  end
  object btnSmooth: TButton
    Left = 839
    Top = 463
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Smooth'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = btnSmoothClick
  end
  object dsClosed: TDataSource
    DataSet = mtbClosed
    Left = 40
    Top = 216
  end
  object mtbClosed: TkbmMemTable
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
    Left = 80
    Top = 216
    object mtbClosedpayroll_id: TStringField
      FieldName = 'payroll_id'
      Size = 12
    end
    object mtbClosedclosed: TIntegerField
      FieldName = 'closed'
    end
    object mtbClosedtasks: TIntegerField
      FieldName = 'tasks'
    end
    object mtbClosedtask_perc: TIntegerField
      FieldName = 'task_perc'
    end
  end
  object mtbCalls: TkbmMemTable
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
    Left = 440
    Top = 176
    object mtbCallsCALLS_CREATED: TFloatField
      FieldName = 'CALLS_CREATED'
    end
    object mtbCallsCALLS_CLOSED: TFloatField
      FieldName = 'CALLS_CLOSED'
    end
    object mtbCallsPAYROLL_CLOSED: TFloatField
      FieldName = 'PAYROLL_CLOSED'
    end
    object mtbCallsCALLS_OPEN: TFloatField
      FieldName = 'CALLS_OPEN'
    end
    object mtbCallsDATE: TDateTimeField
      FieldName = 'DATE'
      DisplayFormat = 'dd/mm'
    end
  end
end
