// Constantes globales de seguridad y aplicacion
CONSTANT
    GC_APP_NOMBRE = "NCapasWinDev"
    GC_MAX_INTENTOS = 5
    GC_MIN_BLOQUEO = 15
    GC_SESSION_TIMEOUT_MIN = 30
END

// Se recomienda cargar este valor desde config/app_config.ini en produccion
GLOBAL
    gsPepperAplicacion is string = "CAMBIAR_PEPPER_PRODUCCION"
