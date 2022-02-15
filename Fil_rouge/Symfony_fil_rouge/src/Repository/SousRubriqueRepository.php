<?php

namespace App\Repository;

use App\Entity\SousRubrique;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SousRubrique|null find($id, $lockMode = null, $lockVersion = null)
 * @method SousRubrique|null findOneBy(array $criteria, array $orderBy = null)
 * @method SousRubrique[]    findAll()
 * @method SousRubrique[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SousRubriqueRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SousRubrique::class);
    }

    // /**
    //  * @return SousRubrique[] Returns an array of SousRubrique objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?SousRubrique
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
