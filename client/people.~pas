unit people;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB;

type
  TfPeople = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID:integer;
  end;

var
  fPeople: TfPeople;

implementation

uses newPeople, mydm;

{$R *.dfm}

procedure TfPeople.N2Click(Sender: TObject);
begin
  fNewPeople:=TfNewPeople.Create(Application);
  fNewPeople.ShowModal;
  If fNewPeople.ModalResult = mrOk then
  begin
    dm.DCOMConnection1.AppServer.smNewPeople(fNewPeople.edtName.Text);
    dm.cdsPeople.Refresh;
  end;
  fNewPeople.Release;
end;

procedure TfPeople.FormActivate(Sender: TObject);
begin
 DataSource1.DataSet := dm.cdsPeople;
end;

procedure TfPeople.N3Click(Sender: TObject);
begin
  If MessageDlg('Удалить запись '+dm.cdsPeopleNAME.Value+'"?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    dm.DCOMConnection1.AppServer.smDeletePeople(dm.cdsPeopleID.Value);
    dm.cdsPeople.Refresh;
  end;
end;

procedure TfPeople.N4Click(Sender: TObject);
begin
  fNewPeople:=TfNewPeople.Create(Application);
  fNewPeople.edtName.Text := dm.cdsPeopleNAME.Value;
  fNewPeople.ShowModal;
  If fNewPeople.ModalResult = mrOk then
  begin
    dm.DCOMConnection1.AppServer.smEditPeople(dm.cdsPeopleID.Value,
    fNewPeople.edtName.Text);
    dm.cdsPeople.Refresh;
  end;
  fNewPeople.Release;
end;

procedure TfPeople.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ID := dm.cdsPeopleID.Value;
DataSource1.DataSet := nil;
end;

procedure TfPeople.N5Click(Sender: TObject);
begin
Close;
end;

end.
