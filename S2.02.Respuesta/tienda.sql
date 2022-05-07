use tienda;

/*
1.- Llista el nom de tots els productos que hi ha en la taula producto.
*/

SELECT nombre
FROM producto;

/*
2.- Llista els noms i els preus de tots els productos de la taula producto.
*/

SELECT nombre, precio
FROM producto;

/*
3.- Llista totes les columnes de la taula producto.
*/

SELECT *
FROM producto;

/*
4.-Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD)
*/

SELECT nombre, precio , precio*1.06 
FROM producto;

/*
5.-Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). 
Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
*/

SELECT nombre, precio AS euros, precio*1.06 AS dolares
FROM producto;

/*
6.-Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
*/

SELECT UPPER(nombre), precio
FROM producto;

/*
7.-Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
*/

SELECT LOWER(nombre), precio
FROM producto;

/*
8.-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant
*/

SELECT nombre, UPPER(LEFT(nombre,2))
FROM fabricante;

/*
9.-Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
*/

SELECT nombre, ROUND(precio, 1)
FROM producto;

/*
10.-Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
*/

SELECT nombre, truncate(precio, 0)
FROM producto;

/*
11.- Llista el codi dels fabricants que tenen productos en la taula producto.
*/

SELECT f.nombre
FROM producto p
JOIN fabricante f
	ON f.codigo = p.codigo_fabricante;

/*
12.-Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
*/

SELECT distinct f.nombre
FROM producto p
JOIN fabricante f
	ON f.codigo = p.codigo_fabricante;
    
/*
13.-Llista els noms dels fabricants ordenats de manera ascendent.
(no fa falta especificar ASC perque pe rdefecte ja ho fa)
*/

SELECT nombre
FROM fabricante
ORDER BY nombre;

/*
14.-Llista els noms dels fabricants ordenats de manera descendent.
*/

SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

/*
15.-Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
*/

SELECT nombre, precio
FROM producto
ORDER BY nombre ASC, precio DESC;

/*
16.- Retorna una llista amb les 5 primeres files de la taula fabricante.
*/

SELECT *
FROM fabricante
LIMIT 5;

/*
17.- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
*/

SELECT *
FROM fabricante
LIMIT 3, 2;

/*
18.-Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
*/

SELECT nombre, MIN(precio)
FROM producto;

/*
19.- Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
*/

SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

/*
20.-Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
*/

SELECT nombre
FROM producto
WHERE codigo_fabricante = 2; 

/*
21.-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
*/

SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;
    
/*
22.-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. 
Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
*/

SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre;

/*
23.- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
*/

SELECT p.codigo AS codigo_Producto, p.nombre,f.codigo AS codigo_Fabricante, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;
    
/*
24.-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
*/

SELECT p.nombre, MIN(p.precio), f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;
    
/*
25.- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
*/

SELECT p.nombre, MAX(p.precio), f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;
    
/*
26.- Retorna una llista de tots els productes del fabricador Lenovo.
*/

SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

/*
27.- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
*/

SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial'
AND p.precio > 200;

/*
28.-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
*/

SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'ASUS' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

/*
29.- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
*/

SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('ASUS', 'Hewlett-Packard','Seagate');

/*
30.- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
*/

SELECT p.nombre, p.precio
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%e';

/*
31.- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
*/

SELECT p.nombre, p.precio
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

/*
32.- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. 
Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
*/

SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180 
ORDER BY p.precio DESC, p.nombre ASC;

/*
33.-Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
*/

SELECT distinct(f.codigo), f.nombre
FROM fabricante f
JOIN producto p
	ON f.codigo = p. codigo_fabricante;

/*
34.- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. 
El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
*/

SELECT f.codigo, f.nombre, p.nombre
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante;

/*
35.-Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
*/

SELECT f.codigo, f.nombre, p.nombre
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE p.nombre IS NULL;

/*
36.- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
*/

SELECT f.codigo, f.nombre, p.nombre
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE f.nombre = 'Lenovo';

/*
37.- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
*/

SELECT *
FROM producto
WHERE precio = (
SELECT MAX(p.precio)
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE f.nombre = 'Lenovo');

/*
38.-Llista el nom del producte més car del fabricador Lenovo.
*/

SELECT p.nombre
FROM producto p
WHERE p.precio = (
SELECT MAX(p.precio)
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE f.nombre = 'Lenovo');

/*
39.- Llista el nom del producte més barat del fabricant Hewlett-Packard.
*/

SELECT p.nombre
FROM producto p
WHERE p.precio = (
SELECT MIN(p.precio)
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE f.nombre = 'Hewlett-Packard');


/*
40.-Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
*/

SELECT p.nombre
FROM producto p
WHERE p.precio >= (
SELECT MAX(p.precio)
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE f.nombre = 'Lenovo');

/*
41.- Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
*/

SELECT p.codigo, p.nombre, p.precio
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE f.nombre = 'Asus'
AND p.precio > (
SELECT AVG(p.precio)
FROM fabricante f
LEFT JOIN producto p
	ON f.codigo = p. codigo_fabricante
WHERE f.nombre = 'Asus');

