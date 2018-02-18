object dCalls: TdCalls
  Left = 0
  Top = 0
  Caption = 'RD Calls'
  ClientHeight = 736
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCallActions: TPanel
    Left = 752
    Top = 0
    Width = 610
    Height = 736
    Align = alRight
    TabOrder = 1
    OnMouseEnter = pnlCallActionsMouseEnter
    DesignSize = (
      610
      736)
    object lblDetails: TLabel
      Left = 10
      Top = 4
      Width = 32
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Details'
    end
    object lblResolution: TLabel
      Left = 8
      Top = 148
      Width = 50
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Resolution'
    end
    object ctrlCallAction: TDBCtrlGrid
      Left = 10
      Top = 259
      Width = 599
      Height = 468
      AllowDelete = False
      AllowInsert = False
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dsCallAction
      PanelHeight = 117
      PanelWidth = 582
      TabOrder = 0
      RowCount = 4
      OnMouseEnter = ctrlCallActionMouseEnter
      object dbtxtActionDate: TDBText
        Left = 5
        Top = 21
        Width = 121
        Height = 17
        DataField = 'action_datetime'
        DataSource = dsCallAction
      end
      object dbtxtActionedBy: TDBText
        Left = 24
        Top = 55
        Width = 65
        Height = 17
        Alignment = taCenter
        DataField = 'acted_by'
        DataSource = dsCallAction
      end
      object dbtxtReferredTo: TDBText
        Left = 24
        Top = 85
        Width = 65
        Height = 17
        Alignment = taCenter
        DataField = 'refer_to'
        DataSource = dsCallAction
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblActionedBy: TLabel
        Left = 32
        Top = 44
        Width = 57
        Height = 13
        Alignment = taCenter
        Caption = 'Actioned By'
      end
      object lbl1: TLabel
        Left = 32
        Top = 74
        Width = 58
        Height = 13
        Alignment = taCenter
        Caption = 'Referred To'
      end
      object dbmmoCallActions: TDBMemo
        Left = 128
        Top = 8
        Width = 449
        Height = 105
        Anchors = [akLeft, akTop, akBottom]
        DataField = 'action_details'
        DataSource = dsCallAction
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = dbmmoCallActionsClick
        OnMouseEnter = dbmmoCallActionMouseEnter
      end
    end
    object mmoCallA: TMemo
      Left = 241
      Top = 536
      Width = 185
      Height = 89
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnMouseLeave = mmoCallAMouseLeave
    end
    object mmoDescription: TMemo
      Left = 9
      Top = 19
      Width = 592
      Height = 129
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnClick = mmoDescriptionClick
      OnExit = mmoDescriptionExit
      OnMouseEnter = mmoDescriptionMouseEnter
      OnMouseLeave = mmoDescriptionMouseLeave
    end
    object mmoResolution: TMemo
      Left = 9
      Top = 163
      Width = 592
      Height = 90
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnClick = mmoResolutionClick
      OnExit = mmoResolutionExit
      OnMouseEnter = mmoResolutionMouseEnter
      OnMouseLeave = mmoResolutionMouseLeave
    end
  end
  object pnlCallList: TPanel
    Left = 0
    Top = 0
    Width = 1217
    Height = 736
    Align = alLeft
    TabOrder = 0
    OnMouseEnter = pnlCallListMouseEnter
    object lblTo: TLabel
      Left = 402
      Top = 11
      Width = 10
      Height = 13
      Caption = 'to'
    end
    object lblClient: TLabel
      Left = 16
      Top = 35
      Width = 32
      Height = 16
      Caption = 'Client'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPriority: TLabel
      Left = 125
      Top = 35
      Width = 40
      Height = 16
      Caption = 'Priority'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAssigned: TLabel
      Left = 226
      Top = 35
      Width = 51
      Height = 16
      Caption = 'Assigned'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 352
      Top = 35
      Width = 36
      Height = 16
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCallType: TLabel
      Left = 654
      Top = 35
      Width = 53
      Height = 16
      Caption = 'Call Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSystem: TLabel
      Left = 514
      Top = 35
      Width = 42
      Height = 16
      Caption = 'System'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnCallFolder: TButton
      Left = 495
      Top = 5
      Width = 69
      Height = 25
      Hint = 'Open the call folder'
      Caption = 'Call Folder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnCallFolderClick
    end
    object btnClientDetails: TButton
      Left = 623
      Top = 5
      Width = 84
      Height = 25
      Hint = 'Open the clients fact sheet'
      Caption = 'Client Details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnClientDetailsClick
    end
    object btnLastEmail: TButton
      Left = 569
      Top = 5
      Width = 48
      Height = 25
      Hint = 'Open the last email or create a new one'
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnLastEmailClick
    end
    object btnRefresh: TButton
      Left = 95
      Top = 4
      Width = 78
      Height = 25
      Caption = 'Refresh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object cbClosed: TCheckBox
      Left = 179
      Top = 9
      Width = 61
      Height = 17
      AllowGrayed = True
      Caption = 'Closed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cboAssigned: TComboBox
      Left = 283
      Top = 32
      Width = 63
      Height = 24
      CharCase = ecUpperCase
      DropDownCount = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 16
      OnChange = cboAssignedChange
      Items.Strings = (
        'SFSD'
        'DFG')
    end
    object cboCallType: TComboBox
      Left = 713
      Top = 32
      Width = 87
      Height = 24
      CharCase = ecUpperCase
      DropDownCount = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 19
      OnChange = cboCallTypeChange
      Items.Strings = (
        'SFSD'
        'DFG')
    end
    object cboClient: TComboBox
      Left = 54
      Top = 32
      Width = 65
      Height = 24
      CharCase = ecUpperCase
      DropDownCount = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 14
      OnChange = cboClientChange
    end
    object cboPriority: TComboBox
      Left = 171
      Top = 32
      Width = 49
      Height = 24
      CharCase = ecUpperCase
      DropDownCount = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 15
      OnChange = cboPriorityChange
      Items.Strings = (
        'A'
        'B'
        'C')
    end
    object dtpTo: TDateTimePicker
      Left = 414
      Top = 7
      Width = 75
      Height = 21
      Date = 42481.881201828710000000
      Time = 42481.881201828710000000
      TabOrder = 5
    end
    object edtCall: TLabeledEdit
      Left = 27
      Top = 5
      Width = 62
      Height = 24
      EditLabel.Width = 21
      EditLabel.Height = 16
      EditLabel.Caption = 'Call'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edtCallKeyPress
    end
    object dtpFrom: TDateTimePicker
      Left = 318
      Top = 7
      Width = 82
      Height = 21
      Date = 42481.881201828710000000
      Time = 42481.881201828710000000
      TabOrder = 4
    end
    object cboStatus: TComboBox
      Left = 394
      Top = 32
      Width = 114
      Height = 24
      CharCase = ecUpperCase
      DropDownCount = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 17
      OnChange = cboStatusChange
    end
    object dbgCalls: TSMDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 61
      Width = 1209
      Height = 654
      Margins.Top = 60
      Margins.Bottom = 20
      Align = alClient
      DataSource = dsCalls
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 20
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColumnMoved = dbgCallsColumnMoved
      OnDrawColumnCell = dbgCallsDrawColumnCell
      OnMouseEnter = dbgCallsMouseEnter
      OnTitleClick = dbgCallsTitleClick
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
      ExOptions = [eoBooleanAsCheckBox, eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoShowRecNo, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply, eoTitleLines]
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      OnFilterChanged = dbgCallsFilterChanged
      DefaultRowHeight = 20
      ScrollBars = ssHorizontal
      Columns = <
        item
          Expanded = False
          FieldName = 'call_code'
          Title.Caption = 'Call'
          Width = 53
          Visible = True
          FooterValue = 0
          FooterType = ftCount
        end
        item
          Expanded = False
          FieldName = 'customer_code'
          Title.Caption = 'Client'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Title.Caption = 'Description'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'priority'
          Title.Caption = 'Priority'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'recorded_date_time'
          Title.Caption = 'Date'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'payroll_id'
          Title.Caption = 'Assigned'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'last_callactiontype_code'
          Title.Caption = 'Status'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_time'
          Title.Caption = 'Time'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'last_action'
          Title.Caption = 'Last Action'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'system_ref'
          Title.Caption = 'System'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'release_mnemonic'
          Title.Caption = 'Version'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calltype_code'
          Title.Caption = 'Call Type'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'resolved_in_call_code'
          Title.Caption = 'Resolved In Call'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'task_number'
          Title.Caption = 'Task'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'contact'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Contact'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Title.Caption = 'Email'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'phone_number'
          Title.Caption = 'Phone'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'account_manager'
          Title.Caption = 'Account Manager'
          Width = 100
          Visible = True
        end>
    end
    object btnFTP: TButton
      Left = 713
      Top = 5
      Width = 42
      Height = 25
      Hint = 'Open the clients FTP folder'
      Caption = 'FTP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnFTPClick
    end
    object pnlProgress: TPanel
      AlignWithMargins = True
      Left = 445
      Top = 341
      Width = 215
      Height = 54
      Margins.Left = 500
      Margins.Top = 340
      Margins.Right = 500
      Margins.Bottom = 340
      TabOrder = 21
      Visible = False
      DesignSize = (
        215
        54)
      object lblProgress: TLabel
        Left = 48
        Top = 4
        Width = 109
        Height = 19
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Loading Calls...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbProgress: TProgressBar
        Left = 1
        Top = 36
        Width = 213
        Height = 17
        Align = alBottom
        Smooth = True
        TabOrder = 0
        Visible = False
      end
    end
    object btnTimesheets: TButton
      Left = 761
      Top = 5
      Width = 79
      Height = 25
      Hint = 'View the timesheets for this call'
      Caption = 'Timesheets'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnTimesheetsClick
    end
    object btnStats: TButton
      Left = 1143
      Top = 4
      Width = 60
      Height = 25
      Hint = 'View Call Statistics'
      Caption = 'Statistics'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = btnStatsClick
    end
    object cbTSTOnly: TCheckBox
      Left = 242
      Top = 9
      Width = 70
      Height = 17
      AllowGrayed = True
      Caption = 'TST Only'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbGrayed
      TabOrder = 3
    end
    object cbEmailDesc: TCheckBox
      Left = 903
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Email Description'
      TabOrder = 12
      OnClick = cbEmailDescClick
    end
    object btnExcel: TButton
      Left = 846
      Top = 5
      Width = 51
      Height = 25
      Hint = 'Export to Excel'
      Caption = 'Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = btnExcelClick
    end
    object cboSystem: TComboBox
      Left = 562
      Top = 32
      Width = 87
      Height = 24
      CharCase = ecUpperCase
      DropDownCount = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 18
      OnChange = cboSystemChange
      Items.Strings = (
        'BC'
        'CORPORATE'
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
        'RMSMX'
        'SC'
        'SCHEMA'
        'SMS'
        'SMSMX'
        'SMSSS'
        'SYNC'
        'TRANSLATOR'
        'WEBSHOP')
    end
  end
  object mtbCalls: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    ReadOnly = True
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
    Left = 136
    Top = 200
    object mtbCallscall_code: TStringField
      FieldName = 'call_code'
      Size = 12
    end
    object mtbCallscustomer_code: TStringField
      FieldName = 'customer_code'
      Size = 12
    end
    object mtbCallsdescription: TStringField
      FieldName = 'description'
      Size = 80
    end
    object mtbCallscalltype_code: TStringField
      FieldName = 'calltype_code'
      Size = 12
    end
    object mtbCallspriority: TIntegerField
      FieldName = 'priority'
    end
    object mtbCallsrecorded_date_time: TDateTimeField
      FieldName = 'recorded_date_time'
    end
    object mtbCallssystem_ref: TStringField
      FieldName = 'system_ref'
      Size = 12
    end
    object mtbCallslast_callactiontype_code: TStringField
      FieldName = 'last_callactiontype_code'
      Size = 12
    end
    object mtbCallspayroll_id: TStringField
      FieldName = 'payroll_id'
      Size = 12
    end
    object mtbCallscall_details: TStringField
      FieldName = 'call_details'
      Size = 5000
    end
    object mtbCallscall_resolution: TStringField
      FieldName = 'call_resolution'
      Size = 5000
    end
    object mtbCallsfeedback_value: TStringField
      FieldName = 'feedback_value'
    end
    object mtbCallstotal_time: TFloatField
      FieldName = 'total_time'
    end
    object mtbCallslast_action: TDateTimeField
      FieldName = 'last_action'
    end
    object mtbCallsrelease_mnemonic: TStringField
      FieldName = 'release_mnemonic'
      Size = 24
    end
    object mtbCallscontact: TStringField
      FieldName = 'contact'
      Size = 140
    end
    object mtbCallsresolved_in_call_code: TStringField
      FieldName = 'resolved_in_call_code'
      Size = 12
    end
    object mtbCallsemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object mtbCallsfirstname: TStringField
      FieldName = 'firstname'
    end
    object mtbCallstask_number: TStringField
      FieldName = 'task_number'
    end
    object mtbCallscustomer_call_ref: TStringField
      FieldName = 'customer_call_ref'
      Size = 32
    end
    object mtbCallsaccount_manager: TStringField
      FieldName = 'account_manager'
      Size = 64
    end
    object mtbCallsphone_number: TStringField
      FieldName = 'phone_number'
      Size = 64
    end
  end
  object dsCalls: TDataSource
    AutoEdit = False
    Left = 176
    Top = 200
  end
  object dsCallAction: TDataSource
    DataSet = mtbCallAction
    Left = 672
    Top = 208
  end
  object mtbCallAction: TkbmMemTable
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
    Left = 624
    Top = 208
    object mtbCallActionaction_datetime: TDateTimeField
      FieldName = 'action_datetime'
    end
    object mtbCallActioncallactiontype_code: TStringField
      FieldName = 'callactiontype_code'
      Size = 12
    end
    object mtbCallActionaction_details: TStringField
      FieldName = 'action_details'
      Size = 5000
    end
    object mtbCallActionacted_by: TStringField
      FieldName = 'acted_by'
      Size = 12
    end
    object mtbCallActionrefer_to: TStringField
      FieldName = 'refer_to'
      Size = 12
    end
    object mtbCallActiondescription: TStringField
      FieldName = 'description'
      Size = 50
    end
  end
  object poColumns: TPopupMenu
    Left = 224
    Top = 104
    object miSortAscending: TMenuItem
      Caption = 'Sort Ascending'
      OnClick = miSortAscendingClick
    end
    object miSortDescending: TMenuItem
      Caption = 'Sort Descending'
      OnClick = miSortDescendingClick
    end
  end
end
