object fNewInfo: TfNewInfo
  Left = 484
  Top = 143
  Width = 530
  Height = 428
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
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
    Left = 8
    Top = 24
    Width = 84
    Height = 13
    Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 72
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1090#1086#1074#1072#1088#1072
  end
  object Label4: TLabel
    Left = 72
    Top = 144
    Width = 34
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 123
    Height = 13
    Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1077#1085#1080#1094#1091' '#1090#1086#1074#1072#1088#1072
  end
  object edtProduct: TEdit
    Left = 96
    Top = 24
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'edtProduct'
    OnChange = edtKolChange
  end
  object edtKol: TEdit
    Left = 136
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtKol'
    OnChange = edtKolChange
  end
  object edtSum: TEdit
    Left = 152
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtSum'
    OnChange = edtSumChange
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 192
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 64
    Top = 192
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
  object Button1: TButton
    Left = 280
    Top = 24
    Width = 25
    Height = 17
    Caption = '...'
    TabOrder = 5
    OnClick = Button1Click
  end
  object edtPrice: TEdit
    Left = 152
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 6
    OnChange = edtPriceChange
  end
end
