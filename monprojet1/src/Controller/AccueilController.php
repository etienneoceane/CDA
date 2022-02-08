<?php

namespace App\Controller;

use App\Repository\ArtistRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

   /**
     * @Route("/accueil", name="accueil")
     */

class AccueilController extends AbstractController
{
    /**
     * @Route("/liste", name="artiste_liste")
     */

    public function artiste_liste(ArtistRepository $repo): Response
    {

        $liste_artistes= $repo->findAll();
        dump($liste_artistes);

        return $this->render('accueil/index.html.twig', [
            'artists' => $liste_artistes,

        ]);
    }
}
