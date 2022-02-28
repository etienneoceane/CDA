<?php

namespace App\Controller;

use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use App\Repository\SousRubriqueRepository;
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
        $produit = $prod->findAll();
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
            $total+= $totalItem+($totalItem*0.05);
        }
        return $this->render('contenir/panier.html.twig',[
            'home' => $rubriques,
            'items'=>$panierAvecDonnees,
            'total'=>$total,
            'produit'=>$produit
        ]);
    }


    /**
     * @Route("/panier/add/{id}", methods={"POST"}, name="panier_add")
     */
    public function panier_add($id, Request $request, SessionInterface $session, RubriqueRepository $rub, SousRubriqueRepository $sousrepo, ProduitRepository $repo)
    {
        $panier=$session->get('panier',[]);
        $quantite=$request->request->get('qte');
            if(!empty($panier[$id]))
            {

                $panier[$id] = $panier[$id] + (1* $quantite) ;
            } 
            else
            {
                $panier[$id] = 1 * $quantite;
            }
        
        $session->set('panier',$panier);

        $response = $this->forward('App\Controller\AccueilController::Details', [
            'rub'=> $rub,
            'sousrepo'=>$sousrepo,
            'repo'=>$repo,
            'id'=>$id
        ]);
    

    
        return $response;
    } 

    /**
     * @Route("/panier_delete/{id}", name="panier_delete")
     */

    public function delete($id, SessionInterface $session,Request $request)
    {
        $panier=$session->get('panier',[]);
        if(!empty($panier[$id]) ) 
        {
            
            unset($panier[$id]);
        }

        $session->set('panier',$panier);

        return $this->redirectToRoute("panier");
    }

    /**
     * @Route("/panier_update/{id}", name="panier_update")
     */

    public function update($id, SessionInterface $session,Request $request)
    {
        $panier=$session->get('panier',[]);
        $quantite=$request->request->get('qte');
        // if(!empty($panier[$id]))
        // {
            if($quantite>0){
            $panier[$id] = (1* $quantite) ;
            }
            else{
                unset($panier[$id]);
            }
        // } 
        $session->set('panier',$panier);

        return $this->redirectToRoute("panier");
    }

    


}
