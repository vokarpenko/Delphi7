object coServerMyTask: TcoServerMyTask
  OldCreateOrder = False
  Left = 163
  Top = 131
  Height = 526
  Width = 843
  object IBDatabase1: TIBDatabase
    DatabaseName = '127.0.0.1:D:\Programms Install\FDB\'#1047#1072#1076#1072#1095#1072'\MY371.FDB'
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 32
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Left = 112
    Top = 24
  end
  object tFirms: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Filter = 'ID>0'
    Filtered = True
    Left = 32
    Top = 80
  end
  object spNewFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 24
    Top = 144
  end
  object spEditFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 24
    Top = 200
  end
  object spDeleteFirm: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 32
    Top = 256
  end
  object dspFirms: TDataSetProvider
    DataSet = tFirms
    Constraints = False
    Left = 32
    Top = 320
  end
end
