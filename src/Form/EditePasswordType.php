<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class EditePasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder

            ->add('passwordCurrent', PasswordType::class, [
                'label' => 'Votre email',
                'attr' => [
                    'placeholder' => 'Veuillez saisir votre mot de passe actuel'
                ],
                'mapped' => false
            ])
            ->add('newPassword', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Le mot de passe et confirmation doivent être identiques.',
                'label' => 'Votre nouveau mot de passe',
                'mapped' => false,
                'required'  => true,
                'first_options' => ['label' => 'Mot de passe'],
                'second_options' => ['label' => 'Confirmez votre nouveau  mot de passe']
            ])
            ->add('submit', SubmitType::class, [
                'label' => "Modifier"
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
