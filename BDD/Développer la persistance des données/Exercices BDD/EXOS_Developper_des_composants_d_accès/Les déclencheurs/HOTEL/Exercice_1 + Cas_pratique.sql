    -- Exercice_1

    -- 1. modif_reservation : interdire la modification des réservations (on autorise l'ajout et la suppression).

    CREATE TRIGGER modif_reservation AFTER UPDATE ON reservation 
        FOR EACH ROW
        BEGIN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Modification de reservation interdite !';
    END;


    -- 2. insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations.
DELIMITER |
    CREATE TRIGGER insert_reservation AFTER INSERT ON reservation
        FOR EACH ROW
        BEGIN 
            DECLARE id_r INT;
            DECLARE hot_r VARCHAR(50);
            DECLARE nbRes INT;
            SET id_r = NEW.res_id; -- nous captons le numéro de réservations
            SET hot_r=(SELECT hot_nom FROM v_5 WHERE res_id=id_r); -- nous captons le nom d'hôtel
            SET nbRes = (SELECT count(*) FROM v_5 WHERE hot_nom=hot_r); --on calcule le nombre de réservations
            IF nbRes>10 THEN
                SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion réservations !';
            END IF;
        END |
DELIMITER ;

-- 3. insert_reservation2: interdire les réservations si le client possède déjà 3 réservations.
DELIMITER |
    CREATE TRIGGER insert-reservation2 AFTER INSERT ON reservation
        FOR EACH ROW
        BEGIN
            DECLARE id_r_cli INT;
            DECLARE nbRes_cli INT;
            SET id_r_cli = NEW.res_id
            SET nbRes_cli = (SELECT count(*) FROM reservation WHERE res_cli_id = id_r_cli);
                IF nbResCli>3 THEN
                    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion réservations !';
                END IF;
            END|
DELIMITER ;

-- 4. insert_chambre : lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, si ce total est supérieur à 50, on interdit l'insertion de la chambre.

DELIMITER |
CREATE OR REPLACE TRIGGER insert_chambre AFTER INSERT ON chambre
    FOR EACH ROW
    BEGIN
    DECLARE cap_hot INT;
    DECLARE id_hot INT;
    SET id_hot = NEW.cha_hot_id;
    SET cap_hot = (SELECT SUM(cha_capacite) FROM chambre GROUP BY cha_hot_id HAVING cha_hot_id=id_hot);
    IF cap_hot>50 THEN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion réservations !';
    END IF;
END |
DELIMITER ;



    -- CAS PRATIQUE


    -- Recalculer le total de la commande après l'insertion' de produit. 
DELIMITER |
CREATE OR REPLACE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        DECLARE remis DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        SET remis = (SELECT remise FROM commande WHERE id=id_c); -- nous captons la remise
        UPDATE commande SET total=(tot-remis) WHERE id=id_c; -- on stocke le total dans la table commande
END |
DELIMITER ;
--test 
DELETE FROM lignedecommande WHERE id_commande=4;
INSERT INTO lignedecommande(id_commande,id_produit,quantite,prix) VALUES (4,3,5,700);
-- Recalculer le total de la commande après  la modification de produit. 
DELIMITER |
CREATE OR REPLACE TRIGGER after_update_total AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        DECLARE remis DOUBLE;
        SET id_c = OLD.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        SET remis=(SELECT remise FROM commande WHERE id=id_c); -- nous captons la remise
        UPDATE commande SET total=(tot-remis) WHERE id=id_c; -- on stocke le total dans la table commande
END |
DELIMITER ;
--test
UPDATE lignedecommande SET quantite=5 WHERE id_commande=4;
-- Recalculer le total de la commande après  la suppression de produit .
DELIMITER |
CREATE OR REPLACE TRIGGER after_delete_total AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        DECLARE remis DOUBLE;
        SET id_c = OLD.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        SET remis=(SELECT remise FROM commande WHERE id=id_c); -- nous captons la remise
        UPDATE commande SET total=(tot-remis) WHERE id=id_c; -- on stocke le total dans la table commande
END |
DELIMITER ;
--test
DELETE FROM lignedecommande WHERE id_commande=4;