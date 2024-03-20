
<h1>Basics</h1>

<p align="center">
<img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcWx1c2dub3Y1cTJ4emoweTl0YjE0bDB5ajlkaDJtZzhwY2VoY29xayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/1AgCHLTu6T9tEGiTg6/giphy.gif" alt="basic"/>
</p>

----

<h3>Variables</h3>

Zona de memoria cuyo contenido va a ser un tipo de dato. La direccion inicial de esa zona de memoria se asocia con el nombre de la variable. **Puede cambiar su valor**

<h3>Constante</h3>

Zona de memoria cuyo contenido no cambia durante la ejecución del programa.

>[!TIP]
>En vectores y subrangos, se utiliza mucho. Podemos usarlo para definir dimensiones fisicas y el maximo de un subrango. Ademas puede ser utilizado en estructuras de control.

<h3>Tipo de Datos</h3>

Los tipos de datos pueden ser de 2 tipos **simple o compuestos**. Los tipos de dato **simples** son aquellos que toman un unico valor, en un momento determinado. Los tipos de datos **compuestos** son aquellos que peuden tomar varios valores a la vez que guardan alguna relacion logica entre ellos. Ademas pueden ser **definidos por el programa** (built-in) o **definidos por el programador**

<h3>Definidos por el usuario</h3>

#### Enteros

Es un tipo de dato simple y *ordinal*, tiene una representación interna, es decir posee un minimo y un maximo.

>[!NOTE]
>Si un tipo de dato es **ordinal** se sabe quien le sigue y quien le antecede.

#### Real

Es un tipo de dato simple que nos permite representar decimales, pero no es ordinal ya que no podemos saber cual es su siguiente y anterior. Tiene una representación interna (posee maximo y minimo).

#### Boolean

Es un tipo de dato simple y ordinal que nos permite determinar verdadero o falso en una condicion (**true/false**)

#### Caracter

Representa un conjunto finito y ordenado de caracteres que las computadoras reconocen. Contiene un solo caracter. Es simple y ordinal.

#### String

Cadena de caracteres. Como maximo se pueden representar 256 caracteres, siendo el ultimo caracter el espacio. Es un tipo de dato compuesto.

<h3>Estrucutras de Control</h3>

Permiten modificar el flujo de ejecucion del programa

Existen 5 tipos de estrucutras de control
* **Decisión**
* **Iteración**
* **Repetición**
* **Selección**
* **Secuencia**

##### Decisión
**If else**
``` pascal
if (condicion) then
    begin
        //codigo
    end;

else if (condicion) then
    begin
        //codigo
    end;

else
    begin
        //codigo
    end;
```

>[!NOTE]
>Si solo queremos agergar una linea de codigo dentro de la estructura no es necesario agergar las sentencias de *begin* y *end* (aplicable para todas las estructuras de control)

> [!IMPORTANT]
> Si realizamos un *if else* en la linea de finalizacion de codigo del la primera sentencia de if, no debemos agregar un punto y coma.


#### Seleccion
**Case**
``` pascal
case (varible) of
    {casos} : {Codigo a relizar}
    else
        begin
            //codigo
        end;
```

Muy util para le creacion de menus de opciones donde el uso de if hace que el programa se vuelva muy extenso y deficil de leer.


#### Iteración
**While**
``` pascal
while (condicion) do
    begin
        //codigo
    end;
```
Decimos que es un estrucutra de control **precondicional** debido a que se pregunta sobre las condiciones de corte antes de que se ejecute la estructura.

**Repeat-Until**
``` pascal
Repeat
    begin
        //codigo
    end;
until (condicion de corte);
```
Decimos que es un estructura de control **postcondicional** debido a que se pregunta sobre las condiciones de corte despeus de que se ejecute la estructura.

> [!IMPORTANT]
> La principal diferencia en cuanto a la utilizacion de los 2 tipos de estructuras radica principalmente en lo que dice el enunuciado.
>* Debe procesarse el ultimo elemento -> **Repeat**
>* No debe procesarse el ultimo elemento -> **While**

#### Repetición
**For**
``` pascal
for i:= (primer termino) to (ultimo termino) do
    begin
        //codigo
    end;
```

>[!NOTE]
>Muy utilizado en cargas completas de vectores

<h3>Operadores Logicos</h3>

Los utilizamos para determinar condiciones dentro de estructuras de control para la creacion de un codigo claro.

#### Operandos Lógicos

- **Igual** -> `=`
- **Distinto** -> `<>`
- **Mayor** -> `>`
- **Mayor o igual** -> `>=`
- **Menor** -> `<`
- **Menor o igual** -> `<=`
- **Asignación** -> `:=`

#### Operadores Lógicos para operaciones booleanas

- **Conjunción** -> `and`
- **Disjunción** -> `or`
- **Negación** -> `not`

<h3>Subrangos</h3>

Separa una posicion de una variable, se pueden usar con numeros enteros y caracteres.

#### Declaracion

``` pascal
type
    subrango = numero..numero;
```

>[!TIP]
>Muy utilizado en rango de vectores, definir un rango de dias, meses, años, rango de tipos, etc.

<h3>Mod y Div</h3>

Mod es utilizado para el retorar el **resto entero** de la division

Div se utiliza para que nos retorne el **cociente entero** de la division

>[!TIP]
>Estas dos operaciones son muy usadas para la descompocision de numeros.

#### Ejemplos de uso de Mod y Div

**Buscar un numero par**

``` pascal
if (num mod 2 = 0) then
    //accion
```

**Descomponer numeros**

``` pascal
while (num <> 0) do
    begin
        dig := num mod 10;
        //acciones
        num := num div 10;
    end;
```
#### Maximos y Minimos

Si el enunciado nos pide buscar maximos y minimos debemos hacer lo siguiente:

1. Crear las variables `min` o `max` dependiendo de lo que necesitemos (podemos agergar 1 o mas dependiendo si necesitamos 1 o mas maximos o minimos)
2. Si nos piden otros datos para determinar sus maximos o minimos debemos hacer lo mismo

#### Ejemplos de uso de minimos y maximos

**Estructura maximos**

``` Pascal
    if (dato > max1) then
        begin
            max2 := max1;
            max1 := dato;
        end
    else if (dato > max2) then
        max2 := dato;
```

**Estructura Minimos**

``` Pascal
if (dato < min1) then
    begin
        min2 := min1;
        min1 := dato;
    end
else if (dato < max2) then
    min2 := dato;
```

> [!IMPORTANT]
> Para que la asignación de maximos y minimo sea efectiva las variables `max` deben estar inicializadas en **0 o 1** y las `min` en un numero muy alto, por ejemplo: 9999.
