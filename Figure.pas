unit Figure;
interface
Uses graphics,ExtCtrls,Forms,Windows;
  Procedure Setting(asetx:integer);
  Type TFigure=class
  x,y,dx,dy:integer;
  turnkey:integer;
  Image:TImage;
  col:TColor;
  constructor Create(ax,ay:integer;aImage:TImage;acol:TColor);
  procedure Draw;virtual;abstract;
  Procedure NewDraw(x1,y1,x2,y2:integer);
  procedure Move(t:single);virtual;
  procedure Search(t:single);
  procedure Motion(flag:boolean);virtual;
  procedure Turn;virtual;
  function CheckandDel(yn,minyn:integer;Var score:integer):integer;virtual;
  end;
  Type TFigure1=class(TFigure)
  procedure Draw;override;
  procedure Move(t:single);override;
  procedure Motion(flag:boolean);override;
  Function CheckandDel(yn,minyn:integer;Var score:integer):integer;override;
  end;
  Type TFigure2=class(TFigure)
  procedure Draw;override;
  procedure Move(t:single);override;
  procedure Motion(flag:boolean);override;
  Function CheckandDel(yn,minyn:integer;Var score:integer):integer;override;
  procedure Turn;override;
  end;
  Type TFigure3=class(TFigure)
  procedure Draw;override;
  procedure Move(t:single);override;
  procedure Motion(flag:boolean);override;
  Function CheckandDel(yn,minyn:integer;Var score:integer):integer;override;
  procedure Turn;override;
  end;
  Type TFigure4=class(TFigure)
  procedure Draw;override;
  procedure Move(t:single);override;
  procedure Motion(flag:boolean);override;
  Function CheckandDel(yn,minyn:integer;Var score:integer):integer;override;
  procedure Turn;override;
  end;
  Type TFigure5=class(TFigure)
  procedure Draw;override;
  procedure Move(t:single);override;
  procedure Motion(flag:boolean);override;
  Function CheckandDel(yn,minyn:integer;Var score:integer):integer;override;
  procedure Turn;override;
  end;
  Type TFigure6=class(TFigure)
  procedure Draw;override;
  procedure Move(t:single);override;
  procedure Motion(flag:boolean);override;
  Function CheckandDel(yn,minyn:integer;Var score:integer):integer;override;
  procedure Turn;override;
  end;
  Type TFigure7=class(TFigure)
  procedure Draw;override;
  procedure Move(t:single);override;
  procedure Motion(flag:boolean);override;
  Function CheckandDel(yn,minyn:integer;Var score:integer):integer;override;
  procedure Turn;override;
  end;
  Var stop:boolean=false;
  setx:integer=640;
implementation
 Procedure Setting;
  begin
    setx:=asetx;
  end;
 Constructor TFigure.Create;
    Begin
       inherited Create;
       x:=ax; y:=ay; Image:=aImage; col:=acol;
       dx:=0;dy:=0; turnkey:=0;
    End;
   Procedure TFigure.NewDraw;
   begin
     Image.Canvas.Rectangle(x1,y1,x2,y2);
     Image.Canvas.Rectangle(x1+2,y1+2,x2-2,y2-2);
     Image.Canvas.Rectangle(x1+4,y1+4,x2-4,y2-4);
   end;
   Procedure TFigure.Move;
    Begin
       Image.Canvas.Pen.Color:=clWhite;
       Image.Canvas.Brush.Color:=clWhite;
       Draw;
       Image.Canvas.Pen.Color:=clBlack;
       Image.Canvas.Brush.Color:=col;
       Search(t);
       Draw;
       end;
   Procedure TFigure.Search;
    begin
       dy:=round(t*10);
    end;
   Procedure TFigure.Motion;
    begin
      Image.Canvas.Pen.Color:=clWhite;
      Image.Canvas.Brush.Color:=clWhite;
      Draw;
      if flag then
      dx:=dx+40
      else dx:=dx-40;
    end;
   Procedure TFigure.Turn;
    begin
      Image.Canvas.Pen.Color:=clWhite;
      Image.Canvas.Brush.Color:=clWhite;
      Draw;
      Image.Canvas.Pen.Color:=clBlack;
      Image.Canvas.Brush.Color:=col;
      turnkey:=turnkey+1;
      Draw;
    end;
   Function  TFigure.CheckandDel;
var
 count: word;
 i,j:integer;
    begin
      Image.Canvas.Pen.Color:=ClWhite;
      Image.Canvas.Brush.Color:=ClWhite;
      count:=0;
      for i := 1 to 12 do
        begin
          if Image.Canvas.Pixels[40*i-20,yn+20]<>clWhite then
            count:=count+1;
        end;
      if count=12 then
        begin
          for i := 1 to 12 do
            for j := yn div 40 downto minyn div 40 do
              begin
                Image.Canvas.Pen.Color:=Image.Canvas.Pixels[i*40-40,j*40-20];
                Image.Canvas.Brush.Color:=Image.Canvas.Pixels[i*40-20,j*40-20];
                NewDraw(i*40-40,j*40,i*40,j*40+40);
              end;
          minyn:=minyn+40;
          score:=score+1;
        end;
       Result:=minyn;
    end;
   Procedure TFigure1.Draw;
    begin
      NewDraw(x+dx,y+dy,x+dx+40,y+dy+40);
      NewDraw(x+dx,y+dy+40,x+dx+40,y+dy+80);
      NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
      NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
    end;
   Procedure TFigure1.Move;
    begin
      if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+78,y+dy+82]=clWhite)then
      inherited Move(t)
      else stop:=true;
    end;
   Procedure TFigure1.Motion;
    begin
      if (Image.Canvas.Pixels[x+dx-2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+84]=clWhite) and
         (Image.Canvas.Pixels[x+dx-2,y+dy+40]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+72]=clWhite)
          and (dx>-200) and (not flag)
      then inherited Motion(flag);
      if (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+84]=clWhite) and
         (Image.Canvas.Pixels[x+dx+82,y+dy+40]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+72]=clWhite)
          and (dx<200) and flag
      then inherited Motion(flag);
    end;
   Function  TFigure1.CheckandDel;
    begin
      inherited CheckandDel(y+dy,minyn,score);
      inherited CheckandDel(y+dy+40,minyn,score);
      Result:=minyn;
    end;
   Procedure TFigure2.Draw;
    begin
      case turnkey mod 2 of
           0:begin NewDraw(x+dx,y+dy,x+dx+160,y+dy+40);
                   NewDraw(x+dx,y+dy,x+dx+40,y+dy+40);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx+120,y+dy,x+dx+160,y+dy+40);
             end;
           1:begin NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+40,y+dy+80,x+dx+80,y+dy+120);
                   NewDraw(x+dx+40,y+dy+120,x+dx+80,y+dy+160);
             end;
      end;
    end;
   Procedure TFigure2.Move;
    begin
      case turnkey mod 2 of
           0:if (dy<(setx-40)) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+42]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite)
             then inherited Move(t)
             else stop:=true;
           1:if (dy<(setx-160)) and (Image.Canvas.Pixels[x+dx+42,y+dy+162]=clWhite)
             then inherited Move(t)
             else stop:=true;
      end;
    end;
   Procedure TFigure2.Motion;
    begin
      case turnkey mod 2 of
           0:begin if (Image.Canvas.Pixels[x+dx-2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+38]=clWhite) and
                      (Image.Canvas.Pixels[x+dx-2,y+dy+44]=clWhite) and (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+162,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+162,y+dy+38]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+162,y+dy+44]=clWhite) and (dx<160) and (flag)
                   then inherited Motion(flag); end;
           1:begin if      (Image.Canvas.Pixels[x+dx+38,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+40]=clWhite)
                       and (Image.Canvas.Pixels[x+dx+38,y+dy+78]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+116]=clWhite)
                       and (Image.Canvas.Pixels[x+dx+38,y+dy+154]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+164]=clWhite)
                       and (dx>-220) and (not flag)
                   then inherited Motion(flag);
                   if      (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+40]=clWhite)
                       and (Image.Canvas.Pixels[x+dx+82,y+dy+78]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+116]=clWhite)
                       and (Image.Canvas.Pixels[x+dx+82,y+dy+154]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+164]=clWhite)
                       and (dx<220) and flag
                   then inherited Motion(flag); end;
      end;
    end;
   Procedure TFigure2.Turn;
    begin
      case turnkey mod 2 of
        0:if (Image.Canvas.Pixels[x+dx+50,y+dy+78]=clWhite) and (Image.Canvas.Pixels[x+dx+50,y+dy+117]=clWhite) and
             (Image.Canvas.Pixels[x+dx+50,y+dy+150]=clWhite) and (Image.Canvas.Pixels[x+dx+50,y+dy+162]=clWhite)
          then inherited Turn;
        1:if (Image.Canvas.Pixels[x+dx-2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+90,y+dy+42]=clWhite) and
             (Image.Canvas.Pixels[x+dx+130,y+dy+42]=clWhite)
          then inherited Turn;
      end;

    end;
   Function  TFigure2.CheckandDel;
    begin
      if turnkey mod 2=0 then
          Inherited CheckandDel(y+dy,minyn,score)
      else
        begin
          Inherited CheckandDel(y+dy,minyn,score);
          Inherited CheckandDel(y+dy+40,minyn,score);
          Inherited CheckandDel(y+dy+80,minyn,score);
          Inherited CheckandDel(y+dy+120,minyn,score);
        end;
      Result:=minyn;
    end;
   Procedure TFigure3.Draw;
    begin
      case turnkey mod 4 of
           0:begin NewDraw(x+dx,y+dy,x+dx+40,y+dy+40);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx,y+dy+40,x+dx+40,y+dy+80);
             end;
          1:begin  NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+40,y+dy+80,x+dx+80,y+dy+120);
                   NewDraw(x+dx+80,y+dy+80,x+dx+120,y+dy+120);
             end;
           2:begin NewDraw(x+dx,y+dy+40,x+dx+40,y+dy+80);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
             end;
           3:begin NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
                   NewDraw(x+dx+80,y+dy+80,x+dx+120,y+dy+120);
             end;
      end;
    end;
   Procedure TFigure3.Move;
    begin
      case turnkey mod 4 of
           0:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+42]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite)
             then inherited Move(t)
             else stop:=true;
           1:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite)
             then inherited Move(t)
             else stop:=true;
           2:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
             then inherited Move(t)
             else stop:=true;
           3:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite)
             then inherited Move(t)
             else stop:=true;
      end;
    end;
   Procedure TFigure3.Motion;
    begin
      case turnkey mod 4 of
          0:begin if (Image.Canvas.Pixels[x+dx-2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+38]=clWhite) and
                      (Image.Canvas.Pixels[x+dx-2,y+dy+78]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+84]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+42,y+dy+44]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+84]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+44]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+44]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           1:begin if (Image.Canvas.Pixels[x+dx+38,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+38,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+122]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+78,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+118,y+dy+122]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+126]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
           2:begin if (Image.Canvas.Pixels[x+dx-2,y+dy+38]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+78]=clWhite) and
                      (Image.Canvas.Pixels[x+dx-2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+78,y+dy+2]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           3:begin if (Image.Canvas.Pixels[x+dx+38,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+78,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+78,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+78,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+118,y+dy+122]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
      end;
    end;
   Procedure TFigure3.Turn;
    begin
      case turnkey mod 4 of
        0:if (Image.Canvas.Pixels[x+dx+44,y+dy+44]=clWhite) and (Image.Canvas.Pixels[x+dx+84,y+dy+84]=clWhite) and
              (Image.Canvas.Pixels[x+dx+44,y+dy+84]=clWhite) and (Image.Canvas.Pixels[x+dx+84,y+dy+124]=clWhite) and
              (Image.Canvas.Pixels[x+dx+44,y+dy+124]=clWhite)
          then inherited Turn;
        1:if (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and
             (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite)
          then inherited Turn;
        2:if (Image.Canvas.Pixels[x+dx+42,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+118]=clWhite) and
             (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite)
          then inherited Turn;
        3:if (Image.Canvas.Pixels[x+dx+2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and
             (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+42]=clWhite)
          then inherited Turn;
      end;
    end;
   Function  TFigure3.CheckandDel;
    begin
     case turnkey mod 4 of
        0:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        1:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
        2:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        3:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
      end;
    Result:=minyn;
   end;
   Procedure TFigure4.Draw;
    begin
      case turnkey mod 4 of
           0:begin NewDraw(x+dx,y+dy+40,x+dx+40,y+dy+80);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
             end;
           1:begin NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
                   NewDraw(x+dx+80,y+dy+80,x+dx+120,y+dy+120);
             end;
           2:begin NewDraw(x+dx,y+dy,x+dx+40,y+dy+40);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
             end;
           3:begin NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+40,y+dy+80,x+dx+80,y+dy+120);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
             end;
      end;
    end;
   Procedure TFigure4.Move;
    begin
      case turnkey mod 4 of
           0:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
             then inherited Move(t)
             else stop:=true;
           1:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite)
             then inherited Move(t)
             else stop:=true;
           2:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite)
             then inherited Move(t)
             else stop:=true;
           3:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
             then inherited Move(t)
             else stop:=true;
      end;
    end;
   Procedure TFigure4.Motion;
    begin
      case turnkey mod 4 of
          0:begin if (Image.Canvas.Pixels[x+dx+2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx-2,y+dy+82]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           1:begin if (Image.Canvas.Pixels[x+dx+42,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
           2:begin if (Image.Canvas.Pixels[x+dx-2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           3:begin if (Image.Canvas.Pixels[x+dx+38,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+38,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
      end;
    end;
   Procedure TFigure4.Turn;
    begin
      case turnkey mod 4 of
        0:if (Image.Canvas.Pixels[x+dx+44,y+dy+84]=clWhite) and (Image.Canvas.Pixels[x+dx+84,y+dy+84]=clWhite) and
              (Image.Canvas.Pixels[x+dx+118,y+dy+124]=clWhite) and (Image.Canvas.Pixels[x+dx+84,y+dy+124]=clWhite) and
              (Image.Canvas.Pixels[x+dx+84,y+dy]=clWhite)
          then inherited Turn;
        1:if (Image.Canvas.Pixels[x+dx+2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+2]=clWhite)
          then inherited Turn;
        2:if (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and
             (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
          then inherited Turn;
        3:if (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite)
          then inherited Turn;
      end;
    end;
   Function  TFigure4.CheckandDel;
    begin
     case turnkey mod 4 of
        0:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        1:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
        2:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        3:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
      end;
    Result:=minyn;
   end;
   Procedure TFigure5.Draw;
    begin
      case turnkey mod 2 of
           0:begin NewDraw(x+dx,y+dy,x+dx+40,y+dy+40);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
             end;
           1:begin NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
                   NewDraw(x+dx+40,y+dy+80,x+dx+80,y+dy+120);
             end;
      end;
    end;
   Procedure TFigure5.Move;
    begin
      case turnkey mod 2 of
           0:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
             then inherited Move(t)
             else stop:=true;
           1:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
             then inherited Move(t)
             else stop:=true;
      end;
    end;
   Procedure TFigure5.Motion;
    begin
      case turnkey mod 2 of
           0:begin if (Image.Canvas.Pixels[x+dx-2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+78,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+118,y+dy+82]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           1:begin if (Image.Canvas.Pixels[x+dx+42,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+122]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+118]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
      end;
    end;
   Procedure TFigure5.Turn;
    begin
      case turnkey mod 2 of
        0:if (Image.Canvas.Pixels[x+dx+44,y+dy+84]=clWhite) and (Image.Canvas.Pixels[x+dx+44,y+dy+124]=clWhite) and
             (Image.Canvas.Pixels[x+dx+118,y+dy+2]=clWhite)
          then inherited Turn;
        1:if (Image.Canvas.Pixels[x+dx+2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and
             (Image.Canvas.Pixels[x+dx+42,y+dy+2]=clWhite)
          then inherited Turn;
      end;
    end;
   Function  TFigure5.CheckandDel;
    begin
     case turnkey mod 2 of
        0:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        1:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
      end;
    Result:=minyn;
   end;
   Procedure TFigure6.Draw;
    begin
      case turnkey mod 2 of
           0:begin NewDraw(x+dx,y+dy+40,x+dx+40,y+dy+80);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
             end;
           1:begin NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy+80,x+dx+120,y+dy+120);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
             end;
      end;
    end;
   Procedure TFigure6.Move;
    begin
      case turnkey mod 2 of
           0:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite)
             then inherited Move(t)
             else stop:=true;
           1:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite)
             then inherited Move(t)
             else stop:=true;
      end;
    end;
   Procedure TFigure6.Motion;
    begin
      case turnkey mod 2 of
           0:begin if (Image.Canvas.Pixels[x+dx+38,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx-2,y+dy+82]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+118,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           1:begin if (Image.Canvas.Pixels[x+dx+38,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+38,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+78,y+dy+118]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+78,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+122]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
      end;
    end;
   Procedure TFigure6.Turn;
    begin
      case turnkey mod 2 of
        0:if (Image.Canvas.Pixels[x+dx+44,y+dy+84]=clWhite) and (Image.Canvas.Pixels[x+dx+84,y+dy+44]=clWhite) and
             (Image.Canvas.Pixels[x+dx+84,y+dy+84]=clWhite) and (Image.Canvas.Pixels[x+dx+84,y+dy+124]=clWhite)
          then inherited Turn;
        1:if (Image.Canvas.Pixels[x+dx+84,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and
             (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite)
          then inherited Turn;
      end;
    end;
   Function  TFigure6.CheckandDel;
    begin
     case turnkey mod 2 of
        0:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        1:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
      end;
    Result:=minyn;
   end;
   Procedure TFigure7.Draw;
    begin
      case turnkey mod 4 of
           0:begin NewDraw(x+dx,y+dy,x+dx+40,y+dy+40);
                   NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
             end;
           1:begin NewDraw(x+dx+40,y+dy,x+dx+80,y+dy+40);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+40,y+dy+80,x+dx+80,y+dy+120);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
             end;
           2:begin NewDraw(x+dx,y+dy,x+dx+40,y+dy+40);
                   NewDraw(x+dx,y+dy+40,x+dx+40,y+dy+80);
                   NewDraw(x+dx+40,y+dy+40,x+dx+80,y+dy+80);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
             end;
           3:begin NewDraw(x+dx+40,y+dy+80,x+dx+80,y+dy+120);
                   NewDraw(x+dx+80,y+dy,x+dx+120,y+dy+40);
                   NewDraw(x+dx+80,y+dy+40,x+dx+120,y+dy+80);
                   NewDraw(x+dx+80,y+dy+80,x+dx+120,y+dy+120);
             end;
      end;
    end;
   Procedure TFigure7.Move;
    begin
      case turnkey mod 4 of
           0:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+42]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
             then inherited Move(t)
             else stop:=true;
           1:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite)
             then inherited Move(t)
             else stop:=true;
           2:if (dy<(setx-80)) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite)
                         and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite)
             then inherited Move(t)
             else stop:=true;
           3:if (dy<(setx-120)) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite)
             then inherited Move(t)
             else stop:=true;
      end;
    end;
   Procedure TFigure7.Motion;
    begin
      case turnkey mod 4 of
          0:begin if  (Image.Canvas.Pixels[x+dx-2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           1:begin if (Image.Canvas.Pixels[x+dx+38,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+38,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+122]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
           2:begin if (Image.Canvas.Pixels[x+dx-2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx-2,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx-2,y+dy+82]=clWhite) and
                      (dx>-160) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+42,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and
                      (dx<200) and (flag)
                   then inherited Motion(flag); end;
           3:begin if (Image.Canvas.Pixels[x+dx+38,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+38,y+dy+122]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+78,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+78,y+dy+42]=clWhite) and
                      (dx>-200) and (not flag)
                   then inherited Motion(flag);
                   if (Image.Canvas.Pixels[x+dx+122,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+122,y+dy+42]=clWhite) and
                      (Image.Canvas.Pixels[x+dx+122,y+dy+82]=clWhite) and
                      (dx<200) and flag
                   then inherited Motion(flag); end;
      end;
    end;
   Procedure TFigure7.Turn;
    begin
      case turnkey mod 4 of
        0:if (Image.Canvas.Pixels[x+dx+44,y+dy+44]=clWhite) and (Image.Canvas.Pixels[x+dx+44,y+dy+84]=clWhite) and
             (Image.Canvas.Pixels[x+dx+44,y+dy+124]=clWhite)
          then inherited Turn;
        1:if (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+82]=clWhite) and
             (Image.Canvas.Pixels[x+dx+82,y+dy+42]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite) and
             (Image.Canvas.Pixels[x+dx+2,y+dy+2]=clWhite)
          then inherited Turn;
        2:if (Image.Canvas.Pixels[x+dx+42,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+122]=clWhite) and
             (Image.Canvas.Pixels[x+dx+82,y+dy+82]=clWhite) and (Image.Canvas.Pixels[x+dx+82,y+dy+122]=clWhite) and
             (Image.Canvas.Pixels[x+dx+82,y+dy+2]=clWhite)
          then inherited Turn;
        3:if (Image.Canvas.Pixels[x+dx+2,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+2,y+dy+42]=clWhite) and
             (Image.Canvas.Pixels[x+dx+42,y+dy+2]=clWhite) and (Image.Canvas.Pixels[x+dx+42,y+dy+42]=clWhite)
          then inherited Turn;
      end;
    end;
   Function  TFigure7.CheckandDel;
    begin
     case turnkey mod 4 of
        0:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        1:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
        2:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
          end;
        3:begin
            Inherited CheckandDel(y+dy,minyn,score);
            Inherited CheckandDel(y+dy+40,minyn,score);
            Inherited CheckandDel(y+dy+80,minyn,score);
          end;
      end;
    Result:=minyn;
   end;
end.
