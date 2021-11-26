/* Créez trois utilisateurs util1, util2, util3 pour la base papyrus
util1 doit pouvoir effectuer toutes les actions */

CREATE USER 'utilisateur1'@'localhost' IDENTIFIED BY 'utilisateur1';

GRANT ALL PRIVILEGES ON papyrus.* TO 'utilisateur1'@'localhost';


/* util2 ne peut que sélectionner les informations dans la base */

CREATE USER 'utilisateur2'@'localhost' IDENTIFIED BY 'utilisateur2';

GRANT select ON papyrus.* TO 'utilisateur2'@'localhost';


/* util3 n'a aucun droit sur la base de données, sauf d'afficher la table fournis */

CREATE USER 'utilisateur3'@'localhost' IDENTIFIED BY 'utilisateur3';

GRANT show view ON papyrus.fournis TO 'utilisateur3'@'localhost';