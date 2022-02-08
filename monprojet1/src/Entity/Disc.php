<?php

namespace App\Entity;

use App\Repository\DiscRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=DiscRepository::class)
 */
class Disc
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
    private $disc_title;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $disc_year;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $disc_picture;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $disc_label;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $disc_genre;

    /**
     * @ORM\Column(type="decimal", precision=2, scale=2, nullable=true)
     */
    private $disc_price;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDiscTitle(): ?string
    {
        return $this->disc_title;
    }

    public function setDiscTitle(?string $disc_title): self
    {
        $this->disc_title = $disc_title;

        return $this;
    }

    public function getDiscYear(): ?int
    {
        return $this->disc_year;
    }

    public function setDiscYear(?int $disc_year): self
    {
        $this->disc_year = $disc_year;

        return $this;
    }

    public function getDiscPicture(): ?string
    {
        return $this->disc_picture;
    }

    public function setDiscPicture(?string $disc_picture): self
    {
        $this->disc_picture = $disc_picture;

        return $this;
    }

    public function getDiscLabel(): ?string
    {
        return $this->disc_label;
    }

    public function setDiscLabel(?string $disc_label): self
    {
        $this->disc_label = $disc_label;

        return $this;
    }

    public function getDiscGenre(): ?string
    {
        return $this->disc_genre;
    }

    public function setDiscGenre(?string $disc_genre): self
    {
        $this->disc_genre = $disc_genre;

        return $this;
    }

    public function getDiscPrice(): ?string
    {
        return $this->disc_price;
    }

    public function setDiscPrice(?string $disc_price): self
    {
        $this->disc_price = $disc_price;

        return $this;
    }
}
