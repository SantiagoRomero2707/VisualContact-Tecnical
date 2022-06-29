use [VisualContactTecnical-1];


CREATE TABLE dbo.Proveedores  /** CREACIÓN DE LA ENTIDAD DE PROVEEDORES **/
(  
    NIFProveedor Char (15) NOT NULL CONSTRAINT PK_NIFProveedor PRIMARY KEY CLUSTERED (NIFProveedor)
    ,Nombre Varchar (200) NOT NULL  
    ,Direccion Varchar (200) NULL  
);

CREATE TABLE dbo.Producto  /** CREACIÓN DE LA ENTIDAD DE PRODUCTOS **/
(  
    IDProducto Tinyint IDENTITY (1,1) NOT NULL
	, Codigo_Producto Char(3) NOT NULL CONSTRAINT PK_IDProducto PRIMARY KEY CLUSTERED (IDProducto, Codigo_Producto)
    ,Nombre_Producto Varchar(200) NOT NULL  
    ,Precio_Unitario SmallInt NOT NULL  
    ,FK_Proveedor Char(15) NOT NULL  
);


CREATE TABLE dbo.Cliente /** CREACIÓN DE LA ENTIDAD DE CLIENTES **/
(  
    DNI Char(15) NOT NULL, CONSTRAINT PK_Cliente PRIMARY KEY CLUSTERED (DNI)
    ,Nombre Varchar(200) NOT NULL  
    ,Apellido Varchar(200) NULL  
    ,Direccion Char (100) NOT NULL  
	,Fecha_Nacimiento Date NOT NULL  
);

CREATE TABLE dbo.Transacciones /** CREACIÓN DE LA ENTIDAD DE TRANSACCIONES **/
(  
    ID_Compra tinyint IDENTITY (1,1) NOT NULL
	,Codigo_Compra Char (10) NOT NULL CONSTRAINT PK_Transacciones PRIMARY KEY CLUSTERED (ID_Compra,Codigo_Compra)
    ,Fecha_Compra DateTime NOT NULL  
    ,FK_Producto Char(3) NOT NULL  
	,FK_Producto_ID Tinyint NOT NULL  
    ,FK_Cliente Char(15) NOT NULL  
    ,FK_Empresa Char(15) NOT NULL  
);


CREATE TABLE dbo.Empresa /** CREACIÓN DE LA ENTIDAD DE EMPRESAS **/
(  
    NIT_Empresa Char (15) NOT NULL, CONSTRAINT PK_NIT_Empresa PRIMARY KEY CLUSTERED (NIT_Empresa)
    ,Nombre_Empresa Varchar(200) NOT NULL  
    ,Direccion Varchar(200) NULL  
);


/** Restricciones 1 entre entidades (Relaciones) Proveedores -> Producto **/
ALTER TABLE dbo.Producto
	ADD CONSTRAINT FK_Proveedor_Producto FOREIGN KEY (FK_Proveedor)
		REFERENCES dbo.Proveedores (NIFProveedor)
			ON DELETE CASCADE
			ON UPDATE CASCADE
;


/** Restricciones 2 entre entidades (Relaciones) Producto -> Transaccion **/
ALTER TABLE dbo.Transacciones
	ADD CONSTRAINT FK_Producto_Transaccion FOREIGN KEY (FK_Producto_ID,FK_Producto)
		REFERENCES dbo.Producto (IDProducto,Codigo_Producto)
			ON DELETE CASCADE
			ON UPDATE CASCADE
;

/** Restricciones 3 entre entidades (Relaciones) Empresa -> Transacciones **/
ALTER TABLE dbo.Transacciones
	ADD CONSTRAINT FK_Empresa_Transaccion FOREIGN KEY (FK_Empresa)
		REFERENCES dbo.Empresa (NIT_Empresa)
			ON DELETE CASCADE
			ON UPDATE CASCADE
;

/** Restricciones 4 entre entidades (Relaciones) Cliente -> Transacciones **/
ALTER TABLE dbo.Transacciones
	ADD CONSTRAINT FK_Cliente_Transaccion FOREIGN KEY (FK_Cliente)
		REFERENCES dbo.Cliente (DNI)
			ON DELETE CASCADE
			ON UPDATE CASCADE
;