<?php 
    require_once("header.php");
    require_once("db.php");
    $db=connect();

$requete = $db->prepare("SELECT * FROM disc GROUP BY disc_genre ");
$requete->execute();
$tableau = $requete->fetchAll(PDO::FETCH_OBJ)  
?>

<section>
    <div class="container-fluid bg-center">
        <div class="row justify-content-center mt-5">
            <?php foreach ($tableau as $row)
                { ?>
                    <div class="card col-2 p-2 m-1 ">
                            <div class="card-body genre">
                                <p class="text-center"><a id="a" href="artistes.php?disc_genre=<?php echo $row->disc_genre ?>"><?php echo $row->disc_genre ?></a></br>
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