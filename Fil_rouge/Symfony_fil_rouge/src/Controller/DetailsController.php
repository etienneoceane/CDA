<?php

namespace App\Controller;

use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class DetailsController extends AbstractController
{
    /**
     * @Route("/details", name="details")
     */
    public function index(RubriqueRepository $rubrepo): Response
    {
    /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();


        return $this->render('details/details.html.twig', [
            'rubriques' => $rubriques,
        ]);
    }
}
