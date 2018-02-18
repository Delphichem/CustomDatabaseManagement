object dShowTask: TdShowTask
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Show Task'
  ClientHeight = 707
  ClientWidth = 1213
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    1213
    707)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 42
    Width = 1207
    Height = 662
    Margins.Top = 42
    ActivePage = tsRequirements
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tsRequirements: TTabSheet
      Caption = 'Requirements'
      object mmoRequirements: TMemo
        Left = 0
        Top = 0
        Width = 1199
        Height = 631
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
        OnChange = mmoRequirementsChange
      end
    end
    object tsSolution: TTabSheet
      Caption = 'Solution'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1024
      ExplicitHeight = 542
      object mmoSolution: TMemo
        Left = 0
        Top = 0
        Width = 1199
        Height = 631
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
        OnChange = mmoSolutionChange
      end
    end
    object tsReleaseNotes: TTabSheet
      Caption = 'Release Notes'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1024
      ExplicitHeight = 542
      object mmoReleaseNotes: TMemo
        Left = 0
        Top = 0
        Width = 1199
        Height = 631
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
        OnChange = mmoReleaseNotesChange
      end
    end
  end
  object btnSave: TButton
    Left = 1130
    Top = 8
    Width = 75
    Height = 34
    Anchors = [akTop, akRight]
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object edtTaskDesc: TLabeledEdit
    Left = 112
    Top = 12
    Width = 505
    Height = 24
    EditLabel.Width = 63
    EditLabel.Height = 16
    EditLabel.Caption = 'Description'
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
    TabOrder = 2
    OnChange = edtTaskDescChange
  end
end
