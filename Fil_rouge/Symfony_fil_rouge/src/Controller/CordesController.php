<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CordesController extends AbstractController
{
    /**
     * @Route("/cordes", name="cordes")
     */
    public function index(): Response
    {
        return $this->render('cordes/cordes.html.twig', [
            'controller_name' => 'CordesController',
        ]);
    }
}
