object fFirms: TfFirms
  Left = 283
  Top = 222
  Width = 1044
  Height = 540
  Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1103
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 232
    object N1: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N2: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N5Click
    end
  end
  object DataSource1: TDataSource
    DataSet = dm.cdsFirms
    Left = 280
    Top = 216
  end
end
