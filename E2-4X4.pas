program E24x4;
const
    cantPaises = 25;
    cantEmpleados = 2000;
type
    spais = 1..cantPaises;
    scodigo = 0..cantEmpleados;
    empleado = record
        codigo : scodigo;
        codpais : spais;
        antiguedad : integer;
        sueldoBruto : real;
    end;
    
    contador = array[spais] of integer;
    
    infoSueldo = record
        codigo : scodigo;
        sueldoBruto : real;
    end;
    
    v_sueldo = array[scodigo] of infoSueldo;

procedure leer(var e:empleado);
begin
    with e do
        begin
            writeln('Ingrese el codigo del empleado (1-2000)');
            readln(codigo);
            writeln('Ingrese el codigo pais del empleado (1-25)');
            readln(codpais);
            writeln('Ingrese los años de antiguedad del empleado');
            readln(antiguedad);
            writeln('Ingrese el sueldo bruto en dolares del empleado');
            readln(sueldoBruto);
        end;
end;
procedure inicializar (var c:contador; var v:v_sueldo);
var
    i : spais;
begin
    for i:= 1 to cantPaises do
        begin
            c[i] := 0;
            v[i].sueldoBruto := -1;
        end;
end;

procedure actualizarMaximos(var max : infoSueldo; cod: spais; sueldo: real);
begin
    if max.sueldoBruto < sueldo then
        begin
            max.sueldoBruto := sueldo;
            max.codigo := cod;
        end;
end;

procedure procesar(var c:contador; var cant:integer; var v:v_sueldo);
var
    e:empleado;
    codpaisActual : spais;
begin
    leer(e);
    while (e.codigo <> 0) do
        begin
            codpaisActual := e.codpais;
            while (e.codpais = codpaisActual) do
                begin
                    c[codpaisActual] := c[codpaisActual] + 1;
                    actualizarMaximos(v[e.codpais], e.codigo, e.sueldoBruto); //punto 3
                    leer(e);
                end;
            if (e.antiguedad > 10) and (e.sueldoBruto < 1500) then
                cant := cant + 1;
        end;
end;

function maxCantEmpleadosPais(c: contador): integer;
var
    i , maxpais : spais;
    max : integer;
begin
    max := -1;
    for i:= 1 to cantPaises do
        begin
            if c[i] > max then
                begin
                    max := c[i];
                    maxpais := i;
                end;
        end;
    maxCantEmpleadosPais := maxpais;
end;

procedure imprimirCodigoPorPais(v: v_sueldo);
var
    i: spais;
begin
    for i:=1 to cantPaises do
        writeln('En el Pais ', i, ' el codigo del empleado con el mejor sueldo es: ', v[i].codigo);
end;

//Porgrama Principal
var
    c : contador;
    cant : integer;
    v : v_sueldo;
begin
    cant := 0;
    inicializar(c, v);
    procesar(c, cant, v);
    writeln('El pais con la mayor cantidad de empleados es : ', maxCantEmpleadosPais(c)); //punto 1
    imprimirCodigoPorPais(v); //punto 3
    writeln('Los empleados que tienen mas de 10 años de antiguedad y su suldo no llega a los 1500 dolares son: ', cant);
end.
