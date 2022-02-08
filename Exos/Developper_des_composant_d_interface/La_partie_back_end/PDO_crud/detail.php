<?php 
    require_once("header.php");
    require_once("db.php");
    $db=connect();
    $titre=$_GET['disc_title']; 
    $requete = $db->prepare("SELECT DISTINCT * FROM disc JOIN artist ON disc.artist_id = artist.artist_id WHERE disc.disc_title=?");
    $requete->execute(array($titre));
    $tableau = $requete->fetchAll(PDO::FETCH_OBJ)    

?>
<section>
    <div class="container-fluid bg-center">
        <div class="row justify-content-center mt-5">
            <h2>Details</h2>
                <div class="col-sm-6">
                    <form action ="scriptsupprimer.php" method="post">
                        <?php foreach ($tableau as $row)
                        {
                        ?>
                            <div class="form-group">
                                <label for="titre">Titre : </label>
                                <input class="form-control" type="text" name="title" id="titre" disabled
                                    value="<?php echo $row->disc_title?>">
                            </div>
                            <div class="form-group">
                                <label for="annee">Année de sortie :</label>
                                <input class="form-control" type="text" name="year" id="annee" disabled
                                    value="<?php echo $row->disc_year?>">
                            </div>
                            <div class="form-group">
                                <label for="label">Label :</label>
                                <input class="form-control" type="text" name="label" id="label" disabled
                                    value="<?php echo $row->disc_label?>">
                            </div>

                            <div class="col-sm-6">
                                <label for="pict">Picture</label>
                            </div>
                            <div class="col-sm-6 pb-2">
                                <img id="picture" src="src/<?php echo $row->disc_picture?>"  class="img-fluid"
                                    width="300"
                                    alt="<?= $data['details']['disc_title']; ?>">
                            </div>

                            <a href="" class="btn btn-success">Modifier</a>
                            <input type="submit" onclick="Suppression()" value="Supprimer" class="btn btn-danger">
                            <a href="index.php" class="btn btn-primary">Retour</a>

                            <script>
                                function Suppression(){ 

                                //Rappel : confirm() -> Bouton OK et Annuler, renvoit true (OK) ou false (Annuler)
                                var resultat = confirm("Etes-vous certain de vouloir supprimer cet enregistrement ?");

                                if (resultat==false){
                                event.preventDefault();
                                }
                                }
                            </script>

                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="artist">Artiste : </label>
                                    <input class="form-control" type="text" name="artiste" id="artist" disabled
                                        value="<?php echo $row->artist_name?>">
                                </div>
                                <div class="form-group">
                                    <label for="genre">Genre :</label>
                                    <input class="form-control" type="text" name="genre" id="genre" disabled
                                        value="<?php echo $row->disc_genre?>">
                                </div>
                                <div class="form-group">
                                    <label for="prix">Prix :</label>
                                    <input class="form-control" type="text" name="prix" id="price" disabled
                                        value="<?php echo $row->disc_price?>">
                                </div>
                                <div class="form-group">
                                <label for="id">ID :  </label>
                                <input class="form-control" type="hidden" name="id" id="id"
                                    value="<?php echo $row->disc_id?>">
                            </div>
                            </div>
                        <?php
                        }
                        ?>
                    </form>
                </div>    
        </div>
    </div>
</section>

<?php 
require_once("footer.php");
?>