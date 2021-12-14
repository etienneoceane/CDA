-- v_GlobalCde correspondant à la requête : A partir de la table Ligcom, afficher par code produit, 
-- la somme des quantités commandées et le prix total correspondant : o
-- n nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot.

CREATE VIEW v_GlobalCde
AS
SELECT codart AS "Article ref", SUM(qtecde) AS "QteTot", SUM(qtecde*priuni) AS "PrixTot" 
FROM ligcom
GROUP BY codart;



-- v_VentesI100 correspondant à la requête : Afficher les ventes dont le code produit est le I100 (affichage de toutes les colonnes de la table Vente).

CREATE VIEW v_VentesI100
AS
SELECT * FROM vente
WHERE codart='I100';


-- A partir de la vue précédente, créez v_VentesI100Grobrigan remontant toutes les ventes concernant le produit I100 et le fournisseur 00120.

CREATE VIEW v_VentesI100Grobrigan
AS
SELECT * FROM vente
WHERE codart='I100' AND numfou='120';
