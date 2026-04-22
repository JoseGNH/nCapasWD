// Controlador UI para Login
PROCEDURE CTRL_Login_Ejecutar()

sCorreo is string = EDT_Correo
sClave is string = EDT_Clave
sMensaje is string = ""

bOk is boolean = NG_Login(sCorreo, sClave, sMensaje)
IF bOk = False THEN
    Error(sMensaje)
    EDT_Clave = ""
    SetFocusAndReturnToUserInput(EDT_Clave)
    RETURN
END

Open(WIN_Menu)
Close(WIN_Login)
