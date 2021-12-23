--Programmer des procédures stockées sur le SGBD
--Créez une procédure stockée qui sélectionne les commandes non soldées (en cours de livraison), 
--puis une autre qui renvoie le délai moyen entre la date de commande et la date de facturation.

DELIMITER |
CREATE procedure commande_non_soldees (In etat varchar(50))
begin

    SELECT * FROM `Commande` WHERE `commande_date_reglem` IS NULL and `commande_etat` = etat ;
END |
delimiter ;




--Gérer les vues
--Créez une vue correspondant à la jointure Produits - Fournisseurs

CREATE VIEW produit_fournisseur
AS
SELECT pro_id, pro_nom, Fournisseur.four_id
FROM `Produit`
         join Fournisseur ON Produit.four_id = Fournisseur.four_id;

--Créez une vue correspondant à la jointure Produits - Catégorie/Sous catégorie

CREATE VIEW produit_fournis_rub_sousrub
AS 
SELECT pro_id, pro_nom, Fournisseur.four_id, Rubrique.rubrique_id, Sous_rubrique.sousrub_id
FROM `Produit`
            join Fournisseur ON Produit.four_id = Fournisseur.four_id
            join Sous_rubrique ON Produit.sousrub_id = Sous_rubrique.sousrub_id
            join Rubrique ON Sous_rubrique.rubrique_id= Rubrique.rubrique_id;
