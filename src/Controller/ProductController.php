<?php

namespace App\Controller;

use App\Classe\Search;
use App\Form\SearchType;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Monolog\Handler\Handler;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class ProductController extends AbstractController
{

    /**
     * @Route("/nos-produits", name="products")
     */
    public function index(Request $request, ProductRepository $productRepo): Response
    {
        $products = $productRepo->findAll();

        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $products = $productRepo->findWithSearch($search);
        }


        return $this->render('product/index.html.twig', [
            'products' => $products,
            'form_search' => $form->createView(),

        ]);
    }

    /**
     * @Route("/produit{slug}", name="product")
     */
    public function show($slug, ProductRepository $productRepo): Response
    {
        $product = $productRepo->findOneBySlug($slug);

        return $this->render('product/show.html.twig', [
            'product' => $product,
        ]);
    }
}
