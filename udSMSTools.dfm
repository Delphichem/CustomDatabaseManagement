object dSMSTools: TdSMSTools
  Left = 0
  Top = 0
  Caption = 'SMS Tools'
  ClientHeight = 506
  ClientWidth = 355
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnTerminateExe: TButton
    Left = 104
    Top = 458
    Width = 138
    Height = 33
    Hint = 'Rename to _terminate.exe'
    Caption = 'Rename Terminate.exe'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnTerminateExeClick
  end
  object gbRegistry: TGroupBox
    Left = 8
    Top = 8
    Width = 338
    Height = 184
    Caption = 'Registry'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object pnlRegistry: TPanel
      Left = 16
      Top = 17
      Width = 302
      Height = 49
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtRegister: TLabeledEdit
        Left = 160
        Top = 15
        Width = 25
        Height = 24
        EditLabel.Width = 47
        EditLabel.Height = 16
        EditLabel.Caption = 'Register'
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
        TabOrder = 1
        OnChange = edtRegisterChange
      end
      object edtStore: TLabeledEdit
        Left = 47
        Top = 15
        Width = 50
        Height = 24
        EditLabel.Width = 31
        EditLabel.Height = 16
        EditLabel.Caption = 'Store'
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
        OnChange = edtStoreChange
      end
      object btnRegistry: TButton
        Left = 199
        Top = 8
        Width = 98
        Height = 36
        Caption = 'Set Registry'
        TabOrder = 2
        OnClick = btnRegistryClick
      end
    end
    object cbDevelopment: TCheckBox
      Left = 50
      Top = 111
      Width = 239
      Height = 17
      Caption = 'NoBackground|NoColourChange|ClosePOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cbDevelopmentClick
    end
    object cbBypassLogin: TCheckBox
      Left = 176
      Top = 134
      Width = 97
      Height = 17
      Hint = 
        'When running SMS through Delphi in DEBUG mode, it will automatic' +
        'ally use user/pass = '#39'1'#39', if the user exists'
      Caption = 'Bypass Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = cbBypassLoginClick
    end
    object cbAllowReboot: TCheckBox
      Left = 50
      Top = 134
      Width = 80
      Height = 17
      Caption = 'Allow Reboot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = cbAllowRebootClick
    end
    object btnShell: TButton
      Left = 81
      Top = 72
      Width = 160
      Height = 33
      Caption = 'Set Registry Shell To Explorer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnShellClick
    end
    object cbwsDebug: TCheckBox
      Left = 50
      Top = 157
      Width = 80
      Height = 17
      Caption = 'WS Debug'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = cbwsDebugClick
    end
    object cbDCMViewChild: TCheckBox
      Left = 176
      Top = 157
      Width = 97
      Height = 17
      Caption = 'DCM View Child'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = cbDCMViewChildClick
    end
  end
  object gbDataBase: TGroupBox
    Left = 8
    Top = 198
    Width = 338
    Height = 254
    Caption = 'DataBase'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lblEFTType: TLabel
      Left = 125
      Top = 221
      Width = 45
      Height = 13
      Caption = 'EFT Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbUserCredentials: TCheckBox
      Left = 16
      Top = 201
      Width = 128
      Height = 17
      Caption = 'User Credential Checks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cbUserCredentialsClick
    end
    object cbMouse: TCheckBox
      Left = 16
      Top = 182
      Width = 105
      Height = 17
      Caption = 'Use Mouse Cursor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cbMouseClick
    end
    object btnDataCentre: TButton
      Left = 20
      Top = 16
      Width = 137
      Height = 37
      Hint = 
        'Set the register ip adress to '#39'127.0.0.1'#39' and all other ip adres' +
        'ses to '#39'1.1.1.1'#39
      Caption = 'Reset DataCentre Table'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnDataCentreClick
    end
    object pnlCreateUser: TPanel
      Left = 10
      Top = 59
      Width = 318
      Height = 61
      TabOrder = 3
      object edtPassword: TLabeledEdit
        Left = 184
        Top = 15
        Width = 50
        Height = 24
        EditLabel.Width = 55
        EditLabel.Height = 16
        EditLabel.Caption = 'Password'
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
        TabOrder = 1
      end
      object edtUserCode: TLabeledEdit
        Left = 65
        Top = 15
        Width = 50
        Height = 24
        EditLabel.Width = 55
        EditLabel.Height = 16
        EditLabel.Caption = 'UserCode'
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
        OnChange = edtUserCodeChange
      end
      object btnCreateUser: TButton
        Left = 240
        Top = 8
        Width = 73
        Height = 36
        Caption = 'Create User'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnCreateUserClick
      end
      object pbCreateUser: TProgressBar
        Left = 10
        Top = 48
        Width = 303
        Height = 10
        Smooth = True
        TabOrder = 3
        Visible = False
      end
    end
    object pnlReceipts: TPanel
      Left = 111
      Top = 126
      Width = 222
      Height = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object edtPrinterPort: TLabeledEdit
        Left = 33
        Top = 10
        Width = 65
        Height = 21
        EditLabel.Width = 23
        EditLabel.Height = 16
        EditLabel.Caption = 'Port'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 0
        Text = 'COM1'
        OnChange = edtPrinterPortChange
      end
      object btnRptsToFile: TButton
        Left = 104
        Top = 7
        Width = 114
        Height = 26
        Hint = 'After this, remember to set your default printer'
        Caption = 'Print Receipts To File'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnRptsToFileClick
      end
    end
    object rgScreenAlignment: TRadioGroup
      Left = 3
      Top = 126
      Width = 102
      Height = 50
      Caption = 'Screen Alignment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Touchscreen'
        'PC')
      ParentFont = False
      TabOrder = 5
      OnClick = rgScreenAlignmentClick
    end
    object cbEFTEnabled: TCheckBox
      Left = 16
      Top = 221
      Width = 90
      Height = 17
      Caption = 'EFT Enabled'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = cbEFTEnabledClick
    end
    object edtEFTType: TComboBox
      Left = 176
      Top = 221
      Width = 142
      Height = 21
      DropDownCount = 14
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 7
      OnChange = edtEFTTypeChange
      Items.Strings = (
        'M - Manual'
        'V - Verifone'#39's SoftPOS'
        'A - EPS ANZ'
        'C - EPS CBA'
        'N - EPS NAB'
        'F - EPS Standard'
        'Q - Quest'
        'I - Ingenico(UK)'
        'G - Ingenico(AUS/NZ)'
        'S - SyncroPlus'
        'Z - PCEFTPOS NZ'
        'T - Telekurs MPD'
        'Y - Tyro'
        'P - Verifone PCCharge'
        'R - PayZone SpectraCard'
        'X - FIS TransaxEFT'
        'E - Moneris EFT')
    end
    object btnRestoreDataCentre: TButton
      Left = 163
      Top = 16
      Width = 160
      Height = 37
      Hint = 'Downloads Datacentre table from RMS Dev database'
      Caption = 'Restore DataCentre From Dev'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnRestoreDataCentreClick
    end
    object btnNoPromotions: TButton
      Left = 176
      Top = 172
      Width = 137
      Height = 37
      Hint = 'Set active_ind = '#39'N'#39' on all promotions'
      Caption = 'Deactivate All Promotions'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnNoPromotionsClick
    end
  end
end
