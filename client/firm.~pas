unit firm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfFirm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    eName: TEdit;
    eAddress: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure eNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFirm: TfFirm;

implementation

{$R *.dfm}

procedure TfFirm.eNameChange(Sender: TObject);
begin
  BitBtn1.Enabled := (eName.Text<>'') and (eAddress.Text<>'');
end;

end.
