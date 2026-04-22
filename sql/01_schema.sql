-- Esquema base solicitado
CREATE TABLE Rol (
    IdRol INT PRIMARY KEY,
    Descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY,
    IdRol INT NOT NULL,
    Nombre VARCHAR(120) NOT NULL,
    Correo VARCHAR(120) NOT NULL,
    Clave VARCHAR(256) NOT NULL,
    CONSTRAINT FK_Usuario_Rol FOREIGN KEY (IdRol) REFERENCES Rol(IdRol)
);

CREATE UNIQUE INDEX UX_Usuario_Correo ON Usuario(Correo);
