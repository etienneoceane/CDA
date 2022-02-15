<?php

namespace App\Repository;

use App\Entity\Contenir;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Contenir|null find($id, $lockMode = null, $lockVersion = null)
 * @method Contenir|null findOneBy(array $criteria, array $orderBy = null)
 * @method Contenir[]    findAll()
 * @method Contenir[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContenirRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Contenir::class);
    }

    // /**
    //  * @return Contenir[] Returns an array of Contenir objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Contenir
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
