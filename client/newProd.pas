unit newProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfNewProduct = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    edtPrice: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure edtNameChange(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewProduct: TfNewProduct;

implementation

{$R *.dfm}

procedure TfNewProduct.edtNameChange(Sender: TObject);
begin
BitBtn1.Enabled:=(edtName.Text<>'') and (edtPrice.Text<>'');
end;

procedure TfNewProduct.edtPriceChange(Sender: TObject);
var
  s,s1: string;
  i:integer;
begin
s:=edtPrice.Text;
for i:=1 to Length(s) do
 if (s[i] in ['1'..'9']+['0'])
  then s1:=s1+s[i];
edtPrice.Text:=s1;
BitBtn1.Enabled:=(edtName.Text<>'') and (edtPrice.Text<>'');
end;

end.
