<h1>Punteros</h1>

<p align="center">
<img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdjM2cGVlcHlseWhrMWhvemVhejQxYjVxbDU1dTM2eGNteWIybDFoNCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YOvOkaS5ZKfimDIgwJ/giphy.gif" alt="Pointing"/>
</p>

---

Es un tipo de dato <ins>simple, definido por el lenguaje</ins> que nos sirve para almacenar una **direccion de memoria dinamica** donde se puede almacenar cualquier tipo de dato simple visto.

### Declaración de un puntero

```pascal
type
    puntero = ^tipo de dato;

//En el cuerpo del programa o modulo
var
    p: puntero;
```

### Creación de un puntero

Para poder crear un puntero y poder almacenar datos se utiliza la sentencia `new(p)` que lo que hace es crear una direccion de memoria dinamica donde la variable p va a a ser asignada para almacenar contenido.

>[!WARNING]
> No se puede asignar a un puntero una direccion especifica
> MAL -> P := ABCD

### Eliminación de un puntero

Para eliminar tanto la referncia del puntero, es decir a donde apunta en memoria dinamica, como lo que se encuentra almacenado en esa direccion, se utiliza `dispose(p)`.

### Liberación del puntero

Implica cortar el enlace que existe con la memoria dinámica. La misma queda ocupada pero ya no se puede accerder (para ello utilizamos el `p := nil`)

### Diferencia entre dispose y nil

La diferencia principal entre la utilización del `dispose` y el `nil` radica en la conexion a la direccion de memoria dinámica y el contenido almacenado en dicha direccion.

Cuando utilizamos un `dispose(p)` se **libera la posición de memoria**, es decir tanto la conexion con la posicion y el elemento que se encuentra en dicha posición de memoria. 

Cuando utilizamos el `p := nil` **solo** se libera la conexión con la direccion de memoria, es decir que elemento sigue almacenado en la direccion pero no puede ser accedido.

### Asignación entre punteros

Implica asignar la direccion de memoria de un puntero a otra variable de tipo puntero, es decir se comparte la dirección de memoria dinámica.

```pascal
p := q //Se le asigna a q (variable de tipo puntero) la direccion de memoria de p
```

### Asignación de contenido

```pascal
//Asignación directa
p^ := 8

//Leer y asignar a un puntero
read(p^);
```
>[!NOTE]
>* p = puntero (direccion de memoria)
>* p^ = contenido almacenado en la direccion de memoria

>[!IMPORTANT]
> No se puede realizar `read(p)` ni `write(p)` <br>
> No se pueden comparar las direcciones de dos punteros