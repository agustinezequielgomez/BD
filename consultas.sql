-------------------------------------------------- DML PROV-PROD --------------------------------------------------------
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

-------------------------------------------------- DML VENTAS -----------------------------------------------------------
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

-------------------------------------------------- DML OFICINA ----------------------------------------------------------
--1 
SELECT descripcion
FROM oficinas;
--2
SELECT descripcion as Nombre, precio, (precio * 1.21) AS IVA
FROM productos;
--3
SELECT apellido, nombre,fecha_nacimiento, YEAR(now()) - YEAR(fecha_nacimiento) as Edad
FROM empleados;
--4
SELECT *
FROM empleados
WHERE cod_jefe IS NOT NULL;
--5
SELECT * 
FROM empleados
WHERE nombre LIKE "%Maria%"
ORDER BY apellido;
--6
SELECT *
FROM clientes
WHERE razon_social 
LIKE "L%" 
ORDER BY cod_cliente;
--7
SELECT *
FROM pedidos 
WHERE MONTH(fecha_pedido) = 3
ORDER BY fecha_pedido;
--8
SELECT *
FROM oficinas
WHERE codigo_director
IS NULL;
--9
SELECT *
FROM productos
ORDER BY precio LIMIT 4;
--10
SELECT cod_empleado
FROM datos_contratos
ORDER BY cuota DESC
LIMIT 3;

-------------------------------------------------- DML OFICINA MULTI TABLA ----------------------------------------------
--1
SELECT p.descripcion, p.cantidad_stock, f.razon_social
FROM productos p 
INNER JOIN fabricantes f
ON p.cod_fabricante = f.cod_fabricante
ORDER BY f.razon_social,p.descripcion;
--2
SELECT p.cod_pedido, p.fecha_pedido, e.apellido, c.razon_social
FROM pedidos p
INNER JOIN empleados e
ON p.cod_empleado = e.cod_empleado
INNER JOIN clientes c
ON p.cod_cliente = c.cod_cliente;
--3
SELECT e.apellido, dc.cuota, o.descripcion
FROM empleados e
INNER JOIN datos_contratos dc
ON e.cod_empleado = dc.cod_empleado
INNER JOIN oficinas o
ON o.cod_oficina = e.cod_oficina
ORDER BY dc.cuota DESC;
--4
SELECT DISTINCT(c.razon_social)
FROM clientes c
INNER JOIN pedidos p
ON c.cod_cliente = p.cod_cliente
WHERE MONTH(p.fecha_pedido) = 4;
--5
SELECT DISTINCT prod.*
FROM productos prod
INNER JOIN detalle_pedidos dp
ON prod.cod_producto = dp.cod_producto
INNER JOIN pedidos pe
ON pe.cod_pedido = dp.cod_pedido
WHERE MONTH(pe.fecha_pedido) = 3;
--6
SELECT em.*
FROM empleados em
INNER JOIN datos_contratos dc
ON dc.cod_empleado = em.cod_empleado
WHERE YEAR(now()) - YEAR(dc.fecha_contrato) > 10
ORDER BY dc.fecha_contrato DESC
--7
SELECT CL.*
FROM clientes cl
INNER JOIN listas li
ON cl.cod_lista = li.cod_listas
WHERE li.descripcion = "mayoristas"
ORDER BY cl.razon_social;
--8
SELECT DISTINCT prod.cod_producto, prod.descripcion, cl.razon_social
FROM clientes cl
INNER JOIN pedidos ped
ON ped.cod_cliente = cl.cod_cliente
INNER JOIN detalle_pedidos dp
ON dp.cod_pedido = ped.cod_pedido
INNER JOIN productos prod
ON dp.cod_producto = prod.cod_producto
ORDER BY cl.razon_social, prod.descripcion;
--9
SELECT prod.descripcion AS Producto, prod.punto_reposicion - prod.cantidad_stock AS "Cantidad a comprar", fabr.razon_social AS Fabricante
FROM productos prod
INNER JOIN fabricantes fabr
ON prod.cod_fabricante = fabr.cod_fabricante
WHERE prod.cantidad_stock < prod.punto_reposicion
ORDER BY fabr.razon_social, prod.descripcion;
--10
SELECT empl.*, dc.cuota
FROM empleados empl
INNER JOIN datos_contratos dc
ON empl.cod_empleado = dc.cod_empleado
WHERE dc.cuota NOT BETWEEN 50000 AND 100000;
-------------------------------------------------- CONSULTAS AL CATALOGO ------------------------------------------------
--1
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = "Localidad";
--2
SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = "Productos"
AND TABLE_SCHEMA = "ejercitaciondb_oficinas";
--3
SELECT CREATOR, COUNT(NAME)
FROM SYSTABLES
WHERE COUNT(*) > 1
GROUP BY (CREATOR);
--4
SELECT DISTINCT(TABLE_NAME)
FROM INFORMATION_SCHEMA.STATISTICS;