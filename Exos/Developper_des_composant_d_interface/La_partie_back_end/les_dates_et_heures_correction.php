<?php



// Trouvez le numéro de semaine de la date suivante : 14/07/2019.

$d1 = DateTime::createFromFormat("d/m/Y", "14/07/2019");

echo $d1->format("W") . "\n";


// Combien reste-t-il de jours avant la fin de votre formation.

$d1 = new DateTime();
$d2 = DateTime::createFromFormat("d/m/Y", "08/07/2020");

$difference = $d1->diff($d2);

var_dump($difference->format("%a")); //string
var_dump($difference->days); //int

// Comment déterminer si une année est bissextile ?

var_dump($d2->format("L"));

// Montrez que la date du 32/17/2019 est erronée.

var_dump(checkdate(2, 29, 2022));

// Affichez l'heure courante sous cette forme : 11h25.

$d1 = new DateTime();
var_dump($d1->format("d/m/Y H\hi"));

// Ajoutez 1 mois à la date courante.

$d1->add(new DateInterval("P1M"));
var_dump($d1->format("d/m/Y H\hi"));

// Que s'est-il passé le 1000200000

$d3 = DateTime::createFromFormat("U", "1000200000");
var_dump($d3);
var_dump($d3->format("d/m/Y H\hi"));


var_dump(date("d/m/Y H:i", 1000200000));
