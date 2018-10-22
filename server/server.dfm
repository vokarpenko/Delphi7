object coServerTask: TcoServerTask
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 219
  Top = 134
  Height = 428
  Width = 844
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\vagan\Vagan.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251'
      '')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 32
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Left = 104
    Top = 24
  end
  object tFirms: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Filter = 'ID>0'
    Filtered = True
    TableName = 'FDB_FIRME'
    Left = 32
    Top = 88
  end
  object spNewFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_FIRME'
    Left = 32
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_ADDRESS'
        ParamType = ptInput
      end>
  end
  object spEditFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_FIRME'
    Left = 32
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_ADDRESS'
        ParamType = ptInput
      end>
  end
  object spDeleteFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_FIRME'
    Left = 32
    Top = 240
  end
  object dspFirms: TDataSetProvider
    DataSet = tFirms
    Constraints = False
    Left = 32
    Top = 296
  end
  object tProducts: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'FDB_COMPONENT'
    Left = 112
    Top = 88
  end
  object spNewProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_PRODUCT'
    Left = 112
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'IN_PRICE'
        ParamType = ptInput
      end>
  end
  object spEditProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_PRODUCT'
    Left = 112
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'IN_PRICE'
        ParamType = ptInput
      end>
  end
  object spDeleteProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PRODUCT'
    Left = 112
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object dspProduct: TDataSetProvider
    DataSet = tProducts
    Left = 112
    Top = 296
  end
  object tClients: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Filter = 'ID > 0'
    Filtered = True
    TableName = 'FDB_CLIENTS'
    Left = 200
    Top = 88
  end
  object spNewClient: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_CLIENT'
    Left = 200
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_ADDRESS'
        ParamType = ptInput
      end>
  end
  object spEditClient: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_CLIENT'
    Left = 200
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_ADDRESS'
        ParamType = ptInput
      end>
  end
  object spDeleteClient: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_CLIENT'
    Left = 200
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object dspClient: TDataSetProvider
    DataSet = tClients
    Left = 200
    Top = 296
  end
  object tNakl: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'FDB_NAKL'
    Left = 280
    Top = 88
  end
  object spNewNakl: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_NAKL'
    Left = 280
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IN_PID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_CID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_NUKL_TYPE'
        ParamType = ptInput
      end>
  end
  object spDeleteNakl: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_NAKL'
    Left = 280
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object dspNakl: TDataSetProvider
    DataSet = tNakl
    Left = 280
    Top = 296
  end
  object tInfo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'FDB_INFO'
    Left = 368
    Top = 88
  end
  object spNewInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_INFO'
    Left = 368
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_NID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IN_KOLVO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'IN_TOTAL'
        ParamType = ptInput
      end>
  end
  object spDeleteInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_INFO'
    Left = 368
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_NID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PID'
        ParamType = ptInput
      end>
  end
  object dspInfo: TDataSetProvider
    DataSet = tInfo
    Left = 368
    Top = 296
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 624
    Top = 88
  end
  object dspQuery: TDataSetProvider
    DataSet = IBQuery1
    Left = 624
    Top = 144
  end
  object spEditPrice: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_PRICE'
    Left = 368
    Top = 192
  end
  object tPay: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'FDP_PAY'
    Left = 448
    Top = 88
  end
  object spNewPay: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_PAY'
    Left = 448
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IN_NID1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATA'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'IN_PAY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PID1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_KOLOUT'
        ParamType = ptInput
      end>
  end
  object spDeletePay: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PAY'
    Left = 448
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_NID1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PID1'
        ParamType = ptInput
      end>
  end
  object dspPay: TDataSetProvider
    DataSet = tPay
    Left = 448
    Top = 296
  end
  object tPeople: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Filter = 'ID > 0'
    Filtered = True
    TableName = 'FDB_PEOPLE'
    Left = 520
    Top = 88
  end
  object spNewPeople: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_PEOPLE'
    Left = 520
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end>
  end
  object spDeletePeople: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PEOPLE'
    Left = 528
    Top = 240
  end
  object dspPeople: TDataSetProvider
    DataSet = tPeople
    Left = 520
    Top = 296
  end
  object spEditPeople: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_PEOPLE'
    Left = 528
    Top = 192
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 728
    Top = 88
  end
  object dspQuery2: TDataSetProvider
    DataSet = IBQuery2
    Left = 728
    Top = 144
  end
end
