// Controlador UI para Menu
PROCEDURE CTRL_Menu_ProcesarCodigo()

sCodigoLeido is string = EDT_CodigoBarras
sCodigoLimpio is string = NG_CodigoBarrasSanitizar(sCodigoLeido)

IF NG_CodigoBarrasEsValido(sCodigoLimpio) = False THEN
    Error("Codigo de barras invalido")
    RETURN
END

// Punto de extension para busquedas o procesos por codigo
Info("Codigo capturado: " + sCodigoLimpio)
EDT_CodigoBarras = ""
SetFocusAndReturnToUserInput(EDT_CodigoBarras)
