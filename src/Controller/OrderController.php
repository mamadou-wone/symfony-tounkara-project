<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Order;
use App\Entity\Carrier;
use App\Entity\Product;
use App\Form\OrderType;
use App\Entity\OrderDetails;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderController extends AbstractController
{

    private $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    /**
     * @Route("/commande", name="order")
     */
    public function index(Cart $cart, Request $request): Response
    {
        if (!$this->getUser()->getAddresses()->getValues()) {
            return $this->redirectToRoute('account_address_add');
        }
        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser()
        ]);
        return $this->render('order/index.html.twig', [
            'form_order' => $form->createView(),
            'cart' => $cart->getFull()
        ]);
    }


    /**
     * @Route("/commande/recapitulatif", name="order_recap", methods={"POST"})
     */
    public function recap(Cart $cart, Request $request): Response
    {
        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser()
        ]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $date = new \DateTime();


            $carriers = $form->get('carriers')->getData();
            $delivery = $form->get('addresses')->getData();
            $delivery_content = $delivery->getFirstname() . ' ' . $delivery->getLastname();
            $delivery_content .= '<br/>' .  $delivery->getPhone();

            if ($delivery->getCompany()) {
                $delivery_content .= '<br/>' . $delivery->getCompany();
            }
            if ($delivery->getPostal()) {
                $delivery_content .= '<br>' . $delivery->getPostal();
            }
            $delivery_content .= '<br>' . $delivery->getCity();
            $delivery_content .= '<br>' . $delivery->getCountry();


            $order = new Order();
            $reference = $date->format('dmY') . '-' . uniqid();
            $order->setReference($reference);
            $order->setUser($this->getUser());
            $order->setCreateAt($date);
            $order->setCarrierName($carriers->getName());
            $order->setCarrierPrice($carriers->getPrice());
            $order->setDelivery($delivery_content);
            $order->setIsPaid(0);

            $this->em->persist($order);


            foreach ($cart->getFull() as $product) {
                $oderDetails = new OrderDetails();
                $oderDetails->setMyOrder($order);
                $oderDetails->setProduct($product['product']->getName());
                $oderDetails->setQuantity($product['quantity']);
                $oderDetails->setPrice($product['product']->getPrice());
                $oderDetails->setTotal($product['product']->getPrice() * $product['quantity']);
                $this->em->persist($oderDetails);
            }

            $this->em->flush();


            return $this->render('order/recapitulatif.html.twig', [
                'form_order' => $form->createView(),
                'cart' => $cart->getFull(),
                'carrier' => $carriers,
                'delivery' => $delivery_content,
                'reference' => $order->getReference()
            ]);
        }

        return $this->redirectToRoute('cart');
    }
}
