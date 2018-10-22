unit server;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, setverMyTask_TLB, StdVcl, Provider, IBStoredProc, DB,
  IBCustomDataSet, IBTable, IBDatabase, IBQuery;

type
  TcoServerTask = class(TRemoteDataModule, IcoServerTask)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    tFirms: TIBTable;
    spNewFirm: TIBStoredProc;
    spEditFirm: TIBStoredProc;
    spDeleteFirm: TIBStoredProc;
    dspFirms: TDataSetProvider;
    tProducts: TIBTable;
    spNewProduct: TIBStoredProc;
    spEditProduct: TIBStoredProc;
    spDeleteProduct: TIBStoredProc;
    dspProduct: TDataSetProvider;
    tClients: TIBTable;
    spNewClient: TIBStoredProc;
    spEditClient: TIBStoredProc;
    spDeleteClient: TIBStoredProc;
    dspClient: TDataSetProvider;
    tNakl: TIBTable;
    spNewNakl: TIBStoredProc;
    spDeleteNakl: TIBStoredProc;
    dspNakl: TDataSetProvider;
    tInfo: TIBTable;
    spNewInfo: TIBStoredProc;
    spDeleteInfo: TIBStoredProc;
    dspInfo: TDataSetProvider;
    IBQuery1: TIBQuery;
    dspQuery: TDataSetProvider;
    spEditPrice: TIBStoredProc;
    tPay: TIBTable;
    spNewPay: TIBStoredProc;
    spDeletePay: TIBStoredProc;
    dspPay: TDataSetProvider;
    tPeople: TIBTable;
    spNewPeople: TIBStoredProc;
    spDeletePeople: TIBStoredProc;
    dspPeople: TDataSetProvider;
    spEditPeople: TIBStoredProc;
    IBQuery2: TIBQuery;
    dspQuery2: TDataSetProvider;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function smNewFirm(const inName, inAddress: WideString): Integer; safecall;
    procedure smEditFirm(inID: Integer; const inName, inAddress: WideString);
      safecall;
    procedure smDeleteFirm(inID: Integer); safecall;
    function smNewProduct(const inName: WideString; inPrice: Single): Integer;
      safecall;
    procedure smEditProduct(inID: Integer; const inName: WideString;
      inPrice: Single); safecall;
    procedure smDeleteProduct(inID: Integer); safecall;
    function smNewClient(const inName, inAddress: WideString): Integer;
      safecall;
    procedure smEditClient(inID: Integer; const inName, inAddress: WideString);
      safecall;
    procedure smDeleteClient(inID: Integer); safecall;
    function smNewNakl(const inNo: WideString; inDate: TDateTime; inCID,
      inNuklType, inPID: Integer): Integer; safecall;
    procedure smDeleteNakl(inID: Integer); safecall;
    procedure smNewInfo(inNID, inPID: Integer; inKolvo, inTotal: Single);
      safecall;
    procedure smDeleteInfo(inNID, inPID: Integer); safecall;
    procedure smQueryAdd(const Param1: WideString); safecall;
    procedure smQueryClear; safecall;
    procedure smEditPrice(inNID, inPID, inCID: Integer; inTotal: Single);
      safecall;
    function smNewPay(inNID1: Integer; inData: TDateTime; inPay: Single;
      inPID1, inKOLOUT: Integer): Integer; safecall;
    procedure smDeletePay(inID, inNID1, inPID1: Integer); safecall;
    function smNewPeople(const inName: WideString): Integer; safecall;
    procedure smEditPeople(inID: Integer; const inName: WideString); safecall;
    procedure smDeletePeople(inID: Integer); safecall;
    procedure smQueryNew(const Param1: WideString); safecall;
    procedure smQueryDelete; safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TcoServerTask.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TcoServerTask.smNewFirm(const inName,
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

procedure TcoServerTask.smEditFirm(inID: Integer; const inName,
  inAddress: WideString);
begin
  spEditFirm.ParamByName('IN_Address').value := inAddress;
  spEditFirm.ParamByName('IN_NAME').value := inName;
   spEditFirm.ParamByName('IN_ID').value := inID;
  if  not spEditFirm.Transaction.InTransaction then
     spEditFirm.Transaction.StartTransaction;
  spEditFirm.ExecProc;
  if  spEditFirm.Transaction.InTransaction then
     spEditFirm.Transaction.Commit;
end;

procedure TcoServerTask.smDeleteFirm(inID: Integer);
begin
  spDeleteFirm.ParamByName('IN_ID').value := inID;
  if  not spDeleteFirm.Transaction.InTransaction then
     spDeleteFirm.Transaction.StartTransaction;
  spDeleteFirm.ExecProc;
  if  spDeleteFirm.Transaction.InTransaction then
     spDeleteFirm.Transaction.Commit;
end;

function TcoServerTask.smNewProduct(const inName: WideString;
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

procedure TcoServerTask.smEditProduct(inID: Integer;
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

procedure TcoServerTask.smDeleteProduct(inID: Integer);
begin
  spDeleteProduct.ParamByName('in_id').Value:=inID;

 if not spDeleteProduct.Transaction.InTransaction then
 spdeleteProduct.Transaction.StartTransaction;
spDeleteProduct.ExecProc;

 if spDeleteProduct.Transaction.InTransaction then
spDeleteProduct.Transaction.Commit;
end;

procedure TcoServerTask.RemoteDataModuleCreate(Sender: TObject);
begin
  IBDatabase1.Open;
  spNewFirm.Prepare;
  spEditFirm.Prepare;
  spDeleteFirm.Prepare;
end;

procedure TcoServerTask.RemoteDataModuleDestroy(Sender: TObject);
begin
IBDatabase1.Close;
end;

function TcoServerTask.smNewClient(const inName,
  inAddress: WideString): Integer;
begin
  spNewClient.Params[1].Value:=inName;
  spNewClient.Params[2].Value:=inAddress;
 if not spNewClient.Transaction.InTransaction then
 spNewClient.Transaction.StartTransaction;
spNewClient.ExecProc;
Result:=spNewClient.Params[0].Value;
 if spNewClient.Transaction.InTransaction then
spNewClient.Transaction.Commit;
end;

procedure TcoServerTask.smEditClient(inID: Integer; const inName,
  inAddress: WideString);
begin
spEditClient.ParamByName('in_id').Value:=inID;
spEditClient.ParamByName('in_name').Value:=inName;
spEditClient.ParamByName('in_address').Value:=inAddress;

 if not spEditClient.Transaction.InTransaction then
 spEditClient.Transaction.StartTransaction;
spEditClient.ExecProc;

 if spEditClient.Transaction.InTransaction then
spEditClient.Transaction.Commit;
end;

procedure TcoServerTask.smDeleteClient(inID: Integer);
begin
spDeleteClient.ParamByName('in_id').Value:=inID;

 if not spDeleteClient.Transaction.InTransaction then
 spdeleteClient.Transaction.StartTransaction;
spDeleteClient.ExecProc;

 if spDeleteClient.Transaction.InTransaction then
spDeleteClient.Transaction.Commit;
end;

function TcoServerTask.smNewNakl(const inNo: WideString; inDate: TDateTime;
  inCID, inNuklType, inPID: Integer): Integer;
begin
spNewNakl.ParamByName('in_PID').Value := inPID;
spNewNakl.ParamByName('in_number').Value:=inNo;
spNewNakl.ParamByName('in_data').Value:=inDate;
spNewNakl.ParamByName('in_cid').Value := inCID;
spNewNakl.ParamByName('in_nukl_type').Value := inNuklType;
 if not spNewNakl.Transaction.InTransaction then
 spNewNakl.Transaction.StartTransaction;
spNewNakl.ExecProc;
Result:=spNewNakl.Params[0].Value;
 if spNewNakl.Transaction.InTransaction then
spNewNakl.Transaction.Commit;
end;

procedure TcoServerTask.smDeleteNakl(inID: Integer);
begin
  spDeleteNakl.Params[0].Value:=inID;

 if not spDeleteNakl.Transaction.InTransaction then
 spdeleteNakl.Transaction.StartTransaction;
spDeleteNakl.ExecProc;

 if spDeleteNakl.Transaction.InTransaction then
spDeleteNakl.Transaction.Commit;
end;

procedure TcoServerTask.smNewInfo(inNID, inPID: Integer; inKolvo,
  inTotal: Single);
begin
   spNewInfo.Params[0].Value:=inNID;
spNewInfo.Params[1].Value:=inPID;
spNewInfo.Params[2].Value:=inKolvo;
spNewInfo.Params[3].Value:=inTotal;
 if not spNewInfo.Transaction.InTransaction then
 spNewInfo.Transaction.StartTransaction;
spNewInfo.ExecProc;
 if spNewInfo.Transaction.InTransaction then
spNewInfo.Transaction.Commit;
end;

procedure TcoServerTask.smDeleteInfo(inNID, inPID: Integer);
begin
spDeleteInfo.Params[0].Value:=inNID;
spDeleteInfo.Params[1].Value:=inPID;

if not spDeleteInfo.Transaction.InTransaction then
 spdeleteInfo.Transaction.StartTransaction;
spDeleteInfo.ExecProc;

 if spDeleteInfo.Transaction.InTransaction then
spDeleteInfo.Transaction.Commit;
end;

procedure TcoServerTask.smQueryAdd(const Param1: WideString);
begin
IBQuery1.SQL.Add(Param1);
end;

procedure TcoServerTask.smQueryClear;
begin
 IBQuery1.SQL.Clear;
end;

procedure TcoServerTask.smEditPrice(inNID, inPID, inCID: Integer;
  inTotal: Single);
begin
spEditPrice.ParamByName('in_nid').Value:=inNID;
spEditPrice.ParamByName('in_pid').Value:=inPID;
spEditPrice.ParamByName('in_cid').Value:=inCID;

spEditPrice.ParamByName('in_total').Value:=inTotal;

 if not spEditPrice.Transaction.InTransaction then
 spEditPrice.Transaction.StartTransaction;
spEditPrice.ExecProc;

 if spEditPrice.Transaction.InTransaction then
spEditPrice.Transaction.Commit;
end;

function TcoServerTask.smNewPay(inNID1: Integer; inData: TDateTime;
  inPay: Single; inPID1, inKOLOUT: Integer): Integer;
begin
 spNewPay.Params[1].Value:=inNID1;
  spNewPay.Params[2].Value:=inData;
   spNewPay.Params[3].Value:=inPay;
  spNewPay.Params[4].Value:=inPID1;
  spNewPay.Params[5].Value:=inKOLOUT;
 if not spNewPay.Transaction.InTransaction then
 spNewPay.Transaction.StartTransaction;
spNewPay.ExecProc;
Result:=spNewPay.Params[0].Value;
 if spNewPay.Transaction.InTransaction then
spNewPay.Transaction.Commit;
end;

procedure TcoServerTask.smDeletePay(inID, inNID1, inPID1: Integer);
begin

spDeletePay.Params[0].Value:=inID;
spDeletePay.Params[1].Value:=inNID1;
spDeletePay.Params[2].Value:=inPID1;

if not spDeletePay.Transaction.InTransaction then
 spdeletePay.Transaction.StartTransaction;
spDeletePay.ExecProc;

 if spDeletePay.Transaction.InTransaction then
spDeletePay.Transaction.Commit;
end;

function TcoServerTask.smNewPeople(const inName: WideString): Integer;
begin
 spNewPeople.Params[1].Value:=inName;
 if not spNewPeople.Transaction.InTransaction then
 spNewPeople.Transaction.StartTransaction;
spNewPeople.ExecProc;
Result:=spNewPeople.Params[0].Value;
 if spNewPeople.Transaction.InTransaction then
spNewPeople.Transaction.Commit;
end;

procedure TcoServerTask.smEditPeople(inID: Integer;
  const inName: WideString);
begin
  spEditPeople.ParamByName('in_id').Value:=inID;
spEditPeople.ParamByName('in_name').Value:=inName;

 if not spEditPeople.Transaction.InTransaction then
 spEditPeople.Transaction.StartTransaction;
spEditPeople.ExecProc;

 if spEditPeople.Transaction.InTransaction then
spEditPeople.Transaction.Commit;
end;

procedure TcoServerTask.smDeletePeople(inID: Integer);
begin
  spDeletePeople.ParamByName('in_id').Value:=inID;

 if not spDeletePeople.Transaction.InTransaction then
 spdeletePeople.Transaction.StartTransaction;
spDeletePeople.ExecProc;

 if spDeletePeople.Transaction.InTransaction then
spDeletePeople.Transaction.Commit;
end;

procedure TcoServerTask.smQueryNew(const Param1: WideString);
begin
 IBQuery2.SQL.Add(Param1);
end;

procedure TcoServerTask.smQueryDelete;
begin
  IBQuery2.SQL.Clear;
end;

initialization
  TComponentFactory.Create(ComServer, TcoServerTask,
    Class_coServerTask, ciMultiInstance, tmSingle);
end.
