# Normalización de Bases de Datos Relacionales

La normalización es un proceso fundamental en el diseño de bases de datos relacionales que tiene como objetivo eliminar la redundancia de datos y garantizar la integridad de la información. En este artículo, exploraremos las tres formas principales de normalización: la primera forma normal (1FN), la segunda forma normal (2FN) y la tercera forma normal (3FN).

## Primera Forma Normal (1FN)

La primera forma normal es el primer paso en el proceso de normalización y establece las siguientes reglas:

1. **Eliminación de valores repetidos**: Cada campo en una tabla debe contener un solo valor, sin listas separadas por comas u otros delimitadores.

2. **Identificador único**: Cada fila en la tabla debe tener un identificador único, conocido como clave primaria, que permite distinguir una fila de las demás.

## Segunda Forma Normal (2FN)

La segunda forma normal se aplica después de haber alcanzado la 1FN y agrega la siguiente regla:

1. **Eliminación de dependencias parciales**: Cada campo no clave en una tabla debe depender completamente de la clave primaria. Esto significa que no debe haber dependencias parciales de una clave compuesta.

## Tercera Forma Normal (3FN)

La tercera forma normal se aplica después de haber alcanzado la 2FN y agrega la siguiente regla:

1. **Eliminación de dependencias transitivas**: Un campo no clave no debe depender de otro campo no clave. Si un campo depende de otro que, a su vez, depende de la clave primaria, se deben separar en diferentes tablas.

## Ejemplo de Normalización

Para ilustrar estos conceptos, consideremos una tabla llamada "Pedidos" que contiene información sobre productos pedidos por clientes:

| PedidoID | ClienteID | Producto   | Cantidad |
|---------|-----------|------------|----------|
| 1       | 101       | Producto A | 5        |
| 2       | 102       | Producto B | 3        |
| 3       | 101       | Producto A | 2        |

Esta tabla no cumple con la 1FN debido a los valores repetidos en la columna "Producto". Para normalizarla, podríamos crear dos tablas separadas: una para "Pedidos" y otra para "Productos". Luego, podríamos usar el "PedidoID" como clave foránea en la tabla de "Pedidos" para referenciar los productos correspondientes en la tabla de "Productos".

## Enlaces / Programas Utilizados:

* Repositorio Bitbucket: https://bitbucket.org/unsta-jeremias-rodriguez-guzman/workspace/projects/BAS

* Repositorio Github: https://github.com/JereRG/Trabajo-Practico-N-1

## Informacion
* Nombre y Apellido: **Jeremias Rodriguez Guzman.**

* Materia: **Bases de Datos 2023.**

* Universidad: **Universidad del Norte Santo Tomas de Aquino**

*  **T.P Numero: 2 |**
