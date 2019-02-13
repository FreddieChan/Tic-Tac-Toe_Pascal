
Var status : array[1..3,1..3] Of char;
  player : integer;
  //p0_p1
  x, y : integer;
  //current position

Function wincheck(status:Array Of CHAR) : boolean;
Begin
  If (status[1,1] = status[1,2]) And (status[1,2]= status[1,3]) Then 
          wincheck := true
  Else If (status[2,1] = status[2,2]) And (status[2,2]= status[2,3]) Then
          wincheck := true
  Else If (status[3,1] = status[3,2]) And (status[3,2]= status[3,3]) Then
          wincheck := true
  Else If (status[1,1] = status[2,1]) And (status[2,1]= status[3,1])Then
          wincheck := true
  Else If (status[1,2] = status[2,2]) And (status[2,2]= status[3,2])Then
          wincheck := true
  Else If (status[1,3] = status[2,3]) And (status[2,3]= status[3,3])Then
           wincheck := true
  Else If (status[1,1] = status[2,2]) And (status[2,2]= status[3,3])Then
           wincheck := true
  Else If (status[3,1] = status[2,2]) And (status[2,2]= status[1,3])
         Then wincheck := true;
  Else
End;

Function switchplayer(player);
Begin
  If player = 0 Then player := 1
  Else If player = 1 Then player := 0;
End;


Procedure writeboard
Begin
  For i := 1 To 3 Do
    Begin
      For j := 1 To 3 Do
        Begin
          Write('|',staus(i,j),'|')
        End;
      writeln('_____________');
    End;
End;

Function select(x1,y1:integer);
//
Begin
if readkey = 

then 

elseif 

then 



End;

//MAIN
Begin
  writeln('game');
  readln();
  writeboard();


  While wincheck := false Do
    Begin
      writeboard;
      select;
      wincheck;
      switchplayer;
    End;

  While wincheck= true Do
    Begin
      writeln(player,'WINS');
      readln;


    End;

End.
