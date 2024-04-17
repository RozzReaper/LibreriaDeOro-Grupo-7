<?php

namespace Controllers\Products;
use Controllers\PublicController;
use Views\Renderer;

class CategoryForm extends PublicController
{
    private $viewData = [];
    private $mode = "DSP";

    private $categoryId=0;
    private $categoryName = "";
    private $categorySmallDesc="";
    private $categoryStatus="ACT";

    private $modeOptions =[
        "INS"=>"Nueva Categoria",
        "UPD"=>"Actualizando Categoria (%s %s)",
        "DEL"=>"Eliminando categoria (%s %s)",
        "DSP"=>"Mostrar detalles (%s %s)"
    ];

    private $categoryStatusOptions=
    [
        "ACT"=>"Activo",
        "INA"=>"Inactivo",
        "RTR"=>"Retirar",
        "DSC"=>"Descontinuado"
    ];

    private function cargar_datos()
    {
        $this->categoryId = isset($_GET["category_id"]) ? $_GET["category_id"] : 0;
        $this->mode = isset ($_GET["mode"]) ? $_GET["mode"] : "DSP";
        if($this->categoryId > 0){
            $categoria = \Dao\Productos\Categories::getCategory($this->categoryId);
            $this->categoryName = $categoria["category_name"];
            $this->categorySmallDesc = $categoria["category_small_desc"];
            $this->categoryStatus = $categoria["category_status"];

        }
    }

    private function prepareViewData(){
        $viewData["mode"]=$this->mode;
        $viewData["modeDesc"]= sprintf($this->modeOptions[$this->mode],$this->categoryId, $this->categoryName);
        $viewData["category_id"]= $this->categoryId;
        $viewData["category_name"]= $this->categoryName;
        $viewData["category_small_desc"]= $this->categorySmallDesc;
        $viewData["category_status"]= $this->categoryStatus;

        $viewData ["showAction"] = $this-> mode !== "DSP";

        foreach($this->$categoryStatusOptions as $value => $text){
            $viewData["category_status_list"][] =[
                "text"=>$value,
                "value"=>$text,
                "selected"=>($value === $this->categoryStatus) ? "selected" : ""
            ];
         }

         $this->viewData=$viewData;

    }


    public function run(): void
    {
        $this->cargar_datos();
        $this->prepareViewData();
        Renderer::render("products/categoryform",$this->$viewData);
    }

}
