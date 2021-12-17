<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Address;
use App\Form\AddressType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AccountAddressController extends AbstractController
{
    private $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    /**
     * @Route("/compte/adresse", name="account_address")
     */
    public function index()

    {

        return $this->render('account/address.html.twig', []);
    }

    /**
     * @Route("/compte/ajouter-une-adresse", name="account_address_add")
     */
    public function add(Cart $cart, Request $request)

    {
        $address = new Address();
        $form = $this->createForm(AddressType::class, $address);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $address->setUser($this->getUser());
            $this->em->persist($address);
            $this->em->flush();

            if ($cart->get()) {
                return $this->redirectToRoute('order');
            } else {
                return $this->redirectToRoute('account_address');
            }
        }

        return $this->render('account/address_add.html.twig', [
            'form_address' => $form->createView()
        ]);
    }


    /**
     * @Route("/compte/modifier-une-adresse/{id}", name="account_address_edite")
     */
    public function edite(Request $request, $id)

    {
        $address = $this->em->getRepository(Address::class)->findOneById($id);

        if (!$address || $address->getUser() != $this->getUser()) {
            return $this->redirectToRoute('account_address');
        }

        $form = $this->createForm(AddressType::class, $address);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $address->setUser($this->getUser());
            $this->em->flush();
            return $this->redirectToRoute('account_address');
        }

        return $this->render('account/address_add.html.twig', [
            'form_address' => $form->createView()
        ]);
    }


    /**
     * @Route("/compte/supprimer-une-adresse/{id}", name="account_address_delete")
     */
    public function delete(Request $request, $id): Response
    {
        $address = $this->em->getRepository(Address::class)->findOneById($id);

        if (!$address || $address->getUser() != $this->getUser()) {
            return $this->redirectToRoute('account_address');
        }
        $this->em->remove($address);
        $this->em->flush();
        return $this->redirectToRoute('account_address');
    }
}
