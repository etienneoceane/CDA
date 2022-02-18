<?php

namespace App\Controller;

use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AccueilController extends AbstractController
{
    /**
     * @Route("/accueil", name="accueil")
     */
    public function rubriques(RubriqueRepository $repo): Response
    {
        $rubriques = $repo->findAll();

        return $this->render('accueil/accueil.html.twig', [
            'rubriques' => $rubriques
        ]);
    }
}
