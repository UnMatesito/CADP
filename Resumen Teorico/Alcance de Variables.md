<h1>Alcance de las variables</h1>

<p align="center">
    <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMm4zYjRsb2I2enVteDlxOW8xa2VrYmVoZzN0NWNrcWZubHdyZ2FueCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o6gEdDofO7xkaBQXK/giphy.gif" alt="sybology_Reach"/>
</p>

---

Cuando se realiza un programa o modulo tenemos que tener en cuenta el alcance que las variables pueden teener duran5te la ejecución del mismo. **Existen 3 tipos de variables:**

* **Variables Globales**
* **Variables Locales al Programa**
* **Variables Locales al Modulo**

```pascal
Program alcance_de_variables;

var
    a,b: integer;
    //Variables Globales -> Pueden ser utilizadas en todo el programa (modulos/ programa principal)

procedure metodo;
var
    c: integer; 
    //Variables Locales al Modulo -> Pueden ser usadas solo en el proceso donde se encuentran declarados
begin
    //codigo
end;

var
    d: integer; //Variables Locales al Programa -> Pueden ser usados solo en el cuerpo del programa
begin
    //codigo
end.
```

### Como ocurre durante la ejecución

1. Cuando un programa se ejecuta lo primero que se hace es **guardar en memoria las variables globales.**
2. Cuando empeiza a ejecutarse el programa, se **guardan las variables locales al cuerpo del programa.**
3. Cuando llegamos a uno de los procesos del programa, se carga el codido en memoria, se cargan los parametros y **se cargan las variables locales al modulo.**

### Camino de busqueda de variables

#### Programa Principal

Cuando hay 2 variables con el mismo nombre primero se busca si esa se encuentra en el **lugar del programa donde se quiere ejecutar**, sino se busca en las variables locales (si no existe retornaria un error) 

`1. Programa -> 2. Global`

#### Proceso

Cuando se quiere buscar una variable en un proceso primero se busca si existe la **variable local al proceso**, sino se busca si es un **parametro** y si no se encuentra se busca si es una **variable global** 

`1. V.L.P. -> 2. Parametros -> 3. Global`

<h3>Problemas de las variables globales</h3>

---

* Demasiados identificadores
* No se especifica la comunicación entre modulos **IMPORTANTE**
* Conflictos de nombres de identificadores utilizados por diferentes programadores
* Probabilidad de perder integridad de datos, al modificar involuntariamente en un modulo detos de alguna variable que luego deberá ser utilizada por orto modulo **IMPORTANTE**

Para la solución de estos problemas ocasionados, se utiliza una combinación de **ocultamiento de datos (data hiding)** y el **uso de parametros**

El ocultamiento de datos significa que los datos exclusivos de un modulo no deben **ser "visibles" o utilizables por los demas modulos**.

El uso de parametros nos sirve para **comunicarnos con otros modulos o con el programa principal**.