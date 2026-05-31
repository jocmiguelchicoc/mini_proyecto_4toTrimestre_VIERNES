# Lo que aprendí haciendo la base de datos

Aquí escribo un resumen corto de cómo me fue con este trabajo de la biblioteca:

## Problemas que tuve:

* **El orden de las tablas:**
  Al principio me salieron errores porque intenté crear la tabla de `libros` antes de tener creadas las de `autores` y `categorias`. luego mire que primero toca crear las tablas independientes para que luego las claves foráneas no pongan problema.

* **Errores de escritura en el código:**
  Tuve algunos errores sencillos al escribir el código SQL, como comas que me faltaban o escribir mal algunas palabras como VARCHAR. Me tocó revisar los mensajes de error en pgAdmin para ir corrigiendo.

* **Conectar pgAdmin con Docker:**
  Al principio me costó configurar la conexión en pgAdmin para ver las tablas. Tuve algunos problemas con eso, pero pude solucionarlo porque tenía guardado el paso a paso de la clase pasada de cómo abrir el Docker y conectarlo con el usuario y la contraseña.

* **Error de permisos al usar un disco externo (Docker Desktop):**
  Como tengo mi carpeta de trabajo en un disco externo (en la ruta `/media/...`), al intentar levantar los contenedores con `docker compose up -d` me salía un error de montajes denegados (`mounts denied`). Aprendí que Docker Desktop por seguridad bloquea las carpetas compartidas fuera de la ruta personal `/home`. Para solucionarlo, tuve que entrar a los ajustes de Docker Desktop (Settings -> Resources -> File sharing) y agregar manualmente la ruta `/media` a la lista de carpetas permitidas. Después de aplicar y reiniciar, las carpetas y los scripts SQL dentro de `initdb` se pudieron montar sin problemas.

## Lo que aprendí:
* Tuve que investigar por mi cuenta para qué servían las restricciones como `UNIQUE` y `CHECK`, porque al principio no entendía muy bien su función. Al final vi que son muy útiles porque evitan que se guarden datos incorrectos en el sistema.
* Docker es un buen contenedor para levantar la base de datos rápido y hacer pruebas sin tener que instalar todo directo en el computador.

