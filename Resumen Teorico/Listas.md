<h1>Listas</h1>

<p align="center">
    <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExajlkY2RndzB3ZjV1OGo2Y2pyd3MwdnRvbnY5NmtodXdocXR6anYydSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/B7o99rIuystY4/giphy.gif" alt="List"/>
</p>

---

>[!NOTE]
>Para entender mejor conceptos relacionados con punteros, [ver aqui](https://github.com/UnMatesito/CADP/blob/main/Resumen%20Teorico/Punteros.md)

Una **lista** es una estructura de datos <ins>dinámica, definida por el programador</ins>. Es una colección de nodos, donde cada nodo tiene un elemento (con un tipo de dato especificado) y una dirección de memoria dinámica que indica donde se encuentra el siguiente nodo que mantienen un orden logico.

Como sabemos es una estructura de datos [<ins>homogénea</ins>](https://github.com/UnMatesito/CADP/blob/main/Resumen%20Teorico/Estructura%20de%20datos.md), [<ins>dinámica</ins>](https://github.com/UnMatesito/CADP/blob/main/Resumen%20Teorico/Estructura%20de%20datos.md), [<ins>secuencial</ins>](https://github.com/UnMatesito/CADP/blob/main/Resumen%20Teorico/Estructura%20de%20datos.md) y [<ins>lineal</ins>](https://github.com/UnMatesito/CADP/blob/main/Resumen%20Teorico/Estructura%20de%20datos.md)

### Declaración

```pascal
type
    lista = ^nodo;

    nodo = record
        elemento: tipo de dato;
        sig: lista;
    end;

//En el cuerpo del programa o variables del modulo
var
    l : lista;
```

Como podemos ver un nodo es un registro con el elemento y una variable de tipo puntero que apunta a la siguiente dirección de la lista.

### Creación de una lista

Para crear una nueva lista despues que la declaremos en la zona de tipos de datos nuevos, debemos realizar la siguiente declaración

```pascal
begin
    p := nil;
end;
```

Implica marcar que la lista **no tiene una direccion inicial de comienzo**

>[!IMPORTANT]
>Es de vital importancia siempre realizar esta declaración en el cuerpo del programa cuando se quiere iniciar la lista.

### Recorrer una lista

```pascal
Procedure recorrerLista(L : lista);
begin
    while (l <> nil) do
        begin
            //acciones
            l := l^.sig;
        end;
end;
```

Implica posicionarse al comienzo de la lista y a partir de allí ir **"parando"** por cada elemento de la lista hasta llegar al final, es decir cuando `l = nil`

>[!IMPORTANT]
>La lista se pasa como un parametro por valor debido a que si fuese por referencia los pasajes se realizarian en la lista que se pasa como parametro y se perderia la referencia a los punteros, es decir, si se ejecuta otra vez el proceso, no se ejecutaria o daria problemas.

# Principales operaciones con Listas

Las operaciones mas importantes que se pueden realizar con listas son:
* [<ins>Agregar</ins>](#agregar)
* [<ins>Eliminar</ins>](#eliminar)
* [<ins>Busqueda</ins>](#busqueda)
* [<ins>Insertar Ordenado</ins>](#insertar-ordenado)

## Agregar

Existen 2 formas de agregar elementos

### Agregar Adelante

#### Pseudocodigo

```pascal
1. Se crea un nuevo nodo y se le asignan los datos pertinentes
2. Le asignamos como siguiente la lista para crear un enlace
3. Cambiamos la posicion de l para que el nuevo nodo sea el comiezo de la lista
```

#### Codigo

```pascal
procedure agregarAdelante(var l:lista; num:integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := num;
    nuevo^.sig := l;
    l := nuevo;
end;
```

### Agregar Atras

#### Pseudocodigo

```pascal
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
```
#### Codigo

```pascal
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
```
## Eliminar

Existen diferentes formas de eliminar elementos, tanto si la lista esta ordenada como no.

**Consideraciones**
- Se realiza un borrado fisico, quiere decir que el elemento no se encuentra presente en memoria dinámica.
- Para recorrer la lista debemos de utilizar 2 variables de tipo lista que nos permiten saber cual es el **nodo anterior** y cual es el **nodo actual**.
- Cuando se encuentra el nodo se debe generar el enlace entre el nodo anterior y el siguiete nodo del actual, luego se puede realizar el eliminado del nodo.
- Si se quiere eliminar mas de un nodo al realizar el primer elinado se debe asignar el anterior con el actual.

### Una Vez

### Lista Desordenada

#### Pseudocodigo

```pascal
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
```

#### Codigo

```pascal
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
end;
```

### Lista Ordenada

#### Pseudocodigo

```pascal
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
```

#### Codigo

```pascal
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
```

### Mas de una vez

### Lista Desordenada

#### Pseudocodigo

```pascal
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
```

#### Codigo

```pascal
procedure eliminarMasDeUnElementoListaDesordenada(var l:lista; num:integer);
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
```

### Lista Ordenada

#### Pseudocodigo

```pascal
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
```

#### Codigo

```pascal
procedure eliminarMasDeUnElementoListaOrdenada(var l:lista; num:integer);
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
```

## Busqueda

### Lista desordenada

#### Pseudocodigo

```pascal
1. Inicializo una variable booleana que determnina si se encontro el elemento en falso;
2. Mientras la lista no llegue a nil y la variable booleana no sea verdadero
    -> Pregunto si el dato almacenado en la lista es igual al dato a buscar
        si es asi:
            -> la variable booleana pasa a ser verdadera;
        sino
            -> avanzo a la siguiente posicion de la lista;
3. Le asigno a la funcion el valor que contendra la variable booleana despues de la ejecucion;
```

#### Codigo

```pascal
function busquedaListaDesordenada(l:lista; num:integer):boolean;
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
```

### Lista ordenada

#### Pseudocodigo

```pascal
1. Inicializo una variable booleana que determnina si se encontro el elemento en falso;
2. Mientras la lista no llegue a nil y la variable booleana no sea verdadero
    -> avanzo a la siguiente posicion de la lista;
3. Pregunto si el dato almacenado en la lista es igual al dato a buscar
    si es asi:
        -> la variable booleana pasa a ser verdadera;   
4. Le asigno a la funcion el valor que contendra la variable booleana despues de la ejecucion;
```

#### Codigo

```pascal
function busquedaListaOrdenada (l:lista; num:integer):boolean;
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
```

## Insertar Ordenado

**Consideraciones**
- vamos a tener que utilizar 2 variables de tipo lista actual y anterior para ir avanzando en la lista
- existen tres casos en los que tenemos que insertar datos:
    1. si el dato que se quiere insertar tiene que estar al principio de la lista
    2. si el dato que se quiere insertar tiene que estar en el medio de la lista
    3. si el dato que se quiere insertar tiene que estar al final de la lista

#### Pseudocodigo

```pascal
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
```
#### Codigo

<table>
<tr>
    <th>Metodo 1</th>
    <th>Metodo 2</th>
</tr>

<tr>
<td>
<pre lang="pascal">
procedure insertarOrdenado (var l:lista; num:integer);
var
    nuevo, ant, act: lista;
begin
    new(nuevo);
    nuevo^.dato := num; nuevo^.sig := nil;
    if (l = nil) then
        l := nuevo
    else
        begin
            //Caso 1
            act := l;
            ant := l;
        end;
    //Buscar posicion para insertar
    while (act <> nil) and (act^.dato < nuevo^.dato) do
        begin
            ant := act;
            act := act^.sig;
        end;
    if (act = l) then
        begin
            //caso 2
            nuevo^.sig := l;
            l := nuevo;
        end
    esle if (act <> nil) then
        begin
            //caso 3
            ant^.sig := nuevo;
            nuevo^.sig := act;
        end
    else
        begin
            //caso 4
            ant^.sig := nuevo;
            nuevo^.sig := nil;
        end;
end;
</pre>
</td>
<td>
<pre lang="pascal">
procedure insertarOrdenado (var l:lista; num:integer);
var
    nuevo, ant, act: lista;
begin
    new(nuevo);
    nuevo^.dato := num;
    act := l; // caso 1
    while (act <> nil) and (act^.dato < nuevo^.dato) do
        begin
            ant := act;
            act := act^.sig;
        end;
    if (ant = act) then
        //caso 1
        l := nuevo
    else
        //caso 2
        ant^.sig := nuevo;
    //caso 3 y 4
    act^.sig := nuevo; 
end;
</pre>
</td>
</tr>
</table>

>[!NOTE]
>si queremos que la inserción sea asendente usamos <, si queremos que sea desendente usamos >
