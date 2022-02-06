<?php 
    require_once("header.php");
    require_once("db.php");
    $db=connect();
    // On récupère le genre dans le GET
    $name=$_GET['artist_name']; 
    // On établi la requete qui vas permettre d'afficher les noms des artistes du genre passé dans le GET
    $requete = $db->prepare("SELECT disc_title FROM disc JOIN artist ON disc.artist_id = artist.artist_id WHERE artist_name=?");
    $requete->execute(array($name));
    $tableau = $requete->fetchAll(PDO::FETCH_OBJ);

?>

    <section>
    <h2>DETAILS</h2>
        <div class="container-fluid bg-center">
            <div class="row">
                <?php foreach ($tableau as $row){
                ?>
                    <div class="card col-2 p-2 m-1 ">
                            <div class="card-body">
                                <p class="text"><a id="a" href=""><?php echo $row->disc_title?></a></br>
                            </div>
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