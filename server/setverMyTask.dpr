program setverMyTask;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  setverMyTask_TLB in 'setverMyTask_TLB.pas',
  server in 'server.pas' {coServerTask: TRemoteDataModule} {coServerTask: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
