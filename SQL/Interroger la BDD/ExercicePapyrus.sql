-- III LES BESOINS D’AFFICHAGE


-- Ex1. Quelles sont les commandes du fournisseur 09120 ?

SELECT libart AS 'le libellé du produit'
FROM produit
JOIN ligcom
ON produit.codart=ligcom.codart
JOIN entcom
ON ligcom.numcom=entcom.numcom
JOIN fournis
ON entcom.numfou=fournis.numfou
WHERE fournis.numfou=09120;

-- Ex2. Afficher le code des fournisseurs pour lesquels des commandes ont été passées.

SELECT fournis.numfou AS "N° de fournisseur"
FROM fournis
JOIN entcom
ON fournis.numfou=entcom.numfou
GROUP BY fournis.numfou;

-- Ex3. Afficher le nombre de commandes fournisseurs passées, et le nombre de
-- fournisseur concernés

SELECT COUNT(distinct(ligcom.numcom)) AS 'le nbre de commandes fournisseurs passées',
COUNT(distinct(entcom.numfou)) AS 'le nbre de fournisseur concernés'
FROM ligcom
JOIN entcom
ON ligcom.numcom=entcom.numcom;

-- Ex4. Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la
-- quantité annuelle est inférieur est inférieure à 1000
-- (informations à fournir : n° produit, libellé produit, stock, stock actuel d'alerte,
-- quantité annuelle)

SELECT produit.codart AS 'N° de produit',
produit.libart  AS 'le libellé du produit',
produit.stkphy AS "Stock Physique",
produit.stkale AS 'Stock alerte',
produit.qteann AS 'Quantité annuelle'
FROM produit
WHERE stkphy<=stkale
AND qteann<1000;

-- Ex5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
-- L’affichage (département, nom fournisseur) sera effectué par département
-- décroissant, puis par ordre alphabétique

SELECT fournis.nomfou AS 'Nom du fournisseur',
fournis.posfou AS 'Code postale du fournisseur'
FROM fournis
WHERE SUBSTRING(posfou,1,2)=75
OR SUBSTRING(posfou,1,2)=78
OR SUBSTRING(posfou,1,2)=92
OR SUBSTRING(posfou,1,2)=77
ORDER BY fournis.posfou DESC, fournis.nomfou ASC;

-- Ex6. Quelles sont les commandes passées au mois de mars et avril ?

SELECT MONTH(datcom) AS "Mois de commande",
numcom AS 'N° de Commande'
FROM entcom
WHERE MONTH(datcom)=4
OR MONTH(datcom)=3;

-- Ex7. Quelles sont les commandes du jour qui ont des observations particulières ?
-- (Affichage numéro de commande, date de commande)

SELECT numcom AS 'N° de Commande',
datcom AS "Date de commande"
FROM entcom
WHERE obscom!="";

-- Ex8. Lister le total de chaque commande par total décroissant
-- (Affichage numéro de commande et total)

SELECT numcom AS 'N° de Commande',
SUM(priuni*qteliv) AS Total
FROM ligcom
GROUP BY numcom
ORDER BY Total DESC;

-- Ex9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le
-- calcul du total les articles commandés en quantité supérieure ou égale à 1000.
-- (Affichage numéro de commande et total)

SELECT numcom AS 'N° de Commande',
SUM(priuni*qteliv) AS 'Total'
FROM ligcom
WHERE 'Total'>10000
OR qteliv<1000
GROUP BY numcom
ORDER BY Total DESC;

-- Ex10.Lister les commandes par nom fournisseur
-- (Afficher le nom du fournisseur, le numéro de commande et la date)

SELECT fournis.nomfou AS 'Nom du fournisseur',
entcom.numcom AS 'N° de Commande',
entcom.datcom
FROM fournis
JOIN entcom
ON fournis.numfou=entcom.numfou
GROUP BY entcom.numcom;

-- Ex11.Sortir les produits des commandes ayant le mot "urgent' en observation?
-- (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et
-- le sous total = quantité commandée * Prix unitaire)

SELECT ligcom.numcom AS 'N° de Commande',
fournis.nomfou AS 'Nom du fournisseur',
produit.libart AS 'le libellé du produit',
ligcom.qtecde*ligcom.priuni AS Soustotal
FROM produit
JOIN ligcom
ON produit.codart=ligcom.codart
JOIN entcom
ON ligcom.numcom=entcom.numcom
JOIN fournis
ON entcom.numfou=fournis.numfou
WHERE obscom ="Commande urgente";

-- Ex12.Coder de 2 manières différentes la requête suivante :
-- Lister le nom des fournisseurs susceptibles de livrer au moins un article

SELECT DISTINCT fournis.nomfou AS 'Nom du fournisseur',
SUM(ligcom.qteliv) AS "Quantité livré >0"
FROM fournis
JOIN entcom
ON fournis.numfou=entcom.numfou
JOIN ligcom
ON entcom.numcom=ligcom.numcom
WHERE qteliv>0
GROUP BY fournis.nomfou;

SELECT DISTINCT fournis.nomfou AS 'Nom du fournisseur',
SUM(ligcom.qteliv) AS "Quantité livré >0"
FROM fournis
JOIN entcom
ON fournis.numfou=entcom.numfou
JOIN ligcom
ON entcom.numcom=ligcom.numcom
WHERE qteliv!=0
GROUP BY fournis.nomfou;

-- Ex13.Coder de 2 manières différentes la requête suivante
-- Lister les commandes (Numéro et date) dont le fournisseur est celui de la
-- commande 70210 :

SELECT numcom AS 'N° de commande',
datcom AS 'Date de commande'
FROM entcom
WHERE numfou=(SELECT numfou
FROM entcom
WHERE numcom=70210);

-- Ex14.Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés
-- sur Prix1) que le moins cher des rubans (article dont le premier caractère
-- commence par R). On affichera le libellé de l’article et prix1

SELECT libart AS "Libellé de l'article",
prix1 AS "Prix"
FROM produit
JOIN vente
ON produit.codart=vente.codart
WHERE prix1<ALL(SELECT prix1
FROM vente
WHERE codart LIKE "R%");

-- Ex15.Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est
-- inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis
-- fournisseur
SELECT fournis.nomfou AS 'Nom du fournisseur',
produit.libart AS "Nom de produit"
FROM produit
JOIN vente
ON produit.codart=vente.codart
JOIN fournis
ON vente.numfou=fournis.numfou
WHERE produit.stkphy>=produit.stkale*1.5
ORDER BY produit.libart, fournis.nomfou;

-- Ex16.Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est
-- inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30
-- jours. La liste est triée par fournisseur puis produit

SELECT fournis.nomfou AS 'Nom du fournisseur',
produit.libart AS "Nom de produit"
FROM produit
JOIN vente
ON produit.codart=vente.codart
JOIN fournis
ON vente.numfou=fournis.numfou
WHERE produit.stkphy>=produit.stkale*1.5
AND vente.delliv<=30
ORDER BY fournis.nomfou, produit.libart;

/*****************************************************************************/


-- IV LES BESOINS DE MISE A JOUR


/*****************************************************************************/

-- Ex1. Application d'une augmentation de tarif de 4% pour le prix 1, 2% pour le prix2
-- pour le fournisseur 9180

UPDATE vente
SET
prix1=prix1*1.04,
prix2=prix2*1.02
WHERE numfou=9180;

-- Ex2. Dans la table vente, mettre à jour le prix2 des articles dont le prix2 est null, en
-- affectant a valeur de prix.

UPDATE vente 
SET
prix2=prix1
WHERE prix2=0

-- Ex3. Mettre à jour le champ obscom en positionnant '*****' pour toutes les commandes
-- dont le fournisseur a un indice de satisfaction <5

UPDATE entcom
JOIN fournis
ON entcom.numfou=fournis.numfou
SET
entcom.obscom="******"
WHERE fournis.satisf<5

-- Ex4. Suppression du produit I110

DELETE FROM produit
WHERE produit.codart="I110";
DELETE FROM vente
WHERE vente.codart="I110";
DELETE FROM ligcom
WHERE ligcom.codart="I110";
