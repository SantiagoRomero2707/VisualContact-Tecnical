USE [VisualContactTecnical-1];

/* Ejercicios */
/* Punto 1 - Sabana de información por cliente con el detalle del cliente y los productos que ha comprado*/
SELECT Nombre,Apellido, DNI, Direccion,Fecha_Nacimiento, Nombre_Producto, Precio_Unitario, Fecha_Compra, Codigo_Compra FROM dbo.Transacciones 
	INNER JOIN dbo.Producto ON(FK_Producto_ID = IDProducto AND Codigo_Producto = FK_Producto)
	INNER JOIN dbo.Cliente ON(FK_Cliente = DNI)
	
/* Punto 2 - Productos más vendidos y menos vendidos junto con su total de ventas. */
/* Menos Comprado Total */
SELECT top 1 dbo.Producto.Nombre_Producto, dbo.Producto.Precio_Unitario, COUNT(Nombre_Producto) AS Veces_Comprada, SUM(dbo.Producto.Precio_Unitario) AS Monto_Total
FROM dbo.Transacciones 
INNER JOIN dbo.Producto ON(FK_Producto_ID = IDProducto AND Codigo_Producto = FK_Producto)
GROUP BY dbo.Producto.Nombre_Producto, dbo.Producto.Precio_Unitario
ORDER BY Veces_Comprada

/* Más Comprado Total */
SELECT top 1 dbo.Producto.Nombre_Producto, dbo.Producto.Precio_Unitario, COUNT(Nombre_Producto) AS Veces_Comprada, SUM(dbo.Producto.Precio_Unitario) AS Monto_Total
FROM dbo.Transacciones 
INNER JOIN dbo.Producto ON(FK_Producto_ID = IDProducto AND Codigo_Producto = FK_Producto)
GROUP BY dbo.Producto.Nombre_Producto, dbo.Producto.Precio_Unitario
ORDER BY Veces_Comprada DESC 

/* Punto 3 - Conteo de productos y valor total de productos por cliente. */
/* Cantidad de productos comprados por el cliente y el total gastado, lo entendí así */
SELECT dbo.Cliente.Nombre, dbo.Cliente.Apellido,  SUM(dbo.Producto.Precio_Unitario) AS Cantidad_Gastado_Total,COUNT(Nombre_Producto) AS Veces_Comprada
FROM dbo.Transacciones 
INNER JOIN dbo.Producto ON(FK_Producto_ID = IDProducto AND Codigo_Producto = FK_Producto)
INNER JOIN dbo.Cliente ON(FK_Cliente = DNI)
GROUP BY dbo.Cliente.Nombre, dbo.Cliente.Apellido

/* Punto 4 -  Listado de clientes que han comprado un producto especifico. */
SELECT dbo.Producto.Nombre_Producto, COUNT(Nombre_Producto) AS Veces_Comprada, dbo.Cliente.Nombre, dbo.Cliente.Apellido FROM dbo.Transacciones 
	INNER JOIN dbo.Producto ON(FK_Producto_ID = IDProducto AND Codigo_Producto = FK_Producto)
	INNER JOIN dbo.Cliente ON(FK_Cliente = DNI)
GROUP BY dbo.Producto.Nombre_Producto, dbo.Cliente.Nombre, dbo.Cliente.Apellido