USE pizzeria;

/*
Introduccion de datos en base de datos para ejemplo
*/

INSERT INTO provincia
VALUES 	(DEFAULT, 'Barcelona'),
		(DEFAULT, 'Girona');
        
INSERT INTO localidad
VALUES 	(DEFAULT, 'Barcelono', 1),
		(DEFAULT, 'Badalona', 1),
		(DEFAULT, 'Sant Celoni', 1), 
		(DEFAULT, 'Lloret de Mar', 2);
        
INSERT INTO client
VALUES 	(DEFAULT, 'Maria', 'Lopez', 'Calle Pablo III, 152', '08001', '111121314', 1),
		(DEFAULT, 'Pablo', 'Martinez', 'Calle Caceres, 215',  '08003', '222121314', 2),
        (DEFAULT, 'Andres', 'Vilarrubies', 'Calle Pau Casals, 47', '08470',  '33321314', 3),
        (DEFAULT, 'Silvia', 'Pascual', 'Avenida Republica, 6, 10, 1', '27100', '444158894', 4);
     
INSERT INTO Tipo_de_pedido
VALUES 	(DEFAULT, 'Recogida tienda'),
		(DEFAULT, 'Entrega Domicilio');    
     
INSERT INTO Posiciones
VALUES 	(DEFAULT, 'Cocinero'),
		(DEFAULT, 'Repartidor');
        
INSERT INTO tienda
VALUES 	(DEFAULT, 'Calle La font, 42', 08002, 1),
		(DEFAULT, 'Avenida Republica, 71', 08100, 2);
    
INSERT INTO Empleado
VALUES 	(DEFAULT, 'Cristina', 'Revilla', '00000015E', 1, 1),
		(DEFAULT, 'Manel', 'Moliner', '88888894T', 1, 2),
        (DEFAULT, 'Sigrid', 'Lopez', '55555698F', 2, 1),
        (DEFAULT, 'Laura', 'Sanchez', '66666578G', 2, 2);
     
INSERT INTO pedidos
VALUES 	(DEFAULT, 1, '2022-01-15 22:05:00', 2, 0.00, 1, NULL, 1),
		(DEFAULT, 2, '2022-01-15 22:15:00', 3, 0.00, 2, '2022-01-15 22:45:00', 2),
		(DEFAULT, 3, '2022-01-16 21:15:00', 4, 0.00, 2, '2022-01-15 21:45:00', 1);
        
INSERT INTO Categoria
VALUES 	(DEFAULT, 'Vegetariano'),
		(DEFAULT, 'No Vegetariano');

INSERT INTO Clase_producto
VALUES 	(DEFAULT, 'Hambuerguesa'),
		(DEFAULT, 'Pizza'),
		(DEFAULT, 'Bebida');            
        
INSERT INTO Productos
VALUES 	(DEFAULT, 'Hambuerguesa Completa', 'Hambuegursa ternera, lechuga, queso, huevo', NULL, 7.50, NULL, 1),
		(DEFAULT, 'Pizza campestre', 'Pizza, queso, tomate, calabacin, champinones, pimiento', NULL, 6.50, 1, 2),
        (DEFAULT, 'Pizza jamon', 'Pizza, queso, tomate, jamon', NULL, 6.75, 2, 2),  
        (DEFAULT, 'Coca_cola', 'Coca_cola Zero', NULL, 2.50, NULL, 3);
        
INSERT INTO Lineas_pedido
VALUES 	(DEFAULT, 3, 0.00, 1, 1),
		(DEFAULT, 2, 0.00, 1, 4),
        (DEFAULT, 2, 0.00, 2, 2),
        (DEFAULT, 1, 0.00, 2, 3),
        (DEFAULT, 2, 0.00, 3, 1),
		(DEFAULT, 3, 0.00, 3, 2),
        (DEFAULT, 5, 0.00, 3, 4);
        
/*Llista quants productes de categoria 'Begudas' s'han venut en una determinada localitat
*/

SELECT lp.Cantidad_linea AS Total_Producto, lo.nombre, cp.Tipo_producto
FROM clase_producto cp
JOIN Productos pr
	ON cp.id = Clase_producto_id
JOIN Lineas_pedido lp
	ON lp.Articulos_id = pr.id
JOIN pedidos pe
	ON pe.id = lp.pedidos_id
JOIN client cl
	ON cl.id = pe.client_id
JOIN localidad lo
	ON lo.id = cl.localidad_id
WHERE cp.Tipo_producto = 'Bebida'
GROUP BY lo.nombre;


/*
Llista quantes comandes ha efectuat un determinat empleat
*/

SELECT COUNT(p.id) AS Total_Pedidos, e.nombre AS Empleado
FROM Empleado e
JOIN tienda t
	ON e.tienda_id = t.id
JOIN pedidos p
	ON t.id = p.tienda_id
WHERE e.nombre = 'Cristina';
