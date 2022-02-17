<?php

namespace App\Entity;

use App\Repository\LivraisonRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=LivraisonRepository::class)
 */
class Livraison
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=false)
     */
    private $num_bon;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $date;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $etat;

    /**
     * @ORM\OneToMany(targetEntity=Commande::class, mappedBy="livraison")
     */
    private $commande;

    /**
     * @ORM\OneToMany(targetEntity=Expedition::class, mappedBy="Livraison")
     */
    private $expeditions;

    

    public function __construct()
    {
        $this->commande = new ArrayCollection();
        $this->expeditions = new ArrayCollection();
        
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNumBon(): ?string
    {
        return $this->num_bon;
    }

    public function setNumBon(?string $num_bon): self
    {
        $this->num_bon = $num_bon;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(?\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getEtat(): ?string
    {
        return $this->etat;
    }

    public function setEtat(?string $etat): self
    {
        $this->etat = $etat;

        return $this;
    }

    /**
     * @return Collection|Commande[]
     */
    public function getCommande(): Collection
    {
        return $this->commande;
    }

    public function addCommande(Commande $commande): self
    {
        if (!$this->commande->contains($commande)) {
            $this->commande[] = $commande;
            $commande->setLivraison($this);
        }

        return $this;
    }

    public function removeCommande(Commande $commande): self
    {
        if ($this->commande->removeElement($commande)) {
            // set the owning side to null (unless already changed)
            if ($commande->getLivraison() === $this) {
                $commande->setLivraison(null);
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
            $expedition->setLivraison($this);
        }

        return $this;
    }

    public function removeExpedition(Expedition $expedition): self
    {
        if ($this->expeditions->removeElement($expedition)) {
            // set the owning side to null (unless already changed)
            if ($expedition->getLivraison() === $this) {
                $expedition->setLivraison(null);
            }
        }

        return $this;
    }

}
