// Entidad de Usuario
ST_Usuario is Structure
    IdUsuario is int
    IdRol is int
    Nombre is string
    Correo is string
    ClaveHash is string
    RolDescripcion is string
    Activo is boolean
    IntentosFallidos is int
    BloqueadoHasta is DateTime
END
