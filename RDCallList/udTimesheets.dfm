object dTimesheets: TdTimesheets
  Left = 0
  Top = 0
  Caption = 'Timesheets'
  ClientHeight = 474
  ClientWidth = 1202
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
  PixelsPerInch = 96
  TextHeight = 13
  object dbgTimesheets: TSMDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1196
    Height = 468
    Align = alClient
    DataSource = dsTS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
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
    ExOptions = [eoBooleanAsCheckBox, eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoShowRecNo, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply, eoTitleLines]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    OnFilterChanged = dbgTimesheetsFilterChanged
    DefaultRowHeight = 23
    ScrollBars = ssHorizontal
    Columns = <
      item
        Expanded = False
        FieldName = 'payroll_id'
        Title.Caption = 'PayrollID'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'known_as'
        Title.Caption = 'Name'
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'start_str'
        Title.Caption = 'Start Time'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'end_str'
        Title.Caption = 'End Time'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'day_datetime'
        Title.Caption = 'Date'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hours'
        Title.Caption = 'Hours'
        Width = 49
        Visible = True
        FooterValue = 0c
        FooterType = ftSum
      end
      item
        Expanded = False
        FieldName = 'chargeable_ind'
        Title.Caption = 'T&M'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'charge_percentage'
        Title.Caption = 'Perc'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'comment_employee'
        Title.Caption = 'Comment'
        Visible = True
      end>
  end
  object dsTS: TDataSource
    DataSet = mtbTS
    Left = 168
    Top = 208
  end
  object mtbTS: TkbmMemTable
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
    Left = 208
    Top = 208
    object mtbTSpayroll_id: TStringField
      FieldName = 'payroll_id'
      Size = 12
    end
    object mtbTSday_datetime: TDateTimeField
      FieldName = 'day_datetime'
      OnGetText = mtbTSday_datetimeGetText
    end
    object mtbTSstart_interval: TIntegerField
      FieldName = 'start_interval'
    end
    object mtbTSend_interval: TIntegerField
      FieldName = 'end_interval'
    end
    object mtbTSfirst_name: TStringField
      FieldName = 'first_name'
      Size = 24
    end
    object mtbTSlast_name: TStringField
      FieldName = 'last_name'
      Size = 24
    end
    object mtbTSknown_as: TStringField
      FieldName = 'known_as'
      Size = 49
    end
    object mtbTSstart_str: TStringField
      FieldName = 'start_str'
      Size = 12
    end
    object mtbTSend_str: TStringField
      FieldName = 'end_str'
      Size = 12
    end
    object mtbTShours: TFloatField
      FieldName = 'hours'
    end
    object mtbTSchargeable_ind: TStringField
      FieldName = 'chargeable_ind'
      Size = 1
    end
    object mtbTScharge_percentage: TFloatField
      FieldName = 'charge_percentage'
    end
    object mtbTScomment_employee: TStringField
      FieldName = 'comment_employee'
      Size = 256
    end
  end
end
