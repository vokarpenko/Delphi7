unit mydm;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  Tdm = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    cdsFirms: TClientDataSet;
    cdsProducts: TClientDataSet;
    cdsClients: TClientDataSet;
    cdsNakl: TClientDataSet;
    cdsInfo: TClientDataSet;
    cdsQuery: TClientDataSet;
    cdsPay: TClientDataSet;
    cdsPeople: TClientDataSet;
    cdsFirmsID: TIntegerField;
    cdsFirmsNAME: TStringField;
    cdsFirmsADDRESS: TStringField;
    cdsClientsID: TIntegerField;
    cdsClientsNAME: TStringField;
    cdsClientsADDRESS: TStringField;
    cdsPayID1: TIntegerField;
    cdsPayNID1: TIntegerField;
    cdsPayPID1: TIntegerField;
    cdsPayDATA: TDateField;
    cdsPayPAY: TBCDField;
    cdsProductsID: TIntegerField;
    cdsProductsNAME: TStringField;
    cdsProductsPRICE: TBCDField;
    cdsPayKOLOUT: TIntegerField;
    cdsPayNNumber: TStringField;
    cdsPayPname: TStringField;
    cdsQuery2: TClientDataSet;
    cdsNaklID: TIntegerField;
    cdsNaklCID: TIntegerField;
    cdsNaklPID: TIntegerField;
    cdsNaklNUMBER: TStringField;
    cdsNaklDATA: TDateField;
    cdsNaklSUMMA: TBCDField;
    cdsNaklALL_KOLVO: TFloatField;
    cdsNaklNUKL_TYPE: TIntegerField;
    cdsInfoNID: TIntegerField;
    cdsInfoKOLVO: TFloatField;
    cdsInfoTOTAL: TBCDField;
    cdsInfoPRICE: TBCDField;
    cdsInfopname: TStringField;
    cdsInfoPID: TIntegerField;
    cdsNaklcname: TStringField;
    cdsNaklpname: TStringField;
    cdsPeopleID: TIntegerField;
    cdsPeopleNAME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CheckFloat(str: string) : boolean;
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
 DCOMConnection1.Open;
 cdsFirms.Open;
 cdsFirms.AddIndex('idx1','ID',[]);
 cdsFirms.AddIndex('idx2','name;ID',[]);
 cdsFirms.AddIndex('idx3','address;ID',[]);
 cdsFirms.IndexFieldNames := 'ID';

  cdsProducts.Open;
  cdsProducts.AddIndex('idx1','id',[]);
  cdsProducts.AddIndex('idx2','name;id',[]);
  cdsProducts.AddIndex('idx3','price;id',[]);
  cdsProducts.IndexFieldNames:='id';

  cdsClients.Open;
  cdsClients.AddIndex('idx1','id',[]);
  cdsClients.AddIndex('idx2','name;id',[]);
  cdsClients.AddIndex('idx3','address;id',[]);
  cdsClients.IndexFieldNames:='id';

  cdsNakl.Open;   // —Œ–“»–Œ¬ »
  cdsNakl.AddIndex('idx1','id',[]);
  cdsNakl.AddIndex('idx2','NUMBER;ID',[]);
  cdsNakl.AddIndex('idx3','DATA;NUMBER;id',[]);
  cdsNakl.AddIndex('idx4','NUMBER;DATA;id',[]);
  cdsNakl.AddIndex('idx5','Summa;id',[]);
  //cdsNakl.AddIndex('idx6','AllSumPog;id',[]);
  //cdsNakl.AddIndex('idx7','AllKolPog;id',[]);
  cdsNakl.IndexFieldNames:='DATA;id';

  cdsInfo.Open;
  cdsInfo.AddIndex('idx1','NID;PID',[]);
  cdsInfo.AddIndex('idx3','kolvo;NID',[]);
  cdsInfo.AddIndex('idx4','total;kolvo;NID',[]);
  cdsInfo.AddIndex('idx2','kolvo;total;NID',[]);
  cdsInfo.IndexFieldNames:='NID;PID';
//  cdsPay.IndexFieldNames:='NID1';

  cdsPay.Open;
  cdsPeople.Open;
end;

function Tdm.CheckFloat(str: string) : boolean;
begin
  try
    StrToFloat(str);
    Result := True
  except
    result := False;
  end;
end;

end.
