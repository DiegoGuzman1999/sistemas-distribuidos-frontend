# AVANCE — sistemas-distribuidos-frontend

## ¿Qué hace este repositorio?
Es la interfaz visual del sistema. Contiene las páginas HTML que el usuario ve en el navegador. Se comunica con los dos backends mediante peticiones HTTP (fetch).

---

## ¿Cómo se conecta con los backends?
No tiene servidor propio de lógica — solo sirve archivos HTML/CSS. El navegador del usuario es quien hace las llamadas a los backends directamente:

```
Navegador → POST http://localhost:5000/login     → Backend-1 (Auth)
Navegador → GET  http://localhost:5001/productos → Backend-2 (Inventario)
```

---

## Estructura del repositorio

```
sistemas-distribuidos-frontend/
├── templates/
│   ├── login.html       ← Página de inicio de sesión
│   └── inventario.html  ← Página principal con tabla y CRUD
├── static/
│   └── style.css        ← Estilos de toda la aplicación
├── nginx.conf           ← Configuración del servidor web
├── Dockerfile           ← Sirve los archivos con Nginx
├── docker-compose.yml   ← Para correr solo el frontend
└── AVANCE.md            ← Este archivo
```

---

## Páginas

### `login.html`
- Formulario de usuario y contraseña
- Llama al Backend-1 (`/login`)
- Si las credenciales son correctas, redirige a `inventario.html`
- Muestra mensaje de error si las credenciales fallan

### `inventario.html`
- Verifica sesión activa al cargar (llama a `/verificar` en Backend-1)
- Si no hay sesión, redirige al login automáticamente
- Muestra tabla con todos los productos (Backend-2)
- Formulario para agregar y editar productos
- Botones de editar y eliminar por cada producto
- Botón de cerrar sesión en la barra superior

---

## Puerto
El frontend corre en el puerto **3000**. Se accede desde: `http://localhost:3000`

---

## Historial de cambios

| Fecha      | Rama | Descripción                                         |
|------------|------|-----------------------------------------------------|
| 2026-04-20 | dev  | Estructura inicial: login, inventario y estilos CSS |
