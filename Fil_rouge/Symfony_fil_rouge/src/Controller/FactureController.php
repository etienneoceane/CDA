<?php

namespace App\Controller;

use App\Entity\Commande;
use Knp\Snappy\Pdf;
use Knp\Bundle\SnappyBundle\Snappy\Response\PdfResponse;
use App\Repository\ClientRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FactureController extends AbstractController
{
    /**
     * @Route("/facture/pdf/{commande}", name="facturePdf")
     */

    public function facturePdf(Pdf $knpSnappyPdf, Commande $commande, ClientRepository $cli)
    {
        // if ($commande->getClient() !== $cli->findOneBy(['users' => $this->getUser()]) and $this->getUser()->getRoles() == "ROLE_USER") {
        //     return $this->redirectToRoute('accueil');
        // }
        $user=
        $client=$cli->findByUser($);
        $html = $this->renderView('facture/index.html.twig', array(
            'commande' => $commande
        ));
        // header("Content-type:application/pdf");
        return new PdfResponse(
            $knpSnappyPdf->getOutputFromHtml($html),
            'facture-numero-' . $commande->getId() . '.pdf'
        );
    }

    /**
     * @Route("/facture/vu/{commande}", name="facture")
     */

    public function facture(Commande $commande, ClientRepository $client): Response
    {
        // if ($commande->getClient() !== $client->findOneBy(['users' => $this->getUser()]) and !in_array("ROLE_ADMIN", $this->getUser()->getRoles())) {

        //     return $this->redirectToRoute('accueil');
        // }
        return $this->render('facture/index.html.twig', [
                'commande' => $commande
            ]
        );
    }

}
