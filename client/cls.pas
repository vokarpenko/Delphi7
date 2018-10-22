unit cls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, Menus;

type
  TfClients = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    N5: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    ID:integer;
  end;

var
  fClients: TfClients;

implementation

uses mydm, unitnewcls;

{$R *.dfm}

procedure TfClients.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet := dm.cdsClients;
  DBGrid1TitleClick(DBGrid1.Columns[1]);
end;

procedure TfClients.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ID := dm.cdsClientsID.Value;
DBGrid1TitleClick(DBGrid1.Columns[0]);
DataSource1.DataSet := nil;
end;

procedure TfClients.N2Click(Sender: TObject);
begin
  newCls:=TnewCls.Create(Application);
  newCls.ShowModal;
  If newCls.ModalResult = mrOk then
  begin
    dm.DCOMConnection1.AppServer.smNewClient(newCls.eName.Text,
    newCls.eNumber.Text);
    dm.cdsClients.Refresh;
  end;
  newCls.Release;
end;

procedure TfClients.N3Click(Sender: TObject);
begin
  If MessageDlg('Удалить запись '+dm.cdsClientsNAME.Value+'"?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    dm.DCOMConnection1.AppServer.smDeleteClient(dm.cdsClientsID.Value);
    dm.cdsClients.Refresh;
  end;
end;

procedure TfClients.N4Click(Sender: TObject);
begin
  newCls:=TnewCls.Create(Application);
  newCls.eName.Text := dm.cdsClientsNAME.Value;
  newCls.eNumber.Text := dm.cdsClientsADDRESS.Value;
  newCls.ShowModal;
  If newCls.ModalResult = mrOk then
  begin
    dm.DCOMConnection1.AppServer.smEditClient(dm.cdsClientsID.Value,
    newCls.eName.Text, newCls.eNumber.Text);
    dm.cdsClients.Refresh;
  end;
  newCls.Release;
end;

procedure TfClients.N5Click(Sender: TObject);
begin
Close;
end;

procedure TfClients.DBGrid1TitleClick(Column: TColumn);
begin
DBGrid1.Columns[0].Title.Font.Style:= [];
DBGrid1.Columns[1].Title.Font.Style:= [];
DBGrid1.Columns[2].Title.Font.Style:= [];
case Column.Index of
0: dm.cdsClients.IndexFieldNames := 'ID';
1: dm.cdsClients.IndexFieldNames := 'NAME;ID';
2: dm.cdsClients.IndexFieldNames := 'address;ID';
end;
Column.Title.Font.Style := [fsBold];
end;

end.
