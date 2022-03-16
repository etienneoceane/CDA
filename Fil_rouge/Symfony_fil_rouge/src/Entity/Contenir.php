<?php

namespace App\Entity;

use App\Repository\ContenirRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ContenirRepository::class)
 */
class Contenir
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $qtite_commande;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2,  nullable=true)
     */
    private $prix_vente;

    /**
     * @ORM\ManyToOne(targetEntity=Produit::class, inversedBy="contenirs")
     */
    private $produits;

    /**
     * @ORM\ManyToOne(targetEntity=Commande::class, inversedBy="contenirs")
     * @ORM\JoinColumn(nullable=false)
     */
    private $commande;

    public function __construct()
    {
        $this->Produits = new ArrayCollection();
        $this->commandes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQtiteCommande(): ?int
    {
        return $this->qtite_commande;
    }

    public function setQtiteCommande(int $qtite_commande): self
    {
        $this->qtite_commande = $qtite_commande;

        return $this;
    }

    public function getPrixVente(): ?string
    {
        return $this->prix_vente;
    }

    public function setPrixVente(?string $prix_vente): self
    {
        $this->prix_vente = $prix_vente;

        return $this;
    }

    public function getProduits(): ?Produit
    {
        return $this->produits;
    }

    public function setProduits(?Produit $produits): self
    {
        $this->produits = $produits;

        return $this;
    }

    public function getCommande(): ?Commande
    {
        return $this->commande;
    }

    public function setCommande(?Commande $commande): self
    {
        $this->commande = $commande;

        return $this;
    }
}
