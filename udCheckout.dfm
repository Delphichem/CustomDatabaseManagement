object dCheckout: TdCheckout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Task Checkout'
  ClientHeight = 153
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTaskName: TLabel
    Left = 151
    Top = 19
    Width = 59
    Height = 13
    Caption = 'lblTaskName'
  end
  object lblTask: TLabel
    Left = 8
    Top = 14
    Width = 33
    Height = 19
    Caption = 'Task'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnGo: TButton
    Left = 208
    Top = 111
    Width = 49
    Height = 33
    Caption = 'Go'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnGoClick
  end
  object edtTask: TComboBox
    Left = 47
    Top = 12
    Width = 98
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 1
    OnChange = edtTaskChange
  end
  object rgCheckout: TRadioGroup
    Left = 8
    Top = 44
    Width = 457
    Height = 61
    Caption = 'Checkout'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'From Trunk')
    ParentFont = False
    TabOrder = 2
  end
end
