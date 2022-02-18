<?php

namespace App\Controller;

use App\Entity\SousRubrique;
use App\Repository\RubriqueRepository;
use App\Repository\SousRubriqueRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class RubriqueSousRubriqueController extends AbstractController
{

    /**
     * @Route("/Cordes", name="Cordes")
     */
    public function RubriqueCordes(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(3);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }

    /**
     * @Route("/Batterie", name="/Batterie")
     */
    public function RubriqueBatteries(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(1);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }

    /**
     * @Route("/Cases", name="/Cases")
     */
    public function RubriqueCases(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(2);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }

    /**
     * @Route("/Studio", name="/Studio")
     */
    public function RubriqueStudio(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(4);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }

    /**
     * @Route("/Claviers", name="/Claviers")
     */
    public function RubriqueClavier(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(5);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }

    /**
     * @Route("/Vents", name="/Vents")
     */
    public function RubriqueVents(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(6);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }

    /**
     * @Route("/Sono", name="/Sono")
     */
    public function RubriqueSono(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(7);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }

    /**
     * @Route("/Cable", name="/Cable")
     */
    public function RubriqueCable(RubriqueRepository $rubrepo, SousRubriqueRepository $sousrepo): Response
    {
        /* $rubrique afficher les rubriques dans la navbar */
        $rubriques = $rubrepo->findAll();
        $sousrubriques = $sousrepo->findByRubrique(8);

        return $this->render('rubrique/sousrubriques.html.twig', [
            'rubriques' => $rubriques,
            'sousrubriques' => $sousrubriques

        ]);
    }
}
