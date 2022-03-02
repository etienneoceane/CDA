<?php

namespace App\Controller;

use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use App\Repository\SousRubriqueRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminAccueilController extends AbstractController
{
    /**
     * @Route("/admin/accueil", name="admin_accueil")
     */
    public function Rubriques(RubriqueRepository $rub, SousRubriqueRepository $repo): Response

    {
        $rubriques = $rub->findAll();

        return $this->render('admin_accueil/accueil.html.twig', [
            /* $rubrique afficher les rubriques dans la navbar */
            'home' => $rubriques
        ]);
    }

}
