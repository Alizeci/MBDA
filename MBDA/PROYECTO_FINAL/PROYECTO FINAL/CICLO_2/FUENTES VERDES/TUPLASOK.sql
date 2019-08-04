--------------------------------------------------------------------------------------------------------------------------
                                                  /*CICLO 1: Tuplas*/
--------------------------------------------------------------------------------------------------------------------------

/*ADICION*/
/*El propietario debe ser el mismo que tiene la titularidad*/ 
INSERT INTO negocio VALUES (1,'Luis Sierra','Luis Sierra','Pedro Ramirez','Luisa Sierra','<?xml version="1.0"?>
<!DOCTYPE estado_juridico [
	<!ELEMENT estado_juridico (estado)>
	<!ELEMENT estado (titular | embargos | hipotecas | restricciones_de_uso)>	
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
  	<titular nombre="Luis Sierra" cedula="1073254906" confirmacion="SI">
  	</titular>
  	<embargos confirmacion="NO">
  	</embargos>
    <hipotecas confirmacion="NO">
    </hipotecas>
    <restricciones_de_uso confirmacion="SI">
      <descripcion>Zona industrial</descripcion>
    </restricciones_de_uso>
 </estado>
</estado_juridico>',1);