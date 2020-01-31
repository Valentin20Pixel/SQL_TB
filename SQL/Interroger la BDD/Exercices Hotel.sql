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