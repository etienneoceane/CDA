Cas d'utilisation: Enregistrer un emprunt

Conditions:
L'usager est déja inscrit
L'usager est en règle avec sa cotisation
L'usager se présente au guichet avec des ressources
L'usager peut consulter le catalogue via un PC en libre service

Résultats:
Une fiche emprunt est enregistrée dans le système

Flux nominal:

1)
> L'employé clique sur créer un nouvel emprunt
< Le système affiche un formulaire permettant de selectionner le client
        On peut saisir le numéro du client (ou scanner la carte)
        Ou trouver le client dans la liste (en recherchant par nom et prénom)

2)
> L'employé selectionne le client et clique sur "valider" 
< Le système affiche la fiche client (coordonnées, nombre d'emprunts, cotisation...) ()

3)
> L'employe clique sur ajouter un nouveau document
< Le système affiche un formulaire de saisie du code barre de la ressource

4)
> L'employe saisie le code de la ressource
< Le système affiche la synthèse de l'emprunt et propose de saisir un nouveau document (Cette étape est reproduite autant de fois que de document)

5)
> L'employé valide la syntèse de l'emprunt
< Le système met à jour les informations de l'emprunt et procède à la création de la fiche emprunt.






Flux alternatifs:

A l'étape 2:
Le client n'est pas à jour de sa cotisation
Le système affiche une alerte et ...

A l'étape 2:
> Le client indique que ses coordonnées ne sont pas correctes
< Le système affiche un formulaire de modification du client
>
<


A l'étape 4:
Si le nombre de documents empruntés est supèrieur à 5
Le système affiche une alerte et bloque la saisie de nouveaux documents.


A l'étape 4:
Si la ressource est un CDROM
Le système vérifie que la caution a bien été donnée.
Sinon Le système affiche une alerte et ...


A l'étape 4:
Si la ressource est un microfilm
Le système vérifie la disponibilité d'un lecteur.
Sinon Le système affiche une alerte et ...