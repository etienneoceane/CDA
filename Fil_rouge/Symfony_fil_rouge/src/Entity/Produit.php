<?php

namespace App\Entity;

use App\Repository\ProduitRepository;
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
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $description;

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
     * @ORM\Column(type="decimal", precision=10, scale=0, nullable=true)
     */
    private $prixht;

    /**
     * @ORM\ManyToOne(targetEntity=SousRubrique::class, inversedBy="produits")
     * @ORM\JoinColumn(nullable=false)
     */
    private $sousrubrique;

    /**
     * @ORM\ManyToOne(targetEntity=Expedition::class, inversedBy="produits")
     */
    private $expedition;

    /**
     * @ORM\ManyToOne(targetEntity=Approvisionner::class, inversedBy="produits")
     */
    private $approvisionner;

    /**
     * @ORM\ManyToOne(targetEntity=Contenir::class, inversedBy="Produits")
     */
    private $contenir;



    public function getId(): ?int
    {
        return $this->id;
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

    public function getExpedition(): ?Expedition
    {
        return $this->expedition;
    }

    public function setExpedition(?Expedition $expedition): self
    {
        $this->expedition = $expedition;

        return $this;
    }

    public function getApprovisionner(): ?Approvisionner
    {
        return $this->approvisionner;
    }

    public function setApprovisionner(?Approvisionner $approvisionner): self
    {
        $this->approvisionner = $approvisionner;

        return $this;
    }

    public function getContenir(): ?Contenir
    {
        return $this->contenir;
    }

    public function setContenir(?Contenir $contenir): self
    {
        $this->contenir = $contenir;

        return $this;
    }

   }
