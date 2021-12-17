<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController
{
    /**
     * @Route("/mon-panier", name="cart")
     */
    public function index(Cart $cart, ProductRepository $productRepo)
    {

        return $this->render('cart/index.html.twig', [
            'cartComplet' => $cart->getFull()
        ]);
    }


    /**
     * @Route("/mon-panier/add/{id}", name="cart_add")
     */
    public function add(Cart $cart, $id)
    {
        $cart->add($id);

        return $this->redirectToRoute('cart');
    }



    /**
     * @Route("/mon-panier/supprimer", name="cart_remove")
     */
    public function remove(Cart $cart)
    {
        $cart->remove($cart);

        return $this->redirectToRoute('products');
    }

    /**
     * @Route("/mon-panier/supprimer/{id}", name="cart_remove_by_id")
     */
    public function delete(Cart $cart, $id)
    {
        $cart->delete($id);

        return $this->redirectToRoute('cart');
    }


    /**
     * @Route("/mon-panier/reduire/{id}", name="cart_reduire")
     */
    public function decrease(Cart $cart, $id)
    {
        $cart->decrease($id);

        return $this->redirectToRoute('cart');
    }
}
