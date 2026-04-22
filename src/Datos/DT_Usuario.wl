// Acceso a datos de Usuario y Rol
PROCEDURE DT_UsuarioObtenerPorCorreo(sCorreo is string) : ST_Usuario

u is ST_Usuario
u.Activo = True

sSQL is string = [
SELECT
    U.IdUsuario,
    U.IdRol,
    U.Nombre,
    U.Correo,
    U.Clave,
    R.Descripcion AS RolDescripcion
FROM Usuario U
INNER JOIN Rol R ON R.IdRol = U.IdRol
WHERE UPPER(U.Correo) = UPPER({pCorreo})
]

IF HExecuteSQLQuery(QRY_UsuarioLogin, hQueryDefault, sSQL, sCorreo) = False THEN
    Error("Error al consultar usuario: " + HErrorInfo())
    RESULT u
END

HReadFirst(QRY_UsuarioLogin)
IF HFound(QRY_UsuarioLogin) THEN
    u.IdUsuario = QRY_UsuarioLogin.IdUsuario
    u.IdRol = QRY_UsuarioLogin.IdRol
    u.Nombre = QRY_UsuarioLogin.Nombre
    u.Correo = QRY_UsuarioLogin.Correo
    u.ClaveHash = QRY_UsuarioLogin.Clave
    u.RolDescripcion = QRY_UsuarioLogin.RolDescripcion
END

RESULT u

PROCEDURE DT_UsuarioActualizarClave(nIdUsuario is int, sNuevaClaveHash is string)

sSQLUpdate is string = [
UPDATE Usuario
SET Clave = {pClave}
WHERE IdUsuario = {pIdUsuario}
]

HExecuteSQLQuery(QRY_UsuarioUpdateClave, hQueryWithoutCorrection, sSQLUpdate, sNuevaClaveHash, nIdUsuario)
