<?php
    function connect () {
    
                // Paramètres de connexion serveur local
                $host ="127.0.0.1";
                $login="root";     // Votre loggin d'accès au serveur de BDD 
                $password="";    // Le Password pour vous identifier auprès du serveur
                $base ="record";    // La bdd avec laquelle vous voulez travailler 
        
        
        try{        
                //$db = new PDO('mysql:host=localhost;charset=utf8;dbname=hotel', 'root', '');
                $db = new PDO("mysql:host=".$host.";charset=utf8;dbname=".$base."", $login, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        
        catch (Exception $e) {
                echo "La connection à la base e données a échoué ! <br>";
                echo "Merci de bien vérifier vos paramètres de connection ...<br>";
                echo "Erreur : " . $e->getMessage() . "<br>";
                echo "N° : " . $e->getCode(). "<br>";
                die("Fin du script");
        } 
        
        //Attention : ne pas oublier de faire un return de la connection $db !
        return $db;
        
        }
        
        ?>
        