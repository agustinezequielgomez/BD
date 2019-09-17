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