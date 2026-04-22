# AVANCE — sistemas-distribuidos-frontend

## ¿Qué hace este repositorio?
Es la interfaz visual del sistema. Contiene las páginas HTML que el usuario ve en el navegador. Se comunica con los dos backends mediante peticiones HTTP (fetch).

---

## ¿Cómo se conecta con los backends?
Usa **Nginx como proxy inverso** — el HTML hace llamadas a rutas relativas y Nginx las redirige al backend correcto dentro de la red Docker. Esto permite que el mismo HTML funcione en los 3 ambientes sin cambios.

```
Navegador → POST /auth/login     → Nginx → Backend-1 (Auth)
Navegador → GET  /inv/productos  → Nginx → Backend-2 (Inventario)
```

---

## Estructura del repositorio

```
sistemas-distribuidos-frontend/
├── templates/
│   ├── login.html       ← Página de inicio de sesión
│   ├── inventario.html  ← Página principal con tabla y CRUD
│   └── ventas.html      ← Histórico de ventas y reporte
├── static/
│   └── style.css        ← Estilos de toda la aplicación
├── nginx.conf           ← Config base de Nginx
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
- Verifica sesión activa al cargar (llama a `/auth/verificar`)
- Si no hay sesión, redirige al login automáticamente
- Muestra tabla con todos los productos (`/inv/productos`)
- Formulario para agregar y editar productos
- Botones de editar y eliminar por cada producto
- Botón de acceso al histórico de ventas
- Botón de cerrar sesión en la barra superior

### `ventas.html`
- Resumen con tarjetas: total ventas, ingresos y productos vendidos
- Formulario para registrar una venta (descuenta stock automáticamente)
- Top 5 productos más vendidos
- Historial completo de ventas con fecha

---

## Puerto por ambiente

| Ambiente | Puerto |
|---|---|
| Dev | 3000 |
| QA | 3001 |
| Main | 3002 |

La config de Nginx por ambiente se inyecta desde el repo padre al levantar Docker.

---

## Historial de cambios

| Fecha | Autor | Rama | Descripción |
|---|---|---|---|
| 2026-04-20 | DiegoGuzman1999 | dev | Estructura inicial: login, inventario y estilos CSS |
| 2026-04-21 | Checho999awoo | dev | Agregar página de histórico de ventas |
| 2026-04-21 | DiegoGuzman1999 | dev | Cambiar URLs hardcodeadas a rutas relativas para soporte multi-ambiente |
