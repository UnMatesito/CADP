<h1>Modularización</h1>

<h3>Definición</h3>

El concepto de modularización se relaciona a la separacion de una tarea principal en multiples sub-tareas que juntas proporcionan flexibilidad y reusabilidad de codigo.

<h3>Tipos de Modulos</h3>

**Procedimiento** -> Palabra Clave: `Procedure`

**Función** -> Palabra Clave: `Function`

#### Principales Diferencias

* Los procedimientos retornan **0,1 o mas valores** y esos valores pueden ser de distintos tipos (simples/compuestos).
* Las funciones retornan si o si un **unico valor** que se asigna luego de la declaracion de parametros.
* Los procesos no pueden ser invocados en un `write`, ni dentro de las condiciones de una estructura de control.
* Las funciones en caso contrario si se pueden invocar dento de las condiciones de una estructura de control.

<h3>Estructura General</h3>

<table align="center">
<tr>
<th>
Procedimiento
</th>
<th>
Función
</th>
</tr>
<tr>
<td>
<pre lang="pascal">
Procedure nombre(parametros);
begin
    //codigo
end;
</pre>
</td>
<td>
<pre lang="pascal">
Function nombre(parametros):tipo de dato;
begin
    //codigo
end;
</pre>
</td>
</tr>
</table>

<h3>Declaración de un modulo</h3>

<table align="center">
<tr>
<th>
Procedimiento
</th>
<th>
Función
</th>
</tr>
<tr>
<td>
<pre lang="pascal">
//Programa Principal o Dentro de otro modulo
begin
    nombre(parametros ingresados);
end.
</pre>
</td>
<td>
<pre lang="pascal">
//Programa Principal o Dentro de otro modulo
begin
    write(nombre(paramtros ingresados));

    if (nombre(parametros ingresados) = accion correspondiente al tipo de dato) then
        //codigo
end.
</pre>
</td>
</tr>
</table>

>[!IMPORTANT]
> Las Funciones solo pueden devolver tipos de datos simples (integer, boolean, char, puntero). Mientras que los procesos pueden devolver cualquier tipo de dato ya sea simple o compuesto.

<h1>Parametros</h1>

Los **Parametros** es una forma de introducir datos que pueden encontrarse en diferentes partes del programa dentro de un modulo. Esto nos permite copiar datos de variables o modificar los datos de dichas variables. (ocultamiento de datos)

**Existen 2 tipos de parametros**

* **Valor** -> Es un parametro que recibe el valor de una variable pero no genera cambios al finalizar la ejecucion del modulo, debido a que se genera una copia de el valor de dicha variable.
* **Refencia** -> Es un parametro que recibe la direccion de memoria de una variable, permitiendo que sufra cambios durante y despues de la ejecuion de un modulo.

>[!NOTE]
> Por eso decimos que los parametros por valor se los denomina de **Entrada (IN)** y los parametros por referencia se los denomina de **Entrada/Salida (IN/OUT)**.

>[!WARNING]
> Las Funciones no pueden poseer parametros por valor debido a que si se igresa un parametro por referencia se estaria devolviendo 2 o mas datos (dependiendo de la cantidad de parametros).

