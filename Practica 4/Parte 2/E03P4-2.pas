{
    Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
    cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
    con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
    por el camión (medida en kilómetros).
        a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
            cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
        b. Realizar un módulo que reciba el vector generado en a) e informe:
            - El monto promedio transportado de los viajes realizados
            - La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
            - La cantidad de viajes realizados cada día del mes.
        c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
            recorrida sea igual a 100 km.
        Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}

program E03P4_2;
const
    dimf = 200;
    maxdia = 31;
type
    s_dia = 1..maxdia;
    viaje = record
        dia : s_dia;
        monto : real;
        distancia : integer;
        end;
    v_viajes = array[1..dimf] of viaje;
    contador = array[s_dia] of integer;

procedure leerViaje(var m: viaje);
begin
    with m do
        begin
            writeln('Ingrese el dia del mes de Marzo en el que se realizo el viaje');
            readln(dia);
            writeln('Ingrese el monto trasportado');
            readln(monto);
            writeln('Ingrese la distancia recorrida en Km');
            readln(distancia);
        end;
end;

//Inciso A
procedure cargarVector(var v: v_viajes; var diml: integer);
var
    m: viaje;
begin
    leerViaje(m);
    while (diml < dimf) and (m.distancia <> 0) do
        begin
            diml := diml + 1;
            v[diml] := m;
            leerViaje(m);
        end;
end;

procedure inicializar(var c:contador);
var
    i: s_dia;
begin
    for i:= 1 to maxdia do
        c[i] := 0;
end;

//Inciso B
procedure procesarInfo(var v: v_viajes; var c: contador; var diml: integer; var prom: real; var min: real; var mindia: integer; var mindist: integer);
var
    suma : real;
    cant : integer;
    i : integer;
begin
    suma := 0;
    cant := 0;
    min := 9999;
    for i:= 1 to diml do
        begin
            //inciso b.1
            suma := suma + v[i].monto;
            cant := cant + 1;
            //inciso b.2
            if (v[i].monto < min) then
                begin
                    min := v[i].monto;
                    mindia := v[i].dia;
                    mindist := v[i].distancia;
                end;
            //inciso b.3
            c[v[i].dia] := c[v[i].dia] + 1;
        end;
        prom := suma / cant;
end;

//Inciso C
procedure eliminar100km(var v:v_viajes; var diml: integer; pos: integer);
var
    i: integer;
    ok : boolean;
begin
    ok := false;
    while (pos <= diml) and (v[pos].distancia <> 100) do
        pos := pos + 1;
    while (pos <= diml) and (v[pos].distancia = 100) do
        begin
            for i:= pos to (diml - 1) do
                v[i] := v[i + 1];
            ok := true;
            diml := diml - 1;
        end;
end;

//Programa Principal
var
    v: v_viajes;
    c: contador;
    diml, i, pos : integer;
    prom, min : real;
    mindia : integer;
    mindist : integer;
begin
    diml := 0;
    cargarVector(v, diml);
    inicializar(c);
    for i := 1 to diml do
        writeln(v[i].distancia);
    procesarInfo(v, c, diml, prom, min, mindia, mindist);
    writeln('El monto promedio de los viajes es: ', prom:0:2);
    writeln('El dia ', mindia, ' con una distancia de ', mindist, 'Km fue el viaje en que menor monto se trasportaba');
    for i:= 1 to maxdia do
        if c[i] >= 1 then
        writeln('En el dia ', i, ' hubieron ', c[i]);
    pos := 1;
    eliminar100km(v, diml, pos);
    for i := 1 to diml do
        writeln(v[i].distancia);
end.