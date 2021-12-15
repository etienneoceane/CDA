DROP DATABASE VillageGreen2;
CREATE DATABASE VillageGreen2 ;
USE VillageGreen;

CREATE TABLE Fournisseur(
   four_id INT AUTO_INCREMENT,
   four_nom VARCHAR(50),
   four_prenom VARCHAR(50),
   four_raison VARCHAR(50),
   four_adresse VARCHAR(250),
   four_ville VARCHAR(50),
   four_cp VARCHAR(5),
   four_tel VARCHAR(10),
   four_contact_nom VARCHAR(50),
   four_contact_prenom VARCHAR(50),
   PRIMARY KEY(four_id)
);

CREATE TABLE Rubrique(
   rubrique_id INT AUTO_INCREMENT,
   rubrique_nom VARCHAR(50),
   rubrique_desc VARCHAR(250),
   PRIMARY KEY(rubrique_id)
);

CREATE TABLE Sous_rubrique(
   sousrub_id INT AUTO_INCREMENT,
   sousrub_nom VARCHAR(50),
   sousrub_desc VARCHAR(250),
   rubrique_id INT NOT NULL,
   PRIMARY KEY(sousrub_id),
   CONSTRAINT `Sous_rubrique_fk_1` FOREIGN KEY(rubrique_id) REFERENCES Rubrique(rubrique_id)
);

CREATE TABLE Commercial(
   commercial_id INT AUTO_INCREMENT,
   commercial_nom VARCHAR(50),
   commercial_prenom VARCHAR(50),
   commercial_tel INT,
   PRIMARY KEY(commercial_id)
);

CREATE TABLE Client(
   cli_id INT AUTO_INCREMENT,
   cli_nom VARCHAR(50),
   cli_prenom VARCHAR(50),
   cli_raison VARCHAR(50),
   cli_adresse VARCHAR(250),
   cli_ville VARCHAR(50),
   cli_cp VARCHAR(5),
   cli_tel VARCHAR(10),
   cli_mail VARCHAR(50),
   commercial_id INT NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(commercial_id) REFERENCES Commercial(commercial_id)
);

CREATE TABLE Produit(
   pro_id INT AUTO_INCREMENT,
   pro_desc VARCHAR(250),
   pro_nom VARCHAR(50),
   pro_photo VARCHAR(250),
   pro_stock INT,
   pro_prixht DECIMAL(7,2),
   sousrub_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   CONSTRAINT `Produit_fk_1`FOREIGN KEY(sousrub_id) REFERENCES Sous_rubrique(sousrub_id)
);

CREATE TABLE Commande(
   commande_id INT,
   commande_date DATE,
   commande_reduc INT,
   commande_prix_tot INT,
   commande_date_reglem DATE,
   commande_date_fact DATE,
   commande_livraison_adresse VARCHAR(250),
   commande_livraison_ville VARCHAR(50),
   commande_livraison_cp VARCHAR(5),
   commande_facturation_adresse VARCHAR(250),
   commande_facturation_ville VARCHAR(50),
   commande_facturation_cp VARCHAR(5),
   commande_etat VARCHAR(50),
   cli_id INT NOT NULL,
   PRIMARY KEY(commande_id),
   CONSTRAINT `Commande_fk_1` FOREIGN KEY(cli_id) REFERENCES Client(cli_id)
);

CREATE TABLE Livraison(
   liv_id INT AUTO_INCREMENT,
   liv_num_bon VARCHAR(50) NOT NULL,
   liv_date DATE,
   liv_etat VARCHAR(10),
   liv_commande_id INT NOT NULL,
   PRIMARY KEY(liv_id),
   CONSTRAINT `Livraison_fk_1`FOREIGN KEY(liv_commande_id) REFERENCES Commande(commande_id)
);

CREATE TABLE Contenir(
   contenir_pro_id INT ,
   contenir_commande_id INT,
   contenir_qtite_commande INT NOT NULL,
   contenir_prix_vente INT,
   PRIMARY KEY(contenir_pro_id, contenir_commande_id),
   FOREIGN KEY(contenir_pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(contenir_commande_id) REFERENCES Commande(commande_id)
);

CREATE TABLE Approvisionner(
   appro_pro_id INT ,
   appro_four_id INT,
   appro_prix_achat INT NOT NULL,
   appro_date_commande DATE,
   appro_date_liv DATE,
   appro_qtite INT,
   PRIMARY KEY(appro_pro_id, appro_four_id),
   FOREIGN KEY(appro_pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(appro_four_id) REFERENCES Fournisseur(four_id)
);

CREATE TABLE Livrer(
   livrer_pro_id INT,
   livrer_liv_id INT,
   livrer_pro_liv_qtite INT NOT NULL,
   PRIMARY KEY(livrer_pro_id, livrer_liv_id),
   FOREIGN KEY(livrer_pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(livrer_liv_id) REFERENCES Livraison(liv_id)
    );
