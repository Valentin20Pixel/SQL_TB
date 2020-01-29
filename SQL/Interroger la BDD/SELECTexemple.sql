-- Ex1 Aff ttes les infos des employé
USE exemple;
SELECT * FROM employe;
-- Ex2 Aff ttes les infos des depts
SELECT nodept,
nom,
noregion
FROM dept;
-- Ex3 Aff ce qui est demandé
SELECT nom,
dateemb,
nosup,
nodep,
salaire
FROM employe;
-- Ex4 Aff titre
SELECT titre FROM employe;
-- Ex5 Aff les differents titres
SELECT DISTINCT titre FROM employe;
-- Ex6 Aff nom et nodep des titre secretaire
USE exemple;
SELECT nom,
nodep
FROM employe
WHERE titre = "secrétaire";
-- Ex7 Aff les nom et nodep >40
SELECT nom,
nodep
FROM employe
WHERE nodep>40;
-- Ex8 Afficher le nom et le prénom des employés dont le nom est
-- alphabétiquement antérieur au prénom.
SELECT nom,
prenom
FROM employe
WHERE nom<prenom;
-- Ex9 Afficher le nom, le salaire et le numéro du département des employés
-- dont le titre est « Représentant », le numéro de département est 35 et
-- le salaire est supérieur à 20000.
SELECT nom,
nodep
FROM employe
WHERE titre="Représentant"
AND nodep=35
AND salaire>20000;
-- Ex10 Afficher le nom, le titre et le salaire des employés dont le titre est
-- « Représentant » ou dont le titre est « Président ».
SELECT nom,
titre,
salaire
FROM employe
WHERE titre="Représentant"
OR titre="Président";
-- Ex11 Afficher le nom, le titre, le numéro de département, le salaire des
-- employés du département 34, dont le titre est « Représentant » ou
-- « Secrétaire ».
SELECT nom,
titre,
nodep,
salaire
FROM employe
WHERE nodep=34
AND (titre="Représentant" OR titre="Secrétaire");
-- Ex12 Afficher le nom, le titre, le numéro de département, le salaire des
-- employés dont le titre est Représentant, ou dont le titre est Secrétaire
-- dans le département numéro 34.
SELECT nom,
titre,
nodep,
salaire
FROM employe
WHERE titre="Représentant"
OR (titre="Secrétaire" AND nodep=34);
-- Ex13 Afficher le nom, et le salaire des employés dont le salaire est compris
-- entre 20000 et 30000.  
SELECT nom,
salaire
FROM employe
WHERE salaire>20000
AND salaire<30000;
-- Ex14 Inexistant
-- Ex15 Afficher le nom des employés commençant par la lettre « H ». 
SELECT nom
FROM employe
WHERE nom LIKE "h%";
-- Ex16 Afficher le nom des employés se terminant par la lettre « n ». 
SELECT nom
FROM employe
WHERE nom LIKE "%n";
-- Ex17 Afficher le nom des employés contenant la lettre « u » en 3ème
-- position. 
SELECT nom
FROM employe
WHERE nom LIKE "__u%";
-- Ex18 Afficher le salaire et le nom des employés du service 41 classés par
-- salaire croissant
SELECT salaire,
nom
FROM employe
WHERE nodep=41
ORDER BY salaire;
-- Ex19 Afficher le salaire et le nom des employés du service 41 classés par
-- salaire décroissant. 
SELECT salaire,
nom
FROM employe
WHERE nodep=41
ORDER BY salaire DESC;
-- Ex20 Afficher le titre, le salaire et le nom des employés classés par titre
-- croissant et par salaire décroissant.
SELECT titre,
salaire,
nom
FROM employe
ORDER BY titre, salaire DESC;
-- Ex21 Afficher le taux de commission, le salaire et le nom des employés
-- classés par taux de commission croissante. 
SELECT tauxcom,
salaire,
nom
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom;
-- Ex22 Afficher le nom, le salaire, le taux de commission et le titre des
-- employés dont le taux de commission n'est pas renseigné. 
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NULL;
-- Ex23 Afficher le nom, le salaire, le taux de commission et le titre des
-- employés dont le taux de commission est renseigné.
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NOT NULL;
-- Ex24 Afficher le nom, le salaire, le taux de commission, le titre des
-- employés dont le taux de commission est inférieur à 15. 
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NOT NULL
AND tauxcom<15;
-- Ex25 Afficher le nom, le salaire, le taux de commission, le titre des
-- employés dont le taux de commission est supérieur à 15. 
SELECT nom,
salaire,
tauxcom,
titre
FROM employe
WHERE tauxcom IS NOT NULL
AND tauxcom>15;
-- Ex26 Afficher le nom, le salaire, le taux de commission et la commission des
-- employés dont le taux de commission n'est pas nul. (la commission
-- est calculée en multipliant le salaire par le taux de commission)
SELECT nom,
salaire,
tauxcom,
tauxcom*salaire/100 AS Commission
FROM employe
WHERE tauxcom IS NOT NULL;
-- Ex27 Afficher le nom, le salaire, le taux de commission, la commission des
-- employés dont le taux de commission n'est pas nul, classé par taux de
-- commission croissant. 
SELECT nom,
salaire,
tauxcom,
tauxcom*salaire/100 AS Commission
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY Commission ASC;
-- Ex28 Afficher le nom et le prénom (concaténés) des employés. Renommer
-- les colonnes
SELECT CONCAT(nom,prenom) AS "identité"
FROM employe;
-- Ex29 Afficher les 5 premières lettres du nom des employés. 
SELECT SUBSTRING(nom,1,5) AS "4 premiers lettre"
FROM employe;
-- Ex30 Afficher le nom et le rang de la lettre « r » dans le nom des
-- employés.
SELECT LOCATE ("r",nom) AS "rang de r",
nom
FROM employe
WHERE result IS NOT NULL;
-- Ex31 Afficher le nom, le nom en majuscule et le nom en minuscule de
-- l'employé dont le nom est Vrante.
SELECT nom, UPPER(nom)
FROM employe
WHERE UPPER(nom)='vrante';
-- Ex32 Afficher le nom et le nombre de caractères du nom des employés. 
SELECT nom,
LENGTH(nom)
FROM employe;