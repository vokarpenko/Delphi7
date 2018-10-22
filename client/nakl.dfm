object newNakl: TnewNakl
  Left = 210
  Top = 121
  Width = 607
  Height = 261
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1086#1083#1080#1089#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label4: TLabel
    Left = 40
    Top = 112
    Width = 58
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
  end
  object Label3: TLabel
    Left = 40
    Top = 144
    Width = 39
    Height = 13
    Caption = #1052#1077#1073#1077#1083#1100
  end
  object edtNo: TEdit
    Left = 160
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edtNoChange
  end
  object DateTimePicker1: TDateTimePicker
    Left = 152
    Top = 64
    Width = 186
    Height = 21
    Date = 43093.007979340280000000
    Time = 43093.007979340280000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 184
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 184
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object edtCls: TEdit
    Left = 144
    Top = 104
    Width = 281
    Height = 21
    TabOrder = 4
    OnChange = edtNoChange
  end
  object Button2: TButton
    Left = 400
    Top = 104
    Width = 25
    Height = 17
    Caption = '...'
    TabOrder = 5
    OnClick = Button2Click
  end
  object edtPeople: TEdit
    Left = 144
    Top = 136
    Width = 281
    Height = 21
    TabOrder = 6
    OnChange = edtNoChange
  end
  object Button1: TButton
    Left = 400
    Top = 136
    Width = 25
    Height = 17
    Caption = '...'
    TabOrder = 7
    OnClick = Button1Click
  end
end
