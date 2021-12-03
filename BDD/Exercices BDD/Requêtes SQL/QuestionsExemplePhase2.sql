1. Rechercher le prénom des employés et le numéro de la région de leur
département. 
SELECT prenom, noregion
FROM employe
JOIN dept ON dept.noregion
WHERE employe.nodep = dept.nodept;


2. Rechercher le numéro du département, le nom du département, le
nom des employés classés par numéro de département (renommer les
tables utilisées). 
SELECT nodep AS "Numero département",dept.nom AS "Nom département", employe.nom AS "Nom employés"
FROM employe
JOIN dept ON employe.nodep = dept.nodept


3. Rechercher le nom des employés du département Distribution. 
SELECT employe.nom FROM employe
JOIN dept ON employe.nodep = dept.nodept
WHERE dept.nom = "distribution"


4.Rechercher le nom et le salaire des employés qui gagnent plus que
leur patron, et le nom et le salaire de leur patron.
SELECT E.nom AS "Nom de l'employé",
 E.salaire AS "Salaire de l'employé",
 P.nom AS "Nom du patron",
 P.salaire AS "Salaire du patron"	
FROM employe E
JOIN employe P
ON E.nosup= P.noemp
WHERE E.salaire > P.salaire


5.Rechercher le nom et le titre des employés qui ont le même titre que
Amartakaldire. 
SELECT E.nom AS "Nom de l'employe",
E.titre AS "Titre de l'employe",
A.titre AS "Titre de AMA"
FROM employe E
JOIN employe A
ON E.titre =A.titre
WHERE PAS FINI A FINIR PROBLEME CA MARCHE PAS ?????????????????????????