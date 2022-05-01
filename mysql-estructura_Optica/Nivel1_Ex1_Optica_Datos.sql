USE optica_cul_ampolla

/*
Introduccion de datos en base de datos para ejemplo
*/;

INSERT INTO direccion
VALUES 	(DEFAULT, 'Rosello', 15, 2, 2, 'Barbera', 08100, 'España'),
		(DEFAULT, 'Caceres', 215, 6, 3, 'Barcelona', 08003, 'España'),
        (DEFAULT, 'Pau Casals', 47, 3, 2, 'Sant Celoni', 08470, 'España'),
        (DEFAULT, 'Republica', 6, 10, 1, 'Lloret', 27100, 'España');

INSERT INTO cliente
VALUES 	(DEFAULT, 'Maria', 3, '111121314', 'maria@gmail.com', '2022-01-12', NULL),
		(DEFAULT, 'Pablo', 2, '222121314', 'pablo@gmail.com', '2022-01-10', 1),
        (DEFAULT, 'Andres', 4, '33321314', 'andre@gmail.com', '2022-02-01', NULL);
        
INSERT INTO proveedor
VALUES 	(DEFAULT, 'Proveedor_1', 1, '444556677', 'B000000000'),
		(DEFAULT, 'Proveedor_2', 3, '999203040', 'A999999999');
             
INSERT INTO empleado
VALUES 	(DEFAULT, 'Cristina'),
		(DEFAULT, 'Manel'),
        (DEFAULT, 'Sigrid');    
        
INSERT INTO marca
VALUES 	(DEFAULT, 'Ray-Ban', 1),
		(DEFAULT, 'TOUS', 2),
        (DEFAULT, 'PRADA', 2);    
        
INSERT INTO tipo_montura
VALUES 	(DEFAULT, 'Vidre'),
		(DEFAULT, 'Pasta'),
        (DEFAULT, 'Metalica');    

INSERT INTO venta
VALUES 	(DEFAULT, 2, 3, 1, '2022-01-15'),
		(DEFAULT, 1, 2, 2, '2022-02-15'),
        (DEFAULT, 3, 1, 3, '2022-02-20'),
		(DEFAULT, 2, 1, 4, '2022-03-20');    

INSERT INTO gafas
VALUES 	(DEFAULT, 1, 1, 0.75, 0.50, 1, 'Azul', 'Oscuro', 'Oscuro', 500),
		(DEFAULT, 2, 2, 1.25, 0.85, 2, 'Roja', 'Azul', 'Azul', 700),
        (DEFAULT, 2, 3, 0.15, 0.45, 3, 'Blanco', 'Neutro', 'Neutro', 350),
        (DEFAULT, 1, 1, 0.25, 0.70, 3, 'Plateado', 'Amarillo', 'Amarillo', 400);
        
/* En primer lloc l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. 
En concret vol saber de cada proveïdor el nom, l'adreça 
(carrer, número, pis, porta, ciutat, codi postal i país), fax, NIF.
*/;


SELECT
	g.Gafas_id AS Gafas,
	p.Proveedor_nombre AS Proveedor,
    CONCAT ("C/", d.Direccion_calle, ", ",
    d.Direccion_numero, ", ",
    d.Direccion_piso,  ", ", 
    d.Direccion_puerta, ", ",
    d.Direccion_ciudad, ", ",
    d.Direccion_CP, ", ",
    d.Direccion_pais) AS direccion,
    p.Proveedor_fax AS FAX,
    p.Proveedor_NIF AS NIF
FROM gafas g
JOIN marca m
	ON m.Marca_id = g.Gafas_marca
JOIN proveedor p
	ON p.Proveedor_id = m.Marca_proveedor
JOIN direccion d
	ON p.Proveedor_direccion = d.Direccion_id
ORDER BY g.Gafas_id;

/*
La política de compres de l'òptica es basa en que les ulleres d'una marca es compraran a un únic proveïdor 
(així en podrà treure més bons preus), però poden comprar ulleres de diverses marques a un proveïdor.  ---> per això la relació d'un a molts.
De les ulleres vol saber, la marca, la graduació de cadascun dels vidres, el tipus de muntura (flotant, pasta o metàl·lica), el color de la muntura,
el color de cada vidre i el preu.
Com tots els camps relacionats son NOT NULL faig servir JOIN per simplificar.
*/

SELECT 
	g.Gafas_id AS Gafas,
    m.Marca_nombre AS Marca,
    g.Gafas_graduacion_IZ,
    g.Gafas_graduacio_DCH,
    tm.Tipo_montura_nombre AS Tipo_montura,
    g.Gafas_color_montura AS Color_montura,
    g.Gafas_color_vidrio_IZ,
    g.Gafas_color_vidrio_DCH,
    g.Gafas_precio AS Precio
FROM gafas g
JOIN tipo_montura tm
	ON g.Gafas_tipo_montura = tm.Tipo_montura_id
JOIN marca m
	on g.Gafas_marca = m.Marca_id
JOIN proveedor p
	on g.Gafas_proveedor = p.Proveedor_id
ORDER BY g.Gafas_id;
 
 /*
 Dels clients vol emmagatzemar el nom, l'adreça postal, el telèfon, el correu electrònic i la data de registre. 
 També ens demanen, quan arriba un client nou, d'emmagatzemar el client que li ha recomanat l'establiment (sempre i quan algú li hagi recomanat).
 
 S'ha donat d'alta la tabla clients amb tots els camps que demanen i a més amés un camp "Cliente_Recomendado_por" que permet entrades nules per si no ve recomanat per ningu.
 
 El nostre sistema haurà d’indicar qui ha sigut l’empleat que ha venut cada ullera.
 
 S'ha creat una taula nova, anomenada "venta" que demana al client que se li fa la venta, les ulleres que se li venc i el empleat que realitza la venta.
 */
 
 /*
 Llista el total de factures d'un client en un període determinat
 */
 
SELECT 
	c.Cliente_Nombre AS Cliente,
	COUNT(v.Venta_id) AS Total_facturas
FROM venta v
JOIN cliente c
	ON v.Venta_Cliente = c.Clientes_id
WHERE v.venta_fecha > '2022-02-01'
AND v.venta_fecha < '2022-02-28'
GROUP BY c.Clientes_id;
 
/*
Llista els diferents models d'ulleres que ha venut un empleat durant un any
*/ 
 
SELECT 
	m.Marca_nombre AS Gafas_modelo,
    e.Empleado_nombre AS Empleado
FROM venta v
JOIN gafas g
	ON v.Venta_Gafas = g.Gafas_id
JOIN empleado e
	ON v.Venta_Empleado = e.Empleado_id
JOIN marca m
	ON g.Gafas_marca = m.Marca_id
WHERE e.Empleado_id = 1
AND v.venta_fecha > '2022-01-01'
AND v.venta_fecha < '2022-12-31';
 
/*
Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
*/

SELECT p.Proveedor_nombre
FROM venta v
JOIN gafas g
	ON v.Venta_Gafas=g.Gafas_id
JOIN proveedor p
	ON g.Gafas_proveedor = p.Proveedor_id
GROUP BY p.Proveedor_id;