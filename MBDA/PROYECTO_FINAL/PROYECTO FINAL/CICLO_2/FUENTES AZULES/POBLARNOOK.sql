
------------------------------------------------------------------------------------------------------------
                                       /*CICLO 1: PoblarNoOK*/
------------------------------------------------------------------------------------------------------------

--Debe aparecer el titular
INSERT INTO negocio VALUES (3,'Hugo Florez','Patricia Lopez','Hugo Florez','Patricia Lopez','<?xml version="1.0"?>
<!DOCTYPE estado_juridico [
	<!ELEMENT estado_juridico (estado)>
	<!ELEMENT estado (titular+ , embargos? , hipotecas? , restricciones_de_uso?)*>	
	<!ELEMENT titular (descripcion)?>
    <!ELEMENT embargos (descripcion)?>
	<!ELEMENT hipotecas (descripcion)?>
	<!ELEMENT restricciones_de_uso (descripcion)?>
    <!ELEMENT descripcion (#PCDATA)>

	<!ATTLIST titular confirmacion CDATA #REQUIRED
                    nombre CDATA #REQUIRED
                    cedula CDATA #REQUIRED>
	<!ATTLIST embargos confirmacion CDATA #REQUIRED>
	<!ATTLIST hipotecas confirmacion CDATA #REQUIRED>
	<!ATTLIST restricciones_de_uso confirmacion CDATA #REQUIRED>
]>

<estado_juridico>
	<estado>
		<embargos confirmacion="NO">
            <descripcion></descripcion>
  		</embargos>
    	<hipotecas confirmacion="SI">
			<descripcion> Hipotecada al banco</descripcion>
    	</hipotecas>
    </estado>
</estado_juridico>',3);

--En TImagen debe ser JPEG,PNG O PDF

INSERT INTO documento VALUES (8,'PDK',TO_DATE('2018/01/03','yyyy/mm/dd'));

--En la tabla escritura en evento debe ser 'A'(arriendo) o 'V'(venta)

INSERT INTO escritura VALUES (6,'K');

--En la tabla seguimiento en porcentaje debe ser numeros entre 1 y 100

INSERT INTO seguimiento VALUES (8,8,TO_DATE('2018/01/03','yyyy/mm/dd'),NULL,101);

--En documento el numero debe ser entre 1 y 99999

INSERT INTO documento VALUES (0,'PNG',TO_DATE('2018/01/03','yyyy/mm/dd'));

