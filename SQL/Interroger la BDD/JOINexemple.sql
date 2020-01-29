-- Jointure
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
nom AS "Nom de l'employé"
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
-- Exemple4 Rechercher le nom et le salaire des employés qui gagnent plus que
-- leur patron, et le nom et le salaire de leur patron. 
SELECT salaire , nom
FROM employe AS employeSup
JOIN 