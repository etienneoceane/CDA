<?php

namespace App\Entity;

use App\Repository\ApprovisionnerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ApprovisionnerRepository::class)
 */
class Approvisionner
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
    private $prix_achat;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $date_commande;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $date_liv;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $qtite;

    /**
     * @ORM\ManyToOne(targetEntity=Fournisseur::class, inversedBy="approvisionners")
     */
    private $fournisseurs;

    /**
     * @ORM\ManyToOne(targetEntity=Produit::class, inversedBy="approvisionners")
     */
    private $produits;

    

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPrixAchat(): ?int
    {
        return $this->prix_achat;
    }

    public function setPrixAchat(int $prix_achat): self
    {
        $this->prix_achat = $prix_achat;

        return $this;
    }

    public function getDateCommande(): ?\DateTimeInterface
    {
        return $this->date_commande;
    }

    public function setDateCommande(\DateTimeInterface $date_commande): self
    {
        $this->date_commande = $date_commande;

        return $this;
    }

    public function getDateLiv(): ?\DateTimeInterface
    {
        return $this->date_liv;
    }

    public function setDateLiv(?\DateTimeInterface $date_liv): self
    {
        $this->date_liv = $date_liv;

        return $this;
    }

    public function getQtite(): ?int
    {
        return $this->qtite;
    }

    public function setQtite(?int $qtite): self
    {
        $this->qtite = $qtite;

        return $this;
    }

    public function getFournisseurs(): ?Fournisseur
    {
        return $this->fournisseurs;
    }

    public function setFournisseurs(?Fournisseur $fournisseurs): self
    {
        $this->fournisseurs = $fournisseurs;

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


}
