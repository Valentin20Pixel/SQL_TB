-- Ex1
USE exemple;
SELECT * FROM employe;
-- Ex2
SELECT nodept,
nom,
noregion
FROM dept;
-- Ex3
SELECT nom,
dateemb,
nosup,
nodep,
salaire
FROM employe;
-- Ex4
SELECT titre FROM employe;
-- Ex5
SELECT DISTINCT titre FROM employe;
-- Ex6
USE exemple;
SELECT nom,
nodep
FROM employe
WHERE titre = "secrétaire";
-- Ex7
SELECT nom,
nodep
FROM employe
WHERE nodep>40;
-- Ex8
SELECT nom,
prenom
FROM employe
WHERE nom<prenom;
-- Ex9
SELECT nom,
nodep
FROM employe
WHERE titre="Représentant"
AND nodep=35
AND salaire>20000;
-- Ex10
SELECT nom,
titre,
salaire
FROM employe
WHERE titre="Représentant"
OR titre="Président";
-- Ex11
SELECT nom,
titre,
nodep,
salaire
FROM employe
WHERE nodep=34
AND (titre="Représentant" OR titre="Secrétaire");
-- Ex12
SELECT nom,
titre,
nodep,
salaire
FROM employe
WHERE titre="Représentant"
OR (titre="Secrétaire" AND nodep=34);
-- Ex13
SELECT nom,
salaire
FROM employe
WHERE salaire>20000
AND salaire<30000;
-- Ex14 Inexistant
-- Ex15
SELECT nom
FROM employe
WHERE nom LIKE "h%";
-- Ex16
SELECT nom
FROM employe
WHERE nom LIKE "%n";
-- Ex17
SELECT nom
FROM employe
WHERE nom LIKE "__u%";
-- Ex18
SELECT salaire,
nom
FROM employe
WHERE nodep=41
ORDER BY salaire;
-- Ex19
SELECT salaire,
nom
FROM employe
WHERE nodep=41
ORDER BY salaire DESC;
-- Ex20
SELECT titre,
salaire,
nom
FROM employe
ORDER BY titre, salaire DESC;
-- Ex21
SELECT tauxcom,
salaire,
nom
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom;
-- Ex22
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NULL;
-- Ex23
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NOT NULL;
-- Ex24
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NOT NULL
AND tauxcom<15;
-- Ex25
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NOT NULL
AND tauxcom>15;
-- Ex26
SELECT nom,
salaire,
tauxcom,
tauxcom*salaire/100 AS Commission
FROM employe
WHERE tauxcom IS NOT NULL;