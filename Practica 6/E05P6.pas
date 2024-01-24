{
    Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
    producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
    el código -1, que no debe procesarse. 
    Una vez leída y almacenada toda la información, calcular e informar:
        a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
        b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
        c. Código de los dos productos más económicos.
}
program E05P6;
type
    producto = record
        codigo : integer;
        descripcion : string;
        stockAct : integer;
        stockMin : integer;
        precio : real;
        end;
    lista = ^nodo;
    nodo = record
        dato: producto;
        sig : lista;
        end;

procedure leerProducto(var p: producto);
begin
    with p do
        begin
            writeln('Ingrese el codigo del producto');
            readln(codigo);
            if (codigo <> -1) then
            begin
                writeln('Ingrese la descripcion del producto');
                readln(descripcion);
                writeln('Ingrese el stock actual del producto');
                readln(stockAct);
                writeln('Ingrese el stock minimo del producto');
                readln(stockMin);
                writeln('Ingrese el precio del producto');
                readln(precio);
            end;
        end;
end;

procedure armarNodo(var l: lista; p:producto);
var
    aux : lista;
begin
    new(aux);
    aux^.dato := p;
    aux^.sig := l;
    l := aux;
end;

// Recorrer Lista e Informar
procedure recorrerLista(l: lista; cantotal: integer; var codmin1, codmin2: integer);
var
    cant, cantPar : integer;
    num, resto : integer;
    min1, min2 : real;
begin
    min1 := 9999;
    min2 := 9999;
    cant := 0;
    while (l <> nil) do
    begin
        if (l^.dato.stockMin > l^.dato.stockAct) then
                cant := cant + 1;
        num := l^.dato.codigo;
        cantPar := 0;
        while (num <> 0) do
            begin 
                resto := num mod 10;
                if (resto mod 2 = 0) then
                    cantPar := cantPar + 1;
                num := num div 10;
            end;
        if (cantPar >= 3) then
            writeln('El Producto con esta descripcion ', l^.dato.descripcion, ' Tiene un codigo de mas de 3 digitos pares');
        if (l^.dato.precio < min1) then
        begin
            min2 := min1;
            min1 := l^.dato.precio;
            codmin2 := codmin1;
            codmin1 := l^.dato.codigo;
        end
        else if (l^.dato.precio < min2) then
            begin
                min2 := l^.dato.precio;
                codmin1 := l^.dato.codigo;
            end;
        l := l^.sig;
    end;
    writeln('El porcentaje de productos con stock actual menor al stock minimo es: ', (cant*100)/cantotal:2:2,'%');
    writeln('Los dos productos mas economicos son los que tienen el codigo: ', codmin1, ' y ', codmin2);
end;


//Programa Principal
var
    l: lista;
    p : producto;
    cantotal : integer;
    codmin1, codmin2: integer;
begin
    l := nil;
    cantotal := 0;
    //Cargar Lista
    leerProducto(p);
    while (p.codigo <> -1) do
        begin
            armarNodo(l, p);
            cantotal := cantotal + 1;
            leerProducto(p);
        end;
    //Informar
    recorrerLista(l, cantotal, codmin1, codmin2);
end.