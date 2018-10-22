unit coServer;

interface

uses
  SysUtils, Classes, Provider, IBStoredProc, DB, IBCustomDataSet, IBTable,
  IBDatabase;

type
  TcoServerMyTask = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    tFirms: TIBTable;
    spNewFirm: TIBStoredProc;
    spEditFirm: TIBStoredProc;
    spDeleteFirm: TIBStoredProc;
    dspFirms: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  coServerMyTask: TcoServerMyTask;

implementation

{$R *.dfm}

end.
