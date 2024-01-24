{
    Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
    todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
    instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
    La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
    la información disponible de todos los dispositivos e informe:
        a. La cantidad de dispositivos para cada versión de Android.
        b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
        c. El tamaño promedio de las pantallas de todos los dispositivos.
}

program E12P6;
const
    dimf = 14;
type
    s_version = 1..dimf;

    dispositivo = record
        android : s_version;
        tamPantalla : real;
        memRam : integer;
        end;
    
    lista = ^nodo;

    nodo = record
        dato : dispositivo;
        sig : lista;
        end;

    contador = array[s_version] of integer;

procedure leerDispositivo(var d : dispositivo);
begin
    with d do
        begin
            writeln('Ingrese la version de Android del dispositivo');
            readln(android);
            writeln('Ingrese el tamaño de la pantalla en pulgadas del dispositivo');
            readln(tamPantalla);
            writeln('Ingrese la cantidad de memoria RAM en GB del dispositivo');
            readln(memRam);
        end;
end;

procedure armarLista(var l:lista; d:dispositivo);
var
    nuevo : lista;
begin
    new(nuevo);
    nuevo^.dato := d;
    nuevo^.sig := l;
    l := nuevo;
end;

procedure inicializar(var c : contador);
var 
    i : integer;
begin
    for i:= 1 to dimf do
        c[i] := 0;
end;

procedure cargarLista(var l: lista; var c: contador; var suma: real; var cant: integer; var cantDispositivo: integer; var prom: real);
var
    d : dispositivo;
    versionAct : integer;
    version : s_version;
    aux : lista;
begin
    suma := 0;
    cant := 0;
    prom := 0;
    cantDispositivo := 0;
    aux := l;
    leerDispositivo(d);
    while (d.android = version) do
        begin
            versionAct := d.android;
            while (versionAct = d.android) do
                begin
                    suma := suma + aux^.dato.tamPantalla;
                    cant := cant + 1;
                    aux := aux^.sig;
                    leerDispositivo(d);
                end;
            armarLista(aux, d);
            aux := aux^.sig;
        end;
    inicializar(c);
    while (aux <> nil) do
        begin
            c[l^.dato.android] := c[l^.dato.android] + 1;
            if (aux^.dato.memRam > 3) and (aux^.dato.tamPantalla >= 5.0) then
                cantDispositivo := cantDispositivo + 1;
            prom := suma/cant;
        end;
end;

//programa principal
var
    l : lista;
    c : contador;
    i : integer;
    suma : real;
    cant : integer;
    cantDispositivo : integer;
    prom: real;
begin
    cargarLista(l, c, suma, cant, cantDispositivo, prom);
    //inciso a
    for i := 1 to dimf do
        writeln('La version de Android ', i, ' hay: ', c[i]);
    //inciso b
    writeln('La cantidad de dispositivos con mas de 3 GB de RAM y una pantalla de a la sumo 5 pulgadas son: ', cantDispositivo);
    //inciso c
    writeln('El tamaño promedio de las pantallas en pulgada es: ', prom:2:2);
end.