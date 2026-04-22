// Ventana de Login - eventos sugeridos

PROCEDURE WIN_Login_OnOpen()
SesionInicializar()
EDT_Correo = ""
EDT_Clave = ""
SetFocusAndReturnToUserInput(EDT_Correo)

PROCEDURE BTN_Ingresar_OnClick()
CTRL_Login_Ejecutar()

PROCEDURE BTN_Salir_OnClick()
Close()
