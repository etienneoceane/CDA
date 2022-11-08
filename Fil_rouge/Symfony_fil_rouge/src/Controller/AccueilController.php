<?php

namespace App\Controller;

use App\Repository\ClientRepository;
use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use App\Repository\SousRubriqueRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AccueilController extends AbstractController
{
    /**
     * @Route("/accueil", name="accueil")
     */
    public function Rubriques(RubriqueRepository $rub, SousRubriqueRepository $repo, ClientRepository $cli): Response
    {
        $rubriques = $rub->findAll();

        return $this->render('accueil/accueil.html.twig', [
            /* $rubrique afficher les rubriques dans la navbar */
            'home' => $rubriques
        ]);
    }

    /**
     * @Route("/sousrubrique/{id}", name="sousrubrique")
     */
    public function Sousrubriques(RubriqueRepository $rub, SousRubriqueRepository $repo, $id ): Response
    {        
        $rubriques = $rub->findAll();
        $listesousrubriques=$repo->findBy(['rubrique'=>$id]);

        return $this->render('accueil/sousrubriques.html.twig', [
            /* $rubrique afficher les rubriques dans la navbar */
            'home' => $rubriques,
            'listesousrubriques'=>$listesousrubriques
            ]);
    }
    
    /**
     * @Route("/listeproduits/{id}", name="listeproduits")
     */
    public function Listeproduits(ProduitRepository $repo, $id, RubriqueRepository $rubrepo): Response
    {
        $produit = $repo->findBy(['sousrubrique'=>$id]);
        

        return $this->render('accueil/listeproduits.html.twig', [
            'produit' => $produit,
            /* $rubrique afficher les rubriques dans la navbar */
            'home' => $rubrepo->findAll()
        ]);
    }


    /**
     * @Route("/details/{id}", name="details")
     */

    public function Details(RubriqueRepository $rub, SousRubriqueRepository $sousrepo, ProduitRepository $repo, $id): Response
    {
        $rubriques = $rub->findAll();
        $listesousrubriques=$sousrepo->findBy(['rubrique'=>$id]);
        $produit = $repo->findOneBy(['id'=>$id]);


        return $this->render('accueil/details.html.twig', [
            /* $rubrique afficher les rubriques dans la navbar */
            'home' => $rubriques,
            'listesousrubriques'=>$listesousrubriques,
            'produit' => $produit,

        ]);
    }    

    /**
     * @Route("/profil", name="profil_client")
     */
    public function ProfilClient( RubriqueRepository $rub): Response
    {
        $rubriques = $rub->findAll();


        return $this->render('profil/profil.html.twig', [
            'home' => $rubriques,

        ]);
    }


        /**
     * @Route("/recap_profil", name="recap_profil")
     */
    public function ProfilRecapClient( RubriqueRepository $rub): Response
    {
        $rubriques = $rub->findAll();


        return $this->render('profil/recap_profil.html.twig', [
            'home' => $rubriques,

        ]);
    }
}
