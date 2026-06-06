# Guía de Git — Crear repositorio y subir archivos

## ¿Qué es Git?
Git es una herramienta que guarda el historial de cambios de tu código.
GitHub es la página web donde subes ese código para tenerlo en la nube.

---

## PARTE 1 — Configuración inicial (solo la primera vez)

Antes de usar Git por primera vez en tu computador, dile quién eres:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu_correo@gmail.com"
```

---

## PARTE 2 — Crear un repositorio nuevo desde cero

### Paso 1: Crear el repositorio en GitHub

1. Entra a [github.com](https://github.com) e inicia sesión
2. Haz clic en el botón verde **"New"** (arriba a la izquierda)
3. Ponle un nombre al repositorio
4. Elige **Public** o **Private**
5. Haz clic en **"Create repository"**
6. GitHub te muestra una URL como esta:
   ```
   https://github.com/tu_usuario/nombre-repositorio.git
   ```

### Paso 2: Inicializar Git en tu carpeta local

Abre la terminal en la carpeta de tu proyecto y ejecuta:

```bash
git init
```

Esto crea la carpeta `.git` oculta que hace que Git rastree tu proyecto.

### Paso 3: Conectar tu carpeta con GitHub

```bash
git remote add origin https://github.com/tu_usuario/nombre-repositorio.git
```

### Paso 4: Subir todo por primera vez

```bash
git add .
git commit -m "primer commit"
git push -u origin master
```

- `git add .` — agrega todos los archivos
- `git commit` — guarda una "foto" del estado actual
- `git push` — sube esa foto a GitHub

---

## PARTE 3 — Subir cambios a un repositorio que ya existe

Cuando ya tienes el repositorio y haces cambios, el flujo es siempre igual:

### Paso 1: Ver qué cambió

```bash
git status
```

Muestra los archivos modificados o nuevos.

### Paso 2: Agregar los archivos que quieres subir

Agregar archivos específicos:
```bash
git add nombre_archivo.sql
```

Agregar una carpeta completa:
```bash
git add Ejercicios/
```

Agregar todo lo que cambió:
```bash
git add .
```

### Paso 3: Hacer el commit

```bash
git commit -m "descripción de lo que hiciste"
```

Ejemplos de mensajes:
```bash
git commit -m "feat: agregar ejercicio de índices"
git commit -m "fix: corregir consulta SQL"
git commit -m "docs: agregar guía de docker"
```

### Paso 4: Subir a GitHub

```bash
git push
```

---

## Comandos útiles del día a día

| Comando | Para qué sirve |
|---|---|
| `git status` | Ver qué archivos cambiaron |
| `git add .` | Agregar todos los cambios |
| `git commit -m "msg"` | Guardar una foto del estado actual |
| `git push` | Subir los cambios a GitHub |
| `git pull` | Bajar cambios que alguien más subió |
| `git log --oneline` | Ver el historial de commits |
| `git remote -v` | Ver a qué repositorio de GitHub estás conectado |

---

## Flujo resumido (lo que usarás siempre)

```bash
git status              # 1. ver qué cambió
git add .               # 2. agregar los cambios
git commit -m "mensaje" # 3. guardar la foto
git push                # 4. subir a GitHub
```
