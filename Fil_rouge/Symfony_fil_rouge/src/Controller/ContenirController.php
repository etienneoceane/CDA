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
     * @Route("/panier", name="panier")
     */

    public function index(SessionInterface $session, ProduitRepository $prod, RubriqueRepository $rub)
    {
        $rubriques = $rub->findAll();
        $panier=$session->get('panier',[]);
        $panierAvecDonnees= [];
        foreach ($panier as $id  => $qte)
        {
            $panierAvecDonnees[]=[
                'produit'=> $prod->find($id), 
                'quantite'=> $qte
            ];
        }
        $total=0;
        foreach($panierAvecDonnees as $item){
            $totalItem =$item['produit']->getPrixht() * $item['quantite'];
            $total+= $totalItem;
        }
        return $this->render('contenir/index.html.twig',[
            'home' => $rubriques,
            'items'=>$panierAvecDonnees,
            'total'=>$total
        ]);
    }


    /**
     * @Route("/panier/add/{id}", name="panier_add")
     */
    public function panier_add($id, SessionInterface $session)
    {
        $panier=$session->get('panier',[]);

        if(!empty($panier[$id]))
        {
            $panier[$id]++;
        } 
        else
        {
        $panier[$id]=1;
        }

        $session->set('panier',$panier);
        dd($session->get('panier'));
    
    }

}
