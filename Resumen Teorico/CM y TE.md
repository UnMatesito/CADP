<h1>Calculo de Memoria y Tiempo de Ejecución</h1>

## Memoria

Para entender el calculo de memoria primero debemos saber donde se alocan las variables.

<table align="center">
<tr>
    <th>Memoria</th>
</tr>
<tr>
    <td>Estatica</td>
</tr>
<tr>
    <td>Dinamica</td>
</tr>
</table>

### 💾🧍‍♂️Memoria Estatica

Estas variables se alojan en la zona de `Memoria Estatica` donde permancen allí durante toda la ejecución del programa, mas alla que sean utilizadas o no. (siguen ocupando espacio en memoria)

#### Tipos de varaibles que se almacenan en memoria estatica

```pascal
var
    var1 : integer;
    var2 : real;
    var3 : char;
    var4 : boolean;
    var5 : string;
    var6 : 1..20; // Subrango
    var7 : persona // Registro
    var8 : ^integer; // Punteros
    var9 : Array[1..10] of integer // Arreglos 

begin
    //Programa
end.
```

### 💾🏃Memoria Dinamica

Estas variables se alojan en la zona de `Memoria Dinamica` en un espacio llamdo **Heap** donde se reverva un espacio de ella para su uso y cuando no se necesita se libera.

#### Tipos de variables que se almacenan en memoria dinamica

```pascal
var
    var1: ^nodo // Lista

begin
    // Programa
end.
```

### Calculo de Memoria

Para realizar los calculos necesarios para obtener la cantidad de **bytes** que se estan utilizando en memoria debemos tener en cuenta lo siguiente:

**Para la Memoria Estatica:**
---
- Constantes
- Variables globales
- Variables locales (cuerpo o modulos)

**Para la Memoria Dinamica**
---
Se deben considerar cuantos `new()` y `dispose()` se encuentran en el programa. 

>[!WARNING]
>La **asignación de direcciones** no altera a la memoria.

>[!IMPORTANT]
> Al hacer un `dispose()` se libera memoria, `nil` no libera memoria

### Tabla de calculo de memoria 💾

<table align="center">
    <tr>
        <th>Tipo de Variable</th>
        <th>Bytes que ocupa</th>
    </tr>
    <tr>
        <td>Char</td>
        <td>1 byte</td>
    </tr>
    <tr>
        <td>Boolean</td>
        <td>1 byte</td>
    </tr>
    <tr>
        <td>Integer</td>
        <td>2/4/6 bytes</td>
    </tr>
    <tr>
        <td>Real</td>
        <td>8 bytes</td>
    </tr>
    <tr>
        <td>String</td>
        <td>tamaño + 1</td>
    </tr>
    <tr>
        <td>Subrango</td>
        <td>Depende del tipo (Integer -> 2/4/6 bytes) (Real -> 8 bytes) (Char -> 1 byte)</td>
    </tr>
    <tr>
        <td>Registro</td>
        <td>La suma de sus campos</td>
    </tr>
    <tr>
        <td>Vector</td>
        <td>Dimension fisica * tipo de dato</td>
    </tr>
    <tr>
        <td>Puntero</td>
        <td>4 bytes</td>
    </tr>
    <tr>
        <td>new()</td>
        <td>Tipo de dato + siguiente (puntero)</td>
    </tr>
</table>

>[!IMPORTANT]
> Si el `string` no posee un tamaño estipulado la cantidad total de bytes que ocupa es: 256 bytes (255 caracteres + 1)

## Corrección y la Eficiencia de un Programa

Un programa es **correcto** si se realiza de acuerdo a sus **especificaciones**

Un programa puede ser correcto pero puede tener **errores**

**Existen 3 tipos de errores**
- Sintacticos: Se detectan en compilación
- Logicos: Se detectan en la ejecución
- De sistema: Ocurren en casos raros, relacionado al sistema operativo o computadora

### Tecnicas de corrección de programas

- [<ins>Testing</ins>](#testing)
- [<ins>Debugging</ins>](#debugging)
- [<ins>Walkthrough</ins>](#walkthrough)
- [<ins>Verificación</ins>](#verificación)

### Testing

El proposito es **proveer evidencia** convincente de que el programa hace el trabajo esperado.

En este modelo se diseña un ***plan de pruebas*** con los <ins>**peores casos a los cuales el programa puede tener**</ins> para encontrar fallas en esos aspectos y determinar los resultados.

>[!NOTE]
>Estos pasos pueden repetirse mas de dos veces

### Debugging

Es un proceso para **descubiri y reparar** la causa del error.

Para hacer esto se pueden *agregar sententencias adicionales* que permiten **monitorear el comportamiento** del programa. 

Por ejemplo, agregar `writeln()` en diferentes lugares del programa. Cuando encontramos errores logicos agregamos **sentencias extras** para monitorear las variables del programa.

### Walkthrough

Es un proceso de recorrer un programa **frente a una audiencia**.

La *lectura de programas* a otras personas es un buen metodo para **detectar errores**, debido a que la persona que esta predispuesta a encontrar **errores u omisiones** por parte del programador.

### Verificación

Es el proceso de controlar si se <ins>cumplen</ins> las **pre- y post- condiciones** del programa

---

Una vez que verifica que el algoritmo es correcto, es importante determinar la **eficiencia del mismo**.

### Eficiencia de un programa

El analisis de eficiencia de un algoritmo estudia el **Tiempo de Ejecucion** y la **Memoria** que requiere para su ejecución

La **Eficiencia** se basa en los siguientes puntos:

1. Datos de entrada (tamaño y cantidad).

2. Calidad del codigo generado para el compilador.
   
3. Naturaleza y rapidez en la ejecución de las instrucciones de la maquina.
   
4. El tiempo del algoritmo base.

La eficiencia de un programa se puede medir a traves de:

- Memoria: calculo de la **cantidad de bytes** que ocupa las variables
- Tiempo de ejecucion: Puede calcularse de **diferentes formas**
1. <ins>**Analsis Empirico**</ins>: Requiere la implementación del programa, luego ejecutar el programa en la maquina y medir el tiempo consumido. 
<br>Aunque es facil de usar, depende enteramente de la maquina que se este usando, ademas esto se tiene que realizar varias veces para calcular el tiempo promedio.
2. <ins>**Analisis Teorico**</ins>: Implica encontrar una **Cota Maxima (Peor Caso)** para expresar el tiempo de nuestro algoritmo, sin la necesidad de ejecutarlo.
<br> Se obtiene el  timpo teorico del algoritmo u luego el orden de ejecucion del mismo. Lo que se compara entre algoritmos es el **orden de ejecucion**
<br> En este caso, solo se van a considerar las **instrucciones elementales** del algoritmo: *La asignación y operaciones aritmeticas/logicas*

Para medir el tiempo de ejecucion vamos a utilizar las **Unidades de Tiempo (UT)**

### Tabla de tiempo de ejecución de un programa

<table align="center">
<tr>
    <th>Codigo</th>
    <th>Tiempo (UT)</th>
</tr>
<tr>
    <td>writeln()</td>
    <td>0 UT</td>
</tr>
<tr>
    <td>x := y</td>
    <td>1 UT</td>
</tr>
<tr>
    <td>x := constante</td>
    <td>1 UT</td>
</tr>
<tr>
    <td>new() y dispose()</td>
    <td>0 UT</td>
</tr>
<tr>
    <td>x := nil</td>
    <td>1 UT</td>
</tr>
<tr>
    <td>if () then</td>
    <td>Tiempo de evaluar la condición + tiempo del cuerpo</td>
</tr>
<tr>
    <td>if () then, else</td>
    <td>Tiempo de evaluar la condición + el tiempo maximo entre el cuerpo del then o el else (peor caso)</td>
</tr>
<tr>
    <td>for () do</td>
    <td>(3N + 2) + N * (Cuerpo del for)</td>
</tr>
<tr>
    <td>while () do</td>
    <td>C * (N + 1) + N * (Cuepo del while)  <strong>(N >= 0)</strong> </td>
</tr>
<tr>
    <td>repeat until()</td>
    <td>C * N + N * (Cuerpo del repeat)  <strong>(N > 0)</strong></td>
</tr>
</table>

>[!IMPORTANT]
> **Condicion** (<,>,<>,=,or,and,not,/,*,+,-) -> 1 UT
> <br> **N** representa la cantidad de veces qie se ejecuta la condición
> <br> **C** representa la cantidad de tiempo en evaluar la condición

>[!CAUTION]
> Si el `for () do` no empieza en 1 a un numero debemos hacer la siguiente cuenta **(Limite Superior - Limite Inferior - 1)**
> <br> Si no se cuentas veces se va a ejecutar el `while () do`, se va quedar con una **incognita** (posee un tipo lineal)

### Ejemplos de calculo de tiempo de ejecución

### If () then
<table align="center">
<tr>
<th>Codigo</th>
<th>Calculo</th>
</tr>
<tr>
<td>
<pre lang="pascal">
Program uno;
var
    aux, temp, x: integer;
begin
    1. aux := 58;
    2. aux := aux * 5;
    3. if ((aux > 45) and (aux < 300)) then
           begin
               temp := aux - 5;
               x := temp + aux + 2;
           end;
    4. x := x * 10;
end.
</pre>
</td>
<td>
    1. Asignación = 1 UT
    <br>
    2. Asignación * 5 = 2 UT
    <br>
    3. If = evaluar la condicion + cuerpo
    <br>
    Condiciones : > (1 UT) + and (1 UT) + < (1 UT) = 3 UT
    <br>
    Cuerpo: resta + asignación = 2 UT, suma + suma + asignación = 3 UT = 5 UT
    <br>
    Total IF = 8 UT
    <br>
    4. Asignación * 5 = 2 UT
    <br>
    <strong>Total Programa = 13 UT</strong>
</td>
</tr>
</table>

### If () then, else
<table align="center">
<tr>
<th>Codigo</th>
<th>Calculo</th>
</tr>
<tr>
<td>
<pre lang="pascal">
Program dos;
var
    aux, temp, x: integer;
begin
    1.  if (aux > 45) then
            begin
                temp := aux - 5;
                x := temp;
            end
        else
            aux := aux + 1 * (aux mod 2);
end.
</pre>
</td>
<td>
    1. If = evaluar la condición + <strong>max(then, else)</strong>
    <br> Condiciones = 1 UT
    <br> then = 2 UT + 1 UT (asignaciones y resta) -> 3 UT
    <br> else = 4 UT (Asignacion, suma, multiplicación y MOD)
    <br>
    <strong>Total Programa = 5 UT (1 UT + 4 UT -> else)</strong>
</td>
</tr>
</table>

### for () do
<table align="center">
<tr>
<th>Codigo</th>
<th>Calculo</th>
</tr>
<tr>
<td>
<pre lang="pascal">
Program tres;
var
    aux, temp, x: integer;
begin
    1.  for i := 1 to 5 do
            begin
                x := aux;
                aux := aux + 5;
            end;
end.
</pre>
</td>
<td>
    1. For = (3N + 2) + N * (cuerpo)
    <br> N = 5 (veces que se ejecuta)
    <br> (3 * 5 + 2) + 5 * (cuerpo)
    <br> Cuerpo = 1 UT + 2 UT -> 3 UT (asignaciones y suma)
    <br> (15 + 2) + 5 * (3) -> 17 + 15
    <br>
    <strong>Total Programa = 32 UT</strong>
</td>
</tr>
</table>

### while () do
<table align="center">
<tr>
<th>Codigo</th>
<th>Calculo</th>
</tr>
<tr>
<td>
<pre lang="pascal">
Program cuatro;
var
    aux, temp, x: integer;
begin
       aux := 0
    1. while (aux < 5) do
        begin
            x := aux;
            aux := aux + 1;
        end;
end.
</pre>
</td>
<td>
    1. while = C * (N + 1) + N * (cuerpo)
    <br> Condiciones = 1 UT
    <br> N = 5 UT
    <br> 1 * (5 + 1) + 5 * (cuerpo)
    <br> cuerpo = 1 UT + 2 UT -> 3 UT
    <br> 1 * (6) + 5 * 3 -> 6 + 15 -> 21 UT
    <br> 
    <strong>Total Programa = 21 UT</strong>
</td>
</tr>
</table>

### repeat, until()
<table align="center">
<tr>
<th>Codigo</th>
<th>Calculo</th>
</tr>
<tr>
<td>
<pre lang="pascal">
Program cinco;
var
    aux, temp, x: integer;
begin
       aux := 0;
    1. repeat
          begin
            x := aux;
            aux := aux + 1;
          end;
       until (aux > 5)
end.
</pre>
</td>
<td>
    1. Repeat = C * (N) + N * (cuerpo)
    <br> Condiciones = 1 UT
    <br> N = 5
    <br> 1 * 5 + 5 * (cuerpo)
    <br> cuerpo = 1 UT + 2 UT -> 3 UT
    <br> 5 + 5 * 3
    <br> <strong>Total Programa = 20 UT</strong>
</td>
</tr>
</table>

>[!IMPORTANT]
> Las primeras asignaciones del `while()` y `repeat, until()` no se toman como asignaciones comunes, debio a que modifican la cantidad de veces que ocurre el bucle. Esto se aplica tambien en el `i := 1`