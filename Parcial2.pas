program Parcial;
const 
    dimf = 5;
type
    s_categorias = 'A'..'E';
    
    v_premios = array [1..dimf] of real;
    
    empleado = record
        dni : integer;
        apellido : string;
        nombre : string;
        categoria : s_categorias;
        sueldoBas : real;
        premios : v_premios;
        antiguedad: integer;
        end;
        
    listaEmpleados = ^nodo;
    
    nodo = record
        dato : empleado;
        sig: listaEmpleados;
        end;
    
    liquidacion = record
        dni: integer;
        sueldoMen : real;
        end;
    
    listaLiquidaciones = ^nodoLiq;
    
    nodoLiq = record
        dato: liquidacion;
        sig: listaLiquidaciones;
        end;
    
    v_contador = array[s_categorias] of integer;

procedure cargarVector (var v:v_premios; var diml: integer);
var
    monto: real;
begin
    diml := 0;
    writeln('Ingrese el monto del premio');
    readln(monto);
    while (diml < dimf) and (monto <> 0) do
        begin
            diml := diml + 1;
            v[diml] := monto;
            writeln('Ingrese el monto del premio');
            readln(monto);
        end;
end;

procedure leerEmpleado (var e: empleado; var v:v_premios; diml: integer);
begin
    writeln('Ingrese el DNI del empleado');
    readln(e.dni);
    if (e.dni <> -1) then
        begin
            writeln('Ingrese el apellido del empleado');
            readln(e.apellido);
            writeln('Ingrese el nombre del empleado');
            readln(e.nombre);
            writeln('Ingrese la categoria del empleado (A-E)');
            readln(e.categoria);
            writeln('Ingrese el sueldo basico del empleado');
            readln(e.sueldoBas);
            cargarVector(v, diml);
            writeln('Ingrese la antiguedad de años del empleado');
            readln(e.antiguedad);
        end;
end;

procedure insertarOrdenado(var l: listaEmpleados; e: empleado);
var
    ant, act, nuevo : listaEmpleados;
begin
    new(nuevo);
    nuevo^.dato := e;
    act := l;
    ant := l;
    while (act <> nil) and (act^.dato.dni < nuevo^.dato.dni) do
        begin
            ant := act;
            act := act^.sig;
        end;
    if (act = ant) then
        begin
            l := nuevo;
        end
    else
        begin
            ant^.sig := nuevo;
            nuevo^.sig := act;
        end;
end;

procedure cargarLista(var l: listaEmpleados; v:v_premios; diml: integer);
var
    e: empleado;
begin
    leerEmpleado(e, v, diml);
    while (e.dni <> -1) do
        begin
            insertarOrdenado(l, e);
            leerEmpleado(e, v, diml);
        end;
end;

procedure inicializar(var c: v_contador);
var
    i: s_categorias;
begin
    for i:= 'A' to 'E' do
        c[i] := 0;
end;

function esABoC(cat : s_categorias): boolean;
var
    ok : boolean;
begin
    ok := false;
    if (cat = 'A') or (cat = 'B') or (cat = 'C') then
        ok := true;
    esABoC := ok;
end;

procedure armarLista (var l2: listaLiquidaciones; liq : liquidacion);
var
    nuevo : listaLiquidaciones;
begin
    new(nuevo);
    nuevo^.dato := liq;
    nuevo^.sig := l2;
    l2 := nuevo;
end;

procedure crearListayContar(l: listaEmpleados; var l2: listaLiquidaciones; diml : integer; v: v_premios; var c: v_contador);
var
    premiosTotales : real; liq: liquidacion; pos: integer;
begin
    while (l <> nil) do
        begin
            premiosTotales := 0;
            pos := 0;
            liq.dni := l^.dato.dni;
            while (pos >= 1) and (pos <= diml) do
                premiosTotales := premiosTotales + v[pos];
                pos := pos + 1;
            if (esABoC(l^.dato.categoria)) then
                liq.sueldoMen := (l^.dato.sueldoBas + premiosTotales)
            else
                liq.sueldoMen := (l^.dato.sueldoBas + premiosTotales + (l^.dato.antiguedad * 1000));
            armarLista(l2, liq);
            c[l^.dato.categoria] := c[l^.dato.categoria] + 1;
            l := l^.sig;
        end;
end;

procedure eliminar(var l2: listaLiquidaciones; dni: integer; var pude: boolean);
var
    ant, act, aux : listaLiquidaciones;
begin
    pude := false;
    aux := l2;
    act := l2;
    while (act <> nil) and (act^.dato.dni <> dni) do
        begin
            ant := act;
            act := act^.sig;
        end;
    if (act <> nil) then
        if (act = aux) then
            aux := aux^.sig
        else
            ant^.sig := act^.sig;
        dispose(act);
        pude := true;
end;

//Programa Principal
var
    l: listaEmpleados;
    l2: listaLiquidaciones;
    c: v_contador;
    diml: integer;
    pude: boolean;
    v: v_premios;
    i: s_categorias;
begin
    l := nil;
    l2 := nil;
    cargarLista(l, v, diml);
    inicializar(c);
    crearListayContar(l, l2, diml, v, c);
    while (l2 <> nil) do
        begin
            writeln('Nodo');
            writeln(l2^.dato.dni);
            writeln(l2^.dato.sueldoMen:0:2);
            l2 := l2^.sig;
        end;
    for i := 'A' to 'E' do
        writeln('Categoria ', i, ': ', c[i]);
    eliminar(l2, 555, pude);
    if (pude = true) then
        writeln('Nodo Eliminado')
    else
        writeln('No se pudo eliminar el nodo');
end.
