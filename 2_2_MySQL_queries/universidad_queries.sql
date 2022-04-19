

---- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.

SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona ORDER BY fecha_nacimiento ASC, apellido1, apellido2, nombre;

--Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.

SELECT apellido1, apellido2, nombre, telefono FROM persona WHERE telefono IS NULL;

-- Retorna el llistat dels alumnes que van néixer en 1999.

SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE fecha_nacimiento LIKE '1999%';


-- Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.

SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.nif FROM persona JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.telefono IS NULL AND persona.nif LIKE '%K';

-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre FROM asignatura WHERE curso = 3 AND cuatrimestre = 1;

-- Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de -- Retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.

SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.ida.apellido1, persona.apellido2, persona.nombre;

-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.


-- Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT departamento.nombre FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor RIGHT JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre LIKE 'Grado en Ingeniería Informática (Plan 2015)';

-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.

SELECT DISTINCT persona.nombre AS "Estudiants matriculats 18/19" FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 18 AND curso_escolar.anyo_fin = 19;


-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.


-- Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de -- Retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

-- Retorna un llistat amb els professors que no estan associats a un departament.

-- Retorna un llistat amb els departaments que no tenen professors associats.

-- Retorna un llistat amb els professors que no imparteixen cap assignatura.

-- Retorna un llistat amb les assignatures que no tenen un professor assignat.

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

--Consultes resum:

-- Retorna el nombre total d'alumnes que hi ha.

SELECT SUM(tipo = 'alumno') AS "Total amount of students" FROM persona;

-- Calcula quants alumnes van néixer en 1999.
SELECT COUNT(nombre) AS 'Students born in 1999' FROM persona WHERE fecha_nacimiento LIKE '1999%';

-- Calcula quants professors hi ha en cada departament. Ha de mostrar dues columnes: nom del departament, i el nombre de professors que hi ha en aquest departament. El resultat només els departaments amb professors associats. Ordenat de major a menor pel nombre de professors.
SELECT departamento.nombre, COUNT(persona.nombre) AS "Employed Professors" FROM profesor INNER JOIN departamento ON departamento.id = profesor.id_departamento INNER JOIN persona ON persona.id = profesor.id_profesor GROUP BY departamento.nombre ORDER BY COUNT(persona.nombre) DESC;
-- Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.

-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.

-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.

-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.


-- Retorna totes les dades de l'alumne més jove.
SELECT * FROM persona ORDER BY fecha_nacimiento DESC LIMIT 1;

-- Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.