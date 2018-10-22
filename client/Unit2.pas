unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, DB, Menus,DateUtils;

type
  TfRpt = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    lbName: TListBox;
    lbID: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRpt: TfRpt;

implementation

uses product, mydm, cls, fms, people;

{$R *.dfm}

procedure TfRpt.Button1Click(Sender: TObject);
begin
  lbName.Items.Clear;
  lbID.Items.Clear;
end;

procedure TfRpt.Button2Click(Sender: TObject);
begin
 fPeople.ShowModal;
  if dm.cdsPeople.FindKey([fPeople.ID]) then
  begin
    lbName.Items.Add(dm.cdsPeopleNAME.AsString);
    lbID.items.Add(dm.cdsPeopleID.asString);
  end;

 { fFirms.ShowModal;
  if dm.cdsFirms.FindKey([fFirms.ID]) then
  begin
    lbName.Items.Add(dm.cdsFirmsNAME.AsString);
    lbID.items.Add(dm.cdsFirmsID.asString);
  end;    }
  
end;

procedure TfRpt.Button3Click(Sender: TObject);
var dx,colX,x,y,y1,i,kol,kolRows:integer;
rasX:real;
max,sum:single;
cl: Tcolor;
s: string;
begin
  Image1.Picture := nil;
  Image2.Picture := nil;
  dm.DCOMConnection1.AppServer.smQueryClear;
  dm.cdsQuery.Close;

  dm.DCOMConnection1.AppServer.smQueryAdd(
  'select * from report1('''+DateToStr(DateTimePicker1.Date)+''','''+
   DateToStr(DateTimePicker2.Date) + ''')');

   dm.DCOMConnection1.AppServer.smQueryAdd('where out_id in(');
   if lbID.Count > 0 then
    begin
      for i := 0 to lbID.Count - 2 do
         dm.DCOMConnection1.AppServer.smQueryAdd(lbID.Items[i] + ',');
         dm.DCOMConnection1.AppServer.smQueryAdd(lbID.Items[lbID.Count - 1]);
    end;

   // ShowMessage(IntToStr(DBGrid2.DataSource.DataSet.RecordCount));

    dm.DCOMConnection1.AppServer.smQueryAdd(')');
    dm.cdsQuery.Open;
    dm.cdsQuery.Last;
    DataSource1.DataSet := dm.cdsQuery;
    dm.cdsQuery.First;
    max := 0;kol:=0;
    while not dm.cdsQuery.Eof do
    begin
      if max < dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat then
       max :=  dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat;
      inc(kol);
      dm.cdsQuery.Next;
    end;

    dx := 15;

    colx := (Image1.ClientWidth - 2 * dx - dm.cdsQuery.RecordCount * dx)
    div (2 * dm.cdsQuery.RecordCount);  // Ширина

    Image1.Canvas.Pen.Width := 3;
    Image1.Canvas.MoveTo(dx - Image1.Canvas.Pen.Width,dx);
    Image1.Canvas.LineTo(dx - Image1.Canvas.Pen.Width,Image1.ClientHeight-dx+image1.Canvas.Pen.Width div 2);
    Image1.Canvas.LineTo(Image1.clientWidth-dx,Image1.ClientHeight-dx+image1.Canvas.Pen.Width div 2);
    image1.Canvas.Pen.Width := 1;

    x := dx;
    {
    dm.cdsProducts.First;
    while not dm.cdsProducts.Eof do
    begin
      inc(kol);
      dm.cdsProducts.Next;
    end; }
    // УСтановка расстояния между объектами
    rasX := (Image1.clientWidth-2 * dx) / (kol * 1.2);

    image1.Canvas.Pen.Width := 1;
  {  dm.cdsProducts.First;
    while not dm.cdsProducts.Eof do
    begin
      //Белый цвет текста
      Image1.Canvas.Brush.Color := clWhite;
      s :=  dm.cdsProducts.FieldByName('name').AsString;
      Image1.canvas.TextOut(round(x+rasX),Image1.ClientHeight - 12,s);
      Image1.Canvas.Brush.Color := clBlack;
      Image1.Canvas.MoveTo(round(x+rasX),Image1.ClientHeight - 12);
      Image1.Canvas.LineTo(round(x+rasX),0);
      x := x + round(rasx);
      dm.cdsProducts.Next;
    end; }

    dm.cdsQuery.First;
    while not dm.cdsQuery.Eof do
    begin
      Image1.Canvas.Brush.Color := clWhite;
      s :=  dm.cdsQuery.FieldByName('out_name').AsString;
      Image1.canvas.TextOut(round(x+rasX),Image1.ClientHeight - 12,s);
      Image1.Canvas.Brush.Color := clBlack;
      Image1.Canvas.MoveTo(round(x+rasX),Image1.ClientHeight - 12);
      Image1.Canvas.LineTo(round(x+rasX),0);
      x := x + round(rasx);
      dm.cdsQuery.Next;
    end;

    x := dx; // x - текущий левый угол
    y1 := dx;
    y := Image1.ClientHeight - dx;

     image1.Canvas.Pen.Width := 2;
    dm.cdsQuery.First;
    while not dm.cdsQuery.Eof do
    begin
      Image1.Canvas.MoveTo(x,y);
      y := dx + round((Image1.ClientHeight - 2*dx) *
      (max - dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat)/max);//Расчитали высоту

      //Начинаем рисовать
      Randomize;
      cl := rgb(random(256),random(256),random(256));
      x := round(x + rasX);
      Image1.Canvas.Brush.Color := cl;
      Image1.Canvas.LineTo(x,y);
       //2

       //x := x + colX;
       Image1.Canvas.Brush.Color := clWhite;
       s := FloatToStrF(dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat,ffFixed,15,2);
       image1.canvas.TextOut(x - image1.Canvas.TextWidth(s), y - image1.Canvas.TextHeight(s),s);

     // y := dx + round((Image1.ClientHeight - 2*dx) *
    //  (max - dm.cdsQuery.FieldByName('OUT_outKOLVO').AsFloat)/max);//Расчитали высоту
     { x := x + colx;
      Image1.Canvas.Brush.Color := cl;
      Image1.Canvas.Rectangle(x,Image1.ClientHeight-dx,x+colX,y); }



      Image2.Canvas.Font.Color := cl;
      Image2.Canvas.TextOut(dx,y1,dm.cdsQuery.FieldByName('OUT_NAME').asString);

      y1 := y1 + 2 + Image2.Canvas.TextHeight(
          dm.cdsQuery.FieldByName('OUT_NAME').asString);

      dm.cdsQuery.Next;
    end;
end;

procedure TfRpt.N1Click(Sender: TObject);
begin
Close;
end;

procedure TfRpt.Button4Click(Sender: TObject);
var dx,colX,x,y,y1,i:integer;
max:single;
cl: Tcolor  ;
s: string;
begin


  dm.DCOMConnection1.AppServer.smQueryClear;
  dm.cdsQuery.Close;

  dm.DCOMConnection1.AppServer.smQueryAdd(
  'select * from report1('''+DateToStr(DateTimePicker1.Date)+''','''+
   DateToStr(DateTimePicker2.Date) + ''')');

   dm.DCOMConnection1.AppServer.smQueryAdd('where out_id in(');
   if lbID.Count > 0 then
    begin
      for i := 0 to lbID.Count - 2 do
         dm.DCOMConnection1.AppServer.smQueryAdd(lbID.Items[i] + ',');
         dm.DCOMConnection1.AppServer.smQueryAdd(lbID.Items[lbID.Count - 1]);
    end;
    dm.DCOMConnection1.AppServer.smQueryAdd(')');
    dm.cdsQuery.Open;
    dm.cdsQuery.Last;
    DataSource1.DataSet := dm.cdsQuery;
    dm.cdsQuery.First;
    max := 0;

    while not dm.cdsQuery.Eof do
    begin
      if max < dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat then
       max :=  dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat;
      dm.cdsQuery.Next;
    end;

    dx := 15;

    colx := (Image1.ClientWidth - 2 * dx - dm.cdsQuery.RecordCount * dx)
    div (2 * dm.cdsQuery.RecordCount);  // Ширина

    Image1.Canvas.Pen.Width := 3;
    Image1.Canvas.LineTo(dx - Image1.Canvas.Pen.Width,Image1.ClientHeight-dx+image1.Canvas.Pen.Width div 2);
    Image1.Canvas.LineTo(Image1.clientWidth-dx,Image1.ClientHeight-dx+image1.Canvas.Pen.Width div 2);
    image1.Canvas.Pen.Width := 2;
    Image1.Canvas.Rectangle(dx,Image1.ClientHeight-dx,30,Image1.ClientHeight-2*dx);

    x := dx; // x - текущий левый угол
    y1 := dx;

    Image1.Canvas.MoveTo(dx,Image1.ClientHeight-dx);
    dm.cdsQuery.First;
    while not dm.cdsQuery.Eof do
    begin

      y := dx + round((Image1.ClientHeight - 2*dx) *
      (max - dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat)/max);//Расчитали высоту

      //Начинаем рисовать
      Randomize;
      cl := rgb(random(256),random(256),random(256));
      x := x + dx;
      Image1.Canvas.Brush.Color := cl;
      Image1.Canvas.LineTo(x,y);
       //2

       {x := x + colX;
       Image1.Canvas.Brush.Color := clWhite;
       s := FloatToStrF(dm.cdsQuery.FieldByName('OUT_INKOLVO').AsFloat,ffFixed,15,2);
       image1.canvas.TextOut(x - image1.Canvas.TextWidth(s), y - image1.Canvas.TextHeight(s),s); }

      Image2.Canvas.Font.Color := cl;
      Image2.Canvas.TextOut(dx,y1,dm.cdsQuery.FieldByName('OUT_NAME').asString);

      y1 := y1 + 2 + Image2.Canvas.TextHeight(
          dm.cdsQuery.FieldByName('OUT_NAME').asString);

      dm.cdsQuery.Next;
    end;
end;

procedure TfRpt.FormActivate(Sender: TObject);
begin
 DateTimePicker2.Date := now;
end;

end.
