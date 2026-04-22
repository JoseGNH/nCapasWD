-- Endurecimiento opcional para login robusto
-- Ejecutar en una etapa posterior si deseas trazabilidad y bloqueo persistente.

ALTER TABLE Usuario ADD ClaveSalt VARCHAR(64) NULL;
ALTER TABLE Usuario ADD IntentosFallidos INT NOT NULL DEFAULT 0;
ALTER TABLE Usuario ADD BloqueadoHasta DATETIME NULL;
ALTER TABLE Usuario ADD Activo BIT NOT NULL DEFAULT 1;
ALTER TABLE Usuario ADD FechaUltimoAcceso DATETIME NULL;

CREATE INDEX IX_Usuario_Activo ON Usuario(Activo);
