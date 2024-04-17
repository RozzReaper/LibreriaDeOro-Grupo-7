<?php

namespace Controllers;

use Controllers\PublicController;
use Dao\LibrosDao; 
use Views\Renderer;
use \Utilities\Site as Site;

class BooksForm extends PublicController
{
  private $viewData = [];
  private $mode = "DSP";
  private $modeDescriptions = [
    "DSP" => "Detalle de %s %s",
    "INS" => "Nuevo Libro",
    "UPD" => "Editar %s %s",
    "DEL" => "Eliminar %s %s"
  ];
  private $readonly = "";
  private $showCommitBtn = true;
  private $libro = [
    "idlibro" => 0,
    "titulo" => "",
    "autor" => "",
    "fecha" => "",
    "codlicencia" => "",
    "precio" => ""
  ];
  private $libro_xss_token = "";

  public function run(): void
  {
    try {
      $this->getData();
      if ($this->isPostBack()) {
        $this->handlePostAction();
      }
      $this->setViewData();
      Renderer::render("BooksForm", $this->viewData);
    } catch (\Exception $ex) {
      Site::redirectToWithMsg(
        "index.php?page=BooksList",
        $ex->getMessage()
      );
    }
  }

  private function setViewData(): void
{
    $this->viewData["mode"] = $this->mode;
    $this->viewData["libro_xss_token"] = $this->libro_xss_token;
    $this->viewData["FormTitle"] = sprintf(
        $this->modeDescriptions[$this->mode],
        $this->libro["idlibro"],
        $this->libro["titulo"]
    );
    $this->viewData["showCommitBtn"] = $this->showCommitBtn;
    $this->viewData["readonly"] = $this->readonly;
    
    // Asignaciones de datos a la vista
    $this->viewData["idlibro"] = $this->libro["idlibro"];
    $this->viewData["titulo"] = $this->libro["titulo"];
    $this->viewData["autor"] = $this->libro["autor"];
    $this->viewData["fecha"] = $this->libro["fecha"];
    $this->viewData["codlicencia"] = $this->libro["codlicencia"];
    $this->viewData["precio"] = $this->libro["precio"];
}

  private function getData()
  {
    $this->mode = $_GET["mode"] ?? "NOF";
    if (isset($this->modeDescriptions[$this->mode])) {
      $this->readonly = $this->mode === "DEL" ? "readonly" : "";
      $this->showCommitBtn = $this->mode !== "DSP";
      $idlibro = $_GET["id"] ?? 0; 
      if ($this->mode == "INS") {
        $this->libro = [
          "idlibro" => 0,
          "titulo" => "",
          "autor" => "",
          "fecha" => 0, 
          "codlicencia" => 0, 
          "precio" => 0 
        ];
      } else {
        $this->libro = LibrosDao::getById(intval($idlibro)); 
        
      }
    } else {
      throw new \Exception("Formulario cargado en modalidad inválida", 1);
    }
  }

  private function handlePostAction()
  {
    switch ($this->mode) {
      case "INS":
        $this->handleInsert();
        break;
      case "UPD":
        $this->handleUpdate();
        break;
      case "DEL":
        $this->handleDelete();
        break;
      default:
        throw new \Exception("Modo inválido", 1);
    }
  }
  
  private function handleDelete()
{
    $idlibro = $_POST["idlibro"]; // Obtener el idlibro

    $result = LibrosDao::delete($idlibro);
    if ($result > 0) {
        Site::redirectToWithMsg(
            "index.php?page=BooksList",
            "Libro eliminado exitosamente"
        );
    } else {
        throw new \Exception("Error al eliminar el libro");
    }
}


private function handleInsert()
{
    $titulo = $_POST["titulo"];
    $autor = $_POST["autor"];
    $fecha = $_POST["fecha"];
    $codlicencia = $_POST["codlicencia"];
    $precio = $_POST["precio"];

    $result = LibrosDao::insert($titulo, $autor, $fecha, $codlicencia, $precio);

    if ($result > 0) {
        Site::redirectToWithMsg(
            "index.php?page=BooksList",
            "Libro creado exitosamente"
        );
    }
}


  private function handleUpdate()
{
    $idlibro = $_GET["idlibro"]; // Obtener el idlibro de $_GET["id"]
    $titulo = $_POST["titulo"]; // Obtener el título del formulario
    $autor = $_POST["autor"]; // Obtener el autor del formulario
    $fecha = $_POST["fecha"]; // Obtener la fecha del formulario
    $codlicencia = $_POST["codlicencia"]; // Obtener el código de licencia del formulario
    $precio = $_POST["precio"]; // Obtener el precio del formulario

    $result = LibrosDao::update(
        $idlibro,
        $titulo,
        $autor,
        $fecha,
        $codlicencia,
        $precio
    );
    if ($result > 0) {
        Site::redirectToWithMsg(
            "index.php?page=BooksList",
            "Libro actualizado exitosamente"
        );
    }
}

}
