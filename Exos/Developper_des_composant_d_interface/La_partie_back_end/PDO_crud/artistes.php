<?php 
    require_once("header.php");
    require_once("db.php");
    $db=connect();

// On récupère le genre dans le GET
    $genre=$_GET['disc_genre']; 
// On établi la requete qui vas permettre d'afficher les noms des artistes du genre passé dans le GET
    $requete = $db->prepare("SELECT DISTINCT artist_name FROM disc JOIN artist ON disc.artist_id = artist.artist_id WHERE disc.disc_genre=?");
    $requete->execute(array($genre));
    $tableau = $requete->fetchAll(PDO::FETCH_OBJ)    

?>
<section>
    <h2>ARTISTS</h2>
        <div class="container-fluid bg-center">
            <div class="row justify-content-center">
                <?php foreach ($tableau as $row){
                ?>
                <div class="card" style="width: 18rem;">
                    <a href="titre.php?artist_name=<?php echo $row->artist_name ?>">
                        <img class="card-img-top" src="src/<?php echo $row->artist_name?>.jpg" alt="Card image cap">
                            <div class="card-body">
                                <p class="card-text"><?php echo $row->artist_name ?></p>
                            </div>
                    </a>
                </div>    
                <?php
                }
                ?>
            </div>
        </div>
</section>        
                

<?php 
require_once("footer.php");
?>