<?php

namespace Controllers;

use Controllers\PublicController;
use Utilities\Context;
use Utilities\Paging;
use Dao\LibrosDao;
use Views\Renderer;

class BooksList extends PublicController
{
    private $orderBy = "";
    private $orderDescending = false;
    private $pageNumber = 1;
    private $itemsPerPage = 10;
    private $viewData = [];
    private $books = [];
    private $booksCount = 0;
    private $pages = 0;

    public function run(): void
{
    $this->getParams();
    $tmpBooks = LibrosDao::getProducts(
        "", // No necesitas pasar estos parámetros aquí, ya los obtuviste en getParams()
        "", 
        $this->orderBy,
        $this->orderDescending,
        $this->pageNumber - 1,
        $this->itemsPerPage
    );
    $this->books = $tmpBooks["products"]; // Corregir el acceso a la clave "products" en lugar de "books"
    $this->booksCount = $tmpBooks["total"];
    $this->pages = $this->booksCount > 0 ? ceil($this->booksCount / $this->itemsPerPage) : 1;
    if ($this->pageNumber > $this->pages) {
        $this->pageNumber = $this->pages;
    }
    $this->setParamsToDataView();
    Renderer::render("BooksList", $this->viewData);
}


    private function getParams(): void
{
    $validOrderBy = ["idlibro", "titulo", "autor", "fecha", "codlicencia", "precio"];
    $this->orderBy = isset($_GET["orderBy"]) && in_array($_GET["orderBy"], $validOrderBy) ? $_GET["orderBy"] : "";
    if ($this->orderBy !== "clear" && !in_array($this->orderBy, $validOrderBy)) {
        $this->orderBy = "";
    }
    $this->orderDescending = isset($_GET["orderDescending"]) ? boolval($_GET["orderDescending"]) : false;
    $this->pageNumber = isset($_GET["pageNum"]) ? intval($_GET["pageNum"]) : 1;
    $this->itemsPerPage = isset($_GET["itemsPerPage"]) ? intval($_GET["itemsPerPage"]) : 10;

   
}

    
    


    private function setParamsToDataView(): void
    {
        $this->viewData["orderBy"] = $this->orderBy;
        $this->viewData["orderDescending"] = $this->orderDescending;
        $this->viewData["pageNum"] = $this->pageNumber;
        $this->viewData["itemsPerPage"] = $this->itemsPerPage;
        $this->viewData["booksCount"] = $this->booksCount;
        $this->viewData["pages"] = $this->pages;
        $this->viewData["books"] = $this->books;
        if ($this->orderBy !== "") {
            $orderByKey = "Order" . ucfirst($this->orderBy);
            $orderByKeyNoOrder = "OrderBy" . ucfirst($this->orderBy);
            $this->viewData[$orderByKeyNoOrder] = true;
            if ($this->orderDescending) {
                $orderByKey .= "Desc";
            }
            $this->viewData[$orderByKey] = true;
        }
        $pagination = Paging::getPagination(
            $this->booksCount,
            $this->itemsPerPage,
            $this->pageNumber,
            "index.php?page=BooksList",
            "BooksList"
        );
        $this->viewData["pagination"] = $pagination;
    }
}

