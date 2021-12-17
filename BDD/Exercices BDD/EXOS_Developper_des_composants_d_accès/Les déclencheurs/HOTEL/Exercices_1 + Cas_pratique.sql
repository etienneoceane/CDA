    -- Exercices


    CREATE TRIGGER nom 
    [MOMENT] [EVENEMENT]  
    ON [table] 
    FOR EACH ROW
    BEGIN
       -- [requête] 
    END


CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
    BEGIN
        DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
END;

    -- 1. modif_reservation : interdire la modification des réservations (on autorise l'ajout et la suppression).

    CREATE TRIGGER modif_reservation AFTER UPDATE ON reservation 
        FOR EACH ROW
        BEGIN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Modification de reservation interdite !';
    END;


    -- 2. insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations.

    CREATE TRIGGER insert_reservation AFTER INSERT ON reservation
        FOR EACH ROW
        BEGIN 
            DECLARE
