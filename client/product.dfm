object tProducts: TtProducts
  Left = 243
  Top = 160
  Width = 1044
  Height = 540
  Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1028
    Height = 481
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 112
    object Lfyyst1: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N1: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N4Click
    end
  end
  object DataSource1: TDataSource
    DataSet = dm.cdsFirms
    Left = 96
    Top = 32
  end
end
