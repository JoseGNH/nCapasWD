// Conexion centralizada de BD
PROCEDURE DB_Conectar() : boolean

sServidor is string = INIRead("DATABASE", "Server", "127.0.0.1", "config/app_config.ini")
sBase is string = INIRead("DATABASE", "Database", "NCapasSeguridad", "config/app_config.ini")
sUsuario is string = INIRead("DATABASE", "User", "app_login", "config/app_config.ini")
sClave is string = INIRead("DATABASE", "Password", "", "config/app_config.ini")

// Ajustar segun tu motor real (HFSQL Classic/Client-Server u otro)
HDescribeConnection("CNX_APP", sUsuario, sClave, sServidor, sBase, hAccessHFClientServer)
IF HOpenConnection("CNX_APP") = False THEN
    Error("No se pudo abrir la conexion de BD: " + HErrorInfo())
    RESULT False
END

HChangeConnection("*", "CNX_APP")
RESULT True

PROCEDURE DB_Desconectar()
HCloseConnection("CNX_APP")
