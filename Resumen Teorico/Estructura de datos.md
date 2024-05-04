<h1>Estructuras de Datos</h1>

<p align="center">
<img src="https://repository-images.githubusercontent.com/591060405/eaf4564a-72d3-461c-b651-eec7a68b53b5"/>
</p>

---

Permite al programador definir un tipo al que se asocian diferentes datos que tienen  valores lógicamente relacionados y asociados bajo un nombre único.

<table align="center">
<tr>
<th width="25%">
Elementos
</th>
<th width="25%">
Acceso
</th>
<th width="25%">
Tamaño
</th>
<th width="25%">
Linealidad
</th>
</tr>

<tr>
<td>
Homogénea
</td>
<td>
Secuencial
</td>
<td>
Estática
</td>
<td>
Lineal
</td>
</tr>

<tr>
<td>
Heterogénea
</td>
<td>
Directo/ Indexado
</td>
<td>
Dinámica
</td>
<td>
No Lineal
</td>
</tr>
</table>

<h3 align="center">Elementos</h3>

***

Depende si los elementos son del mismo tipo o no.

#### <ins>Homogénea</ins>

Los elementos que lo componen son del mismo tipo.

**Por Ejemplo**: Vectores, Listas

#### <ins>Heterogénea</ins>

Los elementos que lo compoenen son de distintos tipos.

**Por Ejemplo**: Registros

<h3 align="center">Tamaño</h3>

***

Hace referencia a si la estructura puede variar su tamaño durante la ejecución del programa.

#### <ins>Estatica</ins>

El tamaño de la estructura no varía durante la ejecución del programa.

**Por Ejemplo**: Vectores, Registros

#### <ins>Dinámica</ins>

El tamaño de la estructura varia durante la ejecución del programa.

**Por Ejemplo**: Listas

<h3 align="center">Acceso</h3>

***

Hace referencia a como se pueden acceder a los elementos que la componen.

#### <ins>Secuencial</ins>

Para acceder a un elemento en particular se debe respetar el orden que preestablece la estructura, recorriendo por todos los elementos que lo preceden.

**Por Ejemplo**: Listas

#### <ins>Directo/Indexado</ins>

Se puede acceder a un elemento particular, sin la necesidad de pasar por los anteriores a él. Se dice que es indexado debido a que se puede acceder al elemento directamente gracias al uso de un indice.

**Por Ejemplo**: Vectores, Registros

<h3 align="center">Linealidad</h3>

***

#### <ins>Lineal</ins>

Esta formada por ninguno, uno o varios elementos que guardan una relación de adyacencia ordenada donde a cada elemento le sigue uno y le precede uno solo.

**Por Ejemplo**: Vectores, Listas

#### <ins>No Lineal</ins>

Para un elemento dado pueden existir 0, 1 ó mas elementos que le suceden y 0, 1 ó mas elementos que le preceden.

**Por Ejemplo**: Registros

## Declaración

<table>
<tr>
  <th>
    Dentro del type
  </th>
  <th>
    Como una variable
  </th>
</tr>
<tr>
  <td>
    <pre lang="pascal">
      type
          estructuraDeDatos = tipo de estructura de datos 
          //Registro, Vector, Lista
    </pre>
  </td>
  <td>
    <pre lang="pascal">
      var
          estructuraDeDatos : tipo de estructura de datos 
          //Registro, Vector, Lista
    </pre>
  </td>
</tr>
</table>

>[!NOTE]
>Cuando declaramos una estructura de datos dentro del `type` esa variable puede ser utilizada en todo el programa, mientras que las estructuras de datos declaradas en la zona de variables solo pueden ser usadas en la zona donde fue declarada, es decir que los visibilidad y utilización solo va a poder ser en la zona donde fue declarada o por parametros.
