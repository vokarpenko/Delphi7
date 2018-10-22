unit server372_TLB;

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
// File generated on 23.12.2017 19:53:32 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Programms Install\FDB\������\server\server369.tlb (1)
// LIBID: {A79D7ED8-410E-4091-AFC0-2D2FA5A1E094}
// LCID: 0
// Helpfile: 
// HelpString: server372 Library
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
  server372MajorVersion = 1;
  server372MinorVersion = 0;

  LIBID_server372: TGUID = '{A79D7ED8-410E-4091-AFC0-2D2FA5A1E094}';

  IID_IcoServer372: TGUID = '{9F0C3FE1-358E-4C89-92CA-F9AAFFFB857C}';
  CLASS_coServer370: TGUID = '{563686EC-4403-4307-89FA-316929450B54}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IcoServer372 = interface;
  IcoServer372Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  coServer370 = IcoServer372;


// *********************************************************************//
// Interface: IcoServer372
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9F0C3FE1-358E-4C89-92CA-F9AAFFFB857C}
// *********************************************************************//
  IcoServer372 = interface(IAppServer)
    ['{9F0C3FE1-358E-4C89-92CA-F9AAFFFB857C}']
    function smNewFirm(const inName: WideString; const inAddress: WideString): Integer; safecall;
    procedure smEditFirm(inID: Integer; const inName: WideString; const inAddress: WideString); safecall;
    procedure smDeleteFirm(inID: Integer); safecall;
    function smNewProduct(const inName: WideString; inPrice: Single): Integer; safecall;
    procedure smEditProduct(inID: Integer; const inName: WideString; inPrice: Single); safecall;
    procedure smDeleteProduct(inID: Integer); safecall;
    function smNewNakl(inDate: TDateTime; const inNo: WideString; inFID: Integer; inType: Integer): Integer; safecall;
    procedure smDeleteNakl(inID: Integer); safecall;
    procedure smNewInfo(inNID: Integer; inPID: Integer; inCID: Integer; inKolvo: Single; 
                        inTotal: Single); safecall;
    procedure smDeleteInfo(inNID: Integer; inPID: Integer; inCID: Integer); safecall;
    procedure smQueryClear; safecall;
    procedure smQueryAdd(const Param1: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IcoServer372Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9F0C3FE1-358E-4C89-92CA-F9AAFFFB857C}
// *********************************************************************//
  IcoServer372Disp = dispinterface
    ['{9F0C3FE1-358E-4C89-92CA-F9AAFFFB857C}']
    function smNewFirm(const inName: WideString; const inAddress: WideString): Integer; dispid 301;
    procedure smEditFirm(inID: Integer; const inName: WideString; const inAddress: WideString); dispid 302;
    procedure smDeleteFirm(inID: Integer); dispid 303;
    function smNewProduct(const inName: WideString; inPrice: Single): Integer; dispid 304;
    procedure smEditProduct(inID: Integer; const inName: WideString; inPrice: Single); dispid 305;
    procedure smDeleteProduct(inID: Integer); dispid 306;
    function smNewNakl(inDate: TDateTime; const inNo: WideString; inFID: Integer; inType: Integer): Integer; dispid 307;
    procedure smDeleteNakl(inID: Integer); dispid 308;
    procedure smNewInfo(inNID: Integer; inPID: Integer; inCID: Integer; inKolvo: Single; 
                        inTotal: Single); dispid 309;
    procedure smDeleteInfo(inNID: Integer; inPID: Integer; inCID: Integer); dispid 310;
    procedure smQueryClear; dispid 311;
    procedure smQueryAdd(const Param1: WideString); dispid 312;
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
// The Class CocoServer370 provides a Create and CreateRemote method to          
// create instances of the default interface IcoServer372 exposed by              
// the CoClass coServer370. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocoServer370 = class
    class function Create: IcoServer372;
    class function CreateRemote(const MachineName: string): IcoServer372;
  end;

implementation

uses ComObj;

class function CocoServer370.Create: IcoServer372;
begin
  Result := CreateComObject(CLASS_coServer370) as IcoServer372;
end;

class function CocoServer370.CreateRemote(const MachineName: string): IcoServer372;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_coServer370) as IcoServer372;
end;

end.
