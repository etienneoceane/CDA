CREATE TABLE Fournisseur(
   four_id VARCHAR(50),
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
   rubrique_id VARCHAR(50),
   rubrique_nom VARCHAR(50),
   rubrique_desc VARCHAR(250),
   PRIMARY KEY(rubrique_id)
);

CREATE TABLE Sous_rubrique(
   sousrub_id VARCHAR(50),
   sousrub_nom VARCHAR(50),
   sousrub_desc VARCHAR(250),
   rubrique_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(sousrub_id),
   CONSTRAINT `Sous_rubrique_fk_1` FOREIGN KEY(rubrique_id) REFERENCES Rubrique(rubrique_id)
);

CREATE TABLE Commercial(
   commercial_id VARCHAR(50),
   commercial_nom VARCHAR(50),
   commercial_prenom VARCHAR(50),
   commercial_tel INT,
   PRIMARY KEY(commercial_id)
);

CREATE TABLE Client(
   cli_id VARCHAR(50),
   cli_nom VARCHAR(50),
   cli_prenom VARCHAR(50),
   cli_raison VARCHAR(50),
   cli_adresse VARCHAR(250),
   cli_ville VARCHAR(50),
   cli_cp VARCHAR(5),
   cli_tel VARCHAR(10),
   cli_mail VARCHAR(50),
   commercial_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(commercial_id) REFERENCES Commercial(commercial_id)
);

CREATE TABLE Produit(
   pro_id VARCHAR(50),
   pro_desc VARCHAR(250),
   pro_nom VARCHAR(50),
   pro_photo VARCHAR(250),
   pro_stock INT,
   pro_prixht DECIMAL(7,2),
   sousrub_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(pro_id),
   CONSTRAINT `Produit_fk_1`FOREIGN KEY(sousrub_id) REFERENCES Sous_rubrique(sousrub_id)
);

CREATE TABLE Commande(
   commande_num VARCHAR(50),
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
   cli_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(commande_num),
   CONSTRAINT `Commande_fk_1` FOREIGN KEY(cli_id) REFERENCES Client(cli_id)
);

CREATE TABLE Livraison(
   liv_id VARCHAR(50),
   liv_num_bon VARCHAR(50) NOT NULL,
   liv_date DATE,
   liv_etat VARCHAR(10),
   commande_num VARCHAR(50) NOT NULL,
   PRIMARY KEY(liv_id),
   CONSTRAINT `Livraison_fk_1`FOREIGN KEY(commande_num) REFERENCES Commande(commande_num)
);

CREATE TABLE Contenir(
   pro_id VARCHAR(50),
   commande_num VARCHAR(50),
   qtite_commande INT NOT NULL,
   PRIMARY KEY(pro_id, commande_num),
   FOREIGN KEY(pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(commande_num) REFERENCES Commande(commande_num)
);

CREATE TABLE Approvisionner(
   pro_id VARCHAR(50),
   four_id VARCHAR(50),
   appro_prix_achat INT NOT NULL,
   appro_date_commande DATE,
   appro_date_liv DATE,
   appro_qtite INT,
   PRIMARY KEY(pro_id, four_id),
   FOREIGN KEY(pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(four_id) REFERENCES Fournisseur(four_id)
);

CREATE TABLE LIVRER(
   pro_id VARCHAR(50),
   liv_id VARCHAR(50),
   pro_liv_qtite INT NOT NULL,
   PRIMARY KEY(pro_id, liv_id),
   FOREIGN KEY(pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(liv_id) REFERENCES Livraison(liv_id)
);
