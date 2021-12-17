<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\EditePasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AccountController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/compte", name="account")
     */
    public function index(): Response
    {
        return $this->render('account/index.html.twig', [
            'controller_name' => 'AccountController',
        ]);
    }


    /**
     * @Route("/compte/modifier-mon-mot-de-passe", name="account_edite_password")
     */
    public function editePassword(Request $request, UserPasswordEncoderInterface $encoder): Response
    {
        $user = $this->getUser();
        $form = $this->createForm(EditePasswordType::class, $user);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $currentPassword = $form->get('passwordCurrent')->getData();

            if ($encoder->isPasswordValid($user, $currentPassword)) {
                $user->setPassword($encoder->encodePassword($user,  $form->get('newPassword')->getData()));

                $this->entityManager->persist($user);
                $this->entityManager->flush();
            }
        }

        return $this->render('account/editePassword.html.twig', [
            'formEditePassword' => $form->createView(),
        ]);
    }
}
