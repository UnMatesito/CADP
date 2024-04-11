<h1>Registros</h1>

<p align="center">
    <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExanZ6NDE1MXMwZ2Q3ZTc4aTl1b2VsOHh0a3UwNWF4ZXpmN2U0eHptNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3orif8l3lcXT1856ik/giphy.gif" alt="simpsons-registry"/>
</p>

<h3>Definición</h3>

Es un tipo de dato **estructurado compuesto definido por el programador** que permite <ins>agrupar distintas clases de datos en una estructura unica bajo un nombre</ins>. Un registro se sele utilizar para separa las caracteristicas de un objeto real.

Por ejemplo, de un auto se puede extrater su **modelo, precio, marca, etc**.

#### Declaración de registros
```pascal
type
    nombre = record
        campo1: tipo de dato;
        campo2: tipo de dato;
        ...
    end;
```

#### Leer un registro

```pascal
Procedure leer(var n:nombre);
begin
    read(n.campo1);
    read(n.campo2);
end;
```

>[!TIP]
>Se puede utilizar el proceso `with nombreVaraibleRegistro do` para no utilizar n.campo1 optimizando el programa

> [!IMPORTANT]
> **No** se puede realizar un `read(registro)` o `write(registro)` y no se pueden hacer comparaciones directas entre registros -> `registo1 = registro2`.

#### Asignación y comparación de registros

Para acceder a un campo utilizamos la expresión `n.campoN`

<h1>Corte de Control</h1>

Se lo utiliza principalmente para realizar reportes que requieren <ins>subtotales, cantidades o promedios parciales u otros valores similares</ins>.

Genralmente se ordena dependiendo de lo que el enunciado pida, la carga o recorrido de elementos debe ser ordenada si o si.

>[!NOTE]
>Normalmente se pide leer un registro y al final del enunciado se menciona explicitamente "La informacion se lee ordenada por (Campo del registro)".

```pascal
Procedure CorteDeControl (var n: nombre);
begin
    leerRegistro(n);
    while (condicion <> algo que nos pidan en el enunciado) do
        begin
            //se asigna la informacion por la que se quiere manterer ordenada (ej: codAct)
            while (condicion = codAct) do
                begin
                    //acciones -> Pueden ser acciones ej: sumar ocurrencias para un total
                    leerRegistro(n);
                end;
            //acciones -> Puede encontrarse aqui actMaximos, Minimos, etc.
        end;
end;
```

>[!NOTE]
>Los cortes de control pueden ser usados por todos los tipos de datos compuestos, muy util para leer o procesar datos que se encuentran ordenados