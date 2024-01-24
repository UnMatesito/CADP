program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
        
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

var
    pri : lista;
    v : integer;
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
    while (pri <> nil) do
        begin
            writeln(pri^.num);
            pri := pri^.sig;
        end;
end.