/**EJERCICIO N�MERO DOS DE BASES DE DATOS **/
/**SINT�XIS DE TRANSACT-SQL PARA GESTOR DE BASE DE DATOS SQL SERVER 2019 **/


create Database VisualContactTecnical; /** CREACI�N DE LA BASSE DE DATOS **/
use [VisualContactTecnical-1]; /** INSTANCIAMIENTO PARA CONTEXTO DE USO DE LA BASE DE DATOS **/


CREATE TABLE dbo.People  /** CREACI�N DE LA ENTIDAD DE REGISTROS DE PERSONAS EN LA BASE DE DATOS CON SUS CAMPOS DADOS **/
(  
    IDRegistro int IDENTITY (1,1) NOT NULL, CONSTRAINT PK_RegisterPerson PRIMARY KEY CLUSTERED (IDRegistro)
    ,Nombre varchar(20) NOT NULL  
    ,Apellido varchar(20) NULL  
    ,Nota int NOT NULL  
    ,Localidad varchar(20) NOT NULL  
);

/** INSERCI�N DE REGISTROS PARA LA ENTIDAD PERSONA DE LA BASE DE DATOS **/
INSERT INTO  dbo.People values('Ana', 'Herrero', 5, 'Alfaro');
INSERT INTO  dbo.People values('Pedro', 'Ruiz', 6, 'Tudela');
INSERT INTO  dbo.People values('Carlos', 'Tus', 4, 'Alfaro');
INSERT INTO  dbo.People values('Maria', 'Pes', 6, 'Cortes');
INSERT INTO  dbo.People values('Antonio', 'Tous', 7, 'Alfaro');
INSERT INTO  dbo.People values('Nuria', 'Jim�nez', 8, 'Ablitas');
INSERT INTO  dbo.People values('Celia', 'Irurzun', 4, 'Tudela');


/**Primer Ejercicio*/
SELECT * FROM dbo.People;
WHERE Localidad = 'Alfaro' OR Localidad='Cortes';
WHERE Localidad = 'Alfaro' AND Localidad='Cortes';


/**Segundo Ejercicio*/
SELECT * FROM dbo.People
WHERE Nota BETWEEN 6 AND 7 AND 
IDRegistro NOT BETWEEN 2 AND 4;


/**Tercer Ejercicio*/
SELECT * FROM dbo.People
WHERE Nombre LIKE '%a%' AND  Apellido LIKE '%s%';

