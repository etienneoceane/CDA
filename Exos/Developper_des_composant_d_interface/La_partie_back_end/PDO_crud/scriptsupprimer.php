<?php 
    require_once("db.php");
    $db=connect();


    $titre=$_POST['titre'];
    $annee=$_POST['annee'];
    $label=$_POST['label'];
    $genre=$_POST['genre'];
    $prix=$_POST['prix'];
    $id=$_POST['id'];


    try {
        $requete = $db->prepare("DELETE from disc WHERE disc_id=:disc_id");

        $requete->bindValue(':disc_id', $id);



        $requete->execute();
        $requete->closeCursor();
    }
    catch(Exception $er) {
        var_dump($er);
    }
    header("Location: index.php");

?>