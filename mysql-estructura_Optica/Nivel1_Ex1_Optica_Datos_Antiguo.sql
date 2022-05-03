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
VALUES 	(DEFAULT, 'Maria', '111121314', 'maria@gmail.com', '2022-01-12', NULL, 3),
		(DEFAULT, 'Pablo', '222121314', 'pablo@gmail.com', '2022-01-10', 1 ,2),
        (DEFAULT, 'Andres', '33321314', 'andre@gmail.com', '2022-02-01', NULL, 4);
        
INSERT INTO empleado
VALUES 	(DEFAULT, 'Cristina'),
		(DEFAULT, 'Manel'),
        (DEFAULT, 'Sigrid');    
        
INSERT INTO marca
VALUES 	(DEFAULT, 'Ray-Ban', 1),
		(DEFAULT, 'TOUS', 2),
        (DEFAULT, 'PRADA', 2);           
        
INSERT INTO proveedor
VALUES 	(DEFAULT, 'Proveedor_1', '444556677', '444556678', 'B00000000', 1, 1),
		(DEFAULT, 'Proveedor_2', '999203040', '999203041', 'A99999999', 3, 2);
        
INSERT INTO tipo_montura
VALUES 	(DEFAULT, 'Vidre'),
		(DEFAULT, 'Pasta'),
        (DEFAULT, 'Metalica');    

INSERT INTO gafas
VALUES 	(DEFAULT, 1, 1, 0.75, 0.50, 'Azul', 'Oscuro', 'Oscuro', 500),
		(DEFAULT, 2, 2, 1.25, 0.85, 'Roja', 'Azul', 'Azul', 700),
        (DEFAULT, 2, 3, 0.15, 0.45, 'Blanco', 'Neutro', 'Neutro', 350),
        (DEFAULT, 1, 1, 0.25, 0.70, 'Plateado', 'Amarillo', 'Amarillo', 400);

INSERT INTO venta
VALUES 	(DEFAULT, 3, 1, '2022-01-15', 2),
		(DEFAULT, 2, 2, '2022-02-15', 1),
        (DEFAULT, 1, 3, '2022-02-20', 3),
		(DEFAULT, 1, 4, '2022-03-20', 2);    
        
/* En primer lloc l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. 
En concret vol saber de cada proveïdor el nom, l'adreça 
(carrer, número, pis, porta, ciutat, codi postal i país), fax, NIF.
*/;


SELECT
	g.id AS Gafas,
	p.nombre AS Proveedor,
    CONCAT ("C/", d.calle, ", ",
    d.numero, ", ",
    d.piso,  ", ", 
    d.puerta, ", ",
    d.ciudad, ", ",
    d.CP, ", ",
    d.pais) AS direccion,
    p.telefono AS telefono,
    p.fax AS FAX,
    p.NIF AS NIF
FROM gafas g
JOIN proveedor p
	ON g.proveedor = p.id
JOIN direccion d
	ON p.Direccion_id = d.id
ORDER BY g.id;

/*
La política de compres de l'òptica es basa en que les ulleres d'una marca es compraran a un únic proveïdor 
(així en podrà treure més bons preus), però poden comprar ulleres de diverses marques a un proveïdor.  ---> per això la relació d'un a molts.
De les ulleres vol saber, la marca, la graduació de cadascun dels vidres, el tipus de muntura (flotant, pasta o metàl·lica), el color de la muntura,
el color de cada vidre i el preu.
Com tots els camps relacionats son NOT NULL faig servir JOIN per simplificar.
*/

SELECT 
	g.id AS Gafas,
    m.nombre AS Marca,
    g.graduacion_IZ,
    g.graduacio_DCH,
    tm.nombre AS Tipo_montura,
    g.color_montura AS Color_montura,
    g.color_vidrio_IZ,
    g.color_vidrio_DCH,
    g.precio AS Precio
FROM gafas g
JOIN tipo_montura tm
	ON g.tipo_montura = tm.id
JOIN proveedor p
	ON g.proveedor = p.id
JOIN marca m
	ON m.id = p.Marca_id
ORDER BY g.id;
 
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
	c.Nombre AS Cliente,
	COUNT(v.id) AS Total_facturas
FROM venta v
JOIN cliente c
	ON v.Cliente_id = c.id
WHERE v.fecha > '2022-02-01'
AND v.fecha < '2022-02-28'
GROUP BY c.id;
 
/*
Llista els diferents models d'ulleres que ha venut un empleat durant un any
*/ 
 
SELECT 
	m.nombre AS Gafas_modelo,
    e.nombre AS Empleado
FROM venta v
JOIN empleado e
	ON v.empleado = e.id
JOIN gafas g
	ON v.gafas = g.id
JOIN proveedor p
	ON g.proveedor = p.id
JOIN marca m
	ON p.Marca_id= m.id
WHERE e.id = 1
AND v.fecha > '2022-01-01'
AND v.fecha < '2022-12-31';
 
/*
Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
*/

SELECT p.nombre
FROM venta v
JOIN gafas g
	ON v.gafas=g.id
JOIN proveedor p
	ON g.proveedor = p.id
GROUP BY p.id;