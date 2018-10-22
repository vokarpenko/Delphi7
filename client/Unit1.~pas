unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfNewInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtProduct: TEdit;
    edtKol: TEdit;
    edtSum: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Label3: TLabel;
    edtPrice: TEdit;
    procedure edtProductChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtKolChange(Sender: TObject);
    procedure edtSumChange(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewInfo: TfNewInfo;

implementation

uses product, mydm, cls, people;

{$R *.dfm}

procedure TfNewInfo.edtProductChange(Sender: TObject);
begin
  BitBtn1.Enabled := (edtSum.Text <> '') and (edtProduct.Text <> '')
  and (edtKol.Text <> '');
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

procedure TfNewInfo.FormActivate(Sender: TObject);
begin
  edtProduct.Clear;
  edtKol.Clear;
  edtSum.Clear;
end;

procedure TfNewInfo.edtKolChange(Sender: TObject);
begin
if edtKol.Focused then
  begin
    if dm.CheckFloat(edtPrice.Text) and
    (dm.CheckFloat(edtKol.Text)) then
      edtSum.Text := FloatToStrF(StrToFloat(edtPrice.Text)*StrToFloat(edtKol.Text),
      ffFixed,15,2)
    else
      edtSum.Text := '';
  end;
  edtProductChange(nil);
end;

procedure TfNewInfo.edtSumChange(Sender: TObject);
begin
   if edtSum.Focused then
  begin
    if dm.CheckFloat(edtSum.Text) and
    (dm.CheckFloat(edtKol.Text)) and (StrToFloat(edtKol.Text) <> 0) then
      edtPrice.Text := FloatToStrF(StrToFloat(edtSum.Text)/StrToFloat(edtKol.Text),
      ffFixed,15,2)
    else
      edtPrice.Text := '';
  end;
  edtProductChange(nil);
end;

procedure TfNewInfo.edtPriceChange(Sender: TObject);
begin
if edtPrice.Focused then
  begin
    if dm.CheckFloat(edtPrice.Text) and
    (dm.CheckFloat(edtKol.Text)) then
      edtSum.Text := FloatToStrF(StrToFloat(edtPrice.Text)*StrToFloat(edtKol.Text),
      ffFixed,15,2)
    else
      edtSum.Text := '';
  end;
  edtProductChange(nil);
end;

end.
