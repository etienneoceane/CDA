<?php

namespace App\Repository;

use App\Entity\Expedition;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Expedition|null find($id, $lockMode = null, $lockVersion = null)
 * @method Expedition|null findOneBy(array $criteria, array $orderBy = null)
 * @method Expedition[]    findAll()
 * @method Expedition[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ExpeditionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Expedition::class);
    }

    // /**
    //  * @return Expedition[] Returns an array of Expedition objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Expedition
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
