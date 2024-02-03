program E01;

type
    s_sucursal = 1..5;
    
    factura = record
        numero: integer;
        codCliente: integer;
        codSucursal: s_sucursal;
        monto: real;
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato: factura;
        sig: lista;
    end;

procedure cargarLista(var l:lista); //se dispone

procedure eliminarFacturas(l:lista; numSucursal:s_sucursal; var cantEliminados:integer);
var
    ant, act:lista;
begin
    act := l;
    while (act <> nil) do
        begin
            if (act^.dato.codSucursal <> numSucursal) then
                begin
                    ant := act;
                    act := act^.sig;
                end
            else
                begin
                    if (act = l) then
                        l := l^.sig
                    else
                        ant^.sig := act^.sig;
                    cantEliminados := cantEliminados + 1;
                    dispose(act);
                    act := ant;
                end;
        end;
end;

//programa principal    
var
    l: lista;
    numSucursal: s_sucursal;
    cantEliminados:integer;
begin
    l := nil;
    cargarLista(l); //se dispone
    read(numSucursal);
    cantEliminados := 0;
    eliminarFacturas(l, numSucursal, cantEliminados);
    writeln('Con el numero de sucursal ', numSucursal, ' se eliminaron ', cantEliminados, ' facturas');
end.