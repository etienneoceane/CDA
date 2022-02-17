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
     * @ORM\Column(type="integer", nullable=true)
     */
    private $prix_vente;

    /**
     * @ORM\OneToMany(targetEntity=Commande::class, mappedBy="contenir")
     */
    private $commandes;

    /**
     * @ORM\ManyToOne(targetEntity=Produit::class, inversedBy="contenirs")
     */
    private $produits;

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

    public function getPrixVente(): ?int
    {
        return $this->prix_vente;
    }

    public function setPrixVente(?int $prix_vente): self
    {
        $this->prix_vente = $prix_vente;

        return $this;
    }



    /**
     * @return Collection|Commande[]
     */
    public function getCommandes(): Collection
    {
        return $this->commandes;
    }

    public function addCommande(Commande $commande): self
    {
        if (!$this->commandes->contains($commande)) {
            $this->commandes[] = $commande;
            $commande->setContenir($this);
        }

        return $this;
    }

    public function removeCommande(Commande $commande): self
    {
        if ($this->commandes->removeElement($commande)) {
            // set the owning side to null (unless already changed)
            if ($commande->getContenir() === $this) {
                $commande->setContenir(null);
            }
        }

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
