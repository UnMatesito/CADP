program E03P3;
const
    cantEscuelas = 2;
type
    escuela = record
        cue: integer;
        nombre: string;
        cantDocentes: integer;
        cantAlumnos: integer;
        localidad: string;
    end;

    
procedure leerEscuela(var e:escuela);
begin
    with e do
        begin
            writeln('Ingrese el CUE del establecimiento');
            readln(cue);
            writeln('Ingrese el nombre del establecimiento');
            readln(nombre);
            writeln('Ingrese la cantidad de docentes con la que cuenta el establecimiento');
            readln(cantDocentes);
            writeln('Ingrese la cantidad de alumnos');
            readln(cantAlumnos);
            writeln('Ingrese la localidad del establecimiento');
            readln(localidad);
            writeln();
        end;
end;

function relacionDocAlum(docentes:integer; alumnos:integer):real;
begin
    relacionDocAlum := docentes/alumnos;
end;

procedure mayorRelacionLP(e:escuela; doc_Alum:real; var cant:integer);
begin
    if (e.localidad = 'La Plata') and (relacionDocAlum(e.cantDocentes, e.cantAlumnos) > doc_Alum) then
        cant := cant + 1
end;

procedure actMaximos(e:escuela; var max1,max2:real; var nomMax1, nomMax2:string; var cueMax1, cueMax2:integer);
begin
    if (relacionDocAlum(e.cantDocentes, e.cantAlumnos) > max1) then
    begin
        max2 := max1;
        max1 := relacionDocAlum(e.cantDocentes, e.cantAlumnos);
        nomMax2 := nomMax1;
        nomMax1 := e.nombre;
        cueMax2 := cueMax1;
        cueMax1 := e.cue;
    end
    else if(relacionDocAlum(e.cantDocentes, e.cantAlumnos) > max2) then
        begin
            max2 := relacionDocAlum(e.cantDocentes, e.cantAlumnos);
            nomMax2 := e.nombre;
            cueMax2 := e.cue;
        end;
end;

procedure procesar(var e:escuela; doc_Alum:real; var cant:integer; var nomMax1, nomMax2:string; var cueMax1, cueMax2:integer);
var
    i: integer;
    max1, max2: real;
begin
    max1 := -1;
    max2 := -1;
    for i:= 1 to cantEscuelas do
        begin
            leerEscuela(e);
            mayorRelacionLP(e, doc_Alum, cant);
            actMaximos(e, max1, max2, nomMax1, nomMax2, cueMax1, cueMax2);
        end;
end;


//programa principal
var
    e:escuela;
    doc_Alum: real;
    cant:integer;
    nomMax1, nomMax2: string;
    cueMax1, cueMax2: integer;
begin
    doc_Alum := (1 / 23435);
    cant := 0;
    procesar(e, doc_Alum, cant, nomMax1, nomMax2, cueMax1, cueMax2);
    writeln('Cantidad de esculas de La Plata con una relacion Docente-Alumno superior: ', cant);
    writeln('Las 2 escuelas con la mayor relacion Docente-Alumno son: Escuela ', nomMax1, ' CUE: ', cueMax1, ' y Escuela ', nomMax2, ' CUE: ', cueMax2);
end.