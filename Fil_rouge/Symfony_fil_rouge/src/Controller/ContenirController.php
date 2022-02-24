<?php

namespace App\Controller;

use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ContenirController extends AbstractController
{

    /**
     * @Route("/panier_add", name="panier_add")
     */
    public function panier_add(SessionInterface $session, ProduitRepository $prod, Request $request): Response
    {
        $panier = $session->get("panier",[]);
        if ($request->getMethod() == 'POST') {
            $produit = $prod->find($request->get('produit'));
            $panier[$request->get('produit')] = [
                "nom" => $request->get('name'),
                "photo" => $request->get('photo'),
                "qte" => $request->get('qte'),
                "stock" => $produit->getStock()
            ];
            $session->set("panier", $panier);
        }
        dump($panier);

        /* $referer = $request->headers->get('referer');
        return new RedirectResponse($referer); */
        return $this->render('accueil/details.html.twig', [
            /* $rubrique afficher les rubriques dans la navbar */

        ]);
    }

    /**
     * @Route("/paniers/", name="paniers")
     */
    public function panier(SessionInterface $session, ProduitRepository $prod, RubriqueRepository $cat): Response
    {
        $panier = $session->get("panier");
        if(!empty($panier)){


        foreach ($panier as $key => $row) {
            $produit = $prod->find($key);

            $panier[$key]['prixht'] = $produit->getPrixht();
            $panier[$key]['stock'] = $produit->getStock();
            // $panier[$key]['total'] = $produit->getPrice()* $panier[$key]["qte"];
        }
        }
        //var_dump($panier);
        return $this->render('paniers/index.html.twig', [
            'panier' => $panier,
            'menu' => $cat->findAll()
        ]);
    }
}
