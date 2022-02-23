<?php

namespace App\Entity;

use App\Repository\ProduitRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProduitRepository::class)
 */
class Produit
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="text", length=255, nullable=true)
     */
    private $caracteristiques;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $photo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $stock;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2, nullable=true)
     */
    private $prixht;

    /**
     * @ORM\ManyToOne(targetEntity=SousRubrique::class, inversedBy="produits")
     * @ORM\JoinColumn(nullable=false)
     */
    private $sousrubrique;


    /**
     * @ORM\OneToMany(targetEntity=Contenir::class, mappedBy="produits")
     */
    private $contenirs;

    /**
     * @ORM\OneToMany(targetEntity=Approvisionner::class, mappedBy="produits")
     */
    private $approvisionners;

    /**
     * @ORM\OneToMany(targetEntity=Expedition::class, mappedBy="produits")
     */
    private $expeditions;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    public function __construct()
    {
        $this->contenirs = new ArrayCollection();
        $this->approvisionners = new ArrayCollection();
        $this->expeditions = new ArrayCollection();
    }



    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCaracteristiques(): ?string
    {
        return $this->caracteristiques;
    }

    public function setCaracteristiques(?string $caracteristiques): self
    {
        $this->caracteristiques = $caracteristiques;

        return $this;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(?string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPhoto(): ?string
    {
        return $this->photo;
    }

    public function setPhoto(?string $photo): self
    {
        $this->photo = $photo;

        return $this;
    }

    public function getStock(): ?int
    {
        return $this->stock;
    }

    public function setStock(?int $stock): self
    {
        $this->stock = $stock;

        return $this;
    }

    public function getPrixht(): ?string
    {
        return $this->prixht;
    }

    public function setPrixht(?string $prixht): self
    {
        $this->prixht = $prixht;

        return $this;
    }

 

    public function getSousrubrique(): ?SousRubrique
    {
        return $this->sousrubrique;
    }

    public function setSousrubrique(?SousRubrique $sousrubrique): self
    {
        $this->sousrubrique = $sousrubrique;

        return $this;
    }


    /**
     * @return Collection|Contenir[]
     */
    public function getContenirs(): Collection
    {
        return $this->contenirs;
    }

    public function addContenir(Contenir $contenir): self
    {
        if (!$this->contenirs->contains($contenir)) {
            $this->contenirs[] = $contenir;
            $contenir->setProduits($this);
        }

        return $this;
    }

    public function removeContenir(Contenir $contenir): self
    {
        if ($this->contenirs->removeElement($contenir)) {
            // set the owning side to null (unless already changed)
            if ($contenir->getProduits() === $this) {
                $contenir->setProduits(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Approvisionner[]
     */
    public function getApprovisionners(): Collection
    {
        return $this->approvisionners;
    }

    public function addApprovisionner(Approvisionner $approvisionner): self
    {
        if (!$this->approvisionners->contains($approvisionner)) {
            $this->approvisionners[] = $approvisionner;
            $approvisionner->setProduits($this);
        }

        return $this;
    }

    public function removeApprovisionner(Approvisionner $approvisionner): self
    {
        if ($this->approvisionners->removeElement($approvisionner)) {
            // set the owning side to null (unless already changed)
            if ($approvisionner->getProduits() === $this) {
                $approvisionner->setProduits(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Expedition[]
     */
    public function getExpeditions(): Collection
    {
        return $this->expeditions;
    }

    public function addExpedition(Expedition $expedition): self
    {
        if (!$this->expeditions->contains($expedition)) {
            $this->expeditions[] = $expedition;
            $expedition->setProduits($this);
        }

        return $this;
    }

    public function removeExpedition(Expedition $expedition): self
    {
        if ($this->expeditions->removeElement($expedition)) {
            // set the owning side to null (unless already changed)
            if ($expedition->getProduits() === $this) {
                $expedition->setProduits(null);
            }
        }

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

   }
