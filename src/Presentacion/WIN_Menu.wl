// Ventana de Menu - eventos sugeridos

PROCEDURE WIN_Menu_OnOpen()
IF SesionEsValida() = False THEN
    Info("La sesion no es valida o expiro")
    Open(WIN_Login)
    Close()
    RETURN
END

// Toast de bienvenida solicitado
ToastDisplay("Hola " + gSesion.RolDescripcion + " - " + gSesion.NombreUsuario, toastShort, vaMiddle, haCenter)

LBL_Usuario = gSesion.NombreUsuario
LBL_Rol = gSesion.RolDescripcion

PROCEDURE EDT_CodigoBarras_OnEnter()
CTRL_Menu_ProcesarCodigo()

PROCEDURE BTN_CerrarSesion_OnClick()
SesionCerrar()
Open(WIN_Login)
Close()
