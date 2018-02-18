object dSMSLinks: TdSMSLinks
  Left = 0
  Top = 0
  Caption = 'SMS Links'
  ClientHeight = 569
  ClientWidth = 1241
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pgEnquiry: TPageControl
    Left = 0
    Top = 0
    Width = 1241
    Height = 569
    ActivePage = tsItem
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = pgChange
    object tsSale: TTabSheet
      Caption = 'Sale'
      object SpeedButton4: TSpeedButton
        Left = 244
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSaleSearch: TSpeedButton
        Left = 785
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSaleSearchClick
      end
      object btnInfo: TSpeedButton
        Left = 1151
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object pgSale: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsSaleSale
        Align = alBottom
        TabOrder = 0
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsSaleSale: TTabSheet
          Caption = 'Sale'
          object dbgSale: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleLine: TTabSheet
          Caption = 'SaleLine'
          ImageIndex = 1
          object dbgSaleLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsTenderLine: TTabSheet
          Caption = 'TenderLine'
          ImageIndex = 4
          object dbgTenderLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreICSTran3: TTabSheet
          Caption = 'StoreICSTran'
          ImageIndex = 16
          object dbgStoreICSTran3: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleBenefit: TTabSheet
          Caption = 'SaleBenefit'
          ImageIndex = 2
          object dbgSaleBenefit: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleBenefitLine: TTabSheet
          Caption = 'SaleLineBenefit'
          ImageIndex = 3
          object dbgSaleLineBenefit: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'SaleLineReturn'
          ImageIndex = 5
          object dbgSaleLineReturn: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleDelivery: TTabSheet
          Caption = 'SaleDelivery'
          ImageIndex = 6
          object dbgSaleDelivery: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsTransCustomer: TTabSheet
          Caption = 'TransCustomer'
          ImageIndex = 7
          object dbgTransCustomer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleGiftVoucher: TTabSheet
          Caption = 'SaleGiftVoucher'
          ImageIndex = 8
          object dbgSaleGiftVoucher: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsGiftCardTransaction: TTabSheet
          Caption = 'GiftCardTransaction'
          ImageIndex = 9
          object dbgGiftCardTransaction: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleSignature: TTabSheet
          Caption = 'SaleSignature'
          ImageIndex = 10
          object dbgSaleSignature: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleNote: TTabSheet
          Caption = 'SaleNote'
          ImageIndex = 11
          object dbgSaleNote: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleTaxCustomer: TTabSheet
          Caption = 'SaleTaxCustomer'
          ImageIndex = 12
          object dbgSaleTaxCustomer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleTaxExempt: TTabSheet
          Caption = 'SaleTaxExempt'
          ImageIndex = 13
          object dbgSaleTaxExempt: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsScript: TTabSheet
          Caption = 'Script'
          ImageIndex = 14
          object dbgScript: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCustomerPayment: TTabSheet
          Caption = 'CustomerPayment'
          ImageIndex = 15
          object dbgCustomerPayment: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSalelineReference: TTabSheet
          Caption = 'SalelineReference'
          ImageIndex = 17
          object dbgSalelineReference: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object edtSaleCode: TLabeledEdit
        Left = 440
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 58
        EditLabel.Height = 16
        EditLabel.Caption = 'Sale Code'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtSaleCodeKeyPress
      end
      object edtReceiptNbr: TLabeledEdit
        Left = 648
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 66
        EditLabel.Height = 16
        EditLabel.Caption = 'Receipt Nbr'
        LabelPosition = lpLeft
        TabOrder = 2
        OnKeyPress = edtSaleCodeKeyPress
      end
      object btnLastSale: TButton
        Left = 872
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Last Sale'
        TabOrder = 3
        OnClick = btnLastSaleClick
      end
      object dnSale: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 4
      end
      object btnRefreshAll: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 5
        OnClick = btnRefreshAllClick
      end
    end
    object tsItem: TTabSheet
      Caption = 'Item'
      ImageIndex = 1
      object SpeedButton3: TSpeedButton
        Left = 238
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnItemSearch: TSpeedButton
        Left = 983
        Top = 16
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnItemSearcClick
      end
      object SpeedButton6: TSpeedButton
        Left = 1151
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object pgItem: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsRetailChain2
        Align = alBottom
        TabOrder = 0
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsItemItem: TTabSheet
          Caption = 'Item'
          object dbgItem: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsItemColour: TTabSheet
          Caption = 'ItemColour'
          ImageIndex = 1
          object dbgItemColour: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsItemColourSize: TTabSheet
          Caption = 'ItemColourSize'
          ImageIndex = 2
          object dbgItemColourSize: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreICS: TTabSheet
          Caption = 'StoreICS'
          ImageIndex = 3
          object dbgStoreICS: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPrice: TTabSheet
          Caption = 'Price'
          ImageIndex = 4
          object dbgPrice: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSellCode: TTabSheet
          Caption = 'SellCode'
          ImageIndex = 5
          object dbgSellCode: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreICSTran: TTabSheet
          Caption = 'StoreICSTran'
          ImageIndex = 6
          object dbgStoreICSTran: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreIC: TTabSheet
          Caption = 'StoreIC'
          ImageIndex = 7
          object dbgStoreIC: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsItemColourSupplier: TTabSheet
          Caption = 'ItemColourSupplier'
          ImageIndex = 8
          object dbgItemColourSupplier: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsDivision: TTabSheet
          Caption = 'Division'
          ImageIndex = 9
          object dbgDivision: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCategory: TTabSheet
          Caption = 'Category'
          ImageIndex = 10
          object dbgCategory: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsDepartment: TTabSheet
          Caption = 'Department'
          ImageIndex = 11
          object dbgDepartment: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsColour: TTabSheet
          Caption = 'Colour'
          ImageIndex = 12
          object dbgColour: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSize: TTabSheet
          Caption = 'Size'
          ImageIndex = 13
          object dbgSize: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsItemColourImage: TTabSheet
          Caption = 'ItemColourImage'
          ImageIndex = 14
          object dbgItemColourImage: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsImage: TTabSheet
          Caption = 'Image'
          ImageIndex = 15
          object dbgImage: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsFixedItemColourSize: TTabSheet
          Caption = 'FixedItemColourSize'
          ImageIndex = 16
          object dbgFixedItemColourSize: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsitemretailchain: TTabSheet
          Caption = 'ItemRetailChain'
          ImageIndex = 17
          object dbgItemRetailChain: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRetailChain2: TTabSheet
          Caption = 'RetailChain'
          ImageIndex = 18
          object dbgRetailChain2: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object edtItemColourSize: TLabeledEdit
        Left = 472
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 102
        EditLabel.Height = 16
        EditLabel.Caption = 'ItemColourSize Id'
        LabelPosition = lpLeft
        TabOrder = 1
        OnChange = edtItemColourSizeChange
        OnKeyPress = edtItemColourSizeKeyPress
      end
      object btnItemLink: TButton
        Left = 1070
        Top = 16
        Width = 75
        Height = 34
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnItemLinkClick
      end
      object dnItem: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 3
      end
      object Button1: TButton
        Left = 1151
        Top = 34
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 4
        OnClick = btnRefreshAllClick
      end
      object edtItemColour: TLabeledEdit
        Left = 680
        Top = 16
        Width = 113
        Height = 24
        EditLabel.Width = 78
        EditLabel.Height = 16
        EditLabel.Caption = 'ItemColour Id'
        LabelPosition = lpLeft
        TabOrder = 5
        OnChange = edtItemColourChange
        OnKeyPress = edtItemColourSizeKeyPress
      end
      object edtItem: TLabeledEdit
        Left = 866
        Top = 16
        Width = 111
        Height = 24
        EditLabel.Width = 59
        EditLabel.Height = 16
        EditLabel.Caption = 'Item Code'
        LabelPosition = lpLeft
        TabOrder = 6
        OnChange = edtItemChange
        OnKeyPress = edtItemColourSizeKeyPress
      end
    end
    object tsGRN: TTabSheet
      Caption = 'Goods Received'
      ImageIndex = 2
      object SpeedButton2: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnGRNSearch: TSpeedButton
        Left = 551
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnGRNSearchClick
      end
      object SpeedButton7: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object pgGRN: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsStoreICSTran2
        Align = alBottom
        TabOrder = 0
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsGRNGRN: TTabSheet
          Caption = 'Grn'
          object dbgGrn: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsGrnLine: TTabSheet
          Caption = 'GrnLine'
          ImageIndex = 1
          object dbgGrnLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsGrnCarton: TTabSheet
          Caption = 'GrnCarton'
          ImageIndex = 2
          object dbgGrnCarton: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsGrnSize: TTabSheet
          Caption = 'GrnSize'
          ImageIndex = 3
          object dbgGrnSize: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsGrnComment: TTabSheet
          Caption = 'GrnComment'
          ImageIndex = 4
          object dbgGrnComment: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreICSTran2: TTabSheet
          Caption = 'StoreICSTran'
          ImageIndex = 5
          object dbgStoreICSTran2: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object edtGRNCode: TLabeledEdit
        Left = 424
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 53
        EditLabel.Height = 16
        EditLabel.Caption = 'Grn Code'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtGRNCodeKeyPress
      end
      object btnLastGRN: TButton
        Left = 638
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Last GRN'
        TabOrder = 2
        OnClick = btnLastGRNClick
      end
      object dnGrn: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 3
      end
      object Button2: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 4
        OnClick = btnRefreshAllClick
      end
    end
    object tsLocMove: TTabSheet
      Caption = 'Stock Transfer'
      ImageIndex = 3
      object SpeedButton1: TSpeedButton
        Left = 238
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchLocMove: TSpeedButton
        Left = 584
        Top = 13
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchLocMovClick
      end
      object SpeedButton8: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object edtLocMoveCode: TLabeledEdit
        Left = 456
        Top = 17
        Width = 121
        Height = 24
        EditLabel.Width = 82
        EditLabel.Height = 16
        EditLabel.Caption = 'LocMove Code'
        LabelPosition = lpLeft
        TabOrder = 0
        OnKeyPress = edtLocMoveCodeKeyPress
      end
      object pgLocMove: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsUnitloadcontentlog
        Align = alBottom
        TabOrder = 1
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsLocMoveLocMove: TTabSheet
          Caption = 'LocMove'
          object dbgLocMove: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLocMoveLine: TTabSheet
          Caption = 'LocMoveLine'
          ImageIndex = 1
          object dbgLocMoveLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLocMoveCarton: TTabSheet
          Caption = 'LocMoveCarton'
          ImageIndex = 2
          object dbgLocMoveCarton: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLocMoveSize: TTabSheet
          Caption = 'LocMoveSize'
          ImageIndex = 3
          object dbgLocMoveSize: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLocMoveComment: TTabSheet
          Caption = 'LocMoveComment'
          ImageIndex = 4
          object dbgLocMoveComment: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsUnitload: TTabSheet
          Caption = 'UnitLoad'
          ImageIndex = 5
          object dbgUnitload: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsUnitloadContent: TTabSheet
          Caption = 'UnitloadContent'
          ImageIndex = 6
          object dbgUnitloadcontent: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsUnitloadcontentlog: TTabSheet
          Caption = 'UnitloadContentLog'
          ImageIndex = 7
          object dbgUnitloadcontentlog: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object btnLastLocMove: TButton
        Left = 671
        Top = 17
        Width = 89
        Height = 25
        Caption = 'Last LocMove'
        TabOrder = 2
        OnClick = btnLastLocMoveClick
      end
      object btnLocMoveLinkFrom: TButton
        Left = 832
        Top = 13
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnLocMoveLinkFromClick
      end
      object dnLocMove: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 4
      end
      object Button3: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 5
        OnClick = btnRefreshAllClick
      end
    end
    object tsStockTake: TTabSheet
      Caption = 'Stocktake'
      ImageIndex = 4
      object btnRecordView: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchStockTake: TSpeedButton
        Left = 584
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchStockTakeClick
      end
      object SpeedButton9: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object edtStockTakeCode: TLabeledEdit
        Left = 457
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 88
        EditLabel.Height = 16
        EditLabel.Caption = 'Stocktake Code'
        LabelPosition = lpLeft
        TabOrder = 0
        OnKeyPress = edtStockTakeCodeKeyPress
      end
      object pgStockTake: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsStocktakeSku
        Align = alBottom
        TabOrder = 1
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsStockTakeStockTake: TTabSheet
          Caption = 'Stocktake'
          object dbgStockTake: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStockTakeCount: TTabSheet
          Caption = 'StocktakeCount'
          ImageIndex = 1
          object dbgStockTakeCount: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStockTakeCountLine: TTabSheet
          Caption = 'StocktakeCountLine'
          ImageIndex = 2
          object dbgStockTakeCountLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStocktakeInit: TTabSheet
          Caption = 'StocktakeInit'
          ImageIndex = 3
          object dbgStocktakeInit: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStocktakeAdjustment: TTabSheet
          Caption = 'StocktakeAdjustment'
          ImageIndex = 4
          object dbgStocktakeAdjustment: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStocktakeOmit: TTabSheet
          Caption = 'StocktakeOmit'
          ImageIndex = 5
          object dbgStocktakeOmit: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStocktakeLocation: TTabSheet
          Caption = 'StocktakeLocation'
          ImageIndex = 6
          object dbgStocktakeLocation: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStocktakeCategory: TTabSheet
          Caption = 'StocktakeCategory'
          ImageIndex = 7
          object dbgStocktakeCategory: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStocktakeError: TTabSheet
          Caption = 'StocktakeError'
          ImageIndex = 8
          object dbgStocktakeError: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStocktakeSku: TTabSheet
          Caption = 'StocktakeSku'
          ImageIndex = 9
          object dbgStocktakeSku: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object btnLastStockTake: TButton
        Left = 671
        Top = 16
        Width = 97
        Height = 25
        Caption = 'Last StockTake'
        TabOrder = 2
        OnClick = btnLastStockTakeClick
      end
      object dnStockTake: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 3
      end
      object Button4: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 4
        OnClick = btnRefreshAllClick
      end
    end
    object tsVirtualDrawer: TTabSheet
      Caption = 'Virtual Drawer'
      ImageIndex = 5
      object SpeedButton5: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchVirtualDrawer: TSpeedButton
        Left = 624
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchVirtualDrawerClick
      end
      object SpeedButton10: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object edtVirtualDrawerCode: TLabeledEdit
        Left = 497
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 116
        EditLabel.Height = 16
        EditLabel.Caption = 'Virtual Drawer Code'
        LabelPosition = lpLeft
        TabOrder = 0
        OnKeyPress = edtVirtualDrawerCodeKeyPress
      end
      object pgVirtualDrawer: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsStoreJournal
        Align = alBottom
        TabOrder = 1
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsVirtualDrawerVirtualDrawer: TTabSheet
          Caption = 'VirtualDrawer'
          object dbgVirtualDrawer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsVirtualDrawerTender: TTabSheet
          Caption = 'VirtualDrawerTender'
          ImageIndex = 1
          object dbgVirtualDrawerTender: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsVirtualDrawerTransfer: TTabSheet
          Caption = 'VirtualDrawerTransfer'
          ImageIndex = 2
          object dbgVirtualDrawerTransfer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsVdMovement: TTabSheet
          Caption = 'VdMovement'
          ImageIndex = 3
          object dbgVdMovement: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsvdrawerevent: TTabSheet
          Caption = 'VDrawerEvent'
          ImageIndex = 4
          object dbgVDrawerEvent: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreJournal: TTabSheet
          Caption = 'StoreJournal'
          ImageIndex = 8
          object dbgStoreJournal: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsVdrawerrecline: TTabSheet
          Caption = 'VDrawerRecLine'
          ImageIndex = 5
          object dbgVDrawerRecLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsVdrawerrecdenom: TTabSheet
          Caption = 'VDrawerRecDenom'
          ImageIndex = 6
          object dbgVDrawerRecDenom: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsVdrawerrecvoucher: TTabSheet
          Caption = 'VDrawerRecVoucher'
          ImageIndex = 7
          object dbgVDrawerRecVoucher: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object btnVirtualDrawerLinkFrom: TButton
        Left = 832
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnVirtualDrawerLinkFromClick
      end
      object dnVirtualDrawer: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 3
      end
      object Button5: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 4
        OnClick = btnRefreshAllClick
      end
    end
    object tsPromotion: TTabSheet
      Caption = 'Promotion'
      ImageIndex = 6
      object SpeedButton11: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchPromotion: TSpeedButton
        Left = 624
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchPromotionClick
      end
      object SpeedButton13: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object dnPromotion: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 0
      end
      object edtPromotionCode: TLabeledEdit
        Left = 497
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 91
        EditLabel.Height = 16
        EditLabel.Caption = 'Promotion Code'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtPromotionCodeKeyPress
      end
      object btnPromotionLinkFrom: TButton
        Left = 832
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnPromotionLinkFromClick
      end
      object pgPromotion: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsPromotionBeneficiary
        Align = alBottom
        TabOrder = 3
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsPromotionPromotion: TTabSheet
          Caption = 'Promotion'
          object dbgPromotion: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionTier: TTabSheet
          Caption = 'PromotionTier'
          ImageIndex = 2
          object dbgPromotionTier: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionItem: TTabSheet
          Caption = 'PromotionItem'
          ImageIndex = 1
          object dbgPromotionItem: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionItemGroup: TTabSheet
          Caption = 'PromotionItemGroup'
          ImageIndex = 3
          object dbgPromotionItemGroup: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionStore: TTabSheet
          Caption = 'PromotionStore'
          ImageIndex = 4
          object dbgPromotionStore: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionCustomer: TTabSheet
          Caption = 'PromotionCustomer'
          ImageIndex = 5
          object dbgPromotionCustomer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionCustomerType: TTabSheet
          Caption = 'PromotionCustomerType'
          ImageIndex = 6
          object dbgPromotionCustomerType: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionLoyaltyGroup: TTabSheet
          Caption = 'PromotionLoyaltyGroup'
          ImageIndex = 7
          object dbgPromotionLoyaltyGroup: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPromotionBeneficiary: TTabSheet
          Caption = 'PromotionBeneficiary'
          ImageIndex = 8
          object dbgPromotionBeneficiary: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object Button6: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 4
        OnClick = btnRefreshAllClick
      end
    end
    object tsStore: TTabSheet
      Caption = 'Store'
      ImageIndex = 7
      object SpeedButton12: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchStore: TSpeedButton
        Left = 624
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchStoreClick
      end
      object SpeedButton15: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object dnStore: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 0
      end
      object edtStoreCode: TLabeledEdit
        Left = 497
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 64
        EditLabel.Height = 16
        EditLabel.Caption = 'Store Code'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtStoreCodeKeyPress
      end
      object btnStoreLinkFrom: TButton
        Left = 832
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnStoreLinkFromClick
      end
      object pgStore: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsLaybyTermsLine
        Align = alBottom
        TabOrder = 3
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsStoreStore: TTabSheet
          Caption = 'Store'
          object dbgStore: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreNeighbour: TTabSheet
          Caption = 'StoreNeighbour'
          ImageIndex = 2
          object dbgStoreNeighbour: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLocation: TTabSheet
          Caption = 'Location'
          ImageIndex = 3
          object dbgLocation: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRetailChain: TTabSheet
          Caption = 'RetailChain'
          ImageIndex = 5
          object dbgRetailChain: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCompany: TTabSheet
          Caption = 'Company'
          ImageIndex = 6
          object dbgCompany: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCountry: TTabSheet
          Caption = 'Country'
          ImageIndex = 7
          object dbgCountry: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsTimeZone: TTabSheet
          Caption = 'TimeZone'
          ImageIndex = 8
          object dbgTimeZone: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRegister: TTabSheet
          Caption = 'Register'
          ImageIndex = 9
          object dbgRegister: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRemediPc: TTabSheet
          Caption = 'RemediPc'
          ImageIndex = 10
          object dbgRemediPc: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsDocketMessageLine: TTabSheet
          Caption = 'DocketMessageLine'
          ImageIndex = 11
          object dbgDocketMessageLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsDataCentre: TTabSheet
          Caption = 'DataCentre'
          ImageIndex = 4
          object dbgDataCentre: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsDataCentreStatus: TTabSheet
          Caption = 'DataCentreStatus'
          ImageIndex = 12
          object dbgDataCentreStatus: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsDataCentreLastTask: TTabSheet
          Caption = 'DataCentreLastTask'
          ImageIndex = 13
          object dbgDataCentreLastTask: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLocationRetailChain: TTabSheet
          Caption = 'LocationRetailChain'
          ImageIndex = 13
          object dbgLocationRetailChain: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRemediEvent: TTabSheet
          Caption = 'RemediEvent'
          ImageIndex = 14
          object dbgRemediEvent: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRemediPrinterType: TTabSheet
          Caption = 'RemediPrinterType'
          ImageIndex = 15
          object dbgRemediPrinterType: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCurrencyLocation: TTabSheet
          Caption = 'CurrencyLocation'
          ImageIndex = 16
          object dbgCurrencyLocation: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCurrency: TTabSheet
          Caption = 'Currency'
          ImageIndex = 18
          object dbgCurrency: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCurrencyRate: TTabSheet
          Caption = 'CurrencyRate'
          ImageIndex = 17
          object dbgCurrencyRate: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLaybyTerms: TTabSheet
          Caption = 'LaybyTerms'
          ImageIndex = 19
          object dbgLaybyTerms: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLaybyTermsLine: TTabSheet
          Caption = 'LaybyTermsLine'
          ImageIndex = 20
          object dbgLaybyTermsLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object Button7: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 4
        OnClick = btnRefreshAllClick
      end
    end
    object tsUser: TTabSheet
      Caption = 'User/Employee'
      ImageIndex = 8
      object SpeedButton14: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchUser: TSpeedButton
        Left = 847
        Top = 12
        Width = 81
        Height = 38
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchUserClick
      end
      object SpeedButton17: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object dnUser: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 0
      end
      object edtUserCode: TLabeledEdit
        Left = 705
        Top = 16
        Width = 128
        Height = 24
        EditLabel.Width = 102
        EditLabel.Height = 16
        EditLabel.Caption = 'RemediUser Code'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtEmployeeIDKeyPress
      end
      object btnUserLinkFrom: TButton
        Left = 944
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnUserLinkFromClick
      end
      object Button9: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 3
        OnClick = btnRefreshAllClick
      end
      object pgUser: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsRemediPwdHist
        Align = alBottom
        TabOrder = 4
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsRemediUser: TTabSheet
          Caption = 'RemediUser'
          object dbgRemediUser: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRemediUserKey: TTabSheet
          Caption = 'RemediUserKey'
          ImageIndex = 1
          object dbgRemediUserKey: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsEmployee: TTabSheet
          Caption = 'Employee'
          ImageIndex = 2
          object dbgEmployee: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsEmployeeStore: TTabSheet
          Caption = 'EmployeeStore'
          ImageIndex = 3
          object dbgEmployeeStore: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsEmployeeStoreDisc: TTabSheet
          Caption = 'EmployeeStoreDisc'
          ImageIndex = 4
          object dbgEmployeeStoreDisc: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tstimeattenddayhour: TTabSheet
          Caption = 'TimeAttendDayHour'
          ImageIndex = 5
          object dbgTimeAttendDayHour: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsTimeAttendTrans: TTabSheet
          Caption = 'TimeAttendTrans'
          ImageIndex = 6
          object dbgTimeAttendTrans: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsPrintRequest: TTabSheet
          Caption = 'PrintRequest'
          ImageIndex = 7
          object dbgPrintRequest: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsRemediPwdHist: TTabSheet
          Caption = 'RemediPwdHist'
          ImageIndex = 8
          object dbgRemediPwdHist: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object edtEmployeeID: TLabeledEdit
        Left = 465
        Top = 16
        Width = 128
        Height = 24
        EditLabel.Width = 70
        EditLabel.Height = 16
        EditLabel.Caption = 'Employee Id'
        LabelPosition = lpLeft
        TabOrder = 5
        OnKeyPress = edtEmployeeIDKeyPress
      end
    end
    object tsCustomer: TTabSheet
      Caption = 'Customer'
      ImageIndex = 9
      object SpeedButton16: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchCustomer: TSpeedButton
        Left = 624
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchCustomerClick
      end
      object SpeedButton19: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object dnCustomer: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 0
      end
      object edtCustomerId: TLabeledEdit
        Left = 497
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 70
        EditLabel.Height = 16
        EditLabel.Caption = 'Customer Id'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtCustomerIdKeyPress
      end
      object btnCustomerLinkFrom: TButton
        Left = 832
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnCustomerLinkFromClick
      end
      object Button10: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 3
        OnClick = btnRefreshAllClick
      end
      object pgCustomer: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsCustIdentification
        Align = alBottom
        TabOrder = 4
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsCustomerCustomer: TTabSheet
          Caption = 'Customer'
          object dbgCustomer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCustomerType: TTabSheet
          Caption = 'CustomerType'
          ImageIndex = 7
          object dbgCustomerType: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCustomerPoints: TTabSheet
          Caption = 'CustomerPoints'
          ImageIndex = 8
          object dbgCustomerPoints: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLoyaltyCustomer: TTabSheet
          Caption = 'LoyaltyCustomer'
          ImageIndex = 1
          object dbgLoyaltyCustomer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLoyaltyCustMember: TTabSheet
          Caption = 'LoyaltyCustMember'
          ImageIndex = 2
          object dbgLoyaltyCustMember: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLoyaltyCustTran: TTabSheet
          Caption = 'LoyaltyCustTran'
          ImageIndex = 3
          object dbgLoyaltyCustTran: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLoyaltyCustPeriod: TTabSheet
          Caption = 'LoyaltyCustPeriod'
          ImageIndex = 4
          object dbgLoyaltyCustPeriod: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLoyalty: TTabSheet
          Caption = 'Loyalty'
          ImageIndex = 5
          object dbgLoyalty: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLoyaltyProgram: TTabSheet
          Caption = 'LoyaltyProgram'
          ImageIndex = 6
          object dbgLoyaltyProgram: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCustIdentification: TTabSheet
          Caption = 'CustIdentification'
          ImageIndex = 9
          object dbgCustIdentification: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
    end
    object tsLayby: TTabSheet
      Caption = 'Layby'
      ImageIndex = 10
      object SpeedButton18: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchLayby: TSpeedButton
        Left = 624
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchLaybyClick
      end
      object SpeedButton21: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object dnLayby: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 0
      end
      object edtLaybyId: TLabeledEdit
        Left = 497
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 47
        EditLabel.Height = 16
        EditLabel.Caption = 'Layby Id'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtLaybyIdKeyPress
      end
      object btnLaybyLinkFrom: TButton
        Left = 832
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnLaybyLinkFromClick
      end
      object Button11: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 3
        OnClick = btnRefreshAllClick
      end
      object pgLayby: TPageControl
        Left = 0
        Top = 62
        Width = 1233
        Height = 476
        ActivePage = tsSaleLine2
        Align = alBottom
        TabOrder = 4
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsLaybyLayby: TTabSheet
          Caption = 'Layby'
          object dbgLayby: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLaybyLine: TTabSheet
          Caption = 'LaybyLine'
          ImageIndex = 1
          object dbgLaybyLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLaybyTrans: TTabSheet
          Caption = 'LaybyTrans'
          ImageIndex = 2
          object dbgLaybyTrans: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLaybyNote: TTabSheet
          Caption = 'LaybyNote'
          ImageIndex = 3
          object dbgLaybyNote: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsLaybyBalance: TTabSheet
          Caption = 'LaybyBalance'
          ImageIndex = 4
          object dbgLaybyBalance: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsCustomerPayment1: TTabSheet
          Caption = 'CustomerPayment'
          ImageIndex = 5
          object dbgCustomerPayment2: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsSaleLine2: TTabSheet
          Caption = 'SaleLine'
          ImageIndex = 6
          object dbgSaleline2: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 445
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
    end
    object tsBankDeposit: TTabSheet
      Caption = 'BankDeposit'
      ImageIndex = 11
      object SpeedButton22: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchBankDeposit: TSpeedButton
        Left = 624
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchBankDepositClick
      end
      object SpeedButton24: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object dnBankDeposit: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 0
      end
      object edtBankDepositCode: TLabeledEdit
        Left = 497
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 106
        EditLabel.Height = 16
        EditLabel.Caption = 'Bank Deposit Code'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtBankDepositCodeKeyPress
      end
      object btnBankDepositLinkFrom: TButton
        Left = 832
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnBankDepositLinkFromClick
      end
      object Button13: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 3
        OnClick = btnRefreshAllClick
      end
      object pgBankDeposit: TPageControl
        Left = 0
        Top = 56
        Width = 1233
        Height = 482
        ActivePage = tsBankAccountStore
        Align = alBottom
        TabOrder = 4
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsBankDepositBankDeposit: TTabSheet
          Caption = 'BankDeposit'
          object dbgBankDeposit: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsBankDepositCheque: TTabSheet
          Caption = 'BankDepositCheque'
          ImageIndex = 1
          object dbgBankDepositCheque: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsBankDepositVoucher: TTabSheet
          Caption = 'BankDepositVoucher'
          ImageIndex = 2
          object dbgBankDepositVoucher: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsBankDepositTransfer: TTabSheet
          Caption = 'BankDepositTransfer'
          ImageIndex = 3
          object dbgBankDepositTransfer: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsBankAccount: TTabSheet
          Caption = 'BankAccount'
          ImageIndex = 4
          object dbgBankAccount: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsBankAccountStore: TTabSheet
          Caption = 'BankAccountStore'
          ImageIndex = 5
          object dbgBankAccountStore: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
      object btnLastBankDeposit: TButton
        Left = 711
        Top = 16
        Width = 115
        Height = 25
        Caption = 'Last Bank Deposit'
        TabOrder = 5
        OnClick = btnLastBankDepositClick
      end
    end
    object tsAdjustment: TTabSheet
      Caption = 'Adjustment'
      ImageIndex = 12
      object btn1: TSpeedButton
        Left = 243
        Top = 16
        Width = 119
        Height = 25
        Caption = 'Record View'
        Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCB9B9B917171718181895
          9595C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6666663333330202021C1C1C1F1F1F0101012323234F4F4FCBCBCBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0202020000004949
          492121211F1F1F5050500000000000000D0D0DB0B0B0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1F1F1F0505052A2A2AE2E2E2FFFFFF161616151515EEEEEEFFFF
          FF606060030303080808ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262620202022E2E2E
          FFFFFFFFFFFFFFFFFF0E0E0E060606D7D7D7FFFFFFFFFFFF7878780000003737
          37EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD1D1D12A2A2A000000E6E6E6FFFFFFFFFFFFFFFFFF4A4A4A
          525252D9D9D9FFFFFFFFFFFFFFFFFF2D2D2D0000009D9D9DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B200
          0000636363FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6F2F2F2F8F8F8FFFFFFFFFFFF
          FFFFFFD2D2D20000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7070701111111B1B1B2929292828281818185A
          5A5AF2F2F2FFFFFFFFFFFFFFFFFF8484841414142626262B2B2B191919222222
          0F0F0F898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6161610404042121211B1B1B111111010101616161FFFFFFFFFFFFFFFFFFFF
          FFFF8B8B8B0505050E0E0E1616162121211B1B1B0000007E7E7EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E07575750000006060
          60CDCDCDBCBCBCC7C7C7F7F7F7FFFFFFFFFFFFFFFFFFD4D4D4B8B8B8C8C8C8AE
          AEAE0000004E4E4EB9B9B9DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBABABA1212121B1B1BFFFFFFFFFFFFFFFFFFFFFF
          FF8686869D9D9DE4E4E4FFFFFFFFFFFFFFFFFF838383000000909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9454545000000898989FFFFFFFFFFFFFFFFFF0A0A0A0E0E0ED3D3D3FFFF
          FFFFFFFFEEEEEE000000181818BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA0C0C0C030303
          9E9E9EFFFFFFFFFFFF1616160F0F0FE1E1E1FFFFFFEFEFEF0808081515156060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF828282090909000000484848DEDEDE1B1B1B
          181818CBCBCB8C8C8C000000141414474747FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8E8E8E2929290000000000001D1D1D202020000000000000151515
          626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D58C
          8C8C6363631B1B1B1C1C1C464646858585B9B9B9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D040404D5
          D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C595959E6E6E6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OnClick = btnRecordViewClick
      end
      object btnSearchAdjustment: TSpeedButton
        Left = 624
        Top = 12
        Width = 81
        Height = 34
        Caption = 'Search'
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DFDFDED3D3D2
          E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFECECECB6B6B68383876F70749A9998ECECECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED8E8D8E787A81A6A7A69D9C94
          8D8D8FC9C9C9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF9E9F9E37383C767B75E7CE7BC0A46777787FBCBDBDEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED4C4B4C3D4550BB8235F2B13EA87126
          494B4FB3B5B6E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF4F5F4D9D9D9E1E1E0FDFDFDFFFFFFFFFFFFC8C8
          C73A3D42766F6CCA6503C17322945921191E22929395E7E7E7FBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE5E4E5CFCFCE9D
          9E9FA7A8A7EAEAEAFFFFFFFFFFFFB6B6B440484DA68C7AC7793FAE5412744623
          000005696969DBDBDBFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFF1F0F09795927078807B828A5B5B5CCACACBFFFFFFFFFFFFC9C9
          C8353E44BAA28BF1BB8FCE996C3D332B0003072A2A29A6A6A6F2F2F2FEFEFEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB1B1B02227315E5944BB
          89422D1A0872757AEFEFEFEBECECFAF9F96A6B6D787775FFE0B75F5C5A1C2226
          2E2E2D0000005A5A5ADADADAFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFEFEFEE787979323940945F2FAA63231E1815161A1C9797977575759D9D
          9DEFEFEF858689575D62494B4E5D5D5C2B2B2B000000232323B0B0B0FCFCFCFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE9E9E9676A6C4A4B49CA916583
          5A3F1A1D23212120010100787878191919919191D3D3D2969697908F8F4A4A4A
          2626261C1C1C000000808080F2F2F2FEFEFEFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFE8E7E76165685D5650DDBB975D544B2A2F33343332000000AFAFAF4B4B
          4B6C6B6B706E6EC9C9C9C1C1C1BBBBBB848484191919010101A0A0A0FDFDFDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEBABBBB73716E6B6C6E45
          4A4D6E6F6E1A1A1A4B4B4BA9A9A94646464C4D4D5252529A9A9A828282ABABAB
          666666080808494949E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFBFBF9D5D6D6ADAEAFB6B5B59191913D3D3DC1C1C16060605251
          524546455F5E5F2929294C4C4C7E7E7E7777771A1A1A6F6F6FEEEEEEFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCE7E7E7D3D3D3C4C4C4666666181818333333474747363636949494DFDFDF
          DADADAB4B4B4E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BABABA5F5F
          5F6B6B6BC5C5C5E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = btnSearchAdjustmentClick
      end
      object btn6: TSpeedButton
        Left = 1155
        Top = 16
        Width = 53
        Height = 25
        Caption = 'Info'
        OnClick = btnInfoClick
      end
      object dnAdjustment: TDBNavigator
        Left = 3
        Top = 16
        Width = 234
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        TabOrder = 0
      end
      object edtAdjustmentCode: TLabeledEdit
        Left = 497
        Top = 16
        Width = 121
        Height = 24
        EditLabel.Width = 98
        EditLabel.Height = 16
        EditLabel.Caption = 'Adjustment Code'
        LabelPosition = lpLeft
        TabOrder = 1
        OnKeyPress = edtAdjustmentCodeKeyPress
      end
      object btnLastAdjustment: TButton
        Left = 711
        Top = 16
        Width = 115
        Height = 25
        Caption = 'Last Adjustment'
        TabOrder = 2
        OnClick = btnLastAdjustmentClick
      end
      object btnAdjustmentLinkFrom: TButton
        Left = 832
        Top = 12
        Width = 75
        Height = 38
        Hint = 'Obtain the code from a record in a different table'
        Caption = 'Link From..'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnAdjustmentLinkFromClick
      end
      object btn5: TButton
        Left = 1074
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh All'
        TabOrder = 4
        OnClick = btnRefreshAllClick
      end
      object pgAdjustment: TPageControl
        Left = 0
        Top = 56
        Width = 1233
        Height = 482
        ActivePage = tsStoreICSTran4
        Align = alBottom
        TabOrder = 5
        OnChange = pgChange
        OnDrawTab = pgTableDrawTab
        object tsAdjustmentAdjustment: TTabSheet
          Caption = 'Adjustment'
          object dbgAdjustment: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsAdjustmentLine: TTabSheet
          Caption = 'AdjustmentLine'
          ImageIndex = 1
          object dbgAdjustmentLine: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsAdjustmentSize: TTabSheet
          Caption = 'AdjustmentSize'
          ImageIndex = 2
          object dbgAdjustmentSize: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
        object tsStoreICSTran4: TTabSheet
          Caption = 'StoreICSTran'
          ImageIndex = 3
          object dbgStoreICSTran4: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1225
            Height = 451
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnMouseWheelDown = dbgTableMouseWheelDown
            OnMouseWheelUp = dbgTableMouseWheelUp
            Flat = True
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'Tahoma'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clInactiveBorder
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoRowNumber, eoShowFooter, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar, eoAnyKeyFilter, eoFilterAutoApply]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 30
            DefaultRowHeight = 20
            ScrollBars = ssHorizontal
          end
        end
      end
    end
  end
  object pnlInfo: TPanel
    Left = 851
    Top = 152
    Width = 382
    Height = 286
    TabOrder = 1
    object mmoTableHint: TRichEdit
      Left = 4
      Top = 7
      Width = 375
      Height = 274
      Align = alCustom
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object edtColumnValue: TEdit
    Left = 168
    Top = 176
    Width = 97
    Height = 21
    TabOrder = 2
    Visible = False
    OnExit = edtColumnValueExit
    OnKeyPress = edtColumnValueKeyPress
  end
  object mtbRecord: TkbmMemTable
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
    Left = 112
    Top = 40
    object mtbRecordField: TStringField
      FieldName = 'Field'
      Size = 40
    end
    object mtbRecordValue: TStringField
      FieldName = 'Value'
      OnChange = mtbRecordValueChange
      Size = 200
    end
    object mtbRecordType: TStringField
      FieldName = 'Type'
    end
    object mtbRecordIsNull: TBooleanField
      FieldName = 'IsNull'
    end
    object mtbRecordHint: TStringField
      FieldName = 'Hint'
      Size = 300
    end
  end
  object poColumns: TPopupMenu
    Left = 272
    Top = 168
    object SortAscending: TMenuItem
      Caption = 'Sort Ascending'
      OnClick = SortAscendingClick
    end
    object SortDescending: TMenuItem
      Caption = 'Sort Descending'
      OnClick = SortDescendingClick
    end
    object SetValueTo: TMenuItem
      Caption = 'Set Value To..'
      OnClick = SetValueToClick
    end
    object Hint: TMenuItem
      Caption = 'Hint'
      OnClick = HintClick
    end
  end
  object poLinkFrom: TPopupMenu
    Left = 808
    Top = 72
  end
end
