program client;

uses
  Forms,
  main in 'main.pas' {fmMain},
  mydm in 'mydm.pas' {dm: TDataModule},
  fms in 'fms.pas' {fFirms},
  firm in 'firm.pas' {fFirm},
  product in 'product.pas' {tProducts},
  newProd in 'newProd.pas' {fNewProduct},
  cls in 'cls.pas' {fClients},
  unitnewcls in 'unitnewcls.pas' {newCls},
  nakl in 'nakl.pas' {newNakl},
  Unit1 in 'Unit1.pas' {fNewInfo},
  Unit2 in 'Unit2.pas' {fRpt},
  pay in 'pay.pas' {fNewPay},
  people in 'people.pas' {fPeople},
  newPeople in 'newPeople.pas' {fNewPeople},
  Unit3 in 'Unit3.pas' {ClientRpt};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfFirms, fFirms);
  Application.CreateForm(TfFirm, fFirm);
  Application.CreateForm(TtProducts, tProducts);
  Application.CreateForm(TfNewProduct, fNewProduct);
  Application.CreateForm(TfClients, fClients);
  Application.CreateForm(TnewCls, newCls);
  Application.CreateForm(TnewNakl, newNakl);
  Application.CreateForm(TfNewInfo, fNewInfo);
  Application.CreateForm(TfRpt, fRpt);
  Application.CreateForm(TfNewPay, fNewPay);
  Application.CreateForm(TfPeople, fPeople);
  Application.CreateForm(TfNewPeople, fNewPeople);
  Application.CreateForm(TClientRpt, ClientRpt);
  Application.Run;
end.
