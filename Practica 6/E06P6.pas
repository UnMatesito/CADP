{
    La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
    al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
    (cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
    rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
        1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
    Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
    ingresar la sonda llamada “GAIA”, que debe procesarse.
    Una vez finalizada la lectura, informar:
        a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
        b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
        c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
        d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
    Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}
program E06P6;
type
    espec = 1..7;
    sonda = record
        nombre : string[15];
        duracion : integer;
        costoConst : real;
        costoMant : real;
        rangoEsp : espec;
        end;
    lista = ^nodo;
    nodo = record
        dato : sonda;
        sig: lista;
        end;

    contador = array[espec] of integer;
procedure leerSonda(var s: sonda);
begin
    with s do
        begin
            writeln('Ingrese el nombre de la sonda');
            readln(nombre);
            writeln('Ingrese la duracion estimada en meses de la mision');
            readln(duracion);
            writeln('Ingrese el costo de construccion de la sonda');
            readln(costoConst);
            writeln('Ingrese el costo de mantenimiento mensual de la sonda');
            readln(costoMant);
            writeln('Ingrese el rango espectro electromagnetico de la sonda');
            writeln('1: radio');
            writeln('2: microondas');
            writeln('3: inflarojo');
            writeln('4: luz visible');
            writeln('5: ultravioleta');
            writeln('6: rayos X');
            writeln('7: rayos Gamma');
            readln(rangoEsp);
        end;
end;

procedure agregarNodo(var l: lista; s: sonda);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := s;
    nuevo^.sig := l;
    l := nuevo;
end;

procedure armarLista(var l:lista);
var
    s : sonda;
begin
    repeat
        leerSonda(s);
        agregarNodo(l, s);
    until 
        (s.nombre = 'GAIA');
end;

procedure inicializar(c:contador);
var
    i: integer;
begin
    for i:=1 to 7 do
        c[i] := 0;
end;

procedure informar(l: lista; var c:contador; var nombreMax : string; var cantMayorProm: integer);
var
    aux : lista;
    suma : integer;
    cant : integer;
    promDuracion : real;
    promConst : real;
    costMax, mantMax: real;
    sumaConst : real;
begin
    costMax := -1;
    mantMax := -1;
    suma := 0;
    sumaConst := 0;
    cant := 0;
    cantMayorProm := 0;
    aux := l;
    while (aux <> nil) do
        begin
            cant := cant + 1;
           //inciso a
           if (aux^.dato.costoConst > costMax) then
            if (aux^.dato.costoMant > mantMax) then
                begin
                    costMax := aux^.dato.costoConst;
                    mantMax := aux^.dato.costoMant;
                    nombreMax := aux^.dato.nombre;
                end; 
           //inciso b
            inicializar(c);
            c[aux^.dato.rangoEsp] := c[aux^.dato.rangoEsp] + 1;
           //inciso c
            suma := suma + aux^.dato.duracion;
            promDuracion := suma / cant;
           //inciso d
            sumaConst := sumaConst + aux^.dato.costoConst;
            promConst := sumaConst / cant;
            //recorro la lista
            aux := aux^.sig;
        end;
        l := aux;
        while (l <> nil) do
            begin
                if (l^.dato.duracion > promDuracion) then
                    cantMayorProm := cantMayorProm + 1;
                if (l^.dato.duracion > promConst) then
                    writeln('La sonda ', l^.dato.nombre, ' supero el coste de construccion en promedio de las demas');
                l := l^.sig;
            end;
end;


//Programa Principal
var
    l : lista;
    c : contador;
    nombreMax : string;
    cantMayorProm, i : integer;
begin
    armarLista(l);
    informar(l, c, nombreMax, cantMayorProm);
    //inciso a
    writeln('el nombre de la sonda mas costosa es: ', nombreMax);
    //inciso b
    for i:= 1 to 7 do
        writeln('Tipo de espectro electromagnetico: ', i, ' existen: ', c[i], ' sondas');
    //inciso c
    writeln('La cantidad de sondas cuya duracion estimada supera el promedio son: ', cantMayorProm);
    //inciso d
    
end.