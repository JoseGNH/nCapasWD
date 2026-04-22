// Punto de entrada de la aplicacion
PROCEDURE Main()

IF DB_Conectar() = False THEN
    Error("No se pudo iniciar la aplicacion por error de conexion")
    RETURN
END

Open(WIN_Login)
