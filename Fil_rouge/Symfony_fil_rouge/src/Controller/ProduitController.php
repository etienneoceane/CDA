<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Form\ProduitType;
use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/produit")
 */
class ProduitController extends AbstractController
{
    /**
     * @Route("/", name="produit_index", methods={"GET"})
     */
    public function index(ProduitRepository $produit, RubriqueRepository $rub): Response
    {   $produits=$produit->findBy(array(), array('nom' => 'ASC'));
        $rubriques = $rub->findAll();
        return $this->render('produit/index.html.twig', [
            'produits' => $produits,
            'home' => $rubriques,
        ]);
    }

    /**
     * @Route("/new", name="produit_new", methods={"GET", "POST"})
     */
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $produit = new Produit();
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $aMimeTypes = array("image/gif", "image/jpeg", "image/jpg", "image/png", "image/x-png", "image/tiff");
            //   $img = ['products']['photo'];
            $objfichier = $request->files->get('produit');
            $fichier = $objfichier['photo'];

            if (in_array($fichier->getClientmimeType(), $aMimeTypes)) {
                if ($fichier->move('assets/src/', $fichier->getClientOriginalName())) {
                    $produit->setPhoto($fichier->getClientOriginalName());
                    $entityManager->persist($produit);
                    $entityManager->flush();

                    return $this->redirectToRoute('produit_index', [], Response::HTTP_SEE_OTHER);
                }
            }
        }
        return $this->renderForm('produit/new.html.twig', [
            'produit' => $produit,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="produit_show", methods={"GET"})
     */
    public function show($id,ProduitRepository $prod, RubriqueRepository $rub): Response
    {   $produit=$prod->findOneBy(['id'=>$id]);
        $rubriques = $rub->findAll();
        return $this->render('produit/show.html.twig', [
            'produit' => $produit,
            'home' => $rubriques,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="produit_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Produit $id, EntityManagerInterface $entityManager, RubriqueRepository $rub): Response
    {
        $form = $this->createForm(ProduitType::class, $id);
        $form->handleRequest($request);
        $rubriques = $rub->findAll();
        if ($form->isSubmitted() && $form->isValid()) 
        {
                $aMimeTypes = array("image/gif", "image/jpeg", "image/jpg", "image/png", "image/x-png", "image/tiff");
                //   $img = ['products']['photo'];
                $objfichier = $request->files->get('produit');

                $fichier = $objfichier['photo'];
                if (!empty($fichier)&& in_array($fichier->getClientmimeType(), $aMimeTypes)) 
                {
                    if ($fichier->move('assets/src/', $fichier->getClientOriginalName())) 
                    {
                        $id->setPhoto($fichier->getClientOriginalName());
                    }
                }
                $entityManager->flush();

                return $this->redirectToRoute('produit_index', [], Response::HTTP_SEE_OTHER);
        }
        return $this->renderForm('produit/edit.html.twig', [
            'produit' => $id,
            'form' => $form,
            'home' => $rubriques
        ]);
    }

    /**
     * @Route("/{id}", name="produit_delete", methods={"POST"})
     */
    public function delete(Request $request, Produit $produit, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$produit->getId(), $request->request->get('_token'))) {
            $entityManager->remove($produit);
            $entityManager->flush();
        }

        return $this->redirectToRoute('produit_index', [], Response::HTTP_SEE_OTHER);
    }
}
