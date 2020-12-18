object PackageForm: TPackageForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Package'
  ClientHeight = 471
  ClientWidth = 314
  Color = clWindow
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblValidationMsg: TLabel
    Left = 6
    Top = 422
    Width = 88
    Height = 13
    Caption = 'lblValidationMsg'
    ParentFont = False
    Visible = False
    Font.Color = clRed
    Font.Style = [fsBold]
  end
  object lblFilterListType: TLabel
    Left = 7
    Top = 218
    Width = 72
    Height = 13
    Caption = 'Filter List Type'
  end
  object grpVisibility: TGroupBox
    Left = 6
    Top = 107
    Width = 303
    Height = 50
    Caption = 'Visibility'
    TabOrder = 0
    object rbPrivate: TRadioButton
      Left = 30
      Top = 18
      Width = 113
      Height = 17
      Caption = 'Private Package'
      TabOrder = 0
    end
    object rbPublic: TRadioButton
      Left = 158
      Top = 18
      Width = 113
      Height = 17
      Caption = 'Public Package'
      TabOrder = 1
    end
  end
  object leName: TLabeledEdit
    Left = 82
    Top = 168
    Width = 222
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Name'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 153
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 234
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object grpGitHub: TGroupBox
    Left = 6
    Top = 0
    Width = 303
    Height = 107
    Caption = 'GitHub Repository'
    TabOrder = 4
    object btnGoToURL: TSpeedButton
      Left = 275
      Top = 19
      Width = 23
      Height = 22
      Hint = 'Go to URL'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B7B7B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00020202007777
        7700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00020202000000
        000077777700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007D7D7D007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A00000000000000
        00000000000077777700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00020202000000000000000000000000000000000000000000000000000000
        0000000000000000000077777700FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00020202000000000000000000000000000000000000000000000000000000
        000000000000000000000000000077777700FF00FF00FF00FF00FF00FF00FF00
        FF00020202000000000000000000000000000000000000000000000000000000
        00000000000000000000000000007E7E7E00FF00FF00FF00FF00FF00FF00FF00
        FF00020202000000000000000000000000000000000000000000000000000000
        000000000000000000007E7E7E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00848484008282820082828200828282008282820082828200010101000000
        0000000000007E7E7E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00020202000000
        00007E7E7E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00020202007E7E
        7E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0082828200FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGoToURLClick
    end
    object leURL: TLabeledEdit
      Left = 45
      Top = 20
      Width = 227
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'URL'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object leRepoOwner: TLabeledEdit
      Left = 45
      Top = 43
      Width = 227
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'Owner'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 1
    end
    object leRepoName: TLabeledEdit
      Left = 45
      Top = 66
      Width = 227
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Repo'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object aiRepoDataLoad: TActivityIndicator
      Left = 274
      Top = 42
      IndicatorSize = aisSmall
      IndicatorType = aitRotatingSector
    end
  end
  object leDescription: TLabeledEdit
    Left = 82
    Top = 191
    Width = 222
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Description'
    LabelPosition = lpLeft
    TabOrder = 5
  end
  object pcAdjustment: TPageControl
    Left = 6
    Top = 248
    Width = 303
    Height = 168
    ActivePage = tsFilterList
    TabOrder = 6
    object tsFilterList: TTabSheet
      Caption = 'Filter List'
      object btnNewFilterLine: TSpeedButton
        Left = 217
        Top = 3
        Width = 23
        Height = 22
        Hint = 'New filter line'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003636360039393900FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003636
          3600000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000039393900FF00FF00FF00FF003535
          3500000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000036363600FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003535350036363600FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnNewFilterLineClick
      end
      object btnDeleteFilterLine: TSpeedButton
        Left = 271
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Delete filter line'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF0043434300131313001212120012121200121212001212
          12001313130052525200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00C1C1C10000000000000000000000000000000000000000000000
          00000000000000000000D6D6D600FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00A1A1A10000000000000000000000000000000000000000000000
          00000000000000000000B7B7B700FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF008181810000000000000000000000000000000000000000000000
          0000000000000000000097979700FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF006262620000000000000000000000000000000000000000000000
          0000000000000000000078787800FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF004242420000000000000000000000000000000000000000000000
          0000000000000000000059595900FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF002222220000000000000000000000000000000000000000000000
          000000000000000000003A3A3A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000505050000000000000000000000000000000000000000000000
          000000000000000000001B1B1B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          0000000000000000000001010100FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00C4C4C4000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000DDDDDD00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF005656560052525200525252005252520052525200525252005252
          5200525252005252520057575700FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006A6A
          6A00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000006F6F6F00FF00FF00FF00FF005C5C
          5C00000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000060606000FF00FF00FF00FF00D9D9
          D9005C5C5C005252520052525200525252000000000000000000000000000000
          00005252520052525200525252005C5C5C00DBDBDB00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF005D5D5D0000000000000000005F5F
          5F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDeleteFilterLineClick
      end
      object btnEditFilterLine: TSpeedButton
        Left = 244
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Edit filter line'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003434
          3400151515004C4C4C008D8D8D00DDDDDD00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001212
          12000000000000000000000000000000000058585800FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004747
          470000000000000000000000000000000000000000004A4A4A00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008888
          88000000000000000000000000000000000000000000000000004A4A4A00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D6D6
          D600000000000000000000000000000000000000000000000000000000004A4A
          4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00505050000000000000000000000000000000000000000000000000000000
          00004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF004444440000000000000000000000000000000000000000000000
          0000000000004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0044444400000000000000000000000000000000000000
          00000000000012121200D8D8D800FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00444444000000000000000000000000000000
          000012121200CFCFCF00FF00FF00D8D8D800FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF004444440000000000000000001212
          1200CFCFCF00FF00FF00CFCFCF001212120070707000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004444440012121200CFCF
          CF00FF00FF00CFCFCF00121212000000000010101000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7D7D700FF00
          FF00CFCFCF001212120000000000000000000E0E0E00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7D7
          D700121212000000000000000000000000006C6C6C00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00676767000B0B0B000D0D0D006C6C6C00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEditFilterLineClick
      end
      object lbFilterList: TListBox
        Left = 0
        Top = 27
        Width = 295
        Height = 113
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbFilterListClick
      end
    end
    object tsPathMoves: TTabSheet
      Caption = 'Path Moves'
      ImageIndex = 1
    end
  end
  object cbFilterListType: TComboBox
    Left = 82
    Top = 214
    Width = 222
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 7
    OnChange = cbFilterListTypeChange
  end
end
