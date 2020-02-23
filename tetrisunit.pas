unit tetrisunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Figure;
    procedure Keydowncheck(pKey:word);
type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Timer1: TTimer;
    Button4: TButton;
    Label1: TLabel;
    Button5: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Figure: TFigure;
  t:single=0.0;
  minyn:integer=640;
  score:integer=0;
  setx:integer=640;
  setkey:integer=2;
  Figurenumber:word;
  strin:string;
  key1:boolean=false;
  key2:boolean=true;
  key3:boolean=false;
  colors: array[1..8] of TColor=(clMaroon,clBlue,clYellow,clGreen,clPurple,clNavy,clSilver,clOlive);
implementation

{$R *.dfm}
procedure KeyDowncheck;
  begin
    with Form1 do
    case pkey of
   ord('A') : Figure.Motion(false);
   ord('D') : Figure.Motion(true);
   ord('S') : case Figurenumber of
                   1: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+91]=clWhite) and
                         (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                      then t:=t+0.4;
                   2: case Figure.turnkey mod 2 of
                           0: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+122,Figure.y+Figure.dy+51]=clWhite) and ((Figure.y+Figure.dy)<(setx-50))
                              then t:=t+0.4;
                           1: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+171]=clWhite) and ((Figure.y+Figure.dy)<(setx-170))
                              then t:=t+0.4;
                      end;
                   3: case Figure.turnkey mod 4 of
                           0: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+51]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           1: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+131]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+131]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                           2: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           3: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+131]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                      end;
                   4: case Figure.turnkey mod 4 of
                           0: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           1: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+131]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                           2: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+51]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           3: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+131]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                      end;
                   5: case Figure.turnkey mod 2 of
                           0: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           1: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+131]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                      end;
                   6: case Figure.turnkey mod 2 of
                           0: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+51]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           1: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+131]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                      end;
                   7: case Figure.turnkey mod 4 of
                           0: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+51]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           1: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+131]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+51]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                           2: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+2,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+91]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+91]=clWhite) and ((Figure.y+Figure.dy)<(setx-90))
                              then t:=t+0.4;
                           3: if (Image1.Canvas.Pixels[Figure.x+Figure.dx+42,Figure.y+Figure.dy+131]=clWhite) and
                                 (Image1.Canvas.Pixels[Figure.x+Figure.dx+82,Figure.y+Figure.dy+131]=clWhite) and ((Figure.y+Figure.dy)<(setx-130))
                              then t:=t+0.4;
                      end;
              end;
   ord('W') : Figure.Turn;
  end;
  end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  Label2.Hide;Label3.Hide;
  Label4.Hide;Label5.Hide;
  if key1 and key3 then begin
  Figure.Free;
  t:=0;
  end;
  key2:=true;
  randomize;
  Figurenumber:=random(7)+1;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Pen.Color:=clWhite;
  Image1.Canvas.Rectangle(0,0,480,setx);
  case Figurenumber of
       1:Figure:=TFigure1.Create(200,0,Image1,colors[random(8)+1]);
       2:Figure:=TFigure2.Create(160,0,Image1,colors[random(8)+1]);
       3:Figure:=TFigure3.Create(160,0,Image1,colors[random(8)+1]);
       4:Figure:=TFigure4.Create(160,0,Image1,colors[random(8)+1]);
       5:Figure:=TFigure5.Create(160,0,Image1,colors[random(8)+1]);
       6:Figure:=TFigure6.Create(160,0,Image1,colors[random(8)+1]);
       7:Figure:=TFigure7.Create(160,0,Image1,colors[random(8)+1]);
  end;
  key3:=true;
  Form1.Label1.Caption:='Ñ÷¸ò: 000';
  Score:=0;
  minyn:=setx;
  Form1.SetFocus;
  Timer1.Enabled:=true;
  key1:=true;
end;

procedure TForm1.Button1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
    KeyDowncheck(key);
  end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    if key2 then begin
      Timer1.Enabled:=false;
      key2:=false
      end
    else begin
    Timer1.Enabled:=true;
    key2:=true;
    Button1.Setfocus;
      end;
end;

procedure TForm1.Button2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDowncheck(key);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDowncheck(key);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Button4.Hide;
  Button1.Setfocus;
end;

procedure TForm1.Button4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDowncheck(key);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  setkey:=setkey+1;
  setx:=(setkey mod 6)*40 +560;
  if key3 then
    begin
      Figure.Free;
      key3:=false;
    end;
  Timer1.Enabled:=false;
  t:=0;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Pen.Color:=clWhite;
  Image1.Canvas.Rectangle(0,0,480,setx);
  Setting(setx);
  Form1.ClientHeight:=setx+90;
  Button1.Top:=setx+40;Button2.Top:=setx+40;
  Button3.Top:=setx+40;Button4.Top:=setx+40;
  Button5.Top:=setx+40;
  Label2.Show; Label3.Show; Label4.Show; Label5.Show;
  Image1.Height:=setx;
  Label2.Top:=209+(setkey mod 6)*20; Label3.Top:=258+(setkey mod 6)*20;
  Label4.Top:=307+(setkey mod 6)*20; Label5.Top:=356+(setkey mod 6)*20;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Pen.Color:=clWhite;
  Image1.Canvas.Rectangle(0,0,480,setx);
  key2:=true;
  Form1.Label1.Caption:='Ñ÷¸ò: 000';
  Score:=0;
  minyn:=setx;
  Form1.SetFocus;
  key1:=true;
  Button1.Setfocus;
end;

procedure TForm1.Button5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDowncheck(key);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Image1.Canvas.Brush.Color:=ClWhite;
  Image1.Height:=setx;
end;



procedure TForm1.Timer1Timer(Sender: TObject);
begin   
        Figure.Move(t);
        t:=t+0.4;
        if stop then begin
          if (Figure.y+Figure.dy)<minyn then
                       minyn:=Figure.y+Figure.dy;
          Figure.CheckandDel(0,minyn,score);
          str(score,strin);
          Label1.Caption:='Ñ÷¸ò: '+strin+'00';
          Figure.Free;
          t:=0; stop:=false;
          randomize;
          Figurenumber:=random(7)+1;
         case Figurenumber of
             1:Figure:=TFigure1.Create(200,0,Image1,colors[random(8)+1]);
             2:Figure:=TFigure2.Create(160,0,Image1,colors[random(8)+1]);
             3:Figure:=TFigure3.Create(160,0,Image1,colors[random(8)+1]);
             4:Figure:=TFigure4.Create(160,0,Image1,colors[random(8)+1]);
             5:Figure:=TFigure5.Create(160,0,Image1,colors[random(8)+1]);
             6:Figure:=TFigure6.Create(160,0,Image1,colors[random(8)+1]);
             7:Figure:=TFigure7.Create(160,0,Image1,colors[random(8)+1]);
         end;
         key3:=true;
        end;
end;

initialization

finalization
   if key3 then Figure.Free;

end.
