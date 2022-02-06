<?php 
    require_once("header.php");
    require_once("db.php");
    $db=connect();

$requete = $db->prepare("SELECT * FROM disc GROUP BY disc_genre ");
$requete->execute();




?>

<section>
    <div class="container-fluid bg-center">
        <div class="row justify-content-center mt-5">
            <?php while ($row = $requete->fetch(PDO::FETCH_OBJ)) 
                { ?>
                    <div class="card col-2 p-2 m-1 ">
                            <div class="card-body">
                                <p class="text"><a id="a" href="detail.php?disc_genre=<?php echo $row->disc_genre ?>"><?php echo $row->disc_genre ?></a></br>
                                                                        <!-- <?php echo $row->disc_price." €" ?></p> -->
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