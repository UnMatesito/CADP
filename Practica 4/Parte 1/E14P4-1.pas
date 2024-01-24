{
    El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
    los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
    participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo.

    Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
    proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
    residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
    dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
    -1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
        a) El monto total invertido en desarrolladores con residencia en Argentina.
        b) La cantidad total de horas trabajadas por Administradores de bases de datos.
        c) El código del proyecto con menor monto invertido.
        d) La cantidad de Arquitectos de software de cada proyecto.
}

program E14P4_1;
const
    dimf = 1000;
type
    s_proyecto = 1..1000
    s_rol = 1..5
    desarrolador = record
            pais = string[30];
            codproyecto = s_proyecto;
            nombre = string[40];
            rol = s_rol;
            horas = real;
        end;

procedure leerDesarrollador(var d: desarrolador);
begin
    with d do
        begin
            writeln('Ingrese el pais de residencia del desarrollador');
            readln(pais);
            writeln('Ingrese el codigo de proyecto en el que el desarrollador participo');
            readln(codproyecto);
            writeln('Ingrese el nombre del proyecto en el que el desarrollador participo');
            readln(nombre);
            writeln('Ingrese el rol del desarrollador (1-5)');
            readln(rol);
            writeln('Ingrese la cantidad de horas que el desarrolador trabajó');
            readln(horas);
        end;
end;
procedure cargarVector(var diml: integer);
var
    d: desarrolador;
begin
    leerDesarrollador(d);
    while (diml > dimf) and (d.codproyecto <> -1) do
        begin
            diml := diml + 1;
        end;
end;






// Programa Principal
var
    diml : integer;
begin
    diml := 0; 
    cargarVector
end.