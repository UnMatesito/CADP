program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
        
        end;

procedure agregarAdelante(var pri: lista; v: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.num := v;
    nuevo^.sig := pri;
    pri := nuevo;
end;

procedure insetarAsendente(var pri: lista; v: integer);
var
    nuevo, ant, act : lista;
begin
    new(nuevo);
    nuevo^.num := v;
    nuevo^.sig := pri;
    if pri = nil then
        pri := nuevo
    else
        begin
            ant:= pri;
            act:= pri;
        while (act <> nil) and (act^.num < nuevo^.num) do
            begin
                ant := act;
                act := act^.sig;
            end;
        end;
    if (act = pri) then
        begin
            nuevo^.sig := pri;
            pri := nuevo;
        end
    else
        begin
            ant^.sig := nuevo;
            nuevo^.sig := act;
        end;
end;

procedure sublista(pri : lista; var nuevaLista: lista; a: integer; b: integer);
begin
    nuevaLista := nil;
    while (pri <> nil) do
        begin
            if (pri^.num > a) and (pri^.num < b) then
                agregarAdelante(nuevaLista, pri^.num);
            pri := pri^.sig;
        end;
end;

var
    pri : lista;
    v : integer;
    nuevaLista : lista;
    a, b : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(v);
    while (v <> 0) do 
    begin
        insetarAsendente(pri, v);
        writeln('Ingrese un numero');
        read(v);
    end;
    writeln('Ingrese un numero para empezar la sublista');
    readln(a);
    writeln('Ingrese un numero para cerrar la sublista');
    readln(b);
    writeln('Lista Nueva');
    sublista(pri, nuevaLista, a, b);
    while (nuevaLista <> nil) do
        begin
            writeln(nuevaLista^.num);
            nuevaLista := nuevaLista^.sig;
        end;
end.
