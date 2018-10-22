unit newInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfNewInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtProduct: TEdit;
    edtKol: TEdit;
    edtPrice: TEdit;
    edtSum: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Label5: TLabel;
    edtCls: TEdit;
    Button2: TButton;
    procedure edtProductChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewInfo: TfNewInfo;

implementation

uses product, mydm, cls;

{$R *.dfm}

procedure TfNewInfo.edtProductChange(Sender: TObject);
begin
  BitBtn1.Enabled := (edtPrice.Text <> '') and (edtCls.Text <> '') and (edtSum.Text <> '') and (edtProduct.Text <> '')
  and (edtKol.Text <> '')
end;

procedure TfNewInfo.Button1Click(Sender: TObject);
begin

tProducts.ShowModal;
  if dm.cdsProducts.FindKey([tProducts.ID]) then
  begin
    edtProduct.Text := dm.cdsProductsNAME.AsString;
    edtProduct.Tag := dm.cdsProductsID.Value;
    edtPrice.Text := dm.cdsProductsPRICE.AsString;
  end;
end;

procedure TfNewInfo.Button2Click(Sender: TObject);
begin
fClients.ShowModal;
  if dm.cdsClients.FindKey([fClients.ID]) then
  begin
    edtCls.Text := dm.cdsClientsNAME.AsString;
    edtCls.Tag := dm.cdsClientsID.Value;
  end;
end;

end.
