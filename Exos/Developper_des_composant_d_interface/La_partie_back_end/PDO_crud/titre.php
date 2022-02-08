<?php 
    require_once("header.php");
    require_once("db.php");
    $db=connect();
    // On récupère le genre dans le GET
    $name=$_GET['artist_name']; 
    // On établi la requete qui vas permettre d'afficher les noms des artistes du genre passé dans le GET
    $requete = $db->prepare("SELECT disc_title, disc_picture, disc_label, disc_price FROM disc JOIN artist ON disc.artist_id = artist.artist_id WHERE artist_name=?");
    $requete->execute(array($name));
    $tableau = $requete->fetchAll(PDO::FETCH_OBJ);

?>

<div class="container-fluid center">
    <div class="row justify-content-center">
        <h2>DETAILS</h2>
            <?php foreach ($tableau as $row){
            ?>
                <div class="card" style="width: 18rem;">
                    <a href="detail.php?disc_title=<?php echo $row->disc_title ?>">
                        <img class="card-img-top" src="src/<?php echo $row->disc_picture?>" alt="Card image cap">
                        <div class="card-body">
                                <p class="card-text">Titre: <?php echo $row->disc_title ?></p>
                        </div>
                    </a>
                </div>    
            <?php
            }
            ?>  
        
    </div>
    
            <div class="row addtitre">
                <a href="ajout.php?artist_name=<?php echo $name?>" title="lien vers le formulaire d'ajout">
                <button type="button" class="btn btn-primary mt-5 ">Ajouter un titre</button>
                </a>
            </div>
        
</div>
        


















    <?php 
require_once("footer.php");
?>