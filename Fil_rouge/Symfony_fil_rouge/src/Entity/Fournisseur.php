<?php

namespace App\Entity;

use App\Repository\FournisseurRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=FournisseurRepository::class)
 */
class Fournisseur
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
    private $prenom;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $raison;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $adresse;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $ville;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $cp;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $tel;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $contact_nom;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $contact_prenom;

    /**
     * @ORM\OneToMany(targetEntity=Approvisionner::class, mappedBy="fournisseurs")
     */
    private $approvisionners;



    public function __construct()
    {
        $this->approvisionners = new ArrayCollection();
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

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(?string $prenom): self
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getRaison(): ?string
    {
        return $this->raison;
    }

    public function setRaison(?string $raison): self
    {
        $this->raison = $raison;

        return $this;
    }


    public function getAdresse(): ?string
    {
        return $this->adresse;
    }

    public function setAdresse(?string $adresse): self
    {
        $this->adresse = $adresse;

        return $this;
    }

    public function getVille(): ?string
    {
        return $this->ville;
    }

    public function setVille(?string $ville): self
    {
        $this->ville = $ville;

        return $this;
    }

    public function getCp(): ?string
    {
        return $this->cp;
    }

    public function setCp(?string $cp): self
    {
        $this->cp = $cp;

        return $this;
    }

    public function getTel(): ?string
    {
        return $this->tel;
    }

    public function setTel(?string $tel): self
    {
        $this->tel = $tel;

        return $this;
    }

    public function getContactNom(): ?string
    {
        return $this->contact_nom;
    }

    public function setContactNom(?string $contact_nom): self
    {
        $this->contact_nom = $contact_nom;

        return $this;
    }

    public function getContactPrenom(): ?string
    {
        return $this->contact_prenom;
    }

    public function setContactPrenom(?string $contact_prenom): self
    {
        $this->contact_prenom = $contact_prenom;

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
            $approvisionner->setFournisseurs($this);
        }

        return $this;
    }

    public function removeApprovisionner(Approvisionner $approvisionner): self
    {
        if ($this->approvisionners->removeElement($approvisionner)) {
            // set the owning side to null (unless already changed)
            if ($approvisionner->getFournisseurs() === $this) {
                $approvisionner->setFournisseurs(null);
            }
        }

        return $this;
    }  
}
