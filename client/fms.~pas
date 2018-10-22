unit fms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, Menus;

type
  TfFirms = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    ID: integer;
  end;

var
  fFirms: TfFirms;

implementation

uses mydm, firm;

{$R *.dfm}

procedure TfFirms.FormActivate(Sender: TObject);
begin
 DataSource1.DataSet := dm.cdsFirms;
 DBGrid1TitleClick(DBGrid1.Columns[1]);
end;

procedure TfFirms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ID := dm.cdsFirmsID.Value;
DBGrid1TitleClick(DBGrid1.Columns[0]);
DataSource1.DataSet := nil;
end;

procedure TfFirms.N5Click(Sender: TObject);
begin
Close;
end;

procedure TfFirms.N2Click(Sender: TObject);
begin
  fFirm:=TfFirm.Create(Application);
  fFirm.ShowModal;
  If fFirm.ModalResult = mrOk then
  begin
    dm.DCOMConnection1.AppServer.smNewFirm(fFirm.eName.Text,fFirm.eAddress.Text);
    dm.cdsFirms.Refresh;
  end;
  fFirm.Release;
end;

procedure TfFirms.N3Click(Sender: TObject);
begin
  If MessageDlg('Удалить запись '+dm.cdsFirmsNAME.Value+'"?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    dm.DCOMConnection1.AppServer.smDeleteFirm(dm.cdsFirmsID.Value);
    dm.cdsFirms.Refresh;
  end;
end;

procedure TfFirms.N4Click(Sender: TObject);
begin
  fFirm:=TfFirm.Create(Application);
  fFirm.eName.Text := dm.cdsFirmsNAME.Value;
  fFirm.eAddress.Text:= dm.cdsFirmsADDRESS.Value;
  fFirm.ShowModal;
  If fFirm.ModalResult = mrOk then
  begin
    dm.DCOMConnection1.AppServer.smEditFirm(dm.cdsFirmsID.Value,
    fFirm.eName.Text,fFirm.eAddress.Text);
    dm.cdsFirms.Refresh;
  end;
  fFirm.Release;
end;

procedure TfFirms.DBGrid1TitleClick(Column: TColumn);
begin
  DBGrid1.Columns[0].Title.Font.Style:= [];
  DBGrid1.Columns[1].Title.Font.Style := [];
  DBGrid1.Columns[2].Title.Font.Style:= [];
  case Column.Index of
  0: dm.cdsFirms.IndexFieldNames := 'ID';
  1: dm.cdsFirms.IndexFieldNames := 'NAME;ID';
  2: dm.cdsFirms.IndexFieldNames := 'address;ID';
  end;
  Column.Title.Font.Style := [fsBold];
end;

end.
