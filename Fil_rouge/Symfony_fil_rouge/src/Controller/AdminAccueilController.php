<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Repository\ProduitRepository;
use App\Repository\CommandeRepository;
use App\Repository\RubriqueRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminAccueilController extends AbstractController
{
    /**
     * @Route("/admin/accueil", name="admin_accueil")
     */
    public function accueil(CommandeRepository $com): Response
    {

        return $this->render('admin_accueil/accueil.html.twig', [
            'commandes' => $com->findAll(),
        ]);
    }



}
