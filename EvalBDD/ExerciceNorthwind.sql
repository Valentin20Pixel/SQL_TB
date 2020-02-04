-- Ex1 - Liste des contacts français :

-- SELECT permet de retourner des infos FROM de situé dans une table
-- et WHERE de definir une condition

SELECT CompanyName AS "Société",
ContactName AS "Contact",
ContactTitle AS "Fonction",
Phone AS "Téléphone"
FROM customers
WHERE Country="France";

-- Ex2 - Produits vendus par le fournisseur « Exotic Liquids » :

-- JOIN (table) ON (variable commune) permet d'aller chercher des infos ou meme les afficher 
-- dans une autre table

SELECT products.productname AS "Produit",
products.unitprice AS "Prix"
FROM products
JOIN suppliers
ON products.supplierID=suppliers.supplierID
WHERE CompanyName="Exotic Liquids";

-- Ex3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :

-- COUNT() sert de compteur de valeur GROUP BY de groupeur de valeur identique et
-- ORDER BY sert a ordonner le resultat croissant par defaut (ASC) ou bien 
-- decroissant si on ajoute DESC apres l'ordre

SELECT suppliers.CompanyName AS 'Fournisseur',
COUNT(products.productID) AS 'Nbre produits'
FROM suppliers
JOIN products
ON suppliers.supplierID=products.supplierID
WHERE Country='France'
GROUP BY companyname
ORDER BY COUNT(products.productID) DESC;

-- Ex4 - Liste des clients Français ayant plus de 10 commandes :

-- HAVING est la clause de condition de GROUP BY

SELECT CompanyName AS Client,
COUNT(orders.ShipCountry="France") AS NbreCommandes
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
WHERE orders.ShipCountry="France"
GROUP BY customers.CompanyName
HAVING NbreCommandes>10;

-- Ex5 - Liste des clients ayant un chiffre d’affaires > 30.000 :

-- SUM est la somme des valeurs demandé entre ()

SELECT customers.CompanyName AS Client,
SUM(`order details`.UnitPrice*`order details`.Quantity) AS CA,
customers.Country AS Pays
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
JOIN `order details`
ON orders.OrderID=`order details`.OrderID
GROUP BY orders.CustomerID
HAVING CA>30000
ORDER BY CA DESC;

-- Ex6 – Liste des pays dont les clients ont passé commande de produits fournis par « Exotic
-- Liquids » :

-- DISTINCT sert a demander une seule fois la valeur si elle apparait plusieur fois

SELECT DISTINCT customers.country AS Pays
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
JOIN `order details`
ON orders.OrderID=`order details`.OrderID
JOIN products
ON `order details`.ProductID=products.ProductID
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
WHERE suppliers.CompanyName="Exotic Liquids"
ORDER BY Pays;

-- Ex7 – Montant des ventes de 1997 :

-- SUBSTRING(chaine, debut, longueur)  permet tronconner une valeur 

SELECT SUM(`order details`.UnitPrice*`order details`.Quantity) AS "Montant Ventes 97:"
FROM `order details`
JOIN orders
ON `order details`.OrderID=orders.OrderID
WHERE SUBSTRING(OrderDate,3,2)=97;

-- Ex8 – Montant des ventes de 1997 mois par mois :

-- WHERE (Colonne) LIKE (modele) permet d’effectuer une recherche sur un modele particulier
-- MONTH() permet d’extraire le numéro de mois à partir d’une date au format AAAA-MM-JJ

SELECT MONTH(orders.OrderDate) AS Mois97,
SUM(`order details`.UnitPrice*`order details`.Quantity) AS "Montant Ventes"
FROM `order details`
JOIN orders
ON `order details`.OrderID=orders.OrderID
WHERE orders.OrderDate LIKE "1997%"
GROUP BY Mois97;

-- Ex9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?

-- MAX() permet d'obtenir la valeur max 

SELECT MAX(OrderDate) AS "Date de derniere commande"
FROM orders
JOIN customers
ON orders.CustomerID=customers.CustomerID
WHERE customers.CompanyName="Du monde entier";

-- Ex10 – Quel est le délai moyen de livraison en jours ?

-- ROUND() permet d'arrondir un entier AVG() donne la moyenne et DATEDIFF calcul la difference
-- des dates

SELECT DISTINCT ROUND(AVG(DATEDIFF(ShippedDate,OrderDate))) AS "Delai moyen de livraison en jours"
FROM orders;