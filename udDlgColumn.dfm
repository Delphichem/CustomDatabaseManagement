object dDlgColumn: TdDlgColumn
  Left = 0
  Top = 0
  Caption = 'New/Edit Column'
  ClientHeight = 376
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 23
    Top = 23
    Width = 69
    Height = 13
    Caption = 'Column Name:'
  end
  object lblAliasName: TLabel
    Left = 23
    Top = 50
    Width = 56
    Height = 13
    Hint = 
      'Alias Columns are used when columns are redundant and reused for' +
      ' a different purpose'
    Caption = 'Alias Name:'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbl2: TLabel
    Left = 23
    Top = 77
    Width = 54
    Height = 13
    Caption = 'Data Type:'
  end
  object lbl3: TLabel
    Left = 23
    Top = 104
    Width = 69
    Height = 13
    Caption = 'Length (RMS):'
  end
  object lblSMSLength: TLabel
    Left = 183
    Top = 104
    Width = 32
    Height = 13
    Caption = '(SMS):'
  end
  object lbl4: TLabel
    Left = 305
    Top = 104
    Width = 46
    Height = 13
    Caption = 'Precision:'
  end
  object lbl5: TLabel
    Left = 23
    Top = 134
    Width = 57
    Height = 13
    Caption = 'Description:'
  end
  object btnOk: TButton
    Left = 89
    Top = 326
    Width = 97
    Height = 42
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 208
    Top = 326
    Width = 89
    Height = 42
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
  end
  object edtColumnName: TEdit
    Left = 99
    Top = 20
    Width = 289
    Height = 21
    HelpContext = 1
    TabOrder = 2
  end
  object edtAliasName: TEdit
    Left = 99
    Top = 47
    Width = 289
    Height = 21
    Hint = 
      'Alias Columns are used when columns are redundant and reused for' +
      ' a different purpose'
    HelpContext = 1
    TabStop = False
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object cDataType: TComboBox
    Left = 99
    Top = 74
    Width = 289
    Height = 21
    HelpContext = 1
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    OnChange = cDataTypeChange
  end
  object edtLength: TEdit
    Left = 99
    Top = 101
    Width = 51
    Height = 21
    HelpContext = 1
    TabOrder = 5
    OnChange = edtLengthChange
  end
  object edtSMSLength: TEdit
    Left = 219
    Top = 101
    Width = 51
    Height = 21
    HelpContext = 1
    Enabled = False
    ReadOnly = True
    TabOrder = 6
    OnChange = edtLengthChange
  end
  object edtDecimals: TEdit
    Left = 355
    Top = 101
    Width = 33
    Height = 21
    HelpContext = 1
    TabOrder = 7
    OnKeyPress = edtDecimalsKeyPress
  end
  object mmoComments: TMemo
    Left = 23
    Top = 147
    Width = 365
    Height = 117
    HelpContext = 1
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object grp1: TGroupBox
    Left = 23
    Top = 269
    Width = 366
    Height = 44
    Caption = ' Additional Options '
    TabOrder = 9
    object cbNullsAllowed: TCheckBox
      Left = 11
      Top = 17
      Width = 90
      Height = 17
      HelpContext = 1
      Caption = 'NULLs Allowed'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbIdentity: TCheckBox
      Left = 291
      Top = 17
      Width = 60
      Height = 17
      HelpContext = 1
      Caption = 'Identity'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbCalculated: TCheckBox
      Left = 160
      Top = 17
      Width = 71
      Height = 17
      Hint = 'Calculated Fields'
      HelpContext = 1
      Caption = 'Calculated'
      TabOrder = 2
    end
  end
end
