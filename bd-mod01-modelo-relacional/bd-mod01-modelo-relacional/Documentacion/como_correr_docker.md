# Cómo correr el proyecto con Docker Desktop

## Requisitos previos
- Tener **Docker Desktop** instalado y abierto
- Estar en la carpeta del proyecto: `bd-mod01-modelo-relacional`

---

## Paso 1 — Abrir la terminal en la carpeta correcta

Abre una terminal y navega a la carpeta del proyecto:

```bash
cd "/media/hackboy/SENA/00 SENA/CUARTO TRIMESTRE/5. VIERNES/bd-mod01-modelo-relacional-20260529T025619Z-3-001/bd-mod01-modelo-relacional"
```

---

## Paso 2 — Levantar el contenedor

Este comando descarga las imágenes (si no las tienes) y arranca los contenedores en segundo plano:

```bash
docker compose up -d
```

La `-d` significa que corre en segundo plano y te devuelve el control de la terminal.

Espera unos segundos. Puedes verificar que está corriendo en **Docker Desktop** o con:

```bash
docker ps
```

Deberías ver dos contenedores activos:
- `postgres16_bdcurso` — la base de datos PostgreSQL
- `pgadmin_bdcurso` — la interfaz visual de administración

---

## Paso 3 — Ejecutar los ejercicios SQL

Cada ejercicio se corre con este comando (ejecutar en orden):

```bash
# Ejercicio 01 — Claves primarias y foráneas
docker exec -i postgres16_bdcurso psql -U curso_user -d curso_bd < Ejercicios/ejercicio_01_claves.sql
```

```bash
# Ejercicio 02 — Índices
docker exec -i postgres16_bdcurso psql -U curso_user -d curso_bd < Ejercicios/ejercicio_02_indices.sql
```

```bash
# Ejercicio 03 — Integridad referencial
docker exec -i postgres16_bdcurso psql -U curso_user -d curso_bd < Ejercicios/ejercicio_03_integridad_referencial.sql
```

> **Importante:** el ejercicio 03 genera errores a propósito. Eso es parte del ejercicio.

---

## Paso 4 — Entrar a la base de datos por terminal (opcional)

Si quieres explorar la base de datos directamente desde la consola:

```bash
docker exec -it postgres16_bdcurso psql -U curso_user -d curso_bd
```

Comandos útiles dentro de psql:

```sql
\dn                     -- ver los esquemas disponibles
\dt academia.*          -- ver todas las tablas del esquema academia
SELECT * FROM academia.profesores;
\q                      -- salir de psql
```

---

## Paso 5 — Ver la base de datos con interfaz gráfica (pgAdmin)

1. Abre el navegador y entra a: **http://localhost:8080**
2. Inicia sesión con:
   - **Email:** `admin@curso.com`
   - **Contraseña:** `admin123`
3. Conecta el servidor con estos datos:
   - **Host:** `postgres`
   - **Puerto:** `5432`
   - **Usuario:** `curso_user`
   - **Contraseña:** `curso_pass`
   - **Base de datos:** `curso_bd`

---

## Paso 6 — Apagar el contenedor cuando termines

```bash
docker compose down
```

Si quieres apagarlo **y borrar todos los datos** guardados:

```bash
docker compose down -v
```

> **Cuidado con `-v`:** borra el volumen con todos los datos. Tendrías que volver a ejecutar los ejercicios desde cero.
