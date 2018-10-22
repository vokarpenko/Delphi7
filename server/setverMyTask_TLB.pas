unit setverMyTask_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 16.05.2018 20:21:16 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\leha\server\setverMyTask.tlb (1)
// LIBID: {A2C69EF8-CC36-470B-8FED-5FFE3C5FEB0B}
// LCID: 0
// Helpfile: 
// HelpString: setverMyTask Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\SysWOW64\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  setverMyTaskMajorVersion = 1;
  setverMyTaskMinorVersion = 0;

  LIBID_setverMyTask: TGUID = '{A2C69EF8-CC36-470B-8FED-5FFE3C5FEB0B}';

  IID_IcoServerTask: TGUID = '{4D18B261-B14C-4CDE-8425-A4AC5C25D19D}';
  CLASS_coServerTask: TGUID = '{C55F3BDD-614D-4C50-B19C-47141F4E8920}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IcoServerTask = interface;
  IcoServerTaskDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  coServerTask = IcoServerTask;


// *********************************************************************//
// Interface: IcoServerTask
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4D18B261-B14C-4CDE-8425-A4AC5C25D19D}
// *********************************************************************//
  IcoServerTask = interface(IAppServer)
    ['{4D18B261-B14C-4CDE-8425-A4AC5C25D19D}']
    function smNewFirm(const inName: WideString; const inAddress: WideString): Integer; safecall;
    procedure smEditFirm(inID: Integer; const inName: WideString; const inAddress: WideString); safecall;
    procedure smDeleteFirm(inID: Integer); safecall;
    function smNewProduct(const inName: WideString; inPrice: Single): Integer; safecall;
    procedure smEditProduct(inID: Integer; const inName: WideString; inPrice: Single); safecall;
    procedure smDeleteProduct(inID: Integer); safecall;
    function smNewClient(const inName: WideString; const inAddress: WideString): Integer; safecall;
    procedure smEditClient(inID: Integer; const inName: WideString; const inAddress: WideString); safecall;
    procedure smDeleteClient(inID: Integer); safecall;
    function smNewNakl(const inNo: WideString; inDate: TDateTime; inCID: Integer; 
                       inNuklType: Integer; inPID: Integer): Integer; safecall;
    procedure smDeleteNakl(inID: Integer); safecall;
    procedure smNewInfo(inNID: Integer; inPID: Integer; inKolvo: Single; inTotal: Single); safecall;
    procedure smDeleteInfo(inNID: Integer; inPID: Integer); safecall;
    procedure smQueryAdd(const Param1: WideString); safecall;
    procedure smQueryClear; safecall;
    procedure smEditPrice(inNID: Integer; inPID: Integer; inCID: Integer; inTotal: Single); safecall;
    function smNewPay(inNID1: Integer; inData: TDateTime; inPay: Single; inPID1: Integer; 
                      inKolout: Integer): Integer; safecall;
    procedure smDeletePay(inID: Integer; inNID1: Integer; inPID1: Integer); safecall;
    function smNewPeople(const inName: WideString): Integer; safecall;
    procedure smEditPeople(inID: Integer; const inName: WideString); safecall;
    procedure smDeletePeople(inID: Integer); safecall;
    procedure smQueryNew(const Param1: WideString); safecall;
    procedure smQueryDelete; safecall;
  end;

// *********************************************************************//
// DispIntf:  IcoServerTaskDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4D18B261-B14C-4CDE-8425-A4AC5C25D19D}
// *********************************************************************//
  IcoServerTaskDisp = dispinterface
    ['{4D18B261-B14C-4CDE-8425-A4AC5C25D19D}']
    function smNewFirm(const inName: WideString; const inAddress: WideString): Integer; dispid 301;
    procedure smEditFirm(inID: Integer; const inName: WideString; const inAddress: WideString); dispid 302;
    procedure smDeleteFirm(inID: Integer); dispid 303;
    function smNewProduct(const inName: WideString; inPrice: Single): Integer; dispid 304;
    procedure smEditProduct(inID: Integer; const inName: WideString; inPrice: Single); dispid 305;
    procedure smDeleteProduct(inID: Integer); dispid 306;
    function smNewClient(const inName: WideString; const inAddress: WideString): Integer; dispid 307;
    procedure smEditClient(inID: Integer; const inName: WideString; const inAddress: WideString); dispid 308;
    procedure smDeleteClient(inID: Integer); dispid 309;
    function smNewNakl(const inNo: WideString; inDate: TDateTime; inCID: Integer; 
                       inNuklType: Integer; inPID: Integer): Integer; dispid 310;
    procedure smDeleteNakl(inID: Integer); dispid 311;
    procedure smNewInfo(inNID: Integer; inPID: Integer; inKolvo: Single; inTotal: Single); dispid 312;
    procedure smDeleteInfo(inNID: Integer; inPID: Integer); dispid 313;
    procedure smQueryAdd(const Param1: WideString); dispid 314;
    procedure smQueryClear; dispid 315;
    procedure smEditPrice(inNID: Integer; inPID: Integer; inCID: Integer; inTotal: Single); dispid 316;
    function smNewPay(inNID1: Integer; inData: TDateTime; inPay: Single; inPID1: Integer; 
                      inKolout: Integer): Integer; dispid 317;
    procedure smDeletePay(inID: Integer; inNID1: Integer; inPID1: Integer); dispid 318;
    function smNewPeople(const inName: WideString): Integer; dispid 319;
    procedure smEditPeople(inID: Integer; const inName: WideString); dispid 320;
    procedure smDeletePeople(inID: Integer); dispid 321;
    procedure smQueryNew(const Param1: WideString); dispid 322;
    procedure smQueryDelete; dispid 323;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CocoServerTask provides a Create and CreateRemote method to          
// create instances of the default interface IcoServerTask exposed by              
// the CoClass coServerTask. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocoServerTask = class
    class function Create: IcoServerTask;
    class function CreateRemote(const MachineName: string): IcoServerTask;
  end;

implementation

uses ComObj;

class function CocoServerTask.Create: IcoServerTask;
begin
  Result := CreateComObject(CLASS_coServerTask) as IcoServerTask;
end;

class function CocoServerTask.CreateRemote(const MachineName: string): IcoServerTask;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_coServerTask) as IcoServerTask;
end;

end.
