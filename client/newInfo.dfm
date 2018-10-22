object fNewInfo: TfNewInfo
  Left = 169
  Top = 144
  Width = 546
  Height = 439
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
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
    Left = 32
    Top = 32
    Width = 42
    Height = 13
    Caption = #1055#1088#1086#1076#1091#1082#1090
  end
  object Label2: TLabel
    Left = 32
    Top = 128
    Width = 34
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086
  end
  object Label3: TLabel
    Left = 32
    Top = 176
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Label4: TLabel
    Left = 32
    Top = 216
    Width = 34
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object Label5: TLabel
    Left = 32
    Top = 88
    Width = 36
    Height = 13
    Caption = #1050#1083#1080#1077#1085#1090
  end
  object edtProduct: TEdit
    Left = 96
    Top = 24
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'edtProduct'
    OnChange = edtProductChange
  end
  object edtKol: TEdit
    Left = 96
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtKol'
  end
  object edtPrice: TEdit
    Left = 96
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtPrice'
  end
  object edtSum: TEdit
    Left = 96
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'edtSum'
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 248
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 40
    Top = 248
    Width = 75
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object Button1: TButton
    Left = 280
    Top = 24
    Width = 25
    Height = 17
    Caption = '...'
    TabOrder = 6
    OnClick = Button1Click
  end
  object edtCls: TEdit
    Left = 88
    Top = 80
    Width = 209
    Height = 21
    TabOrder = 7
    Text = 'edtCls'
  end
  object Button2: TButton
    Left = 272
    Top = 80
    Width = 25
    Height = 17
    Caption = '...'
    TabOrder = 8
    OnClick = Button2Click
  end
end
