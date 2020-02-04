-- Jointure
/*****************************************************************************/
-- Exemple1 Rechercher le prénom des employés et le numéro de la région de leur
-- département. 
SELECT prenom, noregion
FROM employe 
JOIN dept ON employe.nodep = dept.nodept;
-- Exemple2 Rechercher le numéro du département, le nom du département, le
-- nom des employés classés par numéro de département (renommer les
-- tables utilisées). 
SELECT nodept AS "Numéro de département",
nomdep AS "Nom du département",
nom AS "Nom de lemployé"
FROM dept
JOIN employe
ON dept.nodept = employe.nodep
ORDER BY nodept;
-- Exemple3 Rechercher le nom des employés du département Distribution. 
SELECT nom AS "Nom des employé de la distribition"
FROM employe
JOIN dept
ON dept.nodept = employe.nodep
WHERE nomdep = "distribution";
-- Auto Jointure
/*****************************************************************************/
-- Exemple4 Rechercher le nom et le salaire des employés qui gagnent plus que
-- leur patron, et le nom et le salaire de leur patron. 
SELECT T1.nom AS "Nom employé",
T1.salaire AS "Salaire employé",
T2.nom AS "Nom patron",
T2.salaire AS "Salaire patron"
FROM employe AS T1
JOIN employe AS T2
ON T1.nosup = T2.noemp
WHERE T1.salaire>T2.salaire;
-- Sous Requete
/*****************************************************************************/
-- Exemple5 Rechercher le nom et le titre des employés qui ont le même titre que
-- Amartakaldire. 
SELECT nom,
titre
FROM employe
WHERE titre IN (SELECT titre FROM employe WHERE nom="amartakaldire")
AND nom!="amartakaldire";
-- Exemple6 Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus qu'un seul employé du département 31,
-- classés par numéro de département et salaire. 
SELECT nom,
salaire,
nodep
FROM employe
WHERE salaire > ANY (SELECT salaire FROM employe WHERE nodep=31)
ORDER BY salaire ASC, nodep ASC;
-- Exemple7 Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus que tous les employés du département 31,
-- classés par numéro de département et salaire. 
SELECT nom,
salaire,
nodep
FROM employe
WHERE salaire > ALL (SELECT salaire FROM employe WHERE nodep=31)
ORDER BY salaire ASC, nodep ASC;
-- Exemple8 Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre que l'on trouve dans le département 32. 
SELECT nom,
titre
FROM employe
WHERE nodep=31
AND titre =ANY (SELECT titre FROM employe WHERE nodep=32);
-- Exemple9 Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre l'on ne trouve pas dans le département 32. 
SELECT nom,
titre
FROM employe
WHERE nodep=31
AND titre !=ALL (SELECT titre FROM employe WHERE nodep=32);
-- Exemple10 Rechercher le nom, le titre et le salaire des employés qui ont le même
-- titre et le même salaire que Fairant.
SELECT nom,
titre,
salaire
FROM employe
WHERE titre IN (SELECT titre FROM employe WHERE nom="fairent")
AND salaire IN (SELECT salaire FROM employe WHERE nom="fairent")
AND nom!="fairent";
-- Requetes Externes
/*****************************************************************************/
-- Exemple11 Rechercher le numéro de département, le nom du département, le
-- nom des employés, en affichant aussi les départements dans lesquels
-- il n'y a personne, classés par numéro de département. 
SELECT T1.nodept,
T1.nomdep,
T2.nom
FROM dept AS T1
LEFT JOIN employe AS T2
ON T2.nodep=T1.nodept
ORDER BY nodept;
/*****************************************************************************/
-- Les Groupes
/*****************************************************************************/
-- Ex1. Calculer le nombre d'employés de chaque titre. 
SELECT titre, COUNT(nom)
FROM employe
GROUP BY titre;
-- Ex2. Calculer la moyenne des salaires et leur somme, par région.
SELECT 
dept.noregion AS "Numéro région",
AVG(salaire) AS "Moyenne",
SUM(salaire) AS "Somme"
FROM employe
JOIN dept ON employe.nodep=dept.nodept
GROUP BY noregion;
/*****************************************************************************/
-- La clause HAVING
/*****************************************************************************/
-- Ex3. Afficher les numéros des départements ayant au moins 3 employés. 
SELECT nodep AS "Num de Dépt", 
COUNT(nodep) AS "Nbres de Dept"
FROM employe
GROUP BY nodep
HAVING COUNT(*) >=3;
-- Ex4. Afficher les lettres qui sont l'initiale d'au moins trois employés. 
SELECT SUBSTRING(nom,1,1) AS Initial,
COUNT(SUBSTRING(nom,1,1)) AS Nbres
FROM employe
GROUP BY Initial
HAVING Nbres>2;
-- Ex5. Rechercher le salaire maximum et le salaire minimum parmi tous les
-- salariés et l'écart entre les deux.
SELECT MAX(salaire) AS SalaireMax,
MAX(salaire) - MIN(salaire) AS Ecart,
MIN(salaire) AS SalaireMin
FROM employe;
-- Ex6. Rechercher le nombre de titres différents. 
SELECT COUNT(DISTINCT(titre)) AS "Nbres de titres"
FROM employe;
-- Ex7. Pour chaque titre, compter le nombre d'employés possédant ce titre. 
SELECT DISTINCT titre,
COUNT(nom) AS "Nbres d'employé"
FROM employe
GROUP BY titre;
-- 8. Pour chaque nom de département, afficher le nom du département et
-- le nombre d'employés
SELECT DISTINCT dept.nomdep AS Nomdept,
COUNT(employe.nom) AS NbresEmpl
FROM employe
JOIN dept ON dept.nodept=employe.nodep
GROUP BY dept.nomdep;
-- Ex9. Rechercher les titres et la moyenne des salaires par titre dont la
-- moyenne est supérieure à la moyenne des salaires des Représentants.
SELECT titre,
AVG(salaire) AS SalaireMoy
FROM employe
GROUP BY titre
HAVING AVG(salaire)>(
    SELECT AVG(salaire)
    FROM employe
    WHERE titre="représentant"
    );
-- Ex10.Rechercher le nombre de salaires renseignés et le nombre de taux de
-- commission renseignés.
SELECT COUNT(DISTINCT salaire) AS NbreSalaire,
COUNT(DISTINCT tauxcom) AS NbreTaux
FROM employe;