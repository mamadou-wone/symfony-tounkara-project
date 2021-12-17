<?php


namespace App\Classe;

use App\Entity\Category;

class Search
{
    /**
     * search by string
     *
     * @var string
     */
    public $string = '';


    /**
     * search by many categories
     *
     * @var Category[]
     */
    public $categories = [];
}
