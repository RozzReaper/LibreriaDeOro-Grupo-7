<?php

namespace Controllers\Products;
use Controllers\PublicController;
use Dao\Productos\Categories as CategoriesDao;
use Views\Renderer;

class categoriesList extends PublicController
{

 public function run(): void
    {
        $viewData= [];
        $viewData["categories"]= CategoriesDao::getAllCategories();
        Renderer::render("Productos\categoriesList",$viewData);
    }

}