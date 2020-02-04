-- Lot 1


-- Ex1 - Afficher la liste des hôtels. 
SELECT hot_nom,
hot_ville
FROM hotel;

-- Ex2 - Afficher la ville de résidence de Mr White.
SELECT cli_nom,
cli_prenom,
cli_adresse,
cli_ville
FROM client
WHERE cli_nom="White";

-- Ex3 - Afficher la liste des stations dont l’altitude < 1000
SELECT sta_nom,
sta_altitude
FROM station
WHERE sta_altitude>1000;

-- Ex4 - Afficher la liste des chambres ayant une capacité > 1
SELECT cha_numero,
cha_capacite
FROM chambre
WHERE cha_capacite>1;

-- Ex5 - Afficher les clients n’habitant pas à Londre
SELECT cli_nom,
cli_ville
FROM client
WHERE cli_ville!="Londre";

-- Ex6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3
SELECT hot_nom,
hot_ville,
hot_categorie
FROM hotel
WHERE hot_ville="Bretou"
AND hot_categorie>3;


/*******************************************************************************/


-- Lot 2


-- Ex7 - Afficher la liste des hôtels avec leur station
SELECT sta_nom,
hot_nom,
hot_categorie,
hot_ville
FROM station
JOIN hotel
ON sta_id=hot_sta_id;

-- Ex8 - Afficher la liste des chambres et leur hôtel
SELECT hot_nom,
hot_categorie,
hot_ville,
cha_numero
FROM hotel
JOIN chambre
ON cha_hot_id=hot_id;

-- Ex9 - Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou 
SELECT hot_nom,
hot_categorie,
hot_ville,
cha_numero,
cha_capacite
FROM hotel
JOIN chambre
ON cha_hot_id=hot_id
WHERE cha_capacite>1
AND hot_ville="Bretou";

-- Ex10 - Afficher la liste des réservations avec le nom des clients
SELECT DISTINCT cli_nom,
hot_nom,
res_date
FROM client
JOIN reservation
ON cli_id=res_cli_id
JOIN chambre
ON res_cha_id=cha_hot_id
JOIN hotel
ON cha_hot_id=hot_id;

-- Ex11 - Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station
SELECT DISTINCT cha_numero,
sta_nom,
hot_nom,
cha_capacite
FROM station
JOIN hotel
ON sta_id=hot_sta_id
JOIN chambre
ON hot_id=cha_hot_id;

-- Ex12 - Afficher les réservations avec le nom du client et le nom de l’hôtel
SELECT cli_nom AS "Nom de l'hotel",
hot_nom AS "Nom de l'hotel",
res_date_debut AS "Début de la réservations",
DATEDIFF(res_date_fin,res_date_debut) AS "Durée du séjour"
FROM client
JOIN reservation
ON cli_id=res_cli_id
JOIN chambre
ON res_cha_id=cha_id
JOIN hotel
ON cha_hot_id=hot_id;


/*******************************************************************************/


-- Lot 3


-- Ex13 - Compter le nombre d’hôtel par station
SELECT sta_nom AS Station,
COUNT(hot_id) AS "Nbres d'hotel"
FROM hotel
JOIN station
ON hot_sta_id=sta_id
GROUP BY hot_sta_id;

-- Ex14 - Compter le nombre de chambre par station
SELECT sta_nom AS Station,
COUNT(cha_id) AS "Nbres de chambre"
FROM chambre
JOIN hotel
ON cha_hot_id=hot_id
JOIN station
ON hot_sta_id=sta_id
GROUP BY sta_nom;

-- Ex15 - Compter le nombre de chambre par station ayant une capacité > 1
SELECT sta_nom AS Station,
COUNT(cha_id) AS "Nbres de chambre"
FROM chambre
JOIN hotel
ON cha_hot_id=hot_id
JOIN station
ON hot_sta_id=sta_id
WHERE cha_capacite>1
GROUP BY sta_nom;

-- Ex16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation
SELECT hot_nom AS "Nom d'hotel",
cli_nom AS "Nom client"
FROM hotel
JOIN chambre
ON hot_id=cha_hot_id
JOIN reservation
ON cha_id=res_cha_id
JOIN client
ON  res_cli_id=cli_id
WHERE cli_nom="Squire"
AND cli_id=res_cli_id;

-- Ex17 - Afficher la durée moyenne des réservations par station
SELECT DISTINCT sta_nom AS "Nom de station",
AVG(DATEDIFF(res_date_fin,res_date_debut)) AS "Durée moyenne des réservations"
FROM station
JOIN hotel
ON hot_sta_id=sta_id
JOIN chambre
ON cha_hot_id=hot_id
JOIN reservation
ON res_cha_id=cha_id
GROUP BY sta_nom;