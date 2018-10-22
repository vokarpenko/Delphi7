unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB;

type
  TtProducts = class(TForm)
    MainMenu1: TMainMenu;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tProducts: TtProducts;

implementation

{$R *.dfm}

procedure TtProducts.N2Click(Sender: TObject);
begin
Close;
end;

procedure TtProducts.N3Click(Sender: TObject);
begin
      fNewProduct:=TfNewProduct.Create(Application);
fNewProduct.edtName.Text:=dm.cdsProductNAME.value;
fNewProduct.edtMesure.Text:=dm.cdsProductMESURE.value;
fNewProduct.edtPrice.Text:=dm.cdsProductPRICE.AsVariant;
fNewProduct.ShowModal;
if fNewProduct.ModalResult=mrOK then
begin
dm.DCOMConnection1.AppServer.smEditProduct(dm.cdsProductID.Value,
      fNewProduct.edtName.Text, fNewProduct.edtMesure.Text, fNewProduct.edtPrice.Text);
      dm.cdsProduct.RefreshRecord;
end;
fNewProduct.Release;
end;

end.
