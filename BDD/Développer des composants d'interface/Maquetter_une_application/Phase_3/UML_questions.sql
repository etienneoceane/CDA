Identifiez les acteurs.

Acteurs principaux:
Usager
Employé
Bénévoles

Ecrivez le scénario principal et les scénarios alternatifs pour le cas dusage qui concerne lemprunt dune ressource.

Scenario Emprunter

< Le système propose de rentrer le numero carte usager
> Le client entre le numéro et valide

< Le système vérifie le paiement de la cotisation:
    - OK Le système demande de scanner le premier produit
    - le systéme vérifie le nombre demprunt // on vérifie pas avant car le client peut avoir 10 emprunts dun coup et on risquerais de repeter lopération
    - Pas OK Le système affiche une alerte cotisation non payé

>
    - si ok donne le produit à scanner
    - si pas ok paye la cotisation demandé

< Création de la fiche de lemprunt
