unit newInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfNewInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNakl: TEdit;
    edtProduct: TEdit;
    edtKol: TEdit;
    edtTotal: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewInfo: TfNewInfo;

implementation

{$R *.dfm}

end.
