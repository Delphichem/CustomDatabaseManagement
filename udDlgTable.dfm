object dDlgTable: TdDlgTable
  Left = 0
  Top = 0
  Caption = 'Create/Edit Table'
  ClientHeight = 390
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 9
    Top = 5
    Width = 388
    Height = 292
    Shape = bsFrame
  end
  object lbl1: TLabel
    Left = 24
    Top = 15
    Width = 60
    Height = 13
    Caption = 'Table Name:'
  end
  object lblCommentsLabel: TLabel
    Left = 24
    Top = 74
    Width = 54
    Height = 13
    Caption = 'Comments:'
  end
  object lblTableSize: TLabel
    Left = 24
    Top = 277
    Width = 55
    Height = 13
    Caption = 'lblTableSize'
  end
  object lblTableDate: TLabel
    Left = 24
    Top = 258
    Width = 93
    Height = 13
    Caption = 'Last Modification :  '
  end
  object lbl2: TLabel
    Left = 24
    Top = 212
    Width = 79
    Height = 13
    Caption = 'Schema Version:'
  end
  object lbl3: TLabel
    Left = 29
    Top = 42
    Width = 55
    Height = 13
    Caption = 'Table Alias:'
  end
  object btnOK1: TButton
    Left = 408
    Top = 10
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 0
  end
  object btnCancel1: TButton
    Left = 408
    Top = 42
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object edtTableName: TEdit
    Left = 90
    Top = 12
    Width = 295
    Height = 21
    TabOrder = 2
  end
  object mmoComments: TMemo
    Left = 24
    Top = 93
    Width = 361
    Height = 113
    Color = clWhite
    TabOrder = 3
  end
  object cbTempTable: TCheckBox
    Left = 310
    Top = 212
    Width = 75
    Height = 17
    Caption = 'Temp Table'
    Enabled = False
    TabOrder = 4
  end
  object cbbSchema: TComboBox
    Left = 24
    Top = 231
    Width = 133
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      'RMS Only'
      'RMS and SMS')
  end
  object edtTableAlias: TEdit
    Left = 90
    Top = 39
    Width = 295
    Height = 21
    TabOrder = 6
    OnExit = edtTableAliasExit
  end
  object btnOK: TButton
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
    ParentFont = False
    TabOrder = 7
    OnClick = btnOKClick
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
    TabOrder = 8
  end
end
