# Checklist de Seguridad (Desktop WINDEV)

## Aplicacion
- Firmar digitalmente el ejecutable.
- Activar actualizaciones seguras con validacion de firma.
- Ofuscar o proteger modulos sensibles.
- No hardcodear secretos en codigo fuente.

## Login y sesion
- Limitar intentos fallidos y bloquear temporalmente.
- Forzar clave robusta para usuarios nuevos.
- Registrar auditoria de acceso y cierre de sesion.
- Cerrar sesion por inactividad.

## Datos
- Usar consultas parametrizadas siempre.
- Guardar claves con hash + salt (evitar texto plano).
- Cifrar respaldos y trafico de red si hay servidor remoto.
- Aplicar principio de minimo privilegio al usuario de BD.

## Sistema operativo
- Definir politica de antivirus y antimalware corporativo.
- Habilitar firewall con reglas explicitas.
- Restringir ejecucion de software no firmado.
- Aplicar parches de seguridad de Windows de forma periodica.

## Operacion
- Monitorear intentos de acceso anomalo.
- Rotar credenciales administrativas.
- Tener plan de respuesta a incidentes.
