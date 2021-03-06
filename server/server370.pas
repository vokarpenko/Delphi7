unit server370;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, server372_TLB, StdVcl, Provider, IBStoredProc, DB,
  IBCustomDataSet, IBTable, IBDatabase, IBQuery;

type
  TcoServer370 = class(TRemoteDataModule, IcoServer372)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    spNewFirm: TIBStoredProc;
    spEditFirm: TIBStoredProc;
    dspFirms: TDataSetProvider;
    spDeleteFirm: TIBStoredProc;
    tFirms: TIBTable;
    tProducts: TIBTable;
    spNewProduct: TIBStoredProc;
    spEditProduct: TIBStoredProc;
    spDeleteProduct: TIBStoredProc;
    dspProduct: TDataSetProvider;
    tNakl: TIBTable;
    spNewNakl: TIBStoredProc;
    spDeleteNakl: TIBStoredProc;
    dspNakl: TDataSetProvider;
    tInfo: TIBTable;
    spNewInfo: TIBStoredProc;
    spDeleteInfo: TIBStoredProc;
    dspInfo: TDataSetProvider;
    dspQuery: TDataSetProvider;
    IBQuery1: TIBQuery;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function smNewFirm(const inName, inAddress: WideString): Integer; safecall;
    procedure smDeleteFirm(inID: Integer); safecall;
    procedure smEditFirm(inID: Integer; const inName, inAddress: WideString); safecall;
    function smNewProduct(const inName: WideString; inPrice: Single): Integer;
      safecall;
    procedure smDeleteProduct(inID: Integer); safecall;
    procedure smEditProduct(inID: Integer; const inName: WideString;
      inPrice: Single); safecall;
    function smNewNakl(inDate: TDateTime; const inNo: WideString; inFID,
      inType: Integer): Integer; safecall;
    procedure smDeleteNakl(inID: Integer); safecall;
    procedure smNewInfo(inNID, inPID, inCID: Integer; inKolvo,
      inTotal: Single); safecall;
    procedure smDeleteInfo(inNID, inPID, inCID: Integer); safecall;
    procedure smQueryClear; safecall;
    procedure smQueryAdd(const Param1: WideString); safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TcoServer370.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TcoServer370.smNewFirm(const inName,
  inAddress: WideString): Integer;
begin
  spNewFirm.Params[1].Value := inName; //[1..n] - передаваемый
  spNewFirm.Params[2].Value := inAddress;
  if  not spNewFirm.Transaction.InTransaction then
     spNewFirm.Transaction.StartTransaction;
  spNewFirm.ExecProc;
  Result := spNewFirm.Params[0].Value;
  if  spNewFirm.Transaction.InTransaction then
     spNewFirm.Transaction.Commit;
end;

procedure TcoServer370.smDeleteFirm(inID: Integer);
begin
   spDeleteFirm.ParamByName('IN_ID').value := inID;
  if  not spDeleteFirm.Transaction.InTransaction then
     spDeleteFirm.Transaction.StartTransaction;
  spDeleteFirm.ExecProc;
  if  spDeleteFirm.Transaction.InTransaction then
     spDeleteFirm.Transaction.Commit;
end;

procedure TcoServer370.smEditFirm(inID: Integer; const inName,
  inAddress: WideString);
begin
  spEditFirm.ParamByName('IN_Adress').value := inAddress;
  spEditFirm.ParamByName('IN_NAME').value := inName;
   spEditFirm.ParamByName('IN_ID').value := inID;
  if  not spEditFirm.Transaction.InTransaction then
     spEditFirm.Transaction.StartTransaction;
  spEditFirm.ExecProc;
  if  spEditFirm.Transaction.InTransaction then
     spEditFirm.Transaction.Commit;
end;

procedure TcoServer370.RemoteDataModuleCreate(Sender: TObject);
begin
  IBDatabase1.Open;
  spNewFirm.Prepare;
  spEditFirm.Prepare;
  spDeleteFirm.Prepare;
end;

procedure TcoServer370.RemoteDataModuleDestroy(Sender: TObject);
begin
  IBDatabase1.Close;
end;

function TcoServer370.smNewProduct(const inName: WideString;
  inPrice: Single): Integer;
begin
spNewProduct.Params[1].Value:=inName;
spNewProduct.Params[2].Value:=inPrice;
 if not spNewProduct.Transaction.InTransaction then
 spNewProduct.Transaction.StartTransaction;
spNewProduct.ExecProc;
Result:=spNewProduct.Params[0].Value;
 if spNewProduct.Transaction.InTransaction then
spNewProduct.Transaction.Commit;
end;

procedure TcoServer370.smDeleteProduct(inID: Integer);
begin
spDeleteProduct.ParamByName('in_id').Value:=inID;

 if not spDeleteProduct.Transaction.InTransaction then
 spdeleteProduct.Transaction.StartTransaction;
spDeleteProduct.ExecProc;

 if spDeleteProduct.Transaction.InTransaction then
spDeleteProduct.Transaction.Commit;
end;

procedure TcoServer370.smEditProduct(inID: Integer;
  const inName: WideString; inPrice: Single);
begin
spEditProduct.ParamByName('in_id').Value:=inID;
spEditProduct.ParamByName('in_name').Value:=inName;
spEditProduct.ParamByName('in_price').Value:=inPrice;

 if not spEditProduct.Transaction.InTransaction then
 spEditproduct.Transaction.StartTransaction;
spEditProduct.ExecProc;

 if spEditProduct.Transaction.InTransaction then
spEditProduct.Transaction.Commit;
end;

function TcoServer370.smNewNakl(inDate: TDateTime; const inNo: WideString;
  inFID, inType: Integer): Integer;
begin
  spNewNakl.Params[1].Value:=inNo;
spNewNakl.Params[2].Value:=inDate;
spNewNakl.Params[3].Value:=inFID;
spNewNakl.Params[4].Value:=inType;
 if not spNewNakl.Transaction.InTransaction then
 spNewNakl.Transaction.StartTransaction;
spNewNakl.ExecProc;
Result:=spNewNakl.Params[0].Value;
 if spNewNakl.Transaction.InTransaction then
spNewNakl.Transaction.Commit;
end;

procedure TcoServer370.smDeleteNakl(inID: Integer);
begin

spDeleteNakl.Params[0].Value:=inID;

 if not spDeleteNakl.Transaction.InTransaction then
 spdeleteNakl.Transaction.StartTransaction;
spDeleteNakl.ExecProc;

 if spDeleteNakl.Transaction.InTransaction then
spDeleteNakl.Transaction.Commit;

end;

procedure TcoServer370.smNewInfo(inNID, inPID, inCID: Integer; inKolvo,
  inTotal: Single);
begin
   spNewInfo.Params[0].Value:=inNID;
spNewInfo.Params[1].Value:=inPID;
spNewInfo.Params[2].Value:=inCID;
spNewInfo.Params[3].Value:=inKolvo;
spNewInfo.Params[4].Value:=inTotal;
 if not spNewInfo.Transaction.InTransaction then
 spNewInfo.Transaction.StartTransaction;
spNewInfo.ExecProc;
 if spNewInfo.Transaction.InTransaction then
spNewInfo.Transaction.Commit;
end;

procedure TcoServer370.smDeleteInfo(inNID, inPID, inCID: Integer);
begin
   
spDeleteInfo.Params[0].Value:=inNID;
spDeleteInfo.Params[1].Value:=inPID;
spDeleteInfo.Params[2].Value:=inCID;

if not spDeleteInfo.Transaction.InTransaction then
 spdeleteInfo.Transaction.StartTransaction;
spDeleteInfo.ExecProc;

 if spDeleteInfo.Transaction.InTransaction then
spDeleteInfo.Transaction.Commit;

end;

procedure TcoServer370.smQueryClear;
begin
    IBQuery1.SQL.Clear;
end;

procedure TcoServer370.smQueryAdd(const Param1: WideString);
begin
   IBQuery1.SQL.Add(Param1);
end;

initialization
  TComponentFactory.Create(ComServer, TcoServer370,
    Class_coServer370, ciMultiInstance, tmSingle);
end.
