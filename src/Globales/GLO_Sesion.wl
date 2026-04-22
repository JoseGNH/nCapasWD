// Estructuras globales de sesion para reutilizar en toda la app
ST_SesionUsuario is Structure
    IdUsuario is int
    IdRol is int
    RolDescripcion is string
    NombreUsuario is string
    Correo is string
    FechaHoraLogin is DateTime
    Autenticado is boolean
END

GLOBAL
    gSesion is ST_SesionUsuario

PROCEDURE SesionInicializar()

gSesion.IdUsuario = 0
gSesion.IdRol = 0
gSesion.RolDescripcion = ""
gSesion.NombreUsuario = ""
gSesion.Correo = ""
gSesion.FechaHoraLogin = DateTimeSys()
gSesion.Autenticado = False

PROCEDURE SesionCerrar()
SesionInicializar()

PROCEDURE SesionEsValida() : boolean
IF gSesion.Autenticado = False THEN
    RESULT False
END

// Timeout por inactividad de sesion
nDifMin is int = DateTimeDifference(DateTimeSys(), gSesion.FechaHoraLogin)
IF nDifMin > GC_SESSION_TIMEOUT_MIN THEN
    SesionCerrar()
    RESULT False
END

RESULT True
