program E06P5; //51200 bytes de memoria libre
type
    num = array[1..25598] of integer;
    puntero = ^num;
procedure cargar(var n: num);
var
    i : integer;
begin
    for i:= 1 to 25600 do
        readln(n[i]);
end;
procedure apuntar(var p:puntero);
var
    n: num;
begin
    new(p);
    //cargar(n);
    p^ := n;
end;

var
    p : puntero;
begin
    apuntar(p);
    writeln(sizeof(p));
    writeln(sizeof(p^));
end.