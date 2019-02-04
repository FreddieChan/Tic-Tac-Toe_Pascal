
Var status : array[1..3,1..3] Of char;
    player : integer;//p0_p1

Function wincheck(status:Array): boolean;
Begin
  If (status[1,1] = status[1,2]) And (status[1,2]= status[1,3])
     Else If (status[2,1] = status[2,2]) And (status[2,2]= status[2,3])
     Else If (status[3,1] = status[3,2]) And (status[3,2]= status[3,3])
     Else If (status[1,1] = status[2,1]) And (status[2,1]= status[3,1])
     Else If (status[1,2] = status[2,2]) And (status[2,2]= status[3,2])
     Else If (status[1,3] = status[2,3]) And (status[2,3]= status[3,3])
     Else If (status[1,1] = status[2,2]) And (status[2,2]= status[3,3])
     Else If (status[3,1] = status[2,2]) And (status[2,2]= status[1,3])
    Then wincheck := true;
  Else
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



Begin
  writeln('game');
  readln();
  writeboard();

While wincheck := false Do
begin
  writeboard();
  wincheck();
end;
  
while wincheck= true Do
begin 





End.
