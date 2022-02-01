<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>fonctions.php</title>
</head>
<body>

<!-- EXERCICE 1 Ecrivez une fonction qui permette de générer un lien.
La fonction doit prendre deux paramètres, le lien et le titre -->

    <?php

    function lien ($lien,$titre)
    {
        return "<a href=" . $lien .">" . $titre. "</a>";
    }   
    echo lien("https://www.reddit.com/","Reddit Hug");

    ?>

<!-- EXERCICE 2 Ecrivez une fonction qui calcul la somme des valeurs d'un tableau
La fonction doit prendre un paramètre de type tableau -->

<?php

$tab=array(4,3,8,2) ;
$resultat= somme($tab); //$resultat applique la fonction somme sur $tab

function somme($tableau)
{
    // $calcul = 0;
    // foreach($tableau as $value){
    //     $calcul += $value;  //+= addition(+) puis affectation(=) 
    // }
    $somme =array_sum($tableau);
    return $somme;
}
echo $resultat;
?>

<!-- EXERCICE 3  Créer une fonction qui vérifie le niveau de complexité d'un mot de passe
Elle doit prendra un paramètre de type chaîne de caractères. Elle retournera une valeur booléenne qui vaut true si le paramètre (le mot de passe) respecte les règles suivantes :
Faire au moins 8 caractères de long
Avoir au moins 1 chiffre
Avoir au moins une majuscule et une minuscule -->

<?php
$resultat = complex_password("TopSecret42");
function complex_password($mdp)
{
    $maj = preg_match('@[A-Z]@', $mdp); // preg_match Effectue une recherche de correspondance
    $min = preg_match('@[a-z]@', $mdp);
    $chiffre = preg_match('@[0-9]@', $mdp);
    

    if(!$maj || !$min || !$chiffre || strlen($mdp) < 8)
    {
        return $resultatmdp="false";
    }
    else {
        return $resultatmdp="true";
    }
    
}
echo $resultat;
?>

</body>
</html>