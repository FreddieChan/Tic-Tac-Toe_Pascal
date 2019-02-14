
Var status :   array[1..3,1..3] Of char;
    player :   integer;
    //p0_p1
    x1, y1 :   integer;
    //current position
    f :   text;
    playno :   integer;
    key : char;

Procedure writefile(f:text);
Begin
    assign(f, playno + '.txt');
    rewrite(f);
    writeln(status);
    closefile(f);

End;

Function wincheck(status:Array Of char) :   boolean;
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
Begins
    If player = 0 Then player := 1
    key := 'X';
    Else If player = 1 Then player := 0;
    key := 'O';
End;

Procedure writeboard;
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

Function select(x1,y1:integer) : array;
//missing x1y1 initialization
Begin
    Repeat
        If readkey = 'A' Then x1 := x1-1
        Else
            If readkey = 'D' Then x1 := x1+1
        Else
            If readkey = 'W' Then y1 := y1+1
        Else
            If readkey = 'S' Then y1 := y1-1;
    Until readkey = #10
    select:= [x1,y1];

End;

//MAIN
Begin
    writeln('THE TIC TAC TOE GAME');
    readln();
    wincheck := false;
    While wincheck := false Do
        Begin
            writeboard;
            select;
            gotoxy(select);
            if status(select) = '' then
                write(key);
            wincheck;
            switchplayer;
        End;

    While wincheck= true Do
        Begin
            writeln(player,'WINS');
            writefile;
            readln;
            clrscr;
            wincheck:= false;

        End;
    readln;
End.
