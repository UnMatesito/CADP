program Parcial;
type
    s_eventos = 1..100;
    s_tipos = 1..5;
    evento = record
        nombre : string;
        tipo: s_tipos;
        lugar: string;
        capMaxima : integer;
        costo: real;
        end;
    v_eventos = array [s_eventos] of evento;
    venta = record
        codVenta : integer;
        evento : s_eventos;
        dni : integer;
        cantEntradas: integer;
        end;
    listaVentas = ^nodo;
    nodo = record
        dato: venta;
        sig : listaVentas;
        end;

procedure leerEvento(var e: evento);
begin
    writeln('Nombre');
    readln(e.nombre);
    writeln('tipo de evento');
    readln(e.tipo);
    writeln('lugar');
    readln(e.lugar);
    writeln('capacidad maxima del evento');
    readln(e.capMaxima);
    writeln('costo entrada');
    readln(e.costo);
end;

procedure cargarVector(var v:v_eventos);
var
    i : integer;
    e: evento;
begin
    for i:= 1 to 100 do
        begin
            leerEvento(e);
            v[i] := e;
        end;
end;

procedure leerVenta(var v:venta);
begin
    writeln('Codigo de venta');
    readln(v.codVenta);
    writeln('numero del evento');
    readln(v.evento);
    writeln('Dni del comprador');
    readln(v.dni);
    writeln('Cantidad de entardas compradas');
    readln(v.cantEntradas);
end;

procedure agregarAdelante(var l: listaVentas; v: venta);
var
    nuevo : listaVentas;
begin
    new(nuevo);
    nuevo^.dato := v;
    nuevo^.sig := l;
    l := nuevo;
end;

procedure cargarLista(var l: listaVentas);
var
    v: venta;
begin
    leerVenta(v);
    while (v.codVenta <> -1) do
    begin
        agregarAdelante(l,v);
        leerVenta(v);
    end;
end;

procedure minRecaudacion(l: listaVentas; v: v_eventos; var nomMin1, nomMin2, lugMin1, lugMin2: string; recaudacion: real; min1, min2: real);
begin
    if (recaudacion < min1) then
        begin
            min2 := min1;
            min1 := recaudacion;
            nomMin2 := nomMin1;
            nomMin1 := v[l^.dato.evento].nombre;
            lugMin2 := lugMin1;
            lugMin1 := v[l^.dato.evento].lugar;
        end
    else if (recaudacion < min2) then
        begin
            min2 := recaudacion;
            nomMin2 := v[l^.dato.evento].nombre;
            lugMin2 := v[l^.dato.evento].lugar;
        end;
end;

function esPar (num: integer): boolean;
begin
    esPar := num mod 2 = 0;
end;

procedure dniObraTeatro(l: listaVentas; v:v_eventos);
var
    cantPar, cantImpar: integer;
    dig: integer;
begin
    if (v[l^.dato.evento].tipo = 3) then
        begin
            cantPar := 0;
            cantImpar := 0;
            while (l^.dato.dni <> 0) do
                begin
                    dig := l^.dato.dni MOD 10;
                    if (esPar(dig) = true) then
                        cantPar := cantPar + 1
                    else
                        cantImpar := cantImpar + 1;
                    l^.dato.DNI := l^.dato.DNI div 10;
                end;
            if (cantPar > cantImpar) then
                writeln('se cumple, cantidad de entradas compradas: ', l^.dato.cantEntradas);
        end;
end;

function maxCapacidad50 (l: listaVentas; v:v_eventos; totalEntradas: integer): boolean;
begin
    if (l^.dato.evento = 50) and (v[l^.dato.evento].capMaxima = totalEntradas) then
        maxCapacidad50 := true
    else
        maxCapacidad50 := false;
end;

procedure procesar(l: listaVentas; v:v_eventos; var nomMin1, nomMin2, lugMin1, lugMin2 : string; var totalEntradas : integer);
var
    recaudacion: real;
    min1, min2 : real;
begin
    min1 := 9999;
    min2 := 9999;
    while (l <> nil) do
        begin
            recaudacion := v[l^.dato.evento].costo * l^.dato.cantEntradas;
            minRecaudacion(l, v, nomMin1, nomMin2, lugMin1, lugMin2, recaudacion, min1, min2);
            dniObraTeatro(l, v);
            if (l^.dato.evento = 50) then
                totalEntradas := totalEntradas + l^.dato.cantEntradas;
            l := l^.sig;
        end;
end;

var
    v: v_eventos;
    l: listaVentas;
    totalEntradas : integer;
    nomMin1, nomMin2, lugMin1, lugMin2 : string;
begin
    totalEntradas := 0;
    cargarVector(v); //se dispone
    cargarLista(l);
    procesar(l, v, nomMin1, nomMin2, lugMin1, lugMin2, totalEntradas);
    writeln('nombres con menos recaudacion ', nomMin1, ' y ', nomMin2, ' Lugares con menos recaudacion ', lugMin1, ' y ', lugMin2);
    if (maxCapacidad50(l, v, totalEntradas) = true) then
        writeln('El evento 50 llego a su capacidad maxima')
    else
        writeln('El evento 50 no llego a su capacidad maxima');
end.
