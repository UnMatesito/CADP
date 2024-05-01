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

### Elementos
----

Depende si los elementos son del mismo tipo o no.

#### Homogénea

Los elementos que lo componen son del mismo tipo.

**Por Ejemplo**: Vectores, Listas

#### Heterogénea

Los elementos que lo compoenen son de distintos tipos.

**Por Ejemplo**: Registros

### Tamaño
---

Hace referencia a si la estructura puede variar su tamaño durante la ejecución del programa.

#### Estatica

El tamaño de la estructura no varía durante la ejecución del programa.

**Por Ejemplo**: Vectores, Registros

#### Dinámica

El tamaño de la estructura varia durante la ejecución del programa.

**Por Ejemplo**: Listas

### Acceso
---

Hace referencia a como se pueden acceder a los elementos que la componen.

#### Secuencial

Para acceder a un elemento en particular se debe respetar el orden que preestablece la estructura, recorriendo por todos los elementos que lo preceden.

**Por Ejemplo**: Listas

#### Directo/Indexado

Se puede acceder a un elemento particular, sin la necesidad de pasar por los anteriores a él. Se dice que es indexado debido a que se puede acceder al elemento directamente gracias al uso de un indice.

**Por Ejemplo**: Vectores, Registros

### Linealidad
---

#### Lineal

Esta formada por ninguno, uno o varios elementos que guardan una relación de adyacencia ordenada donde a cada elemento le sigue uno y le precede uno solo.

**Por Ejemplo**: Vectores, Listas

#### No Lineal

Para un elemento dado pueden existir 0, 1 ó mas elementos que le suceden y 0, 1 ó mas elementos que le preceden.

**Por Ejemplo**: Registros