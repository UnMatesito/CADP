
//VECTORES-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Agregar al final
-pseudocodigo
    1.Pregunto si hay espacio, es decir que la dimension logica + 1 no exceda la dimension fisica;
        si lo hay:
            2. incremento la dimension logica en 1;
            3. agrego el elemento al final del vector;
    
    opcional: se puede tener una variable booleana que comprebe si el elemento se agrego o no

-codigo
procedure Agregar (var v:vector; var dimL:integer; num:integer);
begin
    if ((dimL+1) <= dimF) then
        begin
            dimL := dimL + 1;
            v[dimL] := num;
        end;
end;

//Insertar Desordenado
-pseudocodigo
    1. Pregunto si hay espacio, es decir la dimension logica + 1 no exceda la dimension fisica y la posicion donde quiero insertar el elemento exista en el rango del vector;
        si es asi:
            2. hago un for de dimension logica downto posicion corriendo los elementos;
            3. Inserto el elemento en la posicion deseada;
            4. incremento la dimension logica;
    
    opcional: se puede tener una variable booleana que comprebe si el elemento se agrego o no

-codigo
procedure InsertarDesordenado (var v:vector; var dimL:integer; num:integer; pos:integer);
var
    i:integer;
begin
    if ((dimL+1) <= dimF) and (pos >= 1) and (pos <= dimL) then
        begin
            for i:= dimL downto pos do
                v[i+1] := v[i];
            v[pos] := num;
            dimL := dimL + 1;
        end;
end;

//Insertar Ordenado
-pseudocodigo
    1. inicializo la variable posicion en 1
    2. Mientras haya lugar, es decir la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en la poscion sea menor al numero a insertar;
        -> incremento la posicion en 1
    cuando encuentre la poscion a insertar:
    3. Pregunto si la dimension logica + 1 no exceda la dimension fisica y la posicion donde quier insertar sea menor o igual a la dimension logica;
        si es asi:
            4. hago un for de dimension logica downto posicion corriendo los elementos;
            5. Inserto el elemento en la posicion deseada;
            6. incremento la dimension logica;
    
    opcional: se puede tener una variable booleana que comprebe si el elemento se agrego o no

-codigo
procedure InsertarOrdenado (var v:vector; var dimL:integer; num:integer);
var
    pos, i:integer;
begin
    pos := 1;
    while (pos <= dimL) and (v[pos] < num) do
        pos := pos + 1;
    if ((dimL+1) < dimF) and (pos <= dimL) then
        begin
            for i:= dimL downto pos do
                v[i+1] := v[i];
            v[pos] := num;
            dimL := dimL + 1;
        end;
end;

//Eliminar un elemento en una posicion determinada
-pseudocodigo
    1. Pregunto si la poscion que quiero eliminar existe
        si es asi:
            2. Hago un for de posicion a la dimension logica - 1 corriendo los elementos (realizo el borrado logico);
            3. Decremento la dimension logica;

-codigo
procedure eliminarEnPos (var v:vector; var dimL:integer; pos:integer);
var
    i:integer;
begin
    if (pos >= 1) and (pos <= dimL) then
        begin
            for i:= pos to (dimL-1) do
                v[i] := v[i+1];
            dimL := dimL - 1;
        end;
end;

//Eliminar un elemento que se encuentra en vector (vector desordenado)
-pseudocodigo
    1. inicializo la variable posicion en 1
    2. Mientras la posicion sea menor o igual a la dimension logica y el elemento de la poscion sea distinto al elemento a eliminar
        -> incremento la posicion;
    cuando encuentro la posicion:
    3. Pregunto si el elemento en el indice posicion es igual al elemento que quier eliminar
        si es asi:
            4. Hago un for de posicion a la dimension logica - 1 corriendo los elementos (realizo el borrado logico);
            5. Decremento la dimension logica;
-codigo
procedure eliminarElemento (var v:vector; var dimL:integer; num:integer);
var
    pos,i :integer;
begin
    pos := 1;
    while (pos <= dimL) and (v[pos] <> num) do
        pos := pos + 1;
    if (v[pos] = num) then
        begin
            for i:= pos to (dimL-1) do
                v[i] := v[i+1];
            dimL := dimL - 1;
        end;
end;

//Eliminar un elemento que se encuentra en vector (vector ordenado)
-pseudocodigo
    1. inicializo la variable posicion en 1
    2. Mientras la posicion sea menor o igual a la dimension logica y el elemento de la poscion sea menor al elemento a eliminar
        -> incremento la posicion;
    cuando encuentro la posicion
    3. Pregunto si el elemento de la posicion es igual al dato a eliminar
        si es asi:
            4. Hago un for de posicion a la dimension logica - 1 corriendo los elementos (realizo el borrado logico);
            5. Decremento la dimension logica;
-codigo
procedure eliminarElemento (var v:vector; var dimL:integer; num:integer);
var
    pos,i :integer;
begin
    pos := 1;
    while (pos <= dimL) and (v[pos] < num) do
        pos := pos + 1;
    if (v[pos] = num) then
        begin
            for i:= pos to (dimL-1) do
                v[i] := v[i+1];
            dimL := dimL - 1;
        end;
end;

//Eliminar mas de un elemento que se encuentra en vector (vector desordenado/ordenado)
-pseudocodigo
    1. inicializo la variable posicion en 1
    2. Mientras la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en posicion sea menor al numero
        -> incremento la posicion; (para encontrar la primera ocurrencia)
    3. inicializo la variable contador de ocurrencias;
    4. Mientras la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en posicion sea igual al numero
        -> incremento la posicion;
        -> incremento el contador de ocurrencias;
    5. Hago un for desde posicion hasta la dimension logica corriendo los elementos utilizando el contador de ocurrencias (realizo el borrado logico);
    6. Decremento la dimension logica utilizando el contador de ocurrencias;

-codigo
procedure eliminarMasDeUnElemento (var v:vector; var dimL:integer; num:integer);
var
    i,pos,contador:integer;
begin
    pos := 1;
    while (pos <= dimL) and (v[pos] < num) do //para desordenado uso <>
        pos := pos + 1;
    contador := 0;
    while (pos <= dimL) and (v[pos] = num) do
        pos := pos + 1;
        contador := contador + 1;
    for i := pos to dimL do
        v[i-contador] := v[i]; 
    dimL := dimL - contador;
end;

//Busqueda Lineal (vector desordenado)
-pseudocodigo
    1. Inicializo la variable booleana esta en falso porque no se si el elemento se encuentra;
    2. Inicializo la vairable posicion en 1;
    3. Mientras la posicion sea menor o igual a la dimension logica y esta no sea verdadero
        -> si el elemento de la posicion es igual al numero a buscar
            -> esta se convierte en verdadero;
        -> sino 
            -> incremento la posicion;
    4. Asigno a la funcion la variable esta;

-codigo
function busquedaLineal(v:vector; dimL:integer; num:integer):boolean;
var
    esta: boolean;
    pos: integer;
begin
    esta := false;
    pos := 1;
    while (pos <= dimL) and (not esta) do
        begin
            if (v[pos] = num) then
                esta := true
            else
                pos := pos + 1;
        end;
    busquedaLineal := esta;
end;
//Busqueda lineal mejorada(vector ordenado)
-pseudocodigo
    1. Inicializo la variable posicion en 1
    2. Mientras la posicionn sea menor o igual a la dimension logica y el elemento que se encuentra en el indice posicion sea menor al numero
        -> incremento la posicion;
    3. Pregunto si la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en el indice posicion sea igual
        si es asi:
            le asigno a la funcion verdadero;
        sino
            le asigno a la funcion falso;
-codigo
function busquedaMejorada (v:vector; dimL:integer; num:integer):boolean
var
    pos: integer;
begin
    pos := 1;
    while (pos <= dimL) and (v[pos] < num) then
        pos := pos + 1;
    if (pos <= dimL) and (v[pos] = num) then
        busquedaMejorada := true;
    else
        busquedaMejorada := false;
end;

//Busqueda binaria o dicotomica
-pseudocodigo
    1. Inicializo la variable primero en la primera posicion del vector;
    2. Inicializo la variable ultimo en la dimension logica del vector;
    3. Inicializo la variable medio en la posicion de (primero + ultimo) div 2;
    4. Inicializo la variable esta en falso;
    5. Mientras primero es menor o igual que ultimo y el elemento en el indice medio se es igual al elemento a buscar
        ->pregunto si el elemento a buscar es mayor que el elemento en el indice medio
            si es asi:
                -> ultimo pasa a ser medio - 1;
            sino
                -> primero pasa a ser medio + 1;
        -> actualizo medio con la misma cuenta (primero + ultimo) div 2;
    6. Pregunto si primero es menor o igual que ultimo y el elemento del medio es igual al elemento que estoy buscando
        -> esta va a ser verdadero;
    7. Asigno a la funcion el valor de esta;

-codigo
function busquedaDicotomica(v:vector; dimL:integer; num:integer):boolean
var
    pri,medio,ult:integer;
    esta:boolean;
begin
    pri := 1;
    ult := dimL;
    medio := (pri + ult) div 2
    esta := false;
    while (pri <= ult) and (v[medio] < num) do
        begin
            if (num > v[medio]) then
                ult := medio - 1
            else
                pri := medio + 1;
            medio := (pri + ult) div 2; 
        end;
    if (pri <= utl) and (v[medio] = num) then
        esta := true;
    busquedaDicotomica := esta;
end;

//Corte de control (recorrer un vector ya dispuesto)
-pseudocodigo
    1. inicializo la variable posicion en 1
    2. Mientras la posicion sea menor o igual a la dimension logica
        -> le asigno a una variable actual el dato que quiero tener como ordenado;
           (opcional: inicializo otras variables)
        -> Mientras la posicion sea menor o igual a la dimesion logica y la variable actual sea igual al dato con el que comparo
            -> Hago las acciones requeridas;
            -> incremento la posicion en 1;
           (opcional: actualizo maximos u otras acciones)

-codigo
procedure corteDeControl (v:vector; dimL:integer);
var
    pos, datoAct:integer;
begin
    pos := 1
    while (pos <= dimL) do
        begin
            datoAct := v[pos];
            //otras acciones
            while (pos <= dimL) and (datoAct = v[pos]) do
                begin
                    //acciones requeridas
                    pos := pos + 1;
                end;
            //otras acciones
        end;
end;

//Ordenar Vector (selecion)
-pseudocodigo
    consideraciones:
        -tiempo de ejecucion: exponencial;
        -necesito 3 variables locales para posiciones de elementos del vector;
        -no ordeno todo el vector, se ordena hasta la dimension logica - 1 porque sabemos que siempre la ultima posicion va a ser el numero mas grande;
    1. Hago un for de 1 a la dimension logica - 1
        2. le asigno a la variable posicion la variable i (i solo se encarga de hacer el recorrido del vector hasta la dimension logica - 1);
        3. Hago un for de i + 1 (la siguiente posicion) hasta la dimension logica
            4. Pregunto si el elemento en el indice de la siguiente posicion de i es menor al elemento del indice posicion 
                si es asi:
                    -> a posicion le asigno esa posicion donde estaba el elemento mas chico;
            5.realizo el intercambio de elementos utilizando una variable auxiliar para no perder ninguno de los dos datos durante el intercambio;

-codigo
procedure ordenarVector (var v:vector; dimL:integer);
var
    aux:integer;
    i,j,pos:integer;
begin
    for i:=1 to (dimL-1) do
        begin
            pos := i;
            for j:= i+1 to dimL do
                if (v[j] < v[pos]) then
                    pos := j;
            aux := v[pos];
            v[pos] := v[i];
            v[i] := aux;
        end;
end;

//LISTAS------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Agregar Adelante
-pseudocodigo
    1. Se crea un nuevo nodo y se le asignan los datos pertinentes
    2. le asignamos como siguiente la lista para crear un enlace
    3. cambiamos la posicion de l para que el nuevo nodo sea el comiezo de la lista

-codigo
procedure agregarAdelante(var l:lista; num:integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := num;
    nuevo^.sig := l;
    l := nuevo;
end;

//Agregar Atras
-pseudocodigo
    1. Se crea un nuevo nodo y se le asignan los datos pertinentes;
    2. Se le asigna como siguiente nil;
    3. A la lista se le asigna un ultimo;
    4. Se pregunta si la lista esta vacia
        si es asi:
            -> a l se le asigna nuevo;
            -> a ultimo se le asigna nuevo;
        sino
            -> al siguiente de ultimo se le asigna nuevo;
            -> ultimo pasa a ocupar el lugar de nuevo;

-codigo
procedure agregarAtras(var l:lista; num:integer);
var
    nuevo:lista
begin
    new(nuevo);
    nuevo^.dato := num;
    nuevo^.sig := nil;
    if (l = nil) then
        begin
            l := nuevo;
            ult := nuevo;
        end
    else
        begin
            ult^.sig := nuevo;
            ult := nuevo;
        end;
end;

//Insetar Ordenado
-pseudocodigo
    consideraciones:
        - vamos a tener que utilizar 2 variables de tipo lista actual y anterior para ir avanzando en la lista
        - existen tres casos en los que tenemos que insertar datos:
            1. si el dato que se quiere insertar tiene que estar al principio de la lista
            2. si el dato que se quiere insertar tiene que estar en el medio de la lista
            3. si el dato que se quiere insertar tiene que estar al final de la lista
    1. Se crea un nuevo nodo y se le asignan los datos pertinentes;
    2. Se le asigna a la lista actual;
    3. Mientras actual sea distinto de nil y que el elemento de actual sea menor al nuevo elemento que queremos insertar
        -> A anterior se le asigna actual;
        -> A actual se le asigna su siguiente;
    4. Pregunto si actual es igual a anterior (quiere indicar el primer caso);
        si es asi:
            -> A la lista le asigno el nuevo nodo;
        sino
            -> Al siguiente de anterior le asigno el nuevo nodo (caso 2);
    5. Al nuevo nodo le asignamos el siguiente de actual (caso 2 y 3);

-codigo
procedure insertarOrdenado (var l:lista; num:integer);
var
    nuevo, ant, act: lista;
begin
    new(nuevo);
    nuevo^.dato := num;
    act := l;
    while (act <> nil) and (act^.dato < nuevo^.dato) do //si queremos que sea asendente usamos <, si queremos que sea desendente usamos >
        begin
            ant := act;
            act := act^.sig;
        end;
    if (ant = act) then
        l := nuevo //caso 1
    else
        ant^.sig := nuevo; //caso 2
    act^.sig := nuevo; //caso 2 y 3
end;

//Eliminar una vez (desordenado)
-pseudocodigo
    consideraciones:
        -Al igual que con el insertar ordenado necesitamos usar anterior y actual
    1. Le asignamos a actual la lista que qeuremos recorrer
    2. Mientras actual sea distinto de nil y el dato que se encuentra en actual sea distinto del dato que quiero eliminar
        -> A anteriror le asigno actual;
        -> A actual le asigno su siguiente; (hago un recorrido)
    3. Pregunto si actual es disitnto de nil
        si es asi:
            -> Pregunto si actual se encuentra en la primera posicion
                si es asi
                    -> corro el inicio de la lista a la siguiente posicion;
                sino
                    -> hago que el siguiente de actual sea siguiente de anteriror;
            -> elimino el nodo donde se situa actual;

-codigo
procedure eliminar (var l:lista; num:integer);
var
    ant, act:lista;
begin
    act := l;
    while (act <> nil) and (act^.dato <> num) do
        begin
            ant := act;
            act := act^.sig;
        end;
    if (act <> nil) then
        begin
            if (act = l) then
                l := l^.sig;
            else
                ant^.sig := act^.sig;
            dispose(act);
        end;

//Eliminar una vez (ordenado)
-pseudocodigo
    consideraciones:
        -Al igual que con el insertar ordenado necesitamos usar anterior y actual
    1. Le asignamos a actual la lista que qeuremos recorrer
    2. Mientras actual sea distinto de nil y el dato que se encuentra en actual sea menor del dato que quiero eliminar
        -> A anteriror le asigno actual;
        -> A actual le asigno su siguiente; (hago un recorrido)
    3. Pregunto si actual es disitnto de nil y el dato que se encuentra en actual es igual al dato que quiero eliminar
        si es asi:
            -> Pregunto si actual se encuentra en la primera posicion
                si es asi
                    -> corro el inicio de la lista a la siguiente posicion;
                sino
                    -> hago que el siguiente de actual sea siguiente de anteriror;
            -> elimino el nodo donde se situa actual;

-codigo
procedure eliminarOrdenado (var l:lista; num:integer);
var
    ant, act:nuevo;
begin
    act := l;
    while (act <> nil) and (act^.dato < num) do
        begin
            ant := act;
            act := act^.sig;
        end;
    if (act <> nil) and (act^.dato = num) then
        begin
            if (act = l) then
                l := l^.sig
            else
                ant^.sig := act^.sig;
            dispose(act);
        end;
end;

//Eliminar mas de una vez (lista desordenada)
-pseudocodigo
    1. Le asignamos a actual la lista que qeuremos recorrer;
    2. Mientras actual sea distinto de nil
        -> Pregunto si el dato que se encuentra en actual es distinto al dato que quiero eliminar
            si es asi
                -> a anterior se le asigna actual;
                -> a actula se le asigna su siguiente; (realizo el recorrido hasta encontrar el elemento hasta que act sea nil)
            sino (se encontro el dato a eliminar)
                -> Pregunto si actual se encuentra en la primera posicion
                    si es asi:
                        -> la refrencia de la lista pasa a ser la siguiente;
                    sino
                        -> hago que el siguiente de actual sea siguiente de anteriror;
                -> elimino el nodo que se situa en actual;
                -> le asigno a actual el anterior para poder seguir eliminando ocurrencias;

-codigo
procedure eliminarMasDeUnElementoListaDes(var l:lista; num:integer);
begin
    act := l;
    while (act <> nil) do
        begin
            if (act^.dato <> num) then
                begin
                    ant := act;
                    act := act^.sig;
                end
            else
                begin
                    if (act = l) then
                        l := l^.sig
                    else
                        ant^.sig := act^.sig;
                    dispose(act);
                    act := ant;
                end;
        end;
end;

//Eliminar mas de una vez (lista ordenada)
-pseudocodigo
    1. Le asignamos a actual la lista que qeuremos recorrer;
    2. Mientras actual sea distinto de nil
        -> Pregunto si el dato que se encuentra en actual es menor al dato que quiero eliminar
            si es asi
                -> a anterior se le asigna actual;
                -> a actula se le asigna su siguiente; (realizo el recorrido hasta encontrar el elemento hasta que act sea nil)
            sino si el dato que se encuentra en actual es igual al dato que quiero eliminar
                -> Pregunto si actual se encuentra en la primera posicion
                    si es asi:
                        -> la refrencia de la lista pasa a ser la siguiente;
                    sino
                        -> hago que el siguiente de actual sea siguiente de anteriror;
                -> elimino el nodo que se situa en actual;
                -> le asigno a actual el anterior para poder seguir eliminando ocurrencias;

-codigo
procedure eliminarMasDeUnElementoListaDes(var l:lista; num:integer);
begin
    act := l;
    while (act <> nil) do
        begin
            if (act^.dato < num) then
                begin
                    ant := act;
                    act := act^.sig;
                end
            else if (act^.dato = num) then
                begin
                    if (act = l) then
                        l := l^.sig
                    else
                        ant^.sig := act^.sig;
                    dispose(act);
                    act := ant;
                end;
        end;
end;

//Busqueda Desordenada
-pseudocodigo
    1. Inicializo una variable booleana que determnina si se encontro el elemento en falso;
    2. Mientras la lista no llegue a nil y la variable booleana no sea verdadero
        -> Pregunto si el dato almacenado en la lista es igual al dato a buscar
            si es asi:
                -> la variable booleana pasa a ser verdadera;
            sino
                -> avanzo a la siguiente posicion de la lista;
    3. Le asigno a la funcion el valor que contendra la variable booleana despues de la ejecucion;

-codigo
function busquedaDesordenada(l:lista; num:integer):boolean;
var
    encontrado: boolean;
begin
    encontrado := false;
    while (l <> nil) and (not encontrado) do
        begin
            if (l^.dato = num) then
                encontrado := true
            else
                l := l^.sig;
        end;
    busquedaDesordenada := encontrado;
end;

//Busqueda Ordenada
-pseudocodigo
    1. Inicializo una variable booleana que determnina si se encontro el elemento en falso;
    2. Mientras la lista no llegue a nil y la variable booleana no sea verdadero
        -> avanzo a la siguiente posicion de la lista;
    3.Pregunto si el dato almacenado en la lista es igual al dato a buscar
        si es asi:
            -> la variable booleana pasa a ser verdadera;   
    4. Le asigno a la funcion el valor que contendra la variable booleana despues de la ejecucion;

-codigo
function busquedaDesordenada (l:lista; num:integer):boolean;
var
    encontrado: boolean;
begin
    encontrado := false;
    while (l <> nil) and (l^.dato < num) do
        l := l^.sig;
    if (l <> nil) and (l^.dato = num) then
        encontrado := true;
    busquedaDesordenada := encontrado;
end;

//Corte de control
-pseudocodigo
    consideracion: La lista tiene que estar ordeana por un criterio
    1. Mientras la lista no llegue a nil
        -> le asigno al dato actual el dato de la lista
           (opcional: se pueden realizar otras acciones como inicializar un variable)
        -> Mientras la lista no llegue a nil y el dato de la lista sea igual al dato actual
              (Realizo las acciones que me pieden en el problema)
            -> avanzo a la siguiente posicion de la lista;
        (opcional: se puede realizar un actualizar maximo o minimos segun corresponda el ejercicio)

-codigo
procedure corteDeControlLista(l:lista);
var
    datoAct: integer
begin
    while (l <> nil) do
        begin
            datoAct := l^.dato;
            //otras acciones;
            while (l <> nil) and (l^.dato = datoAct) do
                begin
                    //acciones requieridas;
                    l := l^.sig;
                end;
            //actMaximos, minimos, etc;
        end;
end;