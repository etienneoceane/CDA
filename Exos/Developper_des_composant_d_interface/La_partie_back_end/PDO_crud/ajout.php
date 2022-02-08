<?php 
    require_once("header.php");
    require_once("db.php");
    $db=connect();
    $name=$_GET['artist_name']; 
    
    $resultatgenre = $db->prepare("SELECT DISTINCT disc_genre FROM disc");
    $resultatgenre->execute();
    $requeteid = $db->prepare("SELECT DISTINCT artist_id FROM artist WHERE artist_name=?");
    $requeteid->execute(array($name));
    $tableau = $requeteid->fetchAll(PDO::FETCH_OBJ);
        
 
?>
<section>
    <div class="container-fluid bg-center">
        <div class="row justify-content-center mt-5">
            <div class="col-6">
                <form action ="scriptajout.php" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-10">
                            <label for="references">Artiste :</label>
                            <input type="text" class="form-control" readonly id="Description" name="titre" value="<?php echo $name?>">
                        </div>
                        <?php foreach ($tableau as $row)
                        {
                        ?>
                        <div class="col-2">
                            <label for="references"></label>
                            <input type="text" class="form-control" id="Description" name="id" value="<?php echo $row->artist_id?>">
                        </div>
                        <?php
                        }
                        ?>
                    </div>
                    <label for="references">Titre :</label>
                    <input type="text" class="form-control" id="Description" name="titre" value="">
                
                    <label for="references">Année de sortie :</label>
                    <input type="text" class="form-control" id="Description" name="annee" value="">

                    <label for="references">Label :</label>
                    <input type="text" class="form-control" id="Description" name="label" value="">

                    <label for="references">Genre :</label>
                    <select class="form-control" id="listegenre" name="genre">
                    <?php while ($listegenre= $resultatgenre ->fetch(PDO::FETCH_OBJ)) { ?>
                    <option value="<?php echo $listegenre->disc_genre; ?>"><?php echo $listegenre->disc_genre; ?></option> 
                    <?php } ?> </select><br>

                    <label for="references">Prix :</label>
                    <input type="text" class="form-control" id="Description" name="prix" value="">
                    <br>
                    <input type="file" name="fichier"> 
                    <input type="hidden" name="MAX_FILE_SIZE" value="12345"/>
                    <?php 
                        if(isset($_POST["submit"]))
                        {
                            $maxsizeSize=50000;

                            if ($_FILES['fichier']['error'] > 0) 
                            {
                                echo "une erreure est survenue lors du transfert";
                                die;
                            }

                            if ($_FILES['fichier']['size'] > $maxsize) 
                            {
                                echo "le fichier est trop gros";
                                die;
                            }

                        }
                    ?>
                    <input type="submit" value="Enregistrer" class ="btn btn-success" ><br>
                </form>
                <br><a href="index.php" class="btn btn-secondary"  role="button" title="formulaire">Annuler</a>
                   
            </div>
        </div>
    </div>   
</section>







<?php 
require_once("footer.php");
?>