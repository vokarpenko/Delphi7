object fRpt: TfRpt
  Left = 298
  Top = 114
  Width = 1044
  Height = 610
  Align = alClient
  Caption = #1054#1090#1095#1077#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 281
    Top = 120
    Width = 607
    Height = 431
    Align = alClient
  end
  object Image2: TImage
    Left = 888
    Top = 120
    Width = 140
    Height = 431
    Align = alRight
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1028
    Height = 120
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 120
    Width = 281
    Height = 431
    Align = alLeft
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label2: TLabel
      Left = 24
      Top = 88
      Width = 14
      Height = 13
      Caption = #1055#1086
    end
    object DateTimePicker1: TDateTimePicker
      Left = 72
      Top = 48
      Width = 186
      Height = 21
      Date = 43093.919913298610000000
      Time = 43093.919913298610000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 72
      Top = 80
      Width = 186
      Height = 21
      Date = 43093.919932685190000000
      Time = 43093.919932685190000000
      TabOrder = 1
    end
    object lbName: TListBox
      Left = 8
      Top = 120
      Width = 257
      Height = 177
      ItemHeight = 13
      TabOrder = 2
    end
    object lbID: TListBox
      Left = 72
      Top = 152
      Width = 129
      Height = 113
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object Button1: TButton
      Left = 32
      Top = 336
      Width = 75
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 160
      Top = 336
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 96
      Top = 376
      Width = 75
      Height = 25
      Caption = #1054#1090#1095#1077#1090
      TabOrder = 6
      OnClick = Button3Click
    end
  end
  object DataSource1: TDataSource
    Left = 240
    Top = 128
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 136
    object N1: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N1Click
    end
  end
end
