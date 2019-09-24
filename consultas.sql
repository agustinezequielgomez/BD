---------------------------------------- DML PROV-PROD --------------------------------------------------------
--1
SELECT *
FROM productos;
--2
SELECT *
FROM proveedores p
WHERE p.Localidad = 'Capital Federal';
--3
SELECT *
FROM prov_prod p
WHERE p.Cantidad BETWEEN 200 AND 300;
--4
SELECT pp.PNRO
FROM prov_prod pp
INNER JOIN proveedores prov
ON pp.Numero = prov.Numero
WHERE prov.Localidad = 'Avellaneda';
--5
SELECT SUM(pp.Cantidad) AS 'Cantidad' 
FROM prov_prod pp
WHERE pp.Numero = 003 AND pp.PNRO = 001;
--6
SELECT p.PNRO, p.Localidad
FROM productos p
WHERE p.Localidad LIKE '_A%';
--7
SELECT prod.Precio
FROM prov_prod pp
INNER JOIN productos prod
ON pp.PNRO = prod.PNRO
WHERE pp.Numero = 102;
--8
SELECT DISTINCT prod.Localidad
FROM productos prod
UNION 
SELECT DISTINCT prov.Localidad
FROM proveedores prov;
--9
UPDATE productos prod 
SET prod.Tañano = 'Chico'
WHERE prod.Tañano = 'Mediano';
--10
DELETE FROM productos
WHERE PNRO NOT IN (SELECT PNRO FROM prov_prod);
--11
INSERT INTO proveedores VALUES (107, 'Rosales', null, 'Wilde');

-------------------------------------------------- DML VENTAS ----------------------------------------
--1
SELECT MAX(cantidad) 
FROM item_ventas;
--2
SELECT SUM(iv.cantidad) 
FROM item_ventas iv 
INNER JOIN productos prod 
ON iv.codigo_producto = prod.codigo_producto 
WHERE prod.nombre_producto = 'Kiwi';
--3
SELECT prod.nombre_producto as Producto, SUM(iv.cantidad) as Cantidad 
FROM productos prod 
INNER JOIN item_ventas iv 
ON prod.codigo_producto = iv.codigo_producto 
GROUP BY prod.nombre_producto 
ORDER BY SUM(iv.cantidad) DESC;
--4
SELECT prod.nombre_producto as Producto, SUM(iv.cantidad) as Cantidad 
FROM productos prod 
INNER JOIN item_ventas iv 
ON prod.codigo_producto = iv.codigo_producto 
GROUP BY prod.nombre_producto 
HAVING SUM(iv.cantidad) > 30 
ORDER BY prod.nombre_producto DESC;
--5
SELECT cli.nombre as Nombre, cli.codigo_cliente as Codigo_cliente, COUNT(ven.numero_factura) as Cantidad_compras 
FROM clientes cli 
INNER JOIN ventas ven 
ON cli.codigo_cliente = ven.codigo_cliente 
GROUP BY cli.nombre;
--6
