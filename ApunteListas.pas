program listas;

Agregar al principio en una lista
procedure agregarAdelante(var L: lista, registro: register);
var
    nue: lista;
begin
    new(nue);
    nue^.dato:= registro;
    nue^.siguiente:= L;
    L:= nue;
end;

Agregar al final en una lista
procedure agregarAlFinal(var ult: lista, var L:lista,registro: register);
var
    nue: lista;
begin
    new(nue);
    nue^.dato:= registro;
    nue^.siguiente:= nil;
    if (L <> nil) then
        ult^.siguiente:= nue;
    else
        L:= nue;
    ult:= nue;
end;

Agregar en una lista datos ordenados de forma ascendente, para hacerlo de forma descendente hay que poner un signo de menor en vez de mayor en la condición.
procedure agregarOrdenado(var L:lista, registro:register);
    nue: lista;
    act: lista;
    ant: lista;
begin
    new(nue);
    nue^.dato:= registro;
    ant:= L;
    act:= L;
    while(act <> nil) and (act^.dato.campo < registro.campo) begin
        ant:= act;
        act:= act^.siguiente;
    end;
    if (ant = act) then
        L:= nue;
    else
        ant^.siguiente:= nue;
    nue^.siguiente:= act;
end;


    procedure eliminarElemento(var L:lista, valor:integer);
        act: lista;
        ant: lista;
    begin
        ant:= L;
        act:= L;
        while(act <> nil) and (act^.dato <> valor) begin
            ant:= act;
            act:= act^.siguiente;
        end;
        if (L <> nil)
            if (act = L) then
                L:= L^.sig;
            else
                ant^.siguiente:= act^.siguiente;
            dispose(act);
    end;

