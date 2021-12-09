--1. Rechercher le prénom des employés et le numéro de la région de leur
département. 
SELECT prenom, noregion
FROM employe
JOIN dept ON dept.noregion
WHERE employe.nodep = dept.nodept;


--2. Rechercher le numéro du département, le nom du département, le
nom des employés classés par numéro de département (renommer les
tables utilisées). 
SELECT nodep AS "Numero département",dept.nom AS "Nom département", employe.nom AS "Nom employés"
FROM employe
JOIN dept ON employe.nodep = dept.nodept


--3. Rechercher le nom des employés du département Distribution. 
SELECT employe.nom FROM employe
JOIN dept ON employe.nodep = dept.nodept
WHERE dept.nom = "distribution"


--4.Rechercher le nom et le salaire des employés qui gagnent plus que
leur patron, et le nom et le salaire de leur patron.
SELECT E.nom AS "Nom de l'employé",
 E.salaire AS "Salaire de l'employé",
 P.nom AS "Nom du patron",
 P.salaire AS "Salaire du patron"	
FROM employe E
JOIN employe P
ON E.nosup= P.noemp
WHERE E.salaire > P.salaire


--5.Rechercher le nom et le titre des employés qui ont le même titre que
Amartakaldire. 
SELECT nom, titre FROM employe WHERE titre=(SELECT titre FROM employe WHERE nom='Amartakaldire')
ORDER BY nodep, salaire ASC


--6.Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus quun seul employé du département 31,
classés par numéro de département et salaire.
SELECT nom, salaire, nodep FROM employe 
WHERE salaire > ANY(SELECT salaire FROM employe WHERE nodep=31) 
ORDER BY nodep, salaire ASC;


--7. Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus que tous les employés du département 31,
classés par numéro de département et salaire.
SELECT nom, salaire, nodep FROM employe 
WHERE salaire > ALL (SELECT salaire FROM employe WHERE nodep=31) 
ORDER BY nodep, salaire ASC;


--8. Rechercher le nom et le titre des employés du service 31 qui ont un
titre que lon trouve dans le département 32.
SELECT nom, titre FROM employe WHERE nodep=31 AND titre IN (SELECT titre 
FROM employe WHERE nodep=32); 


--9.Rechercher le nom et le titre des employés du service 31 qui ont un
titre lon ne trouve pas dans le département 32.
SELECT nom, titre FROM employe WHERE nodep=31 AND titre NOT IN (SELECT titre 
FROM employe 
WHERE nodep=32); 


--10. Rechercher le nom, le titre et le salaire des employés qui ont le même
titre et le même salaire que Fairant. 
SELECT nom, titre, salaire FROM employe WHERE titre=(SELECT titre 
FROM employe WHERE nom='Fairent') AND salaire=(SELECT salaire 
FROM employe WHERE nom='Fairent');
--------------------------------------------------------------

--11.Rechercher le numéro de département, le nom du département, le nom des employés, en affichant aussi les départements dans lesquels il n'y a personne, classés par numéro de département. 
SELECT dept.nodept AS Département_numéro, dept.nom AS Département_nom, employe.nom AS Employé_nom 
FROM dept
JOIN employe
ON employe.nodep IN (dept.nodept) OR employe.nodep NOT IN (dept.nodept);


--12.Calculer le nombre d'employés de chaque titre.
SELECT titre, COUNT(*) AS Nombre_employe FROM employe GROUP BY titre;


--13.Calculer la moyenne des salaires et leur somme, par région.
SELECT AVG(salaire) AS Moyenne_salaire, noregion AS Région_numéro 
FROM employe
JOIN dept
ON employe.nodep=dept.nodept
GROUP BY noregion;


--14. Afficher les numéros des départements ayant au moins 3 employés.
SELECT nodep AS Numéro_département, COUNT(*) AS Nombre_employé FROM employe GROUP BY nodep HAVING COUNT(*)>=3;


--15. Afficher les lettres qui sont l'initiale d'au moins trois employés.
SELECT SUBSTRING(nom, 1, 1) AS Initiale, COUNT(*) AS Nombre_initiale FROM employe GROUP BY Initiale HAVING COUNT(Initiale)>=3;


--16. Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l'écart entre les deux.
SELECT MAX(salaire) AS Salaire_max, MIN(salaire) AS Salaire_min, (MAX(salaire)-MIN(salaire)) AS Ecart FROM employe;


--17. Rechercher le nombre de titres différents.
SELECT COUNT(DISTINCT titre) FROM employe;

--18. Pour chaque titre, compter le nombre d'employés possédant ce titre.
SELECT titre, COUNT(*) AS Nombre_employe FROM employe GROUP BY titre;

--19. Pour chaque nom de département, afficher le nom du département et le nombre d'employés.
SELECT dept.nom AS Département, COUNT(employe.nom) AS Nombre_employé 
FROM dept 
JOIN employe 
ON employe.nodep=dept.nodept 
GROUP BY dept.nom;


--20. Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants.
SELECT titre, AVG(salaire) AS Salaire_moyenne FROM employe GROUP BY titre HAVING AVG(salaire) > (SELECT AVG(salaire) FROM employe WHERE titre='représentant');


--21.Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés. 
SELECT COUNT(DISTINCT salaire) AS Nombre_salaire, COUNT(DISTINCT tauxcom) AS Nombre_taux_commission FROM employe; 
