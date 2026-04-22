// Servicio de autenticacion principal
// Control de bloqueo local en memoria para reforzar seguridad basica
GLOBAL
    gIntentosCorreo is associative array of int
    gBloqueoCorreoHasta is associative array of DateTime

PROCEDURE NG_EstaBloqueado(sCorreo is string) : boolean
sKey is string = Upper(NG_SanitizarEntrada(sCorreo))
IF gBloqueoCorreoHasta.Exist(sKey) = False THEN
    RESULT False
END

IF DateTimeSys() < gBloqueoCorreoHasta[sKey] THEN
    RESULT True
END

gBloqueoCorreoHasta.Delete(sKey)
gIntentosCorreo.Delete(sKey)
RESULT False

PROCEDURE NG_RegistrarFallo(sCorreo is string)
sKey is string = Upper(NG_SanitizarEntrada(sCorreo))

IF gIntentosCorreo.Exist(sKey) = False THEN
    gIntentosCorreo[sKey] = 0
END

gIntentosCorreo[sKey] += 1

IF gIntentosCorreo[sKey] >= GC_MAX_INTENTOS THEN
    gBloqueoCorreoHasta[sKey] = DateTimeAdd(DateTimeSys(), durationMinute, GC_MIN_BLOQUEO)
END

PROCEDURE NG_RegistrarExito(sCorreo is string)
sKey is string = Upper(NG_SanitizarEntrada(sCorreo))
IF gIntentosCorreo.Exist(sKey) THEN gIntentosCorreo.Delete(sKey)
IF gBloqueoCorreoHasta.Exist(sKey) THEN gBloqueoCorreoHasta.Delete(sKey)

PROCEDURE NG_Login(sCorreo is string, sClavePlano is string, OUT sMensaje is string) : boolean
sMensaje = ""

IF DB_Conectar() = False THEN
    sMensaje = "No fue posible conectar a la base de datos"
    RESULT False
END

sCorreoLimpio is string = NG_SanitizarEntrada(sCorreo)
sClaveLimpia is string = NG_SanitizarEntrada(sClavePlano)

IF sCorreoLimpio = "" OR sClaveLimpia = "" THEN
    sMensaje = "Capture usuario y clave"
    RESULT False
END

IF NG_EstaBloqueado(sCorreoLimpio) THEN
    sMensaje = "Usuario temporalmente bloqueado por intentos fallidos"
    RESULT False
END

u is ST_Usuario = DT_UsuarioObtenerPorCorreo(sCorreoLimpio)
IF u.IdUsuario = 0 THEN
    NG_RegistrarFallo(sCorreoLimpio)
    sMensaje = "Usuario o clave invalida"
    RESULT False
END

sHashIngresadoMD5 is string = NG_HashLegacyMD5(sClaveLimpia)
sHashIngresadoSHA is string = NG_HashSeguro(sClaveLimpia)

bValido is boolean = False
IF Lower(u.ClaveHash) = sHashIngresadoMD5 THEN bValido = True
IF Lower(u.ClaveHash) = sHashIngresadoSHA THEN bValido = True
IF Lower(u.ClaveHash) = Lower(sClaveLimpia) THEN bValido = True

IF bValido = False THEN
    NG_RegistrarFallo(sCorreoLimpio)
    sMensaje = "Usuario o clave invalida"
    RESULT False
END

// Migracion silenciosa de hash heredado a hash robusto
IF Lower(u.ClaveHash) = sHashIngresadoMD5 OR Lower(u.ClaveHash) = Lower(sClaveLimpia) THEN
    DT_UsuarioActualizarClave(u.IdUsuario, sHashIngresadoSHA)
END

NG_RegistrarExito(sCorreoLimpio)

// Carga de variables globales de sesion
SesionInicializar()
gSesion.IdUsuario = u.IdUsuario
gSesion.IdRol = u.IdRol
gSesion.RolDescripcion = u.RolDescripcion
gSesion.NombreUsuario = u.Nombre
gSesion.Correo = u.Correo
gSesion.FechaHoraLogin = DateTimeSys()
gSesion.Autenticado = True

sMensaje = "Acceso correcto"
RESULT True
