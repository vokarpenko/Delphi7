unit pay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfNewPay = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    eKol: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure eKolChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewPay: TfNewPay;

implementation

uses mydm;

{$R *.dfm}

procedure TfNewPay.Edit1Change(Sender: TObject);
begin
  BitBtn1.Enabled := (Edit1.Text <> '') and (eKol.Text <> '');
end;

procedure TfNewPay.FormActivate(Sender: TObject);
begin
 Edit1.Clear;
 DateTimePicker1.Date := Now;
end;

procedure TfNewPay.eKolChange(Sender: TObject);
begin
   if eKol.Focused then
  begin
    if (dm.CheckFloat(eKol.Text)) and (StrToFloat(eKol.Text) <> 0) then
      Edit1.Text := FloatToStrF(StrToFloat(eKol.Text)*dm.cdsInfoPRICE.asFloat,
      ffFixed,15,2)
    else
      Edit1.Text := '';
  end;
//  edtProductChange(nil);
end;

end.
