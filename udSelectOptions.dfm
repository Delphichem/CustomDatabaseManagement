object dSelectOptions: TdSelectOptions
  Left = 0
  Top = 0
  Caption = 'Select Options'
  ClientHeight = 109
  ClientWidth = 201
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
  PixelsPerInch = 96
  TextHeight = 13
  object edtTop: TLabeledEdit
    Left = 8
    Top = 24
    Width = 145
    Height = 26
    EditLabel.Width = 135
    EditLabel.Height = 19
    EditLabel.Caption = 'Select Top Records'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '1000'
  end
  object cbNoLock: TCheckBox
    Left = 56
    Top = 51
    Width = 81
    Height = 17
    Caption = 'No Lock'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 8
    Top = 74
    Width = 81
    Height = 30
    Caption = 'Open'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 110
    Top = 74
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
end
