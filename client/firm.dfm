object fFirm: TfFirm
  Left = 204
  Top = 132
  Width = 433
  Height = 226
  Caption = #1053#1086#1074#1086#1077' '#1086#1090#1076#1077#1083#1077#1085#1080#1077
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
    Left = 40
    Top = 32
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object eName: TEdit
    Left = 128
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = eNameChange
  end
  object eAddress: TEdit
    Left = 96
    Top = 64
    Width = 265
    Height = 21
    TabOrder = 1
    Text = 'eAddress'
    OnChange = eNameChange
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end
