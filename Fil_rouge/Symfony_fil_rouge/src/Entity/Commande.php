<?php

namespace App\Entity;

use App\Repository\CommandeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CommandeRepository::class)
 */
class Commande
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $date;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $reduc;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2,  nullable=true)
     */
    private $prix_tot;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $date_reglem;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $date_fact;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $etat;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $adresse_livraison;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $ville_livraison;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $cp_livraison;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $adresse_facturation;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $ville_facturation;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $cp_facturation;

    /**
     * @ORM\ManyToOne(targetEntity=Client::class, inversedBy="commandes")
     * @ORM\JoinColumn(nullable=false)
     */
    private $client;

    /**
     * @ORM\ManyToOne(targetEntity=Livraison::class, inversedBy="commande")
     */
    private $livraison;

    /**
     * @ORM\OneToMany(targetEntity=Contenir::class, mappedBy="commande")
     */
    private $contenirs;

    public function __construct()
    {
        $this->contenirs = new ArrayCollection();
    }



    public function getId(): ?int
    {
        return $this->id;
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

    public function getReduc(): ?int
    {
        return $this->reduc;
    }

    public function setReduc(?int $reduc): self
    {
        $this->reduc = $reduc;

        return $this;
    }

    public function getPrixTot(): ?string
    {
        return $this->prix_tot;
    }

    public function setPrixTot(?string $prix_tot): self
    {
        $this->prix_tot = $prix_tot;

        return $this;
    }

    public function getDateReglem(): ?\DateTimeInterface
    {
        return $this->date_reglem;
    }

    public function setDateReglem(?\DateTimeInterface $date_reglem): self
    {
        $this->date_reglem = $date_reglem;

        return $this;
    }

    public function getDateFact(): ?\DateTimeInterface
    {
        return $this->date_fact;
    }

    public function setDateFact(?\DateTimeInterface $date_fact): self
    {
        $this->date_fact = $date_fact;

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

    public function getAdresseLivraison(): ?string
    {
        return $this->adresse_livraison;
    }

    public function setAdresseLivraison(?string $adresse_livraison): self
    {
        $this->adresse_livraison = $adresse_livraison;

        return $this;
    }

    public function getVilleLivraison(): ?string
    {
        return $this->ville_livraison;
    }

    public function setVilleLivraison(?string $ville_livraison): self
    {
        $this->ville_livraison = $ville_livraison;

        return $this;
    }

    public function getCpLivraison(): ?string
    {
        return $this->cp_livraison;
    }

    public function setCpLivraison(?string $cp_livraison): self
    {
        $this->cp_livraison = $cp_livraison;

        return $this;
    }

    public function getAdresseFacturation(): ?string
    {
        return $this->adresse_facturation;
    }

    public function setAdresseFacturation(?string $adresse_facturation): self
    {
        $this->adresse_facturation = $adresse_facturation;

        return $this;
    }

    public function getVilleFacturation(): ?string
    {
        return $this->ville_facturation;
    }

    public function setVilleFacturation(?string $ville_facturation): self
    {
        $this->ville_facturation = $ville_facturation;

        return $this;
    }

    public function getCpFacturation(): ?string
    {
        return $this->cp_facturation;
    }

    public function setCpFacturation(?string $cp_facturation): self
    {
        $this->cp_facturation = $cp_facturation;

        return $this;
    }

    public function getClient(): ?Client
    {
        return $this->client;
    }

    public function setClient(?Client $client): self
    {
        $this->client = $client;

        return $this;
    }

    public function getLivraison(): ?Livraison
    {
        return $this->livraison;
    }

    public function setLivraison(?Livraison $livraison): self
    {
        $this->livraison = $livraison;

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
            $contenir->setCommande($this);
        }

        return $this;
    }

    public function removeContenir(Contenir $contenir): self
    {
        if ($this->contenirs->removeElement($contenir)) {
            // set the owning side to null (unless already changed)
            if ($contenir->getCommande() === $this) {
                $contenir->setCommande(null);
            }
        }

        return $this;
    }

}
