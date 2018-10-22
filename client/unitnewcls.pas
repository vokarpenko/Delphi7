unit unitnewcls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TnewCls = class(TForm)
    Label1: TLabel;
    eName: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    eNumber: TEdit;
    procedure eNameChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  newCls: TnewCls;

implementation

{$R *.dfm}

procedure TnewCls.eNameChange(Sender: TObject);
begin
 BitBtn1.Enabled := (eName.Text <> '') and (eNumber.Text <> '');
end;

procedure TnewCls.FormActivate(Sender: TObject);
begin

  //eName.clear;
 // eNumber.Clear;

end;

end.
