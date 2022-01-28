<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    

<!-- LES BOUCLES -->

<!--EXERCICE 1 -->

    <?php 
    for ($i=0; $i<150;$i++) {
        if ($i%2==1){
            echo"<div>".$i."</div>";
        }
    }
    ?>

<!--EXERCICE 2 -->


<!-- //Écrire un programme qui écrit 500 fois la phrase Je dois faire des sauvegardes régulières de mes fichiers. -->

<?php 
// for ($i=0; $i<500; $i++) {
// echo 'Je dois faire des sauvegardes régulières de mes fichiers<br>';
// }
?>



<!--Exercice 3-->
<!-- //Ecrire un script qui affiche la table de multiplication totale de {1,...,12} par {1,...,12}, -->

<table border="1">
    <?php
        for($li=0; $li<10; $li++) {
            echo"<tr>";
                for($co=0; $co<10; $co++) {
                    if($li==0) {
                        echo "<th>". $co ."</th>";
                    } elseif ($co==0){
                        echo "<th>". $li ."</th>";
                    } else {
                        echo "<td>" . $li*$co . "</td>";
                    }
                }
            echo"</tr>";    
        }
    ?>    
</table>





<!-- LES TABLEAUX -->
<!-- Exercice 1 -->
<!-- Créez un tableau associant à chaque mois de l’année le nombre de jours du mois.
Utilisez le nom des mois comme clés de votre tableau associatif.
Affichez votre tableau (dans un tableau HTML) pour faire apparaitre sur chaque ligne le nom du mois et le nombre de jours du mois.
Triez ensuite votre tableau en utilisant comme critère le nombre de jours, puis affichez le résultat. -->

<?php
    $tab=[
    "Janvier"=> 31,
    "Février"=>28,
    "Mars"=>31,
    "Avril"=>30,
    "Mai"=>31,
    "Juin"=>30,
    "Juillet"=>31,
    "Aout"=>31,
    "Septembrer"=>30,
    "Octobre"=>31,
    "Novembre"=>30,
    "Décembre"=>31,
    ];

    asort($tab);
    
?>

<table border="1">
    <tr>
        <th>Mois</th>
        <th>Jours</th>
    </tr>
    <?php foreach($tab as $m => $j): ?>
        <tr>
            <td><?= $m ?></td>
            <td><?= $j ?></td>
        </tr>
    <?php endforeach; ?>
</table>

<!-- Exercice 2 -->
<?php
$capitales = array(
    "Bucarest" => "Roumanie",
    "Bruxelles" => "Belgique",
    "Oslo" => "Norvège",
    "Ottawa" => "Canada",
    "Paris" => "France",
    "Port-au-Prince" => "Haïti",
    "Port-d'Espagne" => "Trinité-et-Tobago",
    "Prague" => "République tchèque",
    "Rabat" => "Maroc",
    "Riga" => "Lettonie",
    "Rome" => "Italie",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Sofia" => "Bulgarie",
    "Alger" => "Algérie",
    "Amsterdam" => "Pays-Bas",
    "Andorre-la-Vieille" => "Andorre",
    "Asuncion" => "Paraguay",
    "Athènes" => "Grèce",
    "Bagdad" => "Irak",
    "Bamako" => "Mali",
    "Berlin" => "Allemagne",
    "Bogota" => "Colombie",
    "Brasilia" => "Brésil",
    "Bratislava" => "Slovaquie",
    "Varsovie" => "Pologne",
    "Budapest" => "Hongrie",
    "Le Caire" => "Egypte",
    "Canberra" => "Australie",
    "Caracas" => "Venezuela",
    "Jakarta" => "Indonésie",
    "Kiev" => "Ukraine",
    "Kigali" => "Rwanda",
    "Kingston" => "Jamaïque",
    "Lima" => "Pérou",
    "Londres" => "Royaume-Uni",
    "Madrid" => "Espagne",
    "Malé" => "Maldives",
    "Mexico" => "Mexique",
    "Minsk" => "Biélorussie",
    "Moscou" => "Russie",
    "Nairobi" => "Kenya",
    "New Delhi" => "Inde",
    "Stockholm" => "Suède",
    "Téhéran" => "Iran",
    "Tokyo" => "Japon",
    "Tunis" => "Tunisie",
    "Copenhague" => "Danemark",
    "Dakar" => "Sénégal",
    "Damas" => "Syrie",
    "Dublin" => "Irlande",
    "Erevan" => "Arménie",
    "La Havane" => "Cuba",
    "Helsinki" => "Finlande",
    "Islamabad" => "Pakistan",
    "Vienne" => "Autriche",
    "Vilnius" => "Lituanie",
    "Zagreb" => "Croatie"
);
asort($capitales);
?>

<table border="1">
    <tr>
        <th>Capitale</th>
        <th>Pays</th>
    </tr>
    <?php foreach($capitales as $c => $p): ?>
        <tr>
            <td><?= $c ?></td>
            <td><?= $p ?></td>
        </tr>
    <?php endforeach; ?>
</table>
<?php
$tab = array_keys($capitales);

foreach($tab as $cap) {
    if (strtolower(substr($cap, 0, 1))!="b") {
        unset($capitales[$cap]);
    }
}

var_dump($capitales);
?>
nb = <?= count($capitales);?>

<!-- A partir du tableau ci-dessus:
Affichez la liste des capitales (par ordre alphabétique) suivie du nom du pays.
Consultez la documentation PHP sur le tri des tableaux
Affichez la liste des pays (par ordre alphabétique) suivie du nom de la capitale.
Affichez le nombre de pays dans le tableau.
Supprimer du tableau toutes les capitales ne commençant par la lettre 'B', puis affichez le contenu du tableau. -->

<!-- Exercice 3 -->

<?php

$departements = [
    "Hauts-de-france" => ["Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"],
    "Bretagne" => ["Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"],
    "Grand-Est" => ["Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"],
    "Normandie" => ["Calvados", "Eure", "Manche", "Orne", "Seine-Maritime"]
];

ksort($departements);

?>

<table border="1">
    <tr>
        <th>Régions</th>
        <th>Nombres</th>
        <th>Départements</th>
    </tr>
    <?php foreach($departements as $reg => $dep): ?>
        <tr>
            <td><?= $reg ?></td>
            <td><?= count($dep) ?></td>
            <td>
                <?php foreach($dep as $d): ?>
                    <div>
                        <?= $d ?>
                    </div>
                <?php endforeach; ?>

            </td>
        </tr>
    <?php endforeach; ?>
</table>





































</body>
</html>