-- LES TRANSACTIONS SQL

--Exercice 1
--Sous PhpMyAdmin, après avoir sélectionné votre base Papyrus codez
--le script suivant et exécutez-le :

START TRANSACTION 
SELECT nomfou FROM fournis WHERE numfou =120;
UPDATE fournis SET numfou='GROSBRIGAND'WHERE numfou=120
SELECT nomfou FROM fournis WHERE numfou=120

--La transaction gère les requêtes les unes après les autres

--Sans commit la transaction n'est pas terminer car elle ne sait pas quand s'arrêter

--Avec commit

--Avec rollback


--Exercice 2 
--Dans l'exercice précédent, nous avons vu que d'autres utilisateurs ne pouvaient pas accéder
-- à l'interrogation de la ligne tant que la transaction n'était pas terminée.
