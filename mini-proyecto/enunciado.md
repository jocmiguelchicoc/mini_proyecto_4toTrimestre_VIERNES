# Enunciado del Proyecto - Sistema de Biblioteca

## Contexto del Problema
Una institución educativa requiere diseñar e implementar una base de datos relacional para gestionar los préstamos de libros de su biblioteca. Actualmente, el control de la información se realiza en hojas de cálculo, lo que dificulta el seguimiento de las entregas y genera redundancia de datos.

## Requisitos del Sistema
El sistema debe almacenar y relacionar la información de:
1. Usuarios de la biblioteca.
2. Libros disponibles.
3. Autores.
4. Categorías.
5. Préstamos realizados, incluyendo las fechas (préstamo, devolución esperada y devolución real) y el estado del proceso.

## Reglas de Integridad (Restricciones)
1. Cada usuario debe tener una dirección de correo electrónico única.
2. Cada libro debe contar con un código ISBN único.
3. Un libro pertenece a una única categoría y tiene un autor principal.
4. Un usuario puede realizar múltiples préstamos en diferentes momentos.
5. Un libro puede ser prestado varias veces a lo largo del tiempo.
6. No se pueden registrar préstamos de usuarios o libros que no existan en el sistema.
7. La fecha esperada de devolución no puede ser anterior a la fecha del préstamo.
8. El estado del préstamo solo puede admitir los valores: 'ACTIVO', 'DEVUELTO' o 'VENCIDO'.

## Estructura de Entregables
El proyecto debe incluir una carpeta llamada `mini-proyecto/` con los siguientes archivos:
- `enunciado.md`: Resumen de los requisitos del problema.
- `script_creacion_tablas.sql`: Definición de tablas y restricciones en SQL.
- `script_insercion_datos.sql`: Datos de prueba cargados en el sistema.
- `consultas_validacion.sql`: Consultas de prueba solicitadas para verificar el funcionamiento.
