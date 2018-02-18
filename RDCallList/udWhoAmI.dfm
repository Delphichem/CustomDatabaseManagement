object dWhoAmI: TdWhoAmI
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Who Are You?'
  ClientHeight = 71
  ClientWidth = 151
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnRemember: TButton
    Left = 16
    Top = 41
    Width = 121
    Height = 25
    Caption = 'Remember Me'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = btnRememberClick
  end
  object cboPayrollID: TComboBox
    Left = 48
    Top = 8
    Width = 57
    Height = 27
    CharCase = ecUpperCase
    DropDownCount = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 0
  end
end
