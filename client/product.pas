unit product;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB;

type
  TtProducts = class(TForm)
    MainMenu1: TMainMenu;
    Lfyyst1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    ID:integer;
  end;

var
  tProducts: TtProducts;

implementation

uses mydm, newProd;

{$R *.dfm}

procedure TtProducts.N4Click(Sender: TObject);
begin
Close;
end;

procedure TtProducts.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet:=dm.cdsProducts;
 DBGrid1TitleClick(DBGrid1.Columns[1]);
end;

procedure TtProducts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ID := dm.cdsProductsID.Value;
DBGrid1TitleClick(DBGrid1.Columns[0]);
DataSource1.DataSet:=nil;
end;

procedure TtProducts.N1Click(Sender: TObject);
begin
fNewProduct := TfNewProduct.Create(Application);
fNewProduct.ShowModal;
if fNewProduct.ModalResult=mrOK then
begin
dm.DCOMConnection1.AppServer.smNewProduct(
      fNewProduct.edtName.Text, fNewProduct.edtPrice.Text);
      dm.cdsProducts.Refresh;
end;
fNewProduct.Release;
end;

procedure TtProducts.N2Click(Sender: TObject);
begin
if MessageDlg('Удалить запись "'+
     dm.cdsProductsNAME.Value+'"?',
     mtConfirmation, [mbYes, mbNo],0)=mrYes then
   begin
     dm.DCOMConnection1.AppServer.smDeleteProduct(
         dm.cdsProductsID.value);
     dm.cdsProducts.Refresh;
   end;
end;

procedure TtProducts.N3Click(Sender: TObject);
begin
fNewProduct:=TfNewProduct.Create(Application);
fNewProduct.edtName.Text:=dm.cdsProductsNAME.value;
fNewProduct.edtPrice.Text:=dm.cdsProductsPRICE.AsVariant;
fNewProduct.ShowModal;
if fNewProduct.ModalResult=mrOK then
begin
dm.DCOMConnection1.AppServer.smEditProduct(dm.cdsProductsID.Value,
      fNewProduct.edtName.Text, fNewProduct.edtPrice.Text);
      dm.cdsProducts.RefreshRecord;
end;
fNewProduct.Release;
end;

procedure TtProducts.DBGrid1TitleClick(Column: TColumn);
begin
DBGrid1.Columns[0].Title.Font.Style:= [];
DBGrid1.Columns[1].Title.Font.Style:= [];
DBGrid1.Columns[2].Title.Font.Style:= [];
case Column.Index of
0: dm.cdsProducts.IndexFieldNames := 'ID';
1: dm.cdsProducts.IndexFieldNames := 'NAME;ID';
2: dm.cdsProducts.IndexFieldNames := 'PRICE;ID';
end;
Column.Title.Font.Style := [fsBold];
end;

end.
