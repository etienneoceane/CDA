<?php

namespace App\Entity;

use App\Repository\RubriqueRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=RubriqueRepository::class)
 */
class Rubrique
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
    private $nom;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $description;

    /**
     * @ORM\OneToMany(targetEntity=SousRubrique::class, mappedBy="rubrique")
     */
    private $sousRubriques;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $photos;

    public function __construct()
    {
        $this->sousRubriques = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection|SousRubrique[]
     */
    public function getSousRubriques(): Collection
    {
        return $this->sousRubriques;
    }

    public function addSousRubrique(SousRubrique $sousRubrique): self
    {
        if (!$this->sousRubriques->contains($sousRubrique)) {
            $this->sousRubriques[] = $sousRubrique;
            $sousRubrique->setRubrique($this);
        }

        return $this;
    }

    public function removeSousRubrique(SousRubrique $sousRubrique): self
    {
        if ($this->sousRubriques->removeElement($sousRubrique)) {
            // set the owning side to null (unless already changed)
            if ($sousRubrique->getRubrique() === $this) {
                $sousRubrique->setRubrique(null);
            }
        }

        return $this;
    }

    public function getPhotos(): ?string
    {
        return $this->photos;
    }

    public function setPhotos(?string $photos): self
    {
        $this->photos = $photos;

        return $this;
    }
}
