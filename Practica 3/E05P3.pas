program E05P3;

type
    auto = record
        marca: string;
        modelo: string;
        precio: real;
    end;

procedure leerAuto(var a:auto);
begin
    with a do
        begin
            writeln('Ingrese la marca del auto');
            readln(marca);
            if (marca <> 'ZZZ') then
                begin
                    writeln('Ingrese el modelo del auto');
                    readln(modelo);
                    writeln('Ingrese el precio del auto');
                    readln(precio);
                    writeln();
                end;
        end;
end;

procedure actMaximo(a:auto; var max:real; var maxMarca, maxModelo:string);
begin
    if (a.precio > max) then
        begin
            max := a.precio;
            maxMarca := a.marca;
            maxModelo := a.modelo;
        end;
end;

procedure procesar(var maxMarca:string; var maxModelo:string);
var
    a:auto;
    max: real;
    marcaAct: string;
    cant: integer;
    totalPrecio: real;
begin
    max := -1;
    leerAuto(a);
    while (a.marca <> 'ZZZ') do
        begin
            marcaAct := a.marca;
            totalPrecio := 0;
            cant := 0;
            while (a.marca <> 'ZZZ') and (marcaAct = a.marca) do
                begin
                    totalPrecio := totalPrecio + a.precio;
                    cant := cant + 1;
                    actMaximo(a, max, maxMarca, maxModelo);
                    leerAuto(a);
                end;
            writeln('Precio promedio de ', marcaAct, ': ', (totalPrecio/cant):0:2);
        end;
end;


var
    maxMarca, maxModelo:string;
begin
    procesar(maxMarca, maxModelo);
    writeln('El ', maxMarca, ' ' , maxModelo, ' es el auto mas caro');
end.