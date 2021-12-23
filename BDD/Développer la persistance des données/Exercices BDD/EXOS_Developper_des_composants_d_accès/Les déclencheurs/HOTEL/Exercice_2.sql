-Créer une table ARTICLES_A_COMMANDER avec les colonnes :
CREATE OR REPLACE TABLE article_a_commander(
    id INT PRIMARY KEY AUTO_INCREMENT,
    codart CHAR(4) NOT NULL,
    date_u DATE NOT NULL DEFAULT CURDATE(),
    qte INT NOT NULL,
	FOREIGN KEY(codart) REFERENCES produit(codart)
    );
/*Créer un déclencheur UPDATE sur la table produit :
lorsque le stock physique devient inférieur ou égal au stock d'alerte,
une nouvelle ligne est insérée dans la table ARTICLES_A_COMMANDER */
DELIMITER |
CREATE OR REPLACE TRIGGER art_a_commander AFTER UPDATE ON produit
   FOR EACH ROW
   BEGIN
   DECLARE stk_ale INT;
   DECLARE stk_phy INT;
   DECLARE stk_a_com INT;
   DECLARE stk_deja_com INT;
   DECLARE cod_art CHAR(4);
   SET cod_art = NEW.codart;
   SET stk_ale = NEW.stkale;
   SET stk_phy = NEW.stkphy;
   IF (stk_ale>stk_phy) THEN
   	IF cod_art = ANY (SELECT codart FROM article_a_commander) THEN
   		SET stk_deja_com = (SELECT SUM(qte) FROM article_a_commander WHERE codart=cod_art);
   	   SET stk_a_com = (stk_ale-stk_phy)-(stk_deja_com);
      	INSERT INTO article_a_commander (codart, qte) VALUES (cod_art, stk_a_com);
      ELSE
      	SET stk_a_com = (stk_ale)-(stk_phy);
      	INSERT INTO article_a_commander (codart, qte) VALUES (cod_art, stk_a_com);
    	END IF;	  
    END IF;	
END |
DELIMITER ;

--test
UPDATE produit SET stkphy=9 WHERE codart='I110';