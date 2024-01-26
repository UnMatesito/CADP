program EA01P4_2;
const
    dimF = 10000;

type
    computadora = record
        codigo: integer;
        verUbuntu: real;
        cantPaquetes: integer;
        cantUsuarios: integer;
    end;
    
    v_Ubuntu = array[1..dimF] of computadora;
    
procedure leerComputadora(var c:computadora);
begin
    with c do
        begin
            write('Codigo de la computadora: ');
            readln(codigo);
            if (codigo <> -1) then
                begin
                    write('Version de Ubuntu: ');
                    readln(verUbuntu);
                    write('Cantidad de paquetes instalados: ');
                    readln(cantPaquetes);
                    write('Cantidad de usuarios que hay en la computadora: ');
                    readln(cantUsuarios);
                    writeln();
                end;
        end;
end;

procedure ordenarVector(var v:v_Ubuntu; dimL:integer);
var
    i,j,pos: integer;
    aux: computadora;
begin
    for i:=1 to (dimL-1) do
        begin
            pos := i;
            for j:= (i+1) to dimL do
                begin
                    if (v[j].codigo < v[pos].codigo) then
                        pos := j;
                end;
            aux := v[pos];
            v[pos] := v[i];
            v[i] := aux;
        end;
end;

procedure cargarVector(var v:v_Ubuntu; var dimL:integer);
var
    c:computadora;
begin
    leerComputadora(c);
    while (dimL <= dimF) and (c.codigo <> -1) do   
        begin
            dimL := dimL + 1;
            v[dimL] := c;
            leerComputadora(c);
        end;
    ordenarVector(v, dimL);
end;

procedure actMaximo(paquetes:integer; version:real; var max:integer; var maxVer:real);
begin
    if (paquetes > max) then
        begin
            max := paquetes;
            maxVer := version;
        end;
end;

procedure procesar(v:v_Ubuntu; dimL:integer);
var
    i:integer;
    cant, totalUsuarios:integer;
    max: integer;
    maxVer:real;
begin
    cant := 0;
    totalUsuarios := 0;
    max := -1;
    for i:=1 to dimL do
        begin
            if (v[i].verUbuntu = 18.04) or (v[i].verUbuntu = 16.04) then
                cant := cant + 1;
            totalUsuarios := totalUsuarios + v[i].cantUsuarios;
            actMaximo(v[i].cantPaquetes, v[i].verUbuntu, max, maxVer);
        end;
    writeln('Cantidad de computadoras con Ubuntu 18.04 o 16.04: ', cant);
    writeln('Usuarios promedio: ', (totalUsuarios/dimL):0:2);
    writeln('La computadora con mayor cantidad de paquetes tiene instalada la verison ', maxVer:0:2, ' de Ubuntu con ', max, ' paquetes');
end;

procedure eliminar(var v:v_Ubuntu; var dimL:integer);
var
    contador: integer;
    i, pos:integer;
begin
    pos := 1;
    contador := 0;
    while (pos <= dimL) and (v[pos].codigo >= 0) or (v[pos].codigo <= 500) do
        begin
            pos := pos + 1;
            contador := contador + 1;
        end;
    for i:= pos to dimL do
        begin
            v[i-contador] := v[i];
        end;
    dimL := dimL - contador;
end;

procedure imprimirVector(v:v_Ubuntu; dimL:integer);
var
    i:integer;
begin
    for i:= 1 to dimL do
        begin
            writeln(v[i].codigo);
            writeln(v[i].verUbuntu:0:2);
            writeln(v[i].cantPaquetes);
            writeln(v[i].cantUsuarios);
            writeln();
        end;
end;

//programa principal
var
    v: v_Ubuntu;
    dimL: integer;
begin
    dimL := 0;
    cargarVector(v, dimL);
    writeln();
    procesar(v, dimL);
    writeln('Vector ordenado');
    imprimirVector(v, dimL);
    writeln();
    eliminar(v, dimL);
    writeln('Vector modificado');
    imprimirVector(v, dimL);
end.
