object fNewPay: TfNewPay
  Left = 2507
  Top = 251
  Width = 424
  Height = 325
  Caption = #1042#1099#1087#1083#1072#1090#1072
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
    Left = 64
    Top = 80
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label2: TLabel
    Left = 64
    Top = 168
    Width = 44
    Height = 13
    Caption = #1042#1099#1087#1083#1072#1090#1072
  end
  object Label3: TLabel
    Left = 64
    Top = 128
    Width = 72
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1090#1086#1074#1072#1088#1072
  end
  object Edit1: TEdit
    Left = 176
    Top = 160
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
    OnChange = Edit1Change
  end
  object DateTimePicker1: TDateTimePicker
    Left = 176
    Top = 80
    Width = 186
    Height = 21
    Date = 43096.978166122690000000
    Time = 43096.978166122690000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 200
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 88
    Top = 200
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object eKol: TEdit
    Left = 176
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = eKolChange
  end
end
