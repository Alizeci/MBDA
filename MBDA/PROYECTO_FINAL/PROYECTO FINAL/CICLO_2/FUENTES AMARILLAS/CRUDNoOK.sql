---------------------------------------------------------------------------------------------------------------------------
                                              /*CICLO 1: CRUDNoOK*/
---------------------------------------------------------------------------------------------------------------------------

/*PROPUESTA*/
/*INSERTAR*/
BEGIN
PC_PROPUESTAS.AD_PROPUESTA('CC',1075689816,'Ofrezco cinco millones mas al precio origial',1);
END;
BEGIN
PC_PROPUESTAS.AD_PROPUESTA('CC',1075689816,'Ofrezco cinco millones mas al precio origial',1);
END;
BEGIN
PC_PROPUESTAS.AD_PROPUESTA('CC',1075689816,'Ofrezco cinco millones mas al precio origial',1);
END;
BEGIN
PC_PROPUESTAS.AD_PROPUESTA('CC',1075689816,'Ofrezco cinco millones mas al precio origial',1);
END;

/*DOCUMENTO*/
/*INSERTAR*/
BEGIN
PC_DOCUMENTOS.AD_DOCUMENTO('PDS');
END;

/*MODIFICAR*/
BEGIN
PC_DOCUMENTOS.MO_DOCUMENTO(1);
END;

/*SEGUIMIENTO*/
/*insertar*/
BEGIN
PC_SEGUIMIENTOS.AD_SEGUIMIENTO(8,NULL,101);
END;

/*MODIFICAR*/
BEGIN
PC_SEGUIMIENTOS.MO_SEGUIMIENTO(22,101);
END;





