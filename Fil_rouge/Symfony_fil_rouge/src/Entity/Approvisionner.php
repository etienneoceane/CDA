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
     * @ORM\OneToMany(targetEntity=Produit::class, mappedBy="approvisionner")
     */
    private $produits;

    /**
     * @ORM\OneToMany(targetEntity=Fournisseur::class, mappedBy="approvisionner")
     */
    private $fournisseur;

    public function __construct()
    {
        $this->produits = new ArrayCollection();
        $this->fournisseur = new ArrayCollection();
    }

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

    /**
     * @return Collection|Produit[]
     */
    public function getProduits(): Collection
    {
        return $this->produits;
    }

    public function addProduit(Produit $produit): self
    {
        if (!$this->produits->contains($produit)) {
            $this->produits[] = $produit;
            $produit->setApprovisionner($this);
        }

        return $this;
    }

    public function removeProduit(Produit $produit): self
    {
        if ($this->produits->removeElement($produit)) {
            // set the owning side to null (unless already changed)
            if ($produit->getApprovisionner() === $this) {
                $produit->setApprovisionner(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Fournisseur[]
     */
    public function getFournisseur(): Collection
    {
        return $this->fournisseur;
    }

    public function addFournisseur(Fournisseur $fournisseur): self
    {
        if (!$this->fournisseur->contains($fournisseur)) {
            $this->fournisseur[] = $fournisseur;
            $fournisseur->setApprovisionner($this);
        }

        return $this;
    }

    public function removeFournisseur(Fournisseur $fournisseur): self
    {
        if ($this->fournisseur->removeElement($fournisseur)) {
            // set the owning side to null (unless already changed)
            if ($fournisseur->getApprovisionner() === $this) {
                $fournisseur->setApprovisionner(null);
            }
        }

        return $this;
    }
}
