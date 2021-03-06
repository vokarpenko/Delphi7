unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB, Comobj, OLEserver, wordXP, ComCtrls;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N15: TMenuItem;
    dsNakl: TDataSource;
    dsInfo: TDataSource;
    dbgInfo: TDBGrid;
    Word2: TMenuItem;
    N12: TMenuItem;
    N2: TMenuItem;
    N16: TMenuItem;
    TabControl1: TTabControl;
    dbgNakl: TDBGrid;
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgNaklTitleClick(Column: TColumn);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure Word2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure dbgInfoTitleClick(Column: TColumn);
    procedure Excel1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  fmMain: TfmMain;
    MSW,XL,Table:variant;

implementation

uses fms, product, cls, nakl, mydm, Unit1, Unit2, pay, people, Unit3;

{$R *.dfm}

procedure TfmMain.N4Click(Sender: TObject);
begin
Close;
end;

procedure TfmMain.N2Click(Sender: TObject);
begin
 ClientRpt.ShowModal;
end;

procedure TfmMain.N3Click(Sender: TObject);
begin
 tProducts.ShowModal;
end;

procedure TfmMain.N5Click(Sender: TObject);
begin
  fClients.ShowModal;
end;

procedure TfmMain.N7Click(Sender: TObject);
var id:integer;
begin
 NewNakl := TNewNakl.Create(Application);
 if TabControl1.TabIndex = 1 then
 begin
  NewNakl.Button2.Visible := false;
  newNakl.edtCls.Text := '<����� ������>';
  newNakl.edtCls.Enabled := false;
 end else
 begin
  NewNakl.Button1.Visible := false;
  newNakl.edtPeople.Text := '<��������� �������������>';
  newNakl.edtPeople.Enabled := false;
 end;

 newNakl.ShowModal;
 if newNakl.ModalResult = mrOk then
 begin
   id := dm.DCOMConnection1.AppServer.smNewNakl(
   newNakl.edtNo.text,
   newNakl.DateTimePicker1.Date,
   newNakl.edtPeople.Tag,
   1-2*TabControl1.TabIndex,
   newNakl.edtCls.Tag
   );
   dm.cdsNakl.Refresh;
   dm.cdsNakl.Locate('id',id,[]);
 end;
 newNakl.Release;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
 dsNakl.DataSet := dm.cdsNakl;

 dm.cdsInfo.MasterSource := dsNakl;
 dm.cdsInfo.MasterFields := 'ID';

 dsInfo.DataSet := dm.cdsInfo;

 //dm.cdsPay.MasterSource := dsNakl;
 //dm.cdsPay.MasterFields := 'ID';
// dsPay.DataSet := dm.cdsPay;

 dbgNaklTitleClick(dbgNakl.Columns[0]);

 dm.cdsNaklcName.Visible := TabControl1.TabIndex = 1;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.cdsInfo.MasterFields := '';
 dm.cdsInfo.MasterSource := nil;
end;

procedure TfmMain.dbgNaklTitleClick(Column: TColumn);
begin
 dbgNakl.Columns[0].Title.Font.Style:= [];
  dbgNakl.Columns[1].Title.Font.Style := [];
  dbgNakl.Columns[2].Title.Font.Style := [];
  dbgNakl.Columns[3].Title.Font.Style := [];
  dbgNakl.Columns[4].Title.Font.Style := [];
  case Column.Index of
  0: dm.cdsNakl.IndexFieldNames := 'NUKL_TYPE;DATA;ID';
  1: dm.cdsNakl.IndexFieldNames := 'NUKL_TYPE;NUMBER;DATA;ID';
  end;
  Column.Title.Font.Style := [fsBold];
  TabControl1Change(nil);
end;

procedure TfmMain.N10Click(Sender: TObject);
begin
  fNewInfo := TfNewInfo.Create(Application);
  fnewInfo.ShowModal;
  if fNewInfo.ModalResult = mrOk then
  begin
    dm.DCOMConnection1.AppServer.
    smNewInfo(dm.cdsNaklID.Value,
     fNewInfo.edtProduct.Tag,
     strToInt(fNewInfo.edtKol.Text),
     strToFloat(fNewInfo.edtSum.Text));
     dm.cdsInfo.Refresh;
     dm.cdsPay.Refresh;
     dm.cdsNakl.Refresh;
  end;
  fNewInfo.Release;
end;

procedure TfmMain.N11Click(Sender: TObject);
begin
  if MessageDlg('������� ���������� '+
  dm.cdsInfopname.AsString
  +'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dm.DCOMConnection1.AppServer.smDeleteInfo(
    dm.cdsInfoNID.value,dm.cdsInfoPID.value);

    dm.cdsInfo.Refresh;
    dm.cdsNakl.Refresh;

  end;
end;

procedure TfmMain.N15Click(Sender: TObject);
begin
 frpt.ShowModal;
end;

procedure TfmMain.Word2Click(Sender: TObject);
var RC,CC,i,j,l,PayKol,NumColumns,NumRows,max:integer;
begin
if ( dm.cdsNakl.FieldByName('nukl_type').value = 1 ) then
begin

 MSW := CreateOleObject('Word.Application');
 MSW.Visible := true;
 MSW.Documents.Add;
 MSW.Selection.Font.Size := 12;
 MSW.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;

 MSW.ActiveDocument.Range.InsertAfter('��������� ����� ' + dm.cdsNaklNumber.AsString);
 MsW.Selection.EndKey (6);
 //�������� �������

  MsW.ActiveDocument.Tables.Add(MsW.ActiveDocument.Range(MSW.Selection.End,MSW.Selection.End),
  dbgInfo.DataSource.DataSet.RecordCount + 4, 4);
  //�� �������������� �������


  MSW.ActiveDocument.Tables.Item(1).Select;
  MSW.ActiveDocument.Tables.Item(1).Rows.Item(1).Select;//1�� ������
  MSW.ActiveDocument.Tables.Item(1).Cell(1,1).Range.Text := '����';
  MSW.ActiveDocument.Tables.Item(1).Cell(1,2).Range.Text := '�����';
  MSW.ActiveDocument.Tables.Item(1).Cell(1,3).Range.Text := '���-��';
  MSW.ActiveDocument.Tables.Item(1).Cell(1,4).Range.Text := '���������';

  Table:=MSW.ActiveDocument.Tables.Item(1);
  Table.Style:='����� �������';


  //Table.Cell(2,1).Range.InsertBefore(dm.cdsNaklNumber.AsString);
  Table.Cell(2,1).Range.InsertBefore(dm.cdsNakl.FieldByName('data').AsString);
  Table.Cell(2,2).Range.InsertBefore(dm.cdsNakl.FieldByName('summa').AsString);
  Table.Cell(2,3).Range.InsertBefore(dm.cdsNakl.FieldByName('ALL_kolvo').AsString);
  Table.Cell(2,4).Range.InsertBefore(dm.cdsNakl.FieldByName('pname').AsString);

  table.cell(3,1).Merge(table.cell(3,4));
  Table.Cell(3,1).Range.InsertBefore('����������');
  Table.Cell(4,1).Range.InsertBefore('������������ ������');
  Table.Cell(4,2).Range.InsertBefore('���-��');
  Table.Cell(4,3).Range.InsertBefore('�����');
  Table.Cell(4,4).Range.InsertBefore('����');

  dm.cdsInfo.First;
  for l:=0 to dm.cdsInfo.RecordCount - 1 do
  begin
    Table.Cell(l+5,1).Range.InsertBefore(dm.cdsInfo.FieldByName('pname').AsString);
    Table.Cell(l+5,2).Range.InsertBefore(dm.cdsInfo.FieldByName('kolvo').AsString);
    Table.Cell(l+5,3).Range.InsertBefore(dm.cdsInfo.FieldByName('total').AsString);
    Table.Cell(l+5,4).Range.InsertBefore(dm.cdsInfo.FieldByName('price').AsString);
    dm.cdsInfo.next;
  end;

  Table.Rows.Item(1).Select;
  msw.selection.Font.bold := 1;

  Table.Rows.Item(3).Select;
  msw.selection.Font.bold := 1;
  msw.selection.Font.Size := 15;

 // MSW.ActiveDocument.Range.InsertAfter('  ');
    //table.cell(1,7).Merge(table.cell(2,10));
    
  MSW.ActiveDocument.SaveAs('D:\ex.doc');
 end;
end;

procedure TfmMain.N12Click(Sender: TObject);
begin

    dm.DCOMConnection1.AppServer.smEditPrice(dm.cdsInfoNID.Value,
    dm.cdsInfoPID.Value,555);
    dm.cdsInfo.Refresh;
    dm.cdsNakl.RefreshRecord;

end;

procedure TfmMain.N8Click(Sender: TObject);
begin
  if MessageDlg('������� ���������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dm.DCOMConnection1.AppServer.smDeleteNakl(
    dm.cdsNaklID.value);
    dm.cdsNakl.Refresh;
  end;
end;

procedure TfmMain.N13Click(Sender: TObject);
begin
 { fNewPay := TfNewPay.Create(Application);
  fnewPay.ShowModal;
  if fNewPay.ModalResult = mrOk then
  if (strToFloat(fNewPay.edit1.text) + dm.cdsInfoSumPog.asFloat <= dm.cdsInfoTotal.asFloat )
  and (strToFloat(fNewPay.eKol.text) + dm.cdsInfoKolPog.asInteger <= dm.cdsInfoKolvo.asFloat )
   then
  begin
    dm.DCOMConnection1.AppServer.
    smNewPay(
     dm.cdsInfoNID.Value,
     fNewPay.DateTimePicker1.Date,
     strToFloat(fNewPay.edit1.text),
     dm.cdsInfoPID.Value,
     strToInt(fNewPay.eKol.text));
     dm.cdsPay.Refresh;
     dm.cdsNakl.Refresh; // ������� ���� ������
     dm.cdsInfo.Refresh; // ������� ���� ������
  end
  else
    MessageDlg('����� ����� �� ������ ��������� ����� � ������',mtError,[mbOk],0);
  fNewPay.Release; }
end;

procedure TfmMain.N16Click(Sender: TObject);
begin
 fPeople.ShowModal;
end;

procedure TfmMain.dbgInfoTitleClick(Column: TColumn);
begin
  dbgInfo.Columns[0].Title.Font.Style:= [];
  dbgInfo.Columns[1].Title.Font.Style := [];
  dbgInfo.Columns[2].Title.Font.Style := [];
  dbgInfo.Columns[3].Title.Font.Style := [];
  //dbgInfo.Columns[4].Title.Font.Style := [];
 // dbgInfo.Columns[5].Title.Font.Style := [];
  //dbgInfo.Columns[6].Title.Font.Style := [];
 //case Column.Index of
  //2: dm.cdsInfo.IndexFieldNames := 'kolvo;NID;PID';
// 3: dm.cdsInfo.IndexFieldNames := 'total;NID;PID';
  {0: dm.cdsInfo.IndexFieldNames := 'NID;PID';
  1: dm.cdsInfo.IndexFieldNames := 'kolvo;NID';
  2: dm.cdsInfo.IndexFieldNames := 'total;kolvo;NID';
  3: dm.cdsInfo.IndexFieldNames := 'kolvo;total;NID';
  //5: dm.cdsInfo.IndexFieldNames := 'inSumma;ID';
  end;                                 }
  Column.Title.Font.Style := [fsBold];
end;

procedure TfmMain.Excel1Click(Sender: TObject);
var l, payKol, max: integer;
begin

 XL := CreateOleObject('Excel.Application');
 XL.Visible := true;
 XL.WorkBooks.Add;
 XL.Selection.Font.Size := 12;

 l := 0;
  dm.cdsPay.First;
  while ( not dm.cdsPay.eof ) do
  begin
    if ( dm.cdsPay.FieldByName('NID1').value = dm.cdsNakl.FieldByName('ID').value ) then
      inc(l);
    dm.cdsPay.next;
  end;

  if dbgInfo.DataSource.DataSet.RecordCount >= l then
    max := dbgInfo.DataSource.DataSet.RecordCount
  else
    max := l;

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
  XL.WorkBooks[1].WorkSheets[1].Cells[4,1].Font.Bold := True;

  XL.WorkBooks[1].WorkSheets[1].Cells[1, 4] := '�������� ���������';
  XL.WorkBooks[1].WorkSheets[1].Range['A1:F1'].Merge;

  XL.WorkBooks[1].WorkSheets[1].Columns[1].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[2].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[4].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[6].ColumnWidth := 15;
  XL.WorkBooks[1].WorkSheets[1].Columns[8].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[9].ColumnWidth := 15;

  XL.WorkBooks[1].WorkSheets[1].Cells[2,1] := '����';
  XL.WorkBooks[1].WorkSheets[1].Cells[2,2] := '��� �������';
  XL.WorkBooks[1].WorkSheets[1].Cells[2,3] := '�����';
  XL.WorkBooks[1].WorkSheets[1].Cells[2,4] := '����� ���������';
  XL.WorkBooks[1].WorkSheets[1].Cells[2,5] := '�����';
  XL.WorkBooks[1].WorkSheets[1].Cells[2,6] := '����� ���������';

  XL.WorkBooks[1].WorkSheets[1].Cells[3,1] := (dm.cdsNakl.FieldByName('data').AsString);
  XL.WorkBooks[1].WorkSheets[1].Cells[3,2] := (dm.cdsNakl.FieldByName('cname').AsString);
  XL.WorkBooks[1].WorkSheets[1].Cells[3,3] := (dm.cdsNakl.FieldByName('summa').AsString);
  XL.WorkBooks[1].WorkSheets[1].Cells[3,4] := (dm.cdsNakl.FieldByName('allSumPog').AsString);
  XL.WorkBooks[1].WorkSheets[1].Cells[3,5] := (dm.cdsNakl.FieldByName('ALL_kolvo').AsString);
  XL.WorkBooks[1].WorkSheets[1].Cells[3,6] :=(dm.cdsNakl.FieldByName('ALLKOLPOG').AsString);

  XL.WorkBooks[1].WorkSheets[1].Cells[4,1] := '����������';
  XL.WorkBooks[1].WorkSheets[1].Range['A4:F4'].Merge;

  XL.WorkBooks[1].WorkSheets[1].Cells[5,1] := ('������������ ������');
  XL.WorkBooks[1].WorkSheets[1].Cells[5,2] := ('����');
  XL.WorkBooks[1].WorkSheets[1].Cells[5,3] := ('���-��');
  XL.WorkBooks[1].WorkSheets[1].Cells[5,4] := ('�����');
  XL.WorkBooks[1].WorkSheets[1].Cells[5,5] := ('���������');
  XL.WorkBooks[1].WorkSheets[1].Cells[5,6] := ('��������');

  dm.cdsInfo.First;
  for l:=0 to dm.cdsInfo.RecordCount - 1 do
  begin
    XL.WorkBooks[1].WorkSheets[1].Cells[l+5,1] := (dm.cdsInfo.FieldByName('pname').AsString);
    XL.WorkBooks[1].WorkSheets[1].Cells[l+5,2] := (dm.cdsInfo.FieldByName('price').AsString);
    XL.WorkBooks[1].WorkSheets[1].Cells[l+5,3] := (dm.cdsInfo.FieldByName('kolvo').AsString);
    XL.WorkBooks[1].WorkSheets[1].Cells[l+5,4] := (dm.cdsInfo.FieldByName('total').AsString);
    XL.WorkBooks[1].WorkSheets[1].Cells[l+5,5] := (dm.cdsInfo.FieldByName('KOLPOG').AsString);
    XL.WorkBooks[1].WorkSheets[1].Cells[l+5,6] := (dm.cdsInfo.FieldByName('SUMPOG').AsString);
    dm.cdsInfo.next;
  end;

  XL.WorkBooks[1].WorkSheets[1].Range['H1:K1'].Merge;;
  XL.WorkBooks[1].WorkSheets[1].Cells[1,8] := ('�������');

  XL.WorkBooks[1].WorkSheets[1].Cells[2,8] := ('������������ ������');
  XL.WorkBooks[1].WorkSheets[1].Cells[2,9] := ('����');
  XL.WorkBooks[1].WorkSheets[1].Cells[2,10] := ('��������');
  XL.WorkBooks[1].WorkSheets[1].Cells[2,11] := ('���-��');

  l := 0;
  payKol := 0;
  dm.cdsPay.First;
  while ( paykol < dm.cdsPay.RecordCount ) do
  begin
    if ( dm.cdsPay.FieldByName('NID1').value = dm.cdsNakl.FieldByName('ID').value ) then
    begin
      XL.WorkBooks[1].WorkSheets[1].Cells[l+3,8] :=(dm.cdsPay.FieldByName('pname').AsString);
      XL.WorkBooks[1].WorkSheets[1].Cells[l+3,9] :=(dm.cdsPay.FieldByName('data').AsString);
      XL.WorkBooks[1].WorkSheets[1].Cells[l+3,10] :=(dm.cdsPay.FieldByName('pay').AsString);
      XL.WorkBooks[1].WorkSheets[1].Cells[l+3,11] :=(dm.cdsPay.FieldByName('kolout').AsString);
      inc(l);
    end;
    inc(payKol);
    dm.cdsPay.next;
  end;

// ��������� ��������� �����
  XL.WorkBooks[1].WorkSheets[1].Range['A1:F' +
  IntToStr(dbgInfo.DataSource.DataSet.RecordCount + 4)].Borders.LineStyle := 1;

  XL.WorkBooks[1].WorkSheets[1].Range['H1:K' +IntToStr(
  l + 2)].Borders.LineStyle := 1;

  
end;

procedure TfmMain.N14Click(Sender: TObject);
begin
  if MessageDlg('������� �������� '+
  dm.cdsPayID1.asString
  +'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dm.DCOMConnection1.AppServer.smDeletePay(
    dm.cdsPayID1.value,dm.cdsPayNID1.value,dm.cdsPayPID1.value);

    dm.cdsPay.Refresh;
    dm.cdsInfo.Refresh;
    dm.cdsNakl.Refresh;

  end;
end;

procedure TfmMain.TabControl1Change(Sender: TObject);
begin
  dm.cdsNakl.SetRange([1-2*TabControl1.TabIndex],
  [1-2*TabControl1.TabIndex]);

  dm.cdsNaklpName.Visible := TabControl1.TabIndex = 0;
  dm.cdsNaklcName.Visible := TabControl1.TabIndex = 1;
end;

end.
