unit nakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TnewNakl = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtNo: TEdit;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    edtCls: TEdit;
    Button2: TButton;
    Label3: TLabel;
    edtPeople: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure edtNoChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  newNakl: TnewNakl;

implementation

uses fms, mydm, cls, people;

{$R *.dfm}

procedure TnewNakl.FormCreate(Sender: TObject);
begin
 edtNo.Clear;
 edtCls.Clear;
 DateTimePicker1.Date := now;
end;

procedure TnewNakl.edtNoChange(Sender: TObject);
begin
 BitBtn1.Enabled := (edtNo.Text <> '');
end;

procedure TnewNakl.Button2Click(Sender: TObject);
begin
  fClients.ShowModal;
  if dm.cdsClients.FindKey([fClients.ID]) then
  begin
    edtCls.Text := dm.cdsClientsNAME.AsString;
    edtCls.Tag := dm.cdsClientsID.Value;
  end;
end;

procedure TnewNakl.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date := now;
end;

procedure TnewNakl.Button1Click(Sender: TObject);
begin
  fPeople.ShowModal;
  if dm.cdsPeople.FindKey([fPeople.ID]) then
  begin
    edtPeople.Text := dm.cdsPeopleNAME.AsString;
    edtPeople.Tag := dm.cdsPeopleID.Value;
  end;
end;

end.
