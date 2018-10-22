unit newPeople;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfNewPeople = class(TForm)
    edtName: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewPeople: TfNewPeople;

implementation

{$R *.dfm}

procedure TfNewPeople.FormActivate(Sender: TObject);
begin
//edtName.clear;
end;

procedure TfNewPeople.edtNameChange(Sender: TObject);
begin
 BitBtn1.Enabled := edtName.Text <> '';
end;

end.
