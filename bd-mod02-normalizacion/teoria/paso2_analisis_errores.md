# Paso 2 — Analizar los errores de diseño

Esta tabla es la que tenemos antes de normalizar que es que toca analizar:

| id_venta | cliente | correo | productos | ciudad_cliente | vendedor |
|----------|---------|--------|-----------|----------------|----------|
| 1 | Ana Torres | ana@mail.com | Mouse, Teclado, Monitor | Bogotá | Carlos |
| 2 | Luis Gómez | luis@mail.com | Laptop, Mouse | Medellín | Carlos |
| 3 | Ana Torres | ana@mail.com | Silla | Bogotá | Diana |

---

## Preguntas y respuestas

**1. ¿Qué datos se repiten?**

Ana Torres aparece dos veces con el mismo correo y la misma ciudad.
Carlos también se repite como vendedor en dos ventas distintas.
Eso significa que si Ana cambia de correo toca ir fila por fila cambiandolo.

**2. ¿Qué columna tiene varios valores en una sola celda?**

La columna productos, En la primera venta aparece Mouse, Teclado, Monitor todo junto en un solo espacio. 

**3. ¿Qué pasa si un cliente cambia de correo?**

Toca buscar todas las filas donde aparezca ese mismo cliente y cambiar el correo en cada una. Si se cambia en una y se olvida en otra quedan datos distintos para la misma persona.

**4. ¿Qué pasa si se elimina la única venta de un cliente?**

Se pierde todo lo del cliente, Como no hay una tabla aparte para clientes, al borrar la venta se borra tambien el nombre, el correo y la ciudad de esa persona.

**5. ¿Se puede registrar un producto sin venta?**

No existe una tabla de productos sola, Para meter un producto hay que meterlo dentro de una venta aunque no se haya vendido nada todavia.

**6. ¿Se puede registrar un vendedor sin venta?**

No. Lo mismo pasa con los vendedores, no tienen su propio espacio. Si no hay venta, el vendedor no existe en la base de datos.

**7. ¿Qué entidades reales aparecen en la tabla?**

Aunque todo esta revuelto, se pueden ver estas entidades:
- Cliente
- Producto
- Vendedor
- Venta
- Detalle de venta que es la relacion entre una venta y sus productos venta_producto se llamaria asi
