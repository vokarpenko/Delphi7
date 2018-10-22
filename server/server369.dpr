program server369;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  server372_TLB in 'server372_TLB.pas',
  server370 in 'server370.pas' {coServer370: TRemoteDataModule} {coServer372: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
