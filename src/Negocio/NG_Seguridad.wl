// Reglas de seguridad transversales
PROCEDURE NG_SanitizarEntrada(sValor is string) : string
sLimpio is string = NoSpace(sValor)
RESULT Replace(sLimpio, "'", "")

PROCEDURE NG_HashLegacyMD5(sClavePlano is string) : string
RESULT Lower(HashString(haMD5, sClavePlano))

PROCEDURE NG_HashSeguro(sClavePlano is string, sSalt is string = "") : string
IF sSalt = "" THEN
    sSalt = "APP-SALT"
END

RESULT Lower(HashString(haSHA256, sSalt + sClavePlano + gsPepperAplicacion))

PROCEDURE NG_ClaveCumplePolitica(sClavePlano is string) : boolean
IF Length(sClavePlano) < 10 THEN RESULT False
IF Position(sClavePlano, "[0-9]", FromBeginning, IgnoreCase, WholeWord) = 0 THEN RESULT False
IF Position(sClavePlano, "[A-Z]", FromBeginning, IgnoreCase, WholeWord) = 0 THEN RESULT False
RESULT True
