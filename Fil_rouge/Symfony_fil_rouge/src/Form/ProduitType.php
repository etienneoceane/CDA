<?php

namespace App\Form;

use App\Entity\Produit;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ProduitType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('caracteristiques')
            ->add('description',TextareaType::class, [
                'attr' => ['class' => 'tinymce'], 'required'=>false,
            ])
            ->add('stock',null,['attr'=>['min'=>0]])
            ->add('prixht')
            ->add('sousrubrique')
            ->add('photo',FileType::class,['mapped' => false, 'required'=>false,'attr'=>['accept'=>'image/*'],'data_class' => null])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Produit::class,
        ]);
    }
}
