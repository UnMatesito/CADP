{
    Realice un programa que resuelva los siguientes incisos:
        a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
            cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
        b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
        c. Lea un nombre y lo inserte en la posición 4 del vector.
        d. Lea un nombre y lo agregue al vector.
        Nota: Realizar todas las validaciones necesarias.
}

program E02P4_2;
const
    dimf = 500;
type
    s_cant = 1..dimf;
    v_alumnos = array[s_cant] of string;

procedure cargarVector(var v:v_alumnos; var diml: integer);
begin
    diml := 1;
    writeln('Ingrese un nombre');
    readln(v[diml]);
    while (diml < dimf) and (v[diml] <> 'ZZZ') do
        begin
            diml := diml + 1;
            writeln('Ingrese un nombre');
            readln(v[diml]);
        end;
end;
procedure eliminarNombre(var v:v_alumnos; var diml:integer; var ok:boolean; pos: integer; var nombre: string);
var
    i : integer;
begin
    ok := false;
    while (v[pos] <> nombre) do
        pos := pos + 1;
    if (v[pos] = nombre) then
        if (pos >= 1) and (pos <= diml) then
            begin
                begin
                    for i:= pos to (diml - 1) do
                        v[i] := v[i + 1];
                end;
                ok := true;
            end;
end;
procedure insertarPos4(var v:v_alumnos; var diml: integer; var ok: boolean; pos:integer; var nombre:string);
var
    i: integer;
begin
    ok := false;
    if ((diml + 1) <= dimf) and (pos <= diml) then
        begin
            for i:= dimL downto pos do
                v[i + 1] := v[i];
            ok := true;
            v[pos]:= nombre;
            dimL:= dimL + 1;
        end;
end;
procedure agregar(var v:v_alumnos; var diml: integer; var ok: boolean; var nombre: string);
begin
    ok := false;
    if (diml < dimf) then
        diml := diml + 1;
        v[diml] := nombre;
        ok := true;
end;



// programa principal
var
    v : v_alumnos;
    diml, i : integer;
    pos : integer;
    ok: boolean;
    nombre : string;
begin
    cargarVector(v, diml);
    pos := 1;
    writeln('Ingrese un nombre que se encunetra en el vector para eliminar');
    readln(nombre);
    eliminarNombre(v, diml, ok, pos, nombre);
    writeln('------------------------------------------------------------------------------------------');
    for i:= 1 to diml do
        writeln(v[i]);
    writeln('Ingrese un nombre nuevo para insertar');
    readln(nombre);
    pos := 4;
    insertarPos4(v, diml, ok, pos, nombre);
    writeln('------------------------------------------------------------------------------------------');
    for i:= 1 to diml do
        writeln(v[i]);
    writeln('------------------------------------------------------------------------------------------');
    writeln('Ingrese un nombre nuevo para agregar al vector');
    readln(nombre);
    agregar(v, diml, ok, nombre);
    writeln('------------------------------------------------------------------------------------------');
    for i:= 1 to diml do
        writeln(v[i]);
end.