object dDlgIndex: TdDlgIndex
  Left = 0
  Top = 0
  Caption = 'Create/Edit Index'
  ClientHeight = 384
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 8
    Top = 10
    Width = 575
    Height = 319
    Shape = bsFrame
  end
  object lbl1: TLabel
    Left = 21
    Top = 23
    Width = 62
    Height = 13
    Caption = 'Index Name:'
  end
  object lblColumnsInIndex: TLabel
    Left = 410
    Top = 51
    Width = 86
    Height = 13
    Caption = 'Columns in Index:'
  end
  object lblAvailableColumns: TLabel
    Left = 224
    Top = 51
    Width = 90
    Height = 13
    Caption = 'Available Columns:'
  end
  object btnAdd: TSpeedButton
    Left = 382
    Top = 78
    Width = 23
    Height = 22
    Hint = 'Add selected field to index list'
    Flat = True
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777700777770007777770607777000770000066077
      7000770666666607700077066666666070007706666666077000770000066077
      7000777777060777700077777700777770007777770777777000777777777777
      7000}
  end
  object btnRemove: TSpeedButton
    Left = 382
    Top = 112
    Width = 23
    Height = 22
    Hint = 'Remove selected Column from Index'
    Flat = True
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777007777770007777060777777000777066000007
      7000770666666607700070666666660770007706666666077000777066000007
      7000777706077777700077777007777770007777770777777000777777777777
      7000}
  end
  object btnClear: TSpeedButton
    Left = 382
    Top = 154
    Width = 23
    Height = 22
    Hint = 'Clear Index Field List'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      04000000000068000000C40E0000C40E00001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777770770777700077770070077770007770600607777000770660660000
      0000706606666666000006606666666600007066066666660000770660660000
      0000777060060777700077770070077770007777707707777000777777777777
      7000}
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 20
    Top = 51
    Width = 88
    Height = 13
    Caption = 'Included Columns:'
  end
  object btnRemoveInclude: TSpeedButton
    Left = 186
    Top = 112
    Width = 23
    Height = 22
    Hint = 'Add selected field to index list'
    Flat = True
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777700777770007777770607777000770000066077
      7000770666666607700077066666666070007706666666077000770000066077
      7000777777060777700077777700777770007777770777777000777777777777
      7000}
  end
  object btnAddInclude: TSpeedButton
    Left = 186
    Top = 78
    Width = 23
    Height = 22
    Hint = 'Remove selected Column from Index'
    Flat = True
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777007777770007777060777777000777066000007
      7000770666666607700070666666660770007706666666077000777066000007
      7000777706077777700077777007777770007777770777777000777777777777
      7000}
  end
  object btnClearInclude: TSpeedButton
    Left = 186
    Top = 154
    Width = 23
    Height = 22
    Hint = 'Clear Index Field List'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      3E020000424D3E0200000000000036000000280000000D0000000D0000000100
      18000000000008020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF00
      0000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
      00B1B317000000000000B1B317000000FFFFFFFFFFFFFFFFFF00000000000000
      000000000000000000B1B317B1B317000000B1B317B1B317000000FFFFFFFFFF
      FF00000000B1B317B1B317B1B317B1B317B1B317B1B317B1B317000000B1B317
      B1B317000000FFFFFF00000000B1B317B1B317B1B317B1B317B1B317B1B317B1
      B317B1B317000000B1B317B1B31700000000000000B1B317B1B317B1B317B1B3
      17B1B317B1B317B1B317000000B1B317B1B317000000FFFFFF00000000000000
      000000000000000000B1B317B1B317000000B1B317B1B317000000FFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFF000000B1B317000000000000B1B317000000
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF00
      0000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00}
    ParentFont = False
  end
  object lblIncludeText: TLabel
    Left = 21
    Top = 245
    Width = 173
    Height = 52
    Caption = 
      'For SQL Server 2005 and above.  Allows the inclusion of data int' +
      'o the index leaf level. Must not be a key field (specified in ri' +
      'ght listbox)'
    WordWrap = True
  end
  object lblIncludeTitle: TLabel
    Left = 21
    Top = 230
    Width = 42
    Height = 13
    Caption = 'Include'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK1: TButton
    Left = 589
    Top = 10
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 0
  end
  object btnCancel1: TButton
    Left = 589
    Top = 42
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object btnAddAnother: TButton
    Left = 589
    Top = 115
    Width = 75
    Height = 25
    Caption = '&Add Another'
    Default = True
    TabOrder = 2
    OnClick = btnAddAnotherClick
  end
  object edtIndexName: TEdit
    Left = 88
    Top = 20
    Width = 481
    Height = 21
    TabOrder = 3
  end
  object cIndexColumns: TListBox
    Left = 410
    Top = 64
    Width = 160
    Height = 160
    TabStop = False
    Color = clWhite
    IntegralHeight = True
    ItemHeight = 13
    TabOrder = 4
  end
  object grpIndexOptions: TGroupBox
    Left = 216
    Top = 230
    Width = 161
    Height = 83
    Caption = ' Index Options '
    TabOrder = 5
    object cbUnique: TCheckBox
      Left = 10
      Top = 16
      Width = 53
      Height = 17
      Caption = 'Unique'
      TabOrder = 0
    end
    object chkDescending: TCheckBox
      Left = 10
      Top = 60
      Width = 77
      Height = 17
      Caption = 'Descending'
      TabOrder = 1
      OnClick = cbDescendingClick
    end
    object cbClustered: TCheckBox
      Left = 10
      Top = 38
      Width = 64
      Height = 17
      Caption = 'Clustered'
      TabOrder = 2
      OnClick = cbClusteredClick
    end
  end
  object cAllColumns: TListBox
    Left = 216
    Top = 64
    Width = 160
    Height = 160
    Color = clWhite
    IntegralHeight = True
    ItemHeight = 13
    PopupMenu = pm1
    TabOrder = 6
  end
  object cIncludeColumns: TListBox
    Left = 20
    Top = 64
    Width = 160
    Height = 160
    Color = clWhite
    IntegralHeight = True
    ItemHeight = 13
    PopupMenu = pm1
    TabOrder = 7
  end
  object rgIndexScope: TRadioGroup
    Left = 410
    Top = 230
    Width = 161
    Height = 83
    Caption = 'Index Scope'
    Items.Strings = (
      'All'
      'RMS Only'
      'SMS Only')
    TabOrder = 8
  end
  object btnOK: TButton
    Left = 185
    Top = 335
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
    TabOrder = 9
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 304
    Top = 335
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
    TabOrder = 10
    OnClick = btnCancelClick
  end
  object pm1: TPopupMenu
    Left = 308
    Top = 119
    object SortbyColumnName1: TMenuItem
      Caption = 'Sort by Column Name'
    end
  end
end
