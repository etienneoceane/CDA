CREATE VIEW hotels_et_stations
AS
SELECT hot_nom, sta_nom FROM hotel, station
WHERE hot_sta_id = sta_id;

CREATE VIEW chambres_et_hotels
AS
SELECT cha_numero, hot_nom FROM chambre, hotel
WHERE cha_hot_id = hot_id;

CREATE VIEW clients_reservations
AS
SELECT CONCAT(cli_nom,' ',cli_prenom) AS "Nom Prénom", res_id  FROM client,reservation
WHERE res_cha_id = cli_id;

CREATE VIEW chambres_hotels_stations
AS
SELECT cha_numero, hot_nom, sta_nom  FROM chambre, hotel, station
WHERE sta_id = hot_sta_id AND hot_id=cha_hot_id;


"JAI FAIT CELUI CI AVEC JOIN POUR CHANGER"
CREATE VIEW reservations_nom_hotel
AS
SELECT res_id, res_date, cli_nom, hot_nom 
FROM reservation
JOIN client ON cli_id = res_cli_id     
JOIN chambre ON cha_id= res_cha_id
JOIN hotel ON hot_id = cha_hot_id

