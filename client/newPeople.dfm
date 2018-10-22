object fNewPeople: TfNewPeople
  Left = 192
  Top = 125
  Width = 308
  Height = 254
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1073#1077#1083#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 80
    Width = 22
    Height = 13
    Caption = #1048#1084#1103
  end
  object edtName: TEdit
    Left = 104
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edtNameChange
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 136
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 72
    Top = 136
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
