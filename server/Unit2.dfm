object coServer372: TcoServer372
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 195
  Top = 127
  Height = 425
  Width = 612
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:D:\Programms Install\FDB\'#1047#1072#1076#1072#1095#1072'\MY371.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 48
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Left = 136
    Top = 24
  end
  object spNewFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_FIRME'
    Left = 32
    Top = 136
  end
  object spEditFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_FIRME'
    Left = 32
    Top = 192
  end
  object dspFirms: TDataSetProvider
    DataSet = tFirms
    Constraints = False
    Left = 32
    Top = 304
  end
  object spDeleteFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_FIRME'
    Left = 32
    Top = 248
  end
  object tFirms: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Filter = 'ID > 0'
    Filtered = True
    TableName = 'FDB_FIRME'
    Left = 40
    Top = 80
  end
  object tProducts: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'FDB_PRODUCTS'
    Left = 136
    Top = 80
  end
  object spNewProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_PRODUCT'
    Left = 136
    Top = 136
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
    Left = 136
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
    Left = 136
    Top = 248
  end
  object dspProduct: TDataSetProvider
    DataSet = tProducts
    Left = 136
    Top = 296
  end
  object tNakl: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'FDB_NAKL'
    Left = 240
    Top = 88
  end
  object spNewNakl: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_NAKL'
    Left = 240
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'IN_NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ID_DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_FID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_TYPE'
        ParamType = ptInput
      end>
  end
  object spDeleteNakl: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_NAKL'
    Left = 240
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object dspNakl: TDataSetProvider
    DataSet = tNakl
    Left = 240
    Top = 304
  end
  object tInfo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'FDB_INFO'
    Left = 344
    Top = 88
  end
  object spNewInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'NEW_INFO'
    Left = 344
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
        DataType = ftUnknown
        Name = 'IN_CID'
        ParamType = ptUnknown
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
    Left = 344
    Top = 200
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
        DataType = ftUnknown
        Name = 'IN_CID'
        ParamType = ptUnknown
      end>
  end
  object dspInfo: TDataSetProvider
    DataSet = tInfo
    Left = 344
    Top = 304
  end
  object dspQuery: TDataSetProvider
    DataSet = IBQuery1
    Left = 424
    Top = 168
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 424
    Top = 88
  end
end
