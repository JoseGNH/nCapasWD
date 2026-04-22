// Reglas para lector de codigo de barras
PROCEDURE NG_CodigoBarrasSanitizar(sCodigo is string) : string

sTmp is string = NoSpace(sCodigo)
sTmp = Replace(sTmp, Charact(9), "")
sTmp = Replace(sTmp, Charact(13), "")
sTmp = Replace(sTmp, Charact(10), "")
RESULT sTmp

PROCEDURE NG_CodigoBarrasEsValido(sCodigo is string) : boolean

sTmp is string = NG_CodigoBarrasSanitizar(sCodigo)
IF sTmp = "" THEN RESULT False
IF Length(sTmp) < 8 THEN RESULT False
IF Length(sTmp) > 32 THEN RESULT False
RESULT True
