object PackageForm: TPackageForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Package'
  ClientHeight = 475
  ClientWidth = 329
  Color = clWindow
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Font.Name = 'Tahoma'
  Font.Charset = DEFAULT_CHARSET
  PixelsPerInch = 96
  TextHeight = 13
  object lblValidationMsg: TLabel
    Left = 6
    Top = 428
    Width = 92
    Height = 13
    Caption = 'lblValidationMsg'
    ParentFont = False
    Visible = False
    Font.Name = 'Tahoma'
    Font.Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Style = [fsBold]
  end
  object lblFilterListType: TLabel
    Left = 16
    Top = 228
    Width = 70
    Height = 13
    Caption = 'Filter List Type'
  end
  object lblPackageType: TLabel
    Left = 19
    Top = 159
    Width = 67
    Height = 13
    Caption = 'Package Type'
  end
  object grpVisibility: TGroupBox
    Left = 6
    Top = 98
    Width = 315
    Height = 50
    Caption = 'Visibility'
    TabOrder = 1
    object rbPrivate: TRadioButton
      Left = 42
      Top = 18
      Width = 113
      Height = 17
      Caption = 'Private Package'
      TabOrder = 0
    end
    object rbPublic: TRadioButton
      Left = 170
      Top = 18
      Width = 113
      Height = 17
      Caption = 'Public Package'
      TabOrder = 1
    end
  end
  object leName: TLabeledEdit
    Left = 90
    Top = 178
    Width = 222
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Name'
    LabelPosition = lpLeft
    TabOrder = 3
  end
  object btnApply: TButton
    Left = 168
    Top = 445
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 7
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 249
    Top = 445
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object grpGitHub: TGroupBox
    Left = 6
    Top = 0
    Width = 315
    Height = 101
    Caption = 'GitHub Repository'
    TabOrder = 0
    object btnGoToURL: TSpeedButton
      Left = 286
      Top = 19
      Width = 23
      Height = 22
      Action = actGoToURL
      Flat = True
      ParentShowHint = False
      ShowHint = True
    end
    object leURL: TLabeledEdit
      Left = 45
      Top = 20
      Width = 236
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'URL'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object leRepoOwner: TLabeledEdit
      Left = 45
      Top = 43
      Width = 236
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'Owner'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object leRepoName: TLabeledEdit
      Left = 45
      Top = 66
      Width = 236
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 25
      EditLabel.Height = 13
      EditLabel.Caption = 'Repo'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 3
    end
    object aiRepoDataLoad: TActivityIndicator
      Left = 285
      Top = 42
      IndicatorSize = aisSmall
      IndicatorType = aitRotatingSector
    end
  end
  object leDescription: TLabeledEdit
    Left = 90
    Top = 201
    Width = 222
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Description'
    LabelPosition = lpLeft
    TabOrder = 4
  end
  object pcAdjustment: TPageControl
    Left = 6
    Top = 254
    Width = 315
    Height = 168
    ActivePage = tsBpl
    TabOrder = 6
    object tsFilterList: TTabSheet
      Caption = 'Filter List'
      object btnNewFilterLine: TSpeedButton
        Left = 217
        Top = 3
        Width = 23
        Height = 22
        Action = actNewFilterLine
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnDeleteFilterLine: TSpeedButton
        Left = 271
        Top = 3
        Width = 23
        Height = 22
        Action = actDeleteFilterLine
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnEditFilterLine: TSpeedButton
        Left = 244
        Top = 3
        Width = 23
        Height = 22
        Action = actEditFilterLine
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object lbFilterList: TListBox
        Left = 0
        Top = 27
        Width = 307
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
      Caption = 'Path Moving'
      ImageIndex = 1
      object btnNewPathMove: TSpeedButton
        Left = 217
        Top = 3
        Width = 23
        Height = 22
        Action = actNewPathMove
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnDeletePathMove: TSpeedButton
        Left = 271
        Top = 3
        Width = 23
        Height = 22
        Action = actDeletePathMove
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnEditPathMove: TSpeedButton
        Left = 244
        Top = 3
        Width = 23
        Height = 22
        Action = actEditPathMove
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object lvPathMoves: TListView
        Left = 0
        Top = 27
        Width = 307
        Height = 113
        Align = alBottom
        BevelOuter = bvNone
        BorderStyle = bsNone
        Columns = <
          item
            Caption = 'Source'
            Width = 147
          end
          item
            Caption = 'Destination'
            Width = 148
          end>
        ColumnClick = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = lvPathMovesClick
      end
    end
    object tsBpl: TTabSheet
      Caption = 'Bpl Options'
      ImageIndex = 2
      object btnNewBplBinFile: TSpeedButton
        Left = 153
        Top = 3
        Width = 23
        Height = 22
        Action = actNewBplBinFile
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnEditBplBinFile: TSpeedButton
        Left = 180
        Top = 3
        Width = 23
        Height = 22
        Action = actEditBplBinFile
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnDeleteBplBinFile: TSpeedButton
        Left = 207
        Top = 3
        Width = 23
        Height = 22
        Action = actDeleteBplBinFile
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnNewBplPrjFile: TSpeedButton
        Left = 2
        Top = 3
        Width = 23
        Height = 22
        Action = actNewBplPrjFile
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnEditBplPrjFile: TSpeedButton
        Left = 29
        Top = 3
        Width = 23
        Height = 22
        Action = actEditBplPrjFile
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnDeleteBplPrjFile: TSpeedButton
        Left = 53
        Top = 3
        Width = 23
        Height = 22
        Action = actDeleteBplPrjFile
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object lblBplProjectRefs: TLabel
        Left = 6
        Top = 28
        Width = 134
        Height = 13
        Caption = 'Project Referencies (.dproj)'
      end
      object lblBplBinaries: TLabel
        Left = 153
        Top = 28
        Width = 123
        Height = 13
        Caption = 'Packag Referencies (.bpl)'
      end
      object lbBplProjects: TListBox
        Left = -1
        Top = 45
        Width = 150
        Height = 97
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbBplProjectsClick
      end
      object lbBplBinaries: TListBox
        Left = 158
        Top = 45
        Width = 150
        Height = 97
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 1
        OnClick = lbBplBinariesClick
      end
    end
  end
  object cbFilterListType: TComboBox
    Left = 90
    Top = 224
    Width = 222
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 5
    OnChange = cbFilterListTypeChange
  end
  object cbPackageType: TComboBox
    Left = 90
    Top = 154
    Width = 222
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 2
    OnChange = cbPackageTypeChange
  end
  object alActions: TActionList
    Images = ilIcons
    Left = 150
    Top = 8
    object actGoToURL: TAction
      Hint = 'Go to URL'
      ImageIndex = 0
      OnExecute = actGoToURLExecute
    end
    object actNewFilterLine: TAction
      Hint = 'New filter line'
      ImageIndex = 1
      OnExecute = actNewFilterLineExecute
    end
    object actEditFilterLine: TAction
      Hint = 'Edit filter line'
      ImageIndex = 2
      OnExecute = actEditFilterLineExecute
    end
    object actDeleteFilterLine: TAction
      Hint = 'Delete filter line'
      ImageIndex = 3
      OnExecute = actDeleteFilterLineExecute
    end
    object actNewPathMove: TAction
      Hint = 'New path moving'
      ImageIndex = 1
      OnExecute = actNewPathMoveExecute
    end
    object actEditPathMove: TAction
      Hint = 'Edit path moving'
      ImageIndex = 2
      OnExecute = actEditPathMoveExecute
    end
    object actDeletePathMove: TAction
      Hint = 'Delete path moving'
      ImageIndex = 3
      OnExecute = actDeletePathMoveExecute
    end
    object actNewBplPrjFile: TAction
      ImageIndex = 1
      OnExecute = actNewBplPrjFileExecute
    end
    object actEditBplPrjFile: TAction
      Hint = 'Edit bpl project file'
      ImageIndex = 2
      OnExecute = actEditBplPrjFileExecute
    end
    object actDeleteBplPrjFile: TAction
      Hint = 'Delete bpl project file'
      ImageIndex = 3
      OnExecute = actDeleteBplPrjFileExecute
    end
    object actNewBplBinFile: TAction
      Hint = 'New bpl package file'
      ImageIndex = 1
      OnExecute = actNewBplBinFileExecute
    end
    object actEditBplBinFile: TAction
      Hint = 'Edit bpl package file'
      ImageIndex = 2
      OnExecute = actEditBplBinFileExecute
    end
    object actDeleteBplBinFile: TAction
      Hint = 'Delete bpl package file'
      ImageIndex = 3
      OnExecute = actDeleteBplBinFileExecute
    end
  end
  object ilIcons: TImageList
    Left = 206
    Top = 8
    Bitmap = {
      494C010104000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF434343001313130012121200121212001212120012121200131313005252
      5200000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000363636003939390000000000000000000000
      0000000000000000000000000000000000000000000034343400151515004C4C
      4C008D8D8D00DDDDDD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFC1C1
      C100000000000000000000000000000000000000000000000000000000000000
      0000D6D6D600000000FF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000007E7E7E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000012121200000000000000
      0000000000000000000058585800000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFA1A1
      A100000000000000000000000000000000000000000000000000000000000000
      0000B7B7B700000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000007E7E7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000047474700000000000000
      00000000000000000000000000004A4A4A000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF8181
      8100000000000000000000000000000000000000000000000000000000000000
      000097979700000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E7E
      7E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000088888800000000000000
      0000000000000000000000000000000000004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF6262
      6200000000000000000000000000000000000000000000000000000000000000
      000078787800000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6D6D600000000000000
      000000000000000000000000000000000000000000004A4A4A00000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF4242
      4200000000000000000000000000000000000000000000000000000000000000
      000059595900000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000505050000000
      00000000000000000000000000000000000000000000000000004A4A4A000000
      000000000000000000000000000000000000000000FF000000FF000000FF2222
      2200000000000000000000000000000000000000000000000000000000000000
      00003A3A3A00000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E00000000000000000036363600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039393900000000000000000000000000000000004444
      4400000000000000000000000000000000000000000000000000000000004A4A
      4A0000000000000000000000000000000000000000FF000000FF000000FF0505
      0500000000000000000000000000000000000000000000000000000000000000
      00001B1B1B00000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E00000000000000000035353500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000036363600000000000000000000000000000000000000
      0000444444000000000000000000000000000000000000000000000000001212
      1200D8D8D800000000000000000000000000000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000001010100000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000444444000000000000000000000000000000000012121200CFCF
      CF0000000000D8D8D8000000000000000000000000FF000000FFC4C4C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DDDDDD00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400000000000000000012121200CFCFCF000000
      0000CFCFCF00121212007070700000000000000000FF000000FF000000FF5656
      5600525252005252520052525200525252005252520052525200525252005252
      520057575700000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E7E
      7E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004444440012121200CFCFCF0000000000CFCF
      CF0012121200000000001010100000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000007E7E7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D7D7D70000000000CFCFCF001212
      120000000000000000000E0E0E0000000000000000FF6A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F6F6F00000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000007E7E7E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700121212000000
      000000000000000000006C6C6C0000000000000000FF5C5C5C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000060606000000000FF0000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000353535003636360000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000676767000B0B
      0B000D0D0D006C6C6C000000000000000000000000FFD9D9D9005C5C5C005252
      5200525252005252520000000000000000000000000000000000525252005252
      5200525252005C5C5C00DBDBDB00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF5D5D5D0000000000000000005F5F5F00000000FF0000
      00FF000000FF000000FF000000FF000000FF424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFF00FFF7FFE7F83FFE007
      FF3FFE7F81FFE007FF1FFE7F80FFE007FF0FFE7F807FE0078007FE7F803FE007
      8003FE7FC01FE00780018001E00FE00780018001F007E0078003FE7FF80BC003
      8007FE7FFC11E007FF0FFE7FFE21FFFFFF1FFE7FFF418001FF3FFE7FFF818001
      FF7FFE7FFFC38001FFFFFFFFFFFFFC3F00000000000000000000000000000000
      000000000000}
  end
end
