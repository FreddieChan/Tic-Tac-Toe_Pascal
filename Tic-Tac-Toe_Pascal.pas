
Uses sysutils, crt;

Type 
    a =   array[1..3,1..3] Of char;

Var status :   a;
    player :   integer;
    x1, y1 :   integer; {1 to 3 which indicate the box}
    f :   text;
    playno :   integer;
    key :   char;
    wincheck:   boolean;

Function winning: Boolean;
Begin
    winning := false;
    If (status[1,1] = status[1,2]) And (status[1,2]= status[1,3]) Then
        winning := true
    Else If (status[2,1] = status[2,2]) And (status[2,2]= status[2,3]) Then
        winning := true
    Else If (status[3,1] = status[3,2]) And (status[3,2]= status[3,3]) Then
        winning := true
    Else If (status[1,1] = status[2,1]) And (status[2,1]= status[3,1])Then
        winning := true
    Else If (status[1,2] = status[2,2]) And (status[2,2]= status[3,2])Then
        winning := true
    Else If (status[1,3] = status[2,3]) And (status[2,3]= status[3,3])Then
        winning := true
    Else If (status[1,1] = status[2,2]) And (status[2,2]= status[3,3])Then
        winning := true
    Else If (status[3,1] = status[2,2]) And (status[2,2]= status[1,3]) Then
        winning := true;
End;


Procedure writefile;

Var i,j :   integer;
Begin
    assign(f, inttostr(playno) + '.txt');
    rewrite(f);
    For i := 1 To 3 Do
        Begin
            For j := 1 To 3 Do
                writeln(status[i,j]);
        End;
    close(f);

End;


Procedure resetgame;

Var i, j :   integer; k:   char;
Begin
    clrscr;
    x1 := 1;
    y1 := 1;
    key := 'O';
    player := 0;
    playno := 0;
    wincheck := false;
    For i := 1 To 3 Do
        For j := 1 To 3 Do
            status[i,j] := Chr(Ord('a') + (j - 1) * 3 + i - 1);
End;



Procedure switchplayer();
Begin
    If player = 0 Then
        Begin
            player := 1;
            key := 'X';
        End
    Else If player = 1 Then
        Begin
            player := 0;
            key := 'O';
        End
End;



Procedure writeboard;

Var i,j :   integer;

Begin
    ClrScr();
    writeln('THE TIC TAC TOE GAME');
    writeln('_____________');
    For i := 1 To 3 Do
        Begin
            For j := 1 To 3 Do
            Begin
                Write('|',status[j, i]);
            End;
            WriteLn('|');
            writeln('_____________');
        End;
End;

Procedure select;
Var k : integer;
Begin
    Repeat
        k := ord(readkey);
        //ord value #
        Write(k);
        If (k = 97) And (x1 <> 1) Then
            x1 := x1 - 1;
        If (k = 100) And (x1 <> 3) Then
            x1 := x1 + 1;
        If (k = 100) And (x1 <> 3) Then
            y1 := y1 - 1;
        If (k = 100) And (x1 <> 3) Then
            y1 := y1 + 1;

            {
        If ((x1>1) And (x1<3)) And ((y1>1) And (y1<3)) Then
            Begin
                If k = 97 Then x1 := x1-1
                Else
                    If k = 110 Then x1 := x1+1
                Else
                    If k = 119 Then y1 := y1+1
                Else
                    If k = 115 Then y1 := y1-1;
            End;
            }
        If k = 0 Then
            ReadKey();
        writeboard();
        { Gotoxy(x1, y1) }
    Until (k = 13) And (True); { Check if the box is not occupied }
    status[x1, y1] := key;
End;

//MAIN
Begin
    writeln('THE TIC TAC TOE GAME');
    readln();
    wincheck := false;
    resetgame;
    writeboard;
    While (wincheck = false) And (playno < 9) Do
        Begin
            select;
            writeboard;
            wincheck := winning;
            switchplayer;
            playno := playno + 1;
        End;
    WriteLn('abc');
    ReadLn();

    If wincheck Then
        Begin
            writeln(player,'WINS');
            writefile;
            readln;
            clrscr;
            wincheck := false;
        End;

    If playno = 9 Then
        writeln('TIE');
    readln;
End.
