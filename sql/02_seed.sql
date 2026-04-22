-- Datos iniciales de Rol
INSERT INTO Rol (IdRol, Descripcion) VALUES
(1, 'Gerente'),
(2, 'Encargado de Compras'),
(3, 'Encargado de Ventas'),
(4, 'Encargado de Cobros de Venta');

-- Datos iniciales de Usuario
-- Nota: Se conserva el contenido solicitado en la columna Clave.
INSERT INTO Usuario (IdUsuario, IdRol, Nombre, Correo, Clave) VALUES
(1, 1, 'Jose Negrete', 'Jose', '07f4b3f624c818ffada76e6b219fccf1'),
(2, 4, 'Maria Lopez', 'Maria', 'clave2'),
(3, 3, 'Carlos Garcia', 'Negrete', 'clave3'),
(4, 4, 'Ana Torres', 'Ana', 'clave4'),
(5, 1, 'Luis Fernandez', 'Luis', 'clave5'),
(6, 2, 'Robert', 'Robert', 'clave5'),
(7, 1, 'Pat', 'Pat', 'clave6'),
(8, 1, 'Alexis Martinez', 'Alexis', '79162b02a4adef009a7d8214aaaafec5'),
(9, 2, 'Juan', 'Juan', '92eaf3719159c372f3d50337e0a14f57');
