program E07P5;
const
    dimf = 2500;
type
    cadena = string[50];
    ciudad = array[1..dimf] of cadena;
procedure cargarVector(var v:ciudad);
var
    i: integer;
begin
    for i:=1 to dimf do
        readln(v[i]);
end;

var
    v: ciudad;
begin
    writeln(sizeof(v));    
    cargarVector(v);
end.