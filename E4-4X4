program E44x4;
const
    cantPaises = 25;
    cantEmpleados = 2000;
type
    spais = 1..cantPaises;
    scodigo = 1..cantEmpleados;
    empleado = record
        codigo : scodigo;
        codpais : spais;
        antiguedad : integer;
        sueldoBruto : real;
    end;
    
    v_empleados = array[scodigo] of empleado;
    
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
procedure inicializar (var c:contador; var vs:v_sueldo);
var
    i : spais;
begin
    for i:= 1 to cantPaises do
        begin
            c[i] := 0;
            vs[i].sueldoBruto := -1;
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

procedure cargarVector (var ve:v_empleados; var diml:integer);
var
    e: empleado;
begin
    leer(e);
    while (diml < cantEmpleados) and (e.codigo <> 0) do
        begin
            ve[diml] := e;
            diml := diml + 1;
            leer(e);
        end;
end;

procedure procesar(var c:contador; var cant:integer; var vs:v_sueldo; diml: integer; var ve: v_empleados);
var
    i: integer;
begin
    cargarVector(ve, diml);
    for i := 1 to diml do
        begin
            c[ve[i].codpais] := c[ve[i].codpais] + 1;
            actualizarMaximos(vs[ve[i].codpais], ve[i].codigo, ve[i].sueldoBruto);
        end;
    if (ve[i].antiguedad >  10) and (ve[i].sueldoBruto < 1500) then
        cant := cant + 1;
end;

function maxCantEmpleadosPais(c: contador; diml:integer): integer;
var
    i , maxpais : spais;
    max : integer;
begin
    max := -1;
    for i:= 1 to diml do
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
    ve : v_empleados;
    c : contador;
    cant : integer;
    vs : v_sueldo;
    diml : scodigo;
begin
    cant := 0;
    diml := 1;
    inicializar(c, vs);
    procesar(c, cant, vs, diml, ve);
    writeln('El pais con la mayor cantidad de empleados es : ', maxCantEmpleadosPais(c, diml)); //punto 1
    imprimirCodigoPorPais(vs); //punto 3
    writeln('Los empleados que tienen mas de 10 años de antiguedad y su suldo no llega a los 1500 dolares son: ', cant);
end.
