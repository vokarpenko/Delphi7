unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids;

type
  TClientRpt = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    lbName: TListBox;
    lbID: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientRpt: TClientRpt;
  MSW,XL,Table:variant;

implementation

uses cls, mydm, people, ComObj;

{$R *.dfm}

procedure TClientRpt.FormActivate(Sender: TObject);
begin
 DateTimePicker2.Date := now;
end;

procedure TClientRpt.Button2Click(Sender: TObject);
begin
 fPeople.ShowModal;
  if dm.cdsPeople.FindKey([fPeople.ID]) then
  begin
    lbName.Items.Add(dm.cdsPeopleNAME.AsString);
    lbID.items.Add(dm.cdsPeopleID.asString);
  end;
end;

procedure TClientRpt.Button1Click(Sender: TObject);
begin
  lbName.Items.Clear;
  lbID.Items.Clear;
end;

procedure TClientRpt.Button3Click(Sender: TObject);
var dx,colX,x,y,y1,l,i:integer;
max:single;
cl: Tcolor;
s: string;
XL: variant;
begin
  dm.DCOMConnection1.AppServer.smQueryDelete;
  dm.cdsQuery2.Close;

  dm.DCOMConnection1.AppServer.smQueryNew(
  'select * from report2('''+DateToStr(DateTimePicker1.Date)+''','''+
   DateToStr(DateTimePicker2.Date) + ''')');

   dm.DCOMConnection1.AppServer.smQueryNew('where out_id in(');
   if lbID.Count > 0 then
    begin
      for i := 0 to lbID.Count - 2 do
         dm.DCOMConnection1.AppServer.smQueryNew(lbID.Items[i] + ',');
      dm.DCOMConnection1.AppServer.smQueryNew(lbID.Items[lbID.Count - 1]);
    end;
    dm.DCOMConnection1.AppServer.smQueryNew(')');

    dm.cdsQuery2.Open;
   // if dm.cdsQuery.RecordCount <> 0 then
    //begin
    dm.cdsQuery2.Last;
    DataSource1.DataSet := dm.cdsQuery2;
    dm.cdsQuery2.First;
    max := 0;
    dm.cdsQuery2.Refresh;
  dm.cdsQuery2.FieldByName('OUT_ID').DisplayLabel := '�';
  dm.cdsQuery2.FieldByName('OUT_NAME').DisplayLabel := '������������';
  dm.cdsQuery2.FieldByName('OUT_INKOLVO').DisplayLabel := '���-�� ������ �������';
  dm.cdsQuery2.FieldByName('OUT_OUTKOLVO').DisplayLabel := '���-�� ����� �������';

  XL := CreateOleObject('Excel.Application');
  XL.Visible := true;
  XL.WorkBooks.Add;
  XL.Selection.Font.Size := 12;

  // ���� �������� ��������
  XL.WorkBooks[1].WorkSheets[1].Name := '�������� ���������';
  for l := 1 to 15 do
    XL.WorkBooks[1].WorkSheets[1].Rows[l].HorizontalAlignment := 3;

   // Style for first row
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Bold := True;
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Color := clBlack;
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Size := 16;
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Name := 'Times New Roman';

  //Style for second row
  XL.WorkBooks[1].WorkSheets[1].Rows[2].Font.Bold := True;
  XL.WorkBooks[1].WorkSheets[1].Rows[3].Font.Bold := True;
  //XL.WorkBooks[1].WorkSheets[1].Cells[4,1].Font.Bold := True;

  XL.WorkBooks[1].WorkSheets[1].Columns[1].ColumnWidth := 30;
  XL.WorkBooks[1].WorkSheets[1].Columns[2].ColumnWidth := 30;
  XL.WorkBooks[1].WorkSheets[1].Columns[3].ColumnWidth := 30;

  XL.WorkBooks[1].WorkSheets[1].Cells[1, 1] := '�������� ���������';
  XL.WorkBooks[1].WorkSheets[1].Range['A1:C1'].Merge;

  XL.WorkBooks[1].WorkSheets[1].Cells[2,1] := '����������';
  XL.WorkBooks[1].WorkSheets[1].Range['A2:C2'].Merge;

  XL.WorkBooks[1].WorkSheets[1].Cells[3,1] := ('������������ ������');
  XL.WorkBooks[1].WorkSheets[1].Cells[3,2] := ('���-�� �� ������ �������');
  XL.WorkBooks[1].WorkSheets[1].Cells[3,3] := ('���-�� �� ����� �������');

  dm.cdsQuery2.First;
  for l:=0 to dm.cdsQuery2.RecordCount - 1 do
  begin
    XL.WorkBooks[1].WorkSheets[1].Cells[l+4,1] := (dm.cdsQuery2.FieldByName('OUT_name').Asstring);
    XL.WorkBooks[1].WorkSheets[1].Cells[l+4,2] := (dm.cdsQuery2.FieldByName('OUT_INKOLVO').AsFloat);
    XL.WorkBooks[1].WorkSheets[1].Cells[l+4,3] := (dm.cdsQuery2.FieldByName('OUT_OUTKOLVO').AsFloat);
    dm.cdsQuery2.next;
  end;

  // ��������� ��������� �����
  XL.WorkBooks[1].WorkSheets[1].Range['A1:C'+
  IntToStr(dm.cdsQuery2.RecordCount + 3 )].Borders.LineStyle := 1;


end;

procedure TClientRpt.N1Click(Sender: TObject);
begin
Close;
end;

end.
