<h1>Vectores</h1>

<p align="center">
    <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMnJxdmxoMjM0dGdramxuOWo0dHRwdW1tem80ajZ1cTF6OGk2MHhiMiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/uDj0Fa3q8ipBS/giphy.gif" alt="bookshelf"/>
</p>

---

### Definción

Es una estructura de datos compuesta definido por el programador que permite acceder a cada componente, ya que es ***indexada***, ***lineal***, ***estatica*** y ***homogenea***

<h3>Estructura geeneral de como crear un vector</h3>

Al ser una estructura de datos definida por el programador, un vector de declara de la siguiente forma:

```pascal
type
    vector = array [Rango] of //tipo de dato simple


//En programa principal o modulos
var
    v: vector;
```

>[!NOTE]
>El rango puede ser de Integer [1..10], Caracteres [A..Z] o de los 256 caracteres disponibles [char]


<h3>Acceso a los elementos</h3>

Para acceder a alguno de los elementos se declara en el programa como `vector[i]` siendo `i` el indice que nos permite acceder al elemento que se encuentra en dicha posicion del vector.

#### Leer y escribir en un registro con un tipo de dato simple

```pascal
read(v[i]);

write(v[i]);
```

#### Leer y escribir en un registro con un tipo de dato compuesto

```pascal
//Registros
read(v[i].campoN);

write(v[i].campoN);

//Vectores
read(v1[v2[i]]);

write(v1[v2[i]])

//Punteros-Listas
read(v[i]^);

write(v[i]^);
```

<h2>Dimension Fisica y Dimension Logica</h2>

#### Dimensión fisica

Determina la <ins>ocupación maxima de memoria</ins>, esta **no varia** durante la ejecución del programa

>[!TIP]
>La dimension fisica se suele declarar en constantes y es util para hacer **recorridos completos** y **comparar entre la dimensión fisica y lógica**

#### Dimensión lógica

Indica la <ins>cantidad de prociones de memoria ocupadas con **contenido real**</ins>. Puede cambiar durante la ejecucion del programa y no debe superar a la dimensión fisica.

Esta va aumenta cuando se van cargando elmentos en un vector.

>[!TIP]
>La dimensión lógica tiene un papel muy importante en las operaciónes de vectores, cargas parciales, comparaciones, etc.

<h2>Carga de vectores</h2>

Existen 2 tipos de carga de datos a vectores que van a ser muy utilizados durante la materia.

#### Carga Total

```pascal
procedure cargaTotal(var v:vector);
begin
    for i := 1 to dimF do
        read(v[i]);
end;
```

Como vemos, primero se pasa como *parametro por referencia* proque lo queremos modificar llenando el vector. Luego hacemos una repetición hasta la dimensión fisica cargando datos de cualquier tipo.

#### Carga Parcial

```pascal
procedure cargaParcial(var v:vector);
var
    dimL: integer;
begin
    dimL := 1;
    read(v[dimL]);
    while (dimL < dimF) and (condición de corte) do
        begin
            dimL := dimL + 1;
            read(v[dimL]);
        end;
end;
```

En este caso se recorre el vector hasta que se cumpla una sentencia de corte que lo menciona el enunciado, por lo tanto el vector no va a poseer en todas sus posiciones elementos.

#### Carga Parcial con registros

```pascal
procedure cargaParcialRegistros(var v:vector);
var
    dimL: integer;
    n: nombreRegistro;
begin
    leerCampos(n);
    dimL := 0;
    while (dimL < dimF) and (condición de corte) do
        begin
            dimL := dimL + 1;
            v[dimL] := n;
            leerCampos(n);
        end;
end;
```

<h1>Principales operaciones con Vectores</h1>

* [<ins>Agregar</ins>](#agregar)
* [<ins>Insertar</ins>](#insertar)
* [<ins>Busqueda</ins>](#busqueda)
* [<ins>Eliminar</ins>](#eliminar)
* [<ins>Ordenar</ins>](#ordenar)

## Agregar

#### Pseudocodigo

```pascal
1.Pregunto si hay espacio, es decir que la dimension logica + 1 no exceda la dimension fisica;
    si lo hay:
        2. incremento la dimension logica en 1;
        3. agrego el elemento al final del vector;
```

**Opcional**: Se puede tener una variable booleana que comprebe si el elemento se agrego o no.

#### Codigo

```pascal
procedure Agregar (var v:vector; var dimL:integer; num:integer);
begin
    if ((dimL+1) <= dimF) then
        begin
            dimL := dimL + 1;
            v[dimL] := num;
        end;
end;
```
## Insertar

Existen 2 formas de insertar **Desordenado** y **Ordenado**:

**Consideraciones**
- Si se quiere insertar un elemento en una posición determinada, se tienen que **mover lo que estaba en esa posición y sus siguientes un espacio**
- **La posición debe ser valida**
- Si se quiere hacer un *insertar ordenado* se debe hacer **una comparación con el siguiente** e insertarlo donde se necesite

### Desordenado

#### Pseudocodigo

```pascal
1. Pregunto si hay espacio, es decir la dimension logica + 1 no exceda la dimension fisica y la posicion donde quiero insertar el elemento exista en el rango del vector;
        si es asi:
            2. hago un for de dimension logica downto posicion corriendo los elementos;
            3. Inserto el elemento en la posicion deseada;
            4. incremento la dimension logica;
```
**Opcional**: se puede tener una variable booleana que comprebe si el elemento se agrego o no

#### Codigo

```pascal
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
```

### Ordenado

#### Pseudocodigo

```pascal
1. inicializo la variable posicion en 1
2. Mientras haya lugar, es decir la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en la poscion sea menor al numero a insertar;
    -> incremento la posicion en 1
cuando encuentre la poscion a insertar:
3. Pregunto si la dimension logica + 1 no exceda la dimension fisica y la posicion donde quier insertar sea menor o igual a la dimension logica;
    si es asi:
        4. hago un for de dimension logica downto posicion corriendo los elementos;
        5. Inserto el elemento en la posicion deseada;
        6. incremento la dimension logica;
```

**Opcional**: se puede tener una variable booleana que comprebe si el elemento se agrego o no

#### Codigo

```pascal
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
```
## Busqueda

Existen 2 tipos de busqueda en un vector:
- **Desordenado**: no utiliza ningun criterio, es una busqueda comun pero ineficiente debido a que debe recorrer todo el vector
- **Ordenado**: Se puede realizar 2 tipos de busuqeda: 
    1. **Mejorada**
    2. **Binaria o Dicotomica**|

### Busqueda Lineal

#### Pseudocodigo
```pascal
1. Inicializo la variable booleana esta en falso porque no se si el elemento se encuentra;
2. Inicializo la vairable posicion en 1;
3. Mientras la posicion sea menor o igual a la dimension logica y esta no sea verdadero
    -> si el elemento de la posicion es igual al numero a buscar
        -> esta se convierte en verdadero;
    -> sino 
        -> incremento la posicion;
4. Asigno a la funcion la variable esta;
```

#### Codigo

```pascal
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
```
### Busqueda Lineal Mejorada

#### Pseudocodigo
```pascal
1. Inicializo la variable posicion en 1
2. Mientras la posicionn sea menor o igual a la dimension logica y el elemento que se encuentra en el indice posicion sea menor al numero
    -> incremento la posicion;
3. Pregunto si la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en el indice posicion sea igual
    si es asi:
        le asigno a la funcion verdadero;
    sino
        le asigno a la funcion falso;
```

#### Codigo

```pascal
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
```

### Busqueda Binaria o dicotomica

#### Pseudocodigo

```pascal
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
```

#### Codigo

```pascal
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
```

## Eliminar

**Consideraciones**
- Verificar que la posición sea valida
- Hacer el corrimiento a partir de la posición y hasta el final
- Decrementar la dimensión logica

>[!NOTE]
> Cuando nos referimos a eliminar un elemento de un vector, el elemento se elimina, pero el elemento que se encontraba en la ultima posición se va a duplicar debido a que se genera un **borrado lógico** pero al decrementar la dimensión lógica ese elemento no puede ser accedido.

### Una ocurrencia

#### Posicion Determinada

#### Pseudocodigo

```pascal
1. Pregunto si la poscion que quiero eliminar existe
    si es asi:
        2. Hago un for de posicion a la dimension logica - 1 corriendo los elementos;
            (realizo el borrado logico)
        3. Decremento la dimension logica;
```

#### Codigo

```pascal
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
```

#### Buscar elemento y eliminarlo (vector desordenado)

#### Pseudocodigo

```pascal
1. inicializo la variable posicion en 1
2. Mientras la posicion sea menor o igual a la dimension logica y el elemento de la poscion sea distinto al elemento a eliminar
    -> incremento la posicion;
cuando encuentro la posicion:
3. Pregunto si el elemento en el indice posicion es igual al elemento que quier eliminar
    si es asi:
        4. Hago un for de posicion a la dimension logica - 1 corriendo los elementos; 
            (realizo el borrado logico)
        5. Decremento la dimension logica;
```

#### Codigo

```pascal
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
```

#### Buscar elemento y eliminarlo (vector ordenado)

#### Pseudocodigo

```pascal
1. inicializo la variable posicion en 1
2. Mientras la posicion sea menor o igual a la dimension logica y el elemento de la poscion sea menor al elemento a eliminar
    -> incremento la posicion;
cuando encuentro la posicion:
3. Pregunto si el elemento de la posicion es igual al dato a eliminar
    si es asi:
        4. Hago un for de posicion a la dimension logica - 1 corriendo los elementos (realizo el borrado logico);
        5. Decremento la dimension logica;
```

#### Codigo

```pascal
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
```

### Mas de una ocurrencia (vector ordenado/desordenado)

#### Pseudocodigo

```pascal
1. inicializo la variable posicion en 1
2. Mientras la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en posicion sea menor al numero
    -> incremento la posicion; (para encontrar la primera ocurrencia)
3. inicializo la variable contador de ocurrencias;
4. Mientras la posicion sea menor o igual a la dimension logica y el elemento que se encuentra en posicion sea igual al numero
    -> incremento la posicion;
    -> incremento el contador de ocurrencias;
5. Hago un for desde posicion hasta la dimension logica corriendo los elementos utilizando el contador de ocurrencias   (realizo el borrado logico);
6. Decremento la dimension logica utilizando el contador de ocurrencias;
```

#### Codigo

```pascal
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
```

## Ordenar

Existen muchas formas para ordenar un vector, algunas de ellas son:
- Selección
- Intercambio
- Inserción

### Selección

**Consideraciones**
- Tiempo de Ejecución: Exponencial
- Necesito de 3 variables locales para posiciones de elementos del vector
- No ordeno todo el vector, se ordena hasta la dimension logica - 1 porque sabemos que siempre la ultima posicion va a ser el numero mas grande

#### Pseudocodigo

```pascal
1. Hago un for de 1 a la dimension logica - 1
    2. le asigno a la variable posicion la variable i (i solo se encarga de hacer el recorrido del vector hasta la dimension logica - 1);
    3. Hago un for de i + 1 (la siguiente posicion) hasta la dimension logica
        4. Pregunto si el elemento en el indice de la siguiente posicion de i es menor al elemento del indice posicion 
            si es asi:
                -> a posicion le asigno esa posicion donde estaba el elemento mas chico;
        5.realizo el intercambio de elementos utilizando una variable auxiliar para no perder ninguno de los dos datos durante el intercambio;

```

#### Codigo

```pascal
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
```

<h2>Algunas operaciones extras</h2>

* **Intercambio**
    ```pascal
    Procedure intercambio(var v: vector);
    var
        x, y: integer;
        aux: integer; //consideramos que el vector es de enteros
    begin
        //Buscamos que posiciones queremos intercambiar
        read(x);
        read(y);
        //Realizamos el intercambio
        aux := v[x];
        v[x] := v[y];
        v[y] := aux;
    end;
    ```
    Asignamos lo que esta en la psoicion **x** en una variable auxiliar que va a guardar el dato para su introducción en la posicion **y** sin que se pierdan los datos.

* **Elemento Maximo**
    ```pascal
    Procedure elementoMaximo(var v:vector);
    var
        max: integer;
        i: integer;
    begin
        max := -1;
        for i := 1 to dimL do
            begin
                if (v[i] > max) then
                    max := v[i];
            end;
    end;
    ```
    Como sabemos debemos incializar **max** en un valor muy chico.

* **Elemento Minimo**
    ```pascal
    Procedure elementoMinimo(var v:vector);
    var
        min: integer;
        i: integer;
    begin
        min := 9999;
        for i := 1 to dimL do
            begin
                if (v[i] < min) then
                    min := v[i];
            end;
    end;
    ```
    Como sabemos debemos inicializar **min** en un valor muy grande.

* **Corte de Control**
    Se recorre un vector ya dispuesto
    ```pascal
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
    ```

## Vector Contador

Como su nombre lo indica nos sirve para **contar las ocurrencias de un tipo de dato que se requiera**

### Crear un vector contador

```pascal
type
    vectorContador = array [Rango] of integer;

//En el cuerpo del programa o modulos
var
    c: vectorContador;
```

### Inicialización de un vector contador

Para poder utilizar un vector contador se debe inicializar en 0 para cada espacio dentro del rango

```pascal
Procedure inicializar(var c: vectorContador);
var
    i: integer;
begin
    for i := 1 to dimF do
        c[i] := 0;
end;
```
### Agregar elementos

Para ir **agregando elementos** al vector contador debemos hacer:

`c[El tipo de dato que qeuremos argregar] + 1`

Por ejemplo:

`c[v[i].dia] := c[v[i].dia] + 1`

>[!NOTE]
>Lo que se quiera agregar al vector debe considir con el tipo de dato que se le especifico, es decir que en este caso recibe enteros.

## Vector de vector

Un vector de vector (matriz) podriamos ejemplificarla como una tabla de Excel que para ir rellenandola de datos se necesita de 2 `for` para ir insertando datos.

#### Ejemplo de carga de datos

```pascal
Procedure vectorDeVector(var v1: vector1; var v2: vector2);
var
    i,j : integer;
begin
    for i := 1 to dimFv1 do
        for j := 1 to dimFv2 do
            begin
                read(v[i]);
                read(v[j]);
            end;
end;
```