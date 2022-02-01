<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dates et heures.php</title>
</head>
<body>
    <h1>LES DATES ET LES HEURES</h1>

<?php
// EXERCICE 1 Trouvez le numéro de semaine de la date suivante : 14/07/2019.

// date_default_timezone_set("Europe/Paris");

// $date = "2019-07-14";
// $semaine = date('W',strtotime($date)); // on utilise 'W' pour le nombre de la semaine
// echo "Il s'agit de la semaine $semaine"."<br>";

// $d1 = DateTime::createFromFormat("d\m\Y","14/07/2019");
// var_dump( $d1->format("W"));

?>
<br>
<?php
// EXERCICE 2 Combien reste-t-il de jours avant la fin de votre formation.

$aujourdhui = date_create('2022-01-31');
$finform = date_create('2022-07-08');
$interval = date_diff($aujourdhui, $finform);
echo "Il reste ".$interval->format('%a')." jours avant la fin de la formation"; //%a pour compter en nombre de jours
?>
<br>
<?php
// EXERCICE 3 Comment déterminer si une année est bissextile ?

function bissextile($annee)
    {
        return "L'année ".$annee. " est bissextile : ". (date("m-d", strtotime("$annee-02-29")) == "02-29" ? 'Oui' :'Non').".";;
    }

echo bissextile('2022');
?>
<br>
<?php
// EXERCICE 4  Montrez que la date du 32/17/2019 est erronée.

function valide($m,$d,$a)
{
    return "La date ".$m."-".$d."-".$a." est valide : ". ((checkdate($m,$d,$a))?'Oui':'Non')." .";
}
echo valide(17,32,2019);

?>
<br>
<?php
// EXERCICE 5 Affichez l'heure courante sous cette forme : 11h25.
$date = new DateTime();
var_dump ($date->format("H \hi")); // Affichage de quelque chose comme : Wednesday the 15thecho date('l \t\h\e jS');

?>
<br>
<?php
// EXERCICE 6 Ajoutez 1 mois à la date courante.
echo date("d-m-Y", strtotime('+1 month'));


?>
<br>
<?php
// EXERCICE 7 Que s'est-il passé le 1000200000

echo date("d-m-Y", 1000200000);

?>


    
</body>
</html>