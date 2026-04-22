# nCapasWinDev

Proyecto base de escritorio en WINDEV (WLanguage) con arquitectura nCapas para:
- Login seguro con control riguroso de acceso.
- Uso de lector de codigo de barras (modo teclado/keyboard wedge).
- Estructura moderna, entendible y mantenible.

## Objetivo funcional actual
- Pantalla de Login.
- Validacion de usuario por rol.
- Apertura de pantalla de Menu despues de autenticar.
- Toast de bienvenida con: puesto (rol) y usuario.
- Variables globales de sesion (ids, rol, nombre, etc.) para reuso futuro.

## Arquitectura nCapas
- Capa Entidad: modelos puros (Usuario, Rol, Sesion).
- Capa Datos: acceso a BD (consultas parametrizadas, conexion, persistencia).
- Capa Negocio: reglas de autenticacion, hashing, bloqueo temporal, validaciones.
- Capa Presentacion: ventanas WINDEV (Login y Menu), controladores UI.

Estructura en este repositorio:

```
config/
docs/
sql/
src/
	Globales/
	Entidad/
	Datos/
	Negocio/
	Presentacion/
```

## Seguridad implementada en la base del proyecto
- Consultas parametrizadas (anti SQL Injection).
- Hash de clave en login (soporta validacion legacy MD5 y esquema robusto SHA-256 + salt).
- Politica de bloqueo por intentos fallidos.
- Sanitizacion de entradas (correo, clave, codigo de barras).
- Variables de sesion centralizadas y cierre seguro.
- Recomendaciones de hardening anti malware en `docs/seguridad-checklist.md`.

## Tablas base solicitadas
Se incluyen scripts en `sql/`:
- `01_schema.sql`: crea `Rol` y `Usuario` (esquema base).
- `02_seed.sql`: inserta datos de ejemplo.
- `03_security_patch_optional.sql`: columnas opcionales para endurecimiento.

## Flujo de login
1. Usuario captura correo/usuario y clave.
2. Presentacion valida formato basico y llama a Negocio.
3. Negocio sanitiza y calcula hash de verificacion.
4. Datos ejecuta query parametrizada y retorna entidad.
5. Negocio evalua estado (bloqueos/intentos) y autoriza.
6. Se carga sesion global y se abre Menu.
7. Menu muestra toast: "Hola [Puesto] - [NombreUsuario]".

## Uso de lector de codigo de barras
- Preparado para lector tipo teclado (el scanner escribe en un control input).
- Se agrega validacion de formato del codigo en Negocio.
- En Menu se deja punto de extension para acciones por codigo.

## Pasos sugeridos en WINDEV
1. Crear proyecto ejecutable de escritorio.
2. Crear analisis (HFSQL/externa) y tablas `Rol` y `Usuario`.
3. Importar modulos WLanguage en carpetas equivalentes.
4. Crear ventanas:
	 - `WIN_Login`
	 - `WIN_Menu`
5. Vincular eventos de botones/controles a `CTRL_Login` y `CTRL_Menu`.
6. Configurar `config/app_config.ini` para entorno.
7. Probar casos: acceso correcto, clave invalida, bloqueo por intentos.

## Nota importante
El codigo incluido es una base profesional y clara para evolucionar rapido.
Dependiendo de tu version exacta de WINDEV y motor de BD, puede requerir ajuste minimo de sintaxis en funciones de acceso a datos.
