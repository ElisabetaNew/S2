use universidad;

/*
1.- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. 
El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
*/

SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY 1, 2, 3;

/*
2.-Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
*/

SELECT nombre, apellido1, apellido2
FROM persona 
WHERE tipo = 'alumno'
AND telefono IS NULL;

/*
3.-Retorna el llistat dels alumnes que van néixer en 1999.
*/

SELECT nombre, apellido1, apellido2 
FROM persona 
WHERE tipo = 'alumno' 
AND YEAR(fecha_nacimiento) = '1999';

/*
4.- Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
*/

SELECT nombre, apellido1, apellido2, nif
FROM persona 
WHERE tipo = 'profesor'
AND telefono IS NULL
AND nif LIKE '%K';

/*
5..-Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
*/

SELECT *
FROM asignatura
WHERE cuatrimestre = 1
AND curso = 3
AND id_grado = 7;

/*
6.- Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats.
El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
*/

SELECT pe.apellido1, pe.apellido2, pe.nombre, de.nombre
FROM persona pe
JOIN profesor pr
	ON pr.id_profesor = pe.id
JOIN departamento de
	ON pr.id_departamento = de.id
ORDER BY 1, 2, 3;

/*
7.- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
*/

SELECT a.nombre, c.anyo_inicio, c.anyo_fin
FROM asignatura a
JOIN alumno_se_matricula_asignatura am
	ON am.id_asignatura = a.id
JOIN curso_escolar c
	ON am.id_curso_escolar = c.id
JOIN persona pe
	ON pe.id = am.id_alumno
WHERE pe.nif = '26902806M';

/*
8.- Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
*/

SELECT de.nombre
FROM departamento de
JOIN profesor pr
	ON de.id = pr.id_departamento
JOIN asignatura a
	ON a.id_profesor = pr.id_profesor
JOIN grado g
	ON g.id = a.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
GROUP BY 1;

/*
9.- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
*/

SELECT pe.nombre, pe.apellido1, pe.apellido2
FROM persona pe
JOIN alumno_se_matricula_asignatura am
	ON am.id_alumno = pe.id
JOIN curso_escolar c
	ON c.id = am.id_curso_escolar
WHERE c.anyo_inicio = 2018
AND c.anyo_fin = 2019
GROUP BY 1, 2, 3;

/*
Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
*/

/*
1.- Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. 
El llistat també ha de mostrar aquells professors que no tenen cap departament associat. (Todos los profesores tiene departamento asociado pero si no apareceian en el listado)
El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. 
El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
*/

SELECT de.nombre, pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe
LEFT JOIN profesor pr
	ON pe.id = pr.id_profesor
LEFT JOIN departamento de
	ON de.id = pr.id_departamento
WHERE pe.tipo = 'profesor'	
ORDER BY 1, 2, 3, 4;

/*
2.- Retorna un llistat amb els professors que no estan associats a un departament.
(tots tenen un departament associat, per aixo el llistat es sense dades de retorn)
*/

SELECT de.nombre, pe.apellido1, pe.apellido2, pe.nombre
FROM profesor pr
LEFT JOIN departamento de
	ON de.id = pr.id_departamento
LEFT JOIN persona pe
	ON pe.id = pr.id_profesor
WHERE pr.id_departamento IS NULL
ORDER BY 1, 2, 3, 4;

/*
3.- Retorna un llistat amb els departaments que no tenen professors associats.
*/

SELECT de.nombre, pe.apellido1, pe.apellido2, pe.nombre
FROM profesor pr
RIGHT JOIN departamento de
	ON de.id = pr.id_departamento
LEFT JOIN persona pe
	ON pe.id = pr.id_profesor
WHERE pr.id_departamento IS NULL
ORDER BY 1, 2, 3, 4;

/*
4.- Retorna un llistat amb els professors que no imparteixen cap assignatura.
*/

SELECT pe.apellido1, pe.apellido2, pe.nombre, a.id AS asignatura
FROM profesor pr
LEFT JOIN asignatura a
	ON a.id_profesor = pr.id_profesor
LEFT JOIN persona pe
	ON pe.id = pr.id_profesor
WHERE a.id IS NULL
ORDER BY 1, 2, 3;

/*
5.- Retorna un llistat amb les assignatures que no tenen un professor assignat.
*/

SELECT a.nombre, a.id_profesor
FROM profesor pr
RIGHT JOIN asignatura a
	ON a.id_profesor = pr.id_profesor
WHERE a.id_profesor IS NULL
ORDER BY 1, 2;

/*
6.-Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
*/

SELECT de.nombre, a.nombre, pr.id_departamento 
FROM departamento de
LEFT JOIN profesor pr
	ON de.id = pr.id_departamento
LEFT JOIN asignatura a
	ON pr.id_profesor = a.id_profesor
WHERE a.nombre IS NULL
GROUP BY 1
ORDER BY 1;

/*
Consultes resum:
*/

/*
1.-Retorna el nombre total d'alumnes que hi ha.
*/

SELECT count(id)
FROM persona
WHERE tipo = 'alumno';

/*
2.- Calcula quants alumnes van néixer en 1999.
*/

SELECT count(id)
FROM persona
WHERE tipo = 'alumno'
AND YEAR(fecha_nacimiento) = '1999';

/*
3.-Calcula quants professors hi ha en cada departament. 
El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. 
El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
*/

SELECT de.nombre, COUNT(pe.id)
FROM departamento de
JOIN profesor pr
	ON pr.id_departamento = de.id
JOIN persona pe
	ON pr.id_profesor = pe.id
GROUP BY de.nombre
ORDER BY 2 DESC;

/*
4.- Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. 
Tingui en compte que poden existir departaments que no tenen professors associats. 
Aquests departaments també han d'aparèixer en el llistat.
*/

SELECT de.nombre, COUNT(pe.id)
FROM departamento de
LEFT JOIN profesor pr
	ON pr.id_departamento = de.id
LEFT JOIN persona pe
	ON pr.id_profesor = pe.id
GROUP BY de.nombre
ORDER BY 2 DESC;

/*
5.-Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures 
que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. 
Aquests graus també han d'aparèixer en el llistat. 
El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
*/

SELECT gr.nombre, count(a.id)
FROM grado gr
LEFT JOIN asignatura a
	ON gr.id = a.id_grado
GROUP BY gr.nombre
ORDER BY 2 DESC;

/*
6.- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures
que té cadascun, dels graus que tinguin més de 40 assignatures associades.
*/

SELECT gr.nombre, COUNT(a.id)
FROM grado gr
LEFT JOIN asignatura a
	ON gr.id = a.id_grado
GROUP BY gr.nombre
HAVING COUNT(a.id)>40
ORDER BY 2 DESC;

/*
7.- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha 
per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura 
i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
*/

SELECT gr.nombre, a.tipo, SUM(a.creditos) AS total_creditos_segun_tipo
FROM grado gr
LEFT JOIN asignatura a
	ON gr.id = a.id_grado
GROUP BY gr.nombre, a.tipo
ORDER BY 1, 2;

/*
8.- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun 
dels cursos escolars. 
El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre
d'alumnes matriculats.
*/

SELECT ce.anyo_inicio AS Inicio, COUNT(DISTINCT(am.id_alumno))
FROM alumno_se_matricula_asignatura am
JOIN curso_escolar ce
	ON ce.id = am.id_curso_escolar
GROUP BY 1;

/*
9.- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. 
El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. 
El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. 
El resultat estarà ordenat de major a menor pel nombre d'assignatures.
*/

SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, count(a.id)
FROM asignatura a
RIGHT JOIN persona pe
	ON a.id_profesor = pe.id
WHERE pe.tipo = 'profesor'
GROUP BY 1
ORDER BY 5 DESC;

/*
10.- Retorna totes les dades de l'alumne més jove.
*/

SELECT *
FROM persona
WHERE tipo = 'alumno'
HAVING YEAR(fecha_nacimiento) = MIN(YEAR(fecha_nacimiento));

/*
11.- Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.
*/

SELECT pe.nombre
FROM profesor pr
LEFT JOIN asignatura a
	ON a.id_profesor = pr.id_profesor
JOIN persona pe
	ON pe.id = pr.id_profesor
WHERE pr.id_departamento IS NOT NULL
AND a.id IS NULL;