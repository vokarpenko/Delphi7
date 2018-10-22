object dm: Tdm
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 624
  Top = 121
  Height = 275
  Width = 669
  object DCOMConnection1: TDCOMConnection
    ServerGUID = '{C55F3BDD-614D-4C50-B19C-47141F4E8920}'
    ServerName = 'setverMyTask.coServerTask'
    Left = 40
    Top = 16
  end
  object cdsFirms: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFirms'
    RemoteServer = DCOMConnection1
    Left = 40
    Top = 80
    object cdsFirmsID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsFirmsNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
    end
    object cdsFirmsADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDRESS'
      Size = 100
    end
  end
  object cdsProducts: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduct'
    RemoteServer = DCOMConnection1
    Left = 112
    Top = 80
    object cdsProductsID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsProductsNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
    end
    object cdsProductsPRICE: TBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      Precision = 18
      Size = 2
    end
  end
  object cdsClients: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClient'
    RemoteServer = DCOMConnection1
    Left = 192
    Top = 80
    object cdsClientsID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsClientsNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
    end
    object cdsClientsADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDRESS'
      Size = 50
    end
  end
  object cdsNakl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNakl'
    RemoteServer = DCOMConnection1
    Left = 264
    Top = 80
    object cdsNaklID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object cdsNaklCID: TIntegerField
      FieldName = 'CID'
      Required = True
      Visible = False
    end
    object cdsNaklPID: TIntegerField
      FieldName = 'PID'
      Required = True
      Visible = False
    end
    object cdsNaklNUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUMBER'
      Size = 10
    end
    object cdsNaklDATA: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATA'
    end
    object cdsNaklSUMMA: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsNaklALL_KOLVO: TFloatField
      DisplayLabel = #1054#1073#1097#1077#1077' '#1050#1086#1083'-'#1074#1086
      FieldName = 'ALL_KOLVO'
      ReadOnly = True
    end
    object cdsNaklNUKL_TYPE: TIntegerField
      FieldName = 'NUKL_TYPE'
      Visible = False
    end
    object cdsNaklcname: TStringField
      DisplayLabel = #1042#1077#1097#1100
      FieldKind = fkLookup
      FieldName = 'cname'
      LookupDataSet = cdsPeople
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'CID'
      Lookup = True
    end
    object cdsNaklpname: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'pname'
      LookupDataSet = cdsClients
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'PID'
      Lookup = True
    end
  end
  object cdsInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInfo'
    RemoteServer = DCOMConnection1
    Left = 328
    Top = 80
    object cdsInfoNID: TIntegerField
      FieldName = 'NID'
      Required = True
      Visible = False
    end
    object cdsInfopname: TStringField
      FieldKind = fkLookup
      FieldName = 'pname'
      LookupDataSet = cdsProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'PID'
      Lookup = True
    end
    object cdsInfoKOLVO: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1072' '#1090#1086#1074#1072#1088#1072
      FieldName = 'KOLVO'
      Required = True
    end
    object cdsInfoTOTAL: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsInfoPRICE: TBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsInfoPID: TIntegerField
      FieldName = 'PID'
      Required = True
      Visible = False
    end
  end
  object cdsQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery'
    RemoteServer = DCOMConnection1
    Left = 528
    Top = 80
  end
  object cdsPay: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPay'
    RemoteServer = DCOMConnection1
    Left = 392
    Top = 80
    object cdsPayID1: TIntegerField
      FieldName = 'ID1'
      Required = True
      Visible = False
    end
    object cdsPayNNumber: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldKind = fkLookup
      FieldName = 'NNumber'
      LookupDataSet = cdsNakl
      LookupKeyFields = 'ID'
      LookupResultField = 'NUMBER'
      KeyFields = 'NID1'
      Lookup = True
    end
    object cdsPayPname: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      FieldKind = fkLookup
      FieldName = 'Pname'
      LookupDataSet = cdsProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'PID1'
      Lookup = True
    end
    object cdsPayNID1: TIntegerField
      FieldName = 'NID1'
      Required = True
      Visible = False
    end
    object cdsPayPID1: TIntegerField
      FieldName = 'PID1'
      Required = True
      Visible = False
    end
    object cdsPayDATA: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATA'
    end
    object cdsPayPAY: TBCDField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'PAY'
      Precision = 18
      Size = 2
    end
    object cdsPayKOLOUT: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOUT'
    end
  end
  object cdsPeople: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPeople'
    RemoteServer = DCOMConnection1
    Left = 456
    Top = 80
    object cdsPeopleID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsPeopleNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsQuery2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery2'
    RemoteServer = DCOMConnection1
    Left = 592
    Top = 80
  end
end
