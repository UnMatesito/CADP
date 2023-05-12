program E12P4_1;
const
  dimf = 53;
  max = 4;
type
  tipos = 1..max;
  t_galaxia = record
    nombre : string[30];
    tipo : tipos;
    masa : integer;
    distpc : integer;
    end;
  v_galaxia = array [1..dimf] of t_galaxia;
  v_contador = array [tipos] of integer;
 
procedure leer (var r:t_galaxia);
begin
  writeln('Ingrese el nombre de la galaxia');
  readln(r.nombre);
  writeln('Ingrese el tipo de galaxia, 1: elíptica, 2: espiral, 3: lenticular, 4: irregular');
  readln(r.tipo);
  writeln('Ingrese su masa en kg');
  readln(r.masa);
  writeln('Ingrese la distancia en pársecs (pc)');
  readln(r.distpc);
end;
procedure cargarVector (var vg: v_galaxia; var diml:integer);
var i : integer;
begin
  diml := 0;
  for i:=1 to dimf do
    begin
      leer(vg[i]);
      diml := diml + 1;
    end;
end;
procedure inicializar (var vc: v_contador);
var i:tipos;
begin
  for i:=1 to max do
    vc[i] := 0;
end;
procedure totalAcumulado(vg: v_galaxia; var sumatot: integer; var suma: integer; diml : integer);
var 
  i:integer;
begin
  suma := 0;
  sumatot := 0;
  for i:= 1 to diml do
    begin
      if (vg[i].nombre = 'Via Lactea') or (vg[i].nombre = 'Andromeda') or (vg[i].nombre = 'Triangulo') then
      begin
        suma := suma + vg[i].masa;
      end;
      sumatot := (sumatot + vg[i].masa);
    end;
    writeln('el porcentaje que representa todas las galaxias con respecto a las 3 principales, es de: ', suma/sumatot*10:0:2, '%');
end;
procedure actualizarMaximosyMinimos(vg : v_galaxia; diml:integer; var min1, min2, max1, max2 : integer; var nomMax1, nomMax2, nomMin1, nomMin2: string);
var i: integer;
begin
  for i:= 1 to diml do
    begin
      if vg[i].masa > max1 then
        begin
          max2 := max1;
          max1 := vg[i].masa;
          nomMax2 := nomMax1;
          nomMax1 := vg[i].nombre;
        end
      else if vg[i].masa > max2 then
        begin
          max2 := vg[i].masa;
          nomMax2 := vg[i].nombre;
        end;
      if vg[i].masa < min1 then
        begin
          min2 := min1;
          min1 := vg[i].masa;
          nomMin2 := nomMin1;
          nomMin1 := vg[i].nombre;
        end
      else if vg[i].masa < min2 then
        begin
          min2 := vg[i].masa;
          nomMin2 := vg[i].nombre;
        end;
    end;
end;
 
//Programa Principal
var
  vg: v_galaxia;
  vc: v_contador;
  diml : integer;
  min1, min2, max1, max2 : integer;
  nomMax1, nomMax2, nomMin1, nomMin2 : string;
  suma, sumatot : integer;
  i, cantnoirr : integer;
begin
  cantnoirr := 0;
  min1 := 9999;
  min2 := 9999;
  max1 := -1;
  max2 := -1;
  cargarVector(vg, diml);
  inicializar(vc);
  for i := 1 to diml do
    begin
      vc[vg[i].tipo] := vc[vg[i].tipo] + 1;
    end;
  for i:= 1 to max do
    writeln(i, ' = ', vc[i]);
  totalAcumulado(vg, sumatot, suma, diml);
  for i := 1 to diml do
    begin
      if (vg[i].tipo <> 4) and (vg[i].distpc > 1000) then
        cantnoirr := cantnoirr + 1;
    end;
  writeln('La cantidad de galaxias no irregulares que se encuantran a menos de 1000pc son: ', cantnoirr);
  actualizarMaximosyMinimos(vg, diml, min1, min2, max1, max2, nomMax1, nomMax2, nomMin1, nomMin2);
  writeln('El nombre de las 2 galaxias con la mayor masa son: ', nomMax1,' y ',nomMax2);
  writeln('El nombre de las 2 galaxias con la menor masa son: ', nomMin1,' y ',nomMin2);
end.
