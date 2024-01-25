program E04P6;

type
    producto = record
        codigo: integer;
        descripcion: string;
        stockAct: integer;
        stockMin: integer;
        precio: real;
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato: producto;
        sig: lista;
    end;

procedure leerProducto(var p:producto);
begin
    with p do
        begin
            writeln('Ingrese el codigo del producto');
            readln(codigo);
            if (codigo <> -1) then
                begin
                    writeln('Descripcion del producto');
                    readln(descripcion);
                    writeln('Ingrese el stock actual del producto');
                    readln(stockAct);
                    writeln('Ingrese el stock minimo del producto');
                    readln(stockMin);
                    writeln('Ingrese el precio del producto');
                    readln(precio);
                    writeln();
                end;
        end;
end;

procedure agregarAdelante(var l:lista; p:producto);
var
    aux: lista;
begin
    new(aux);
    aux^.dato := p;
    aux^.sig := l;
    l := aux;
end;

procedure cargarLista(var l:lista; var cantElementos:integer);
var
    p:producto;
begin
    leerProducto(p);
    while (p.codigo <> -1) do
        begin
            agregarAdelante(l, p);
            cantElementos := cantElementos + 1;
            leerProducto(p);
        end;
end;

function esPar(num:integer):boolean;
begin
    esPar := (num mod 2) = 0;
end;

procedure cod3digpares(codigo:integer; descripcion:string);
var
    cantPar: integer;
    dig: integer;
begin
    cantPar := 0;
    while (codigo <> 0) do
        begin
            dig := codigo mod 10;
            if (esPar(dig)) then
                cantPar := cantPar + 1;
            codigo := codigo div 10;
        end;
    if (cantPar >= 3) then
        writeln('Descripcion: ', descripcion);
end;

procedure actMinimos(precio:real; codigo:integer; var min1, min2:real; var codMin1, codMin2:integer);
begin
   if (precio < min1) then
        begin
            min2 := min1;
            min1 := precio;
            codMin2 := codMin1;
            codMin1 := codigo;
        end
    else if (precio < min2) then
        begin
            min2 := precio;
            codMin2 := codigo;
        end;
end;

procedure procesar(l:lista; cantElementos:integer);
var
    cant: integer;
    min1, min2: real;
    codMin1, codMin2: integer;
begin
    min1 := 9999;
    min2 := 9999;
    cant := 0;
    while (l <> nil) do
        begin
            if (l^.dato.stockAct < l^.dato.stockMin) then
                cant := cant + 1;
            cod3digpares(l^.dato.codigo, l^.dato.descripcion);
            actMinimos(l^.dato.precio, l^.dato.codigo, min1, min2, codMin1, codMin2);
            l := l^.sig;
        end;
    writeln('Los productos donde su stock actual esta por debajo de su stock minimo es del: ', ((cant*100)/cantElementos):0:0,'%');
    writeln('Los dos productos mas baratos son: ', codMin1, ' y ', codMin2);
end;

var
    l:lista;
    cantElementos: integer;
begin
    l := nil;
    cantElementos := 0;
    cargarLista(l, cantElementos);
    procesar(l, cantElementos);
end.