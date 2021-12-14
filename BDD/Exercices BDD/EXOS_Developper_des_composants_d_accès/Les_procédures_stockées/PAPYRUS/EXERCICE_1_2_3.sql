--EXERCICE 1
-- Afficher le code des fournisseurs pour lesquels des commandes ont été passées.
DELIMITER |

CREATE PROCEDURE commandesPassées()
BEGIN
	SELECT DISTINCT numfou AS Fournisseurs FROM entcom
END | 

DELIMITER ;



--EXERCICE 2
-- Créer la procédure stockée Lst_Commandes, qui liste les commandes ayant un libellé particulier dans le champ obscom 
--(cette requête sera construite à partir de la requête n°11).

DELIMITER |

CREATE PROCEDURE Lst_Commandes (IN p_obscom Varchar(50))
BEGIN
    SELECT entcom.numcom AS Commande, fournis.nomfou AS Fournisseur, produit.libart AS Produit, entcom.obscom AS Observation, SUM(qtecde*priuni) AS Total 
FROM fournis 
JOIN entcom 
ON fournis.numfou=entcom.numfou 
JOIN ligcom 
ON entcom.numcom=ligcom.numcom 
JOIN produit 
ON produit.codart=ligcom.codart 
WHERE entcom.obscom LIKE p_obscom 
GROUP BY entcom.numcom, fournis.nomfou, produit.libart;

END |

DELIMITER ;


--EXERCICE 3
--Créer la procédure stockée CA_ Fournisseur, qui pour un code fournisseur et une année entrée en paramètre, 
--calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée (cette requête sera construite à partir de la requête n°19).
--On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table FOURNIS.
--Testez cette procédure avec différentes valeurs des paramètres.

DELIMITER |

CREATE PROCEDURE CA_Fournisseur(
    IN p_numfou int(11),
    IN p_année int(4)
)
BEGIN
SELECT SUM(qtecde*priuni*1.2) AS "Chiffre d'Affaire", numfou AS Fournisseur  
FROM ligcom 
JOIN entcom
ON ligcom.numcom=entcom.numcom
WHERE YEAR(derliv)=p_année
AND entcom.numfou=p_numfou;
END|

DELIMITER ;