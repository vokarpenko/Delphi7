object fNewProduct: TfNewProduct
  Left = 204
  Top = 132
  Width = 391
  Height = 239
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1075#1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 40
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 56
    Top = 72
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object edtName: TEdit
    Left = 160
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edtNameChange
  end
  object edtPrice: TEdit
    Left = 160
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = edtPriceChange
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end
