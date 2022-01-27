-- EVALUATION NORTHWIND

-- 1 - Liste des contacts français
SELECT
`CompanyName` AS `Société`,
`ContactName` AS `contact`,
`ContactTitle` AS `Fpnction`,
`Phone`  AS `Téléphone`
FROM `customers`
WHERE `Country`= 'France';


-- 2 - Produits vendus par le fournisseur « Exotic Liquids » :
SELECT ProductName AS Produit, UnitPrice AS Prix 
FROM products 
JOIN suppliers 
ON suppliers.SupplierID=products.SupplierID 
WHERE suppliers.CompanyName="Exotic Liquids";


-- 3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
SELECT suppliers.CompanyName AS Fournisseur, COUNT(*) AS Nombre_produits 
FROM suppliers 
JOIN products 
ON products.SupplierID=suppliers.SupplierID 
WHERE suppliers.Country='France'
GROUP BY Fournisseur
ORDER BY Nombre_produits DESC; 


-- 4 - Liste des clients Français ayant plus de 10 commandes :
SELECT customers.CompanyName AS Client, 
COUNT(*) AS Nombre_commande
FROM customers 
JOIN orders 
ON customers.CustomerID=orders.CustomerID 
WHERE customers.Country="France"
GROUP BY Client  
HAVING Nombre_commande>10;


-- 5 - Liste des clients ayant un chiffre d’affaires > 30.000 :
SELECT customers.CompanyName AS Client, SUM(`order details`.UnitPrice * `order details`.Quantity) AS CA, customers.Country AS Pays
FROM customers, orders, `order details` 
WHERE customers.CustomerID=orders.CustomerID
AND orders.OrderID=`order details`.OrderID 
GROUP BY customers.CompanyName, customers.Country
HAVING CA > 30000
ORDER BY CA DESC

-- 6 – Liste des pays dont les clients ont passé commande de produits fournis par « Exotic Liquids » :
SELECT customers.Country AS Pays
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
GROUP BY Pays
ORDER BY Pays ASC


-- 7 – Montant des ventes de 1997 :
SELECT SUM(`order details`.UnitPrice*Quantity) AS Montant_Ventes_97
FROM `order details`, orders
WHERE orders.OrderID=`order details`.OrderID 
AND orders.ShippedDate BETWEEN '1997/01/01' AND '1997/12/31'


-- 8 – Montant des ventes de 1997 mois par mois :
SELECT MONTH(orders.ShippedDate) AS `Mois 97`,  SUM(`order details`.UnitPrice*Quantity) AS `Montant Ventes`
FROM `order details`, orders
WHERE orders.OrderID=`order details`.OrderID 
AND orders.ShippedDate BETWEEN '1997/01/01' AND '1997/12/31' 
GROUP BY `Mois 97`
HAVING `Mois 97` BETWEEN '01' AND '12'

-- 9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?
SELECT orders.OrderDate AS `Date de derniere commande`
FROM orders, customers
WHERE orders.CustomerID=customers.CustomerID 
AND customers.CompanyName="Du monde entier"
ORDER BY `Date de derniere commande` DESC 
LIMIT 1



-- 10 – Quel est le délai moyen de livraison en jours ?
SELECT ROUND(AVG(DATEDIFF(`ShippedDate`,`OrderDate`))) AS `Délai moyen de livraison en jours` 
FROM `orders`;




-- 2) PROCEDURES STOCKEES
Codez deux procédures stockées correspondant aux requêtes 9 et 10.
 Les procédures stockées doivent prendre en compte les éventuels paramètres. */


DELIMITER |
CREATE PROCEDURE dateDerniereCommande(IN p_client VARCHAR(50))
BEGIN
   SELECT orders.OrderDate AS `Date de derniere commande`
   FROM orders, customers
   WHERE orders.CustomerID=customers.CustomerID 
   AND customers.CompanyName=p_client
   ORDER BY `Date de derniere commande` DESC 
   LIMIT 1;
END |
DELIMITER ;



DELIMITER |
CREATE PROCEDURE delaiMoyenLivraisonParClient(IN p_clientID VARCHAR(50))
BEGIN
   SELECT ROUND(AVG(DATEDIFF(DATE(ShippedDate), DATE(OrderDate)))) AS `Délai moyen de livraison en jours` 
   FROM orders
   JOIN customers
   ON customers.CustomerID=orders.CustomerID
   WHERE orders.CustomerID=p_clientID;
END |
DELIMITER ;



-- 3) MISE EN PLACE DES REGLES DE GESTIONS
Décrivez par quel moyen et comment vous pourriez implémenter la règle de gestion suivante.
Pour tenir compte des coûts liés au transport, on vérifiera que pour chaque produit d’une commande,
le client réside dans le même pays que le fournisseur du même produit */

DELIMITER |
CREATE TRIGGER paysClientpaysFournisseur
AFTER INSERT 
ON `order details`
FOR EACH ROW
  BEGIN
     DECLARE p_existe varchar(50); 
     SET p_existe = (SELECT `order details`.ProductID
                     FROM `order details`
                     JOIN orders
                     ON `order details`.OrderID=orders.OrderID
                     JOIN customers
                     ON customers.CustomerID=orders.CustomerID
                     JOIN products
                     ON `order details`.ProductID=products.ProductID
                     JOIN suppliers 
                     ON products.SupplierID=suppliers.SupplierID
                     WHERE `order details`.OrderID=NEW.OrderID
                     AND `order details`.ProductID=NEW.ProductID
                     AND customers.Country=suppliers.Country); 
     IF IS NULL(p_existe) 
       THEN  
         SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Les pays de client et fournisseur ne correspondent pas';
     END IF;
  END |
DELIMITER ;