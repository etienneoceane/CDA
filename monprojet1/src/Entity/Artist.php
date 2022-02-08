<?php

namespace App\Entity;

use App\Repository\ArtistRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ArtistRepository::class)
 */
class Artist
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
    private $artist_name;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $artist_url;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getArtistName(): ?string
    {
        return $this->artist_name;
    }

    public function setArtistName(?string $artist_name): self
    {
        $this->artist_name = $artist_name;

        return $this;
    }

    public function getArtistUrl(): ?string
    {
        return $this->artist_url;
    }

    public function setArtistUrl(?string $artist_url): self
    {
        $this->artist_url = $artist_url;

        return $this;
    }
}
