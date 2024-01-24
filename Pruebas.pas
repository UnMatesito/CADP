program JugamosConListas;
type
lista = ^nodo;

nodo = record
num : integer;
sig : lista;
end;

procedure agregarFinal(var pri, ult: lista; v: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.num := v;
    nuevo^.sig := nil;
    if pri = nil then
        begin
            pri := nuevo;
            ult := nuevo;
        end
    else
    begin
        ult^.sig := nuevo;
        ult := nuevo;
    end;
end;

procedure aumentar(pri: lista; a: integer);
var
    l: lista;
begin
    writeln('Lista Nueva');
    l := pri;
    while (pri <> nil) do
        begin
            pri^.num := pri^.num + a;
            writeln(pri^.num);
            pri := pri^.sig;
        end;
end;

var
    pri, ult : lista;
    valor : integer;
    a: integer;
begin
    pri := nil;
    ult := nil;
    writeln('Ingrese un numero');
    readln(valor);
    while (valor <> 0) do 
        begin
            agregarFinal(pri, ult, valor);
            writeln('Ingrese un numero');
            readln(valor);
        end;
    writeln('Lista');
    writeln('Ingrese un numero para incrementar los valores');
    readln(a);
    aumentar(pri, a);
end.