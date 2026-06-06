DOCKER: EMPAQUETA COSAS POR DENTRO POR EJEMPLO APLICACIONES DENTRO DE UN CONTENEDOR 
postgres


modelo relacional:
es una forma de organiar la informacion en estructuras llamadas relaciones
las relaciones se representan en tablas


tabla : es compuesta por una relacion,tabla que representa una entidad o a asociacion

atributo: la columna de una tabla

tupla: es una fila o registro

dominio: son conjuntos de valores validos para un atributo

clave primaria: es un campo que identifica de forma unica cada FILA DE UNA TABLA,no puede repetirse, no puede ser quedar en blanco, tiene que ser estable y pued estar compuesta por uno o mas campos


claves foreneas: permite relacionar una tabla con otra
restrinccion: es una regla que protege la validez de los datos en una tabla


INTEGRIDAD REFERENCIAL: permite garantizar que las relaciones de las tablas sean validas


POSTGRES
permite accines como 
ON DELETE CASCADE: si se elimina el registro padre, se eliminan los registros hijos
ON UPDATE CASCADE: si se actualiza el registro padre, se actualiza el registro hijo
ON DELETE RESTRICT: impide que se elimine el registro padre si tiene resitros hijos
ON DELETE SET NULL: coloca el campo en null si se elimina el registro padre

