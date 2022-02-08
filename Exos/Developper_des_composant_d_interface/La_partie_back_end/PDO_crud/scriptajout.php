<?php 
    require_once("db.php");
    $db=connect();
        

    if(isset($_POST['titre'])) 
    {
        $titre = $_POST['titre'];
    }
    else  $titre = NULL;

    if(isset($_POST['annee'])) 
    {
        $annee = $_POST['annee'];
    }
    else  $annee = NULL;

    if(isset($_POST['label'])) 
    {
        $label = $_POST['label'];
    }
    else  $label = NULL;

    if(isset($_POST['genre'])) 
    {
        $genre = $_POST['genre'];
    }
    else  $genre = NULL;

    if(isset($_POST['prix'])) 
    {
        $prix = $_POST['prix'];
    }
    else  $prix = NULL;

    $titre=$_POST['titre'];
    $annee=$_POST['annee'];
    $label=$_POST['label'];
    $genre=$_POST['genre'];
    $prix=$_POST['prix'];
    $id=$_POST['id'];

    if(move_uploaded_file($_FILES["fichier"]["tmp_name"],'src/'.$_FILES["fichier"]["name"]))
    {
        $fichier=$_FILES["fichier"]["name"];

    

    $requete =$db->prepare("INSERT INTO disc (disc_title,disc_year,disc_picture,disc_label,disc_genre,disc_price,artist_id)
     VALUES(:disc_title,:disc_year,:disc_picture,:disc_label,:disc_genre,:disc_price,:artist_id)");

    $requete->bindValue(':disc_title', $titre);
    $requete->bindValue(':disc_year', $annee);
    $requete->bindValue(':disc_picture',$fichier);
    $requete->bindValue(':disc_label', $label);
    $requete->bindValue(':disc_genre', $genre);
    $requete->bindValue(':disc_price', $prix);
    $requete->bindValue(':artist_id', $id);
  

    $requete->execute();
    $requete->closeCursor();

    header("Location: index.php");
    }
?>