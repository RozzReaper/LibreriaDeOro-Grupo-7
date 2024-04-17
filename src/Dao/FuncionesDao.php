<?php

namespace Dao;

use Dao\Table;

class FuncionesDao extends Table
{

    public static function getProducts(
        string $partialName = "",
        string $status = "",
        string $orderBy = "",
        bool $orderDescending = false,
        int $page = 0,
        int $itemsPerPage = 10
      ) {
        $sqlstr = "SELECT fncod, fndsc, fnest, fntyp FROM funciones";
        $sqlstrCount = "SELECT COUNT(*) as count FROM funciones";
        $conditions = [];
        $params = [];
        if ($partialName != "") {
          $conditions[] = "fndsc LIKE :partialName";
          $params["partialName"] = "%" . $partialName . "%";
        }
        if (!in_array($status, ["ACT", "INA", ""])) {
          throw new \Exception("Error Processing Request Status has invalid value");
        }
        if ($status != "") {
          $conditions[] = "fnest = :status";
          $params["status"] = $status;
        }
        if (count($conditions) > 0) {
          $sqlstr .= " WHERE " . implode(" AND ", $conditions);
          $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
        }
        if (!in_array($orderBy, ["fncod", "fndsc", "fnest", "fntyp", ""])) {
          throw new \Exception("Error Processing Request OrderBy has invalid value");
        }
        if ($orderBy != "") {
          $sqlstr .= " ORDER BY " . $orderBy;
          if ($orderDescending) {
            $sqlstr .= " DESC";
          }
        }
        $numeroDeRegistros = self::obtenerUnRegistro($sqlstrCount, $params)["count"];
        $pagesCount = ceil($numeroDeRegistros / $itemsPerPage);
        if ($page > $pagesCount - 1) {
          $page = $pagesCount - 1;
        }
        $sqlstr .= " LIMIT " . $page * $itemsPerPage . ", " . $itemsPerPage;
      
        $registros = self::obtenerRegistros($sqlstr, $params);
        return ["products" => $registros, "total" => $numeroDeRegistros, "page" => $page, "itemsPerPage" => $itemsPerPage];
      }
      
    public static function getById(string $fncod)
    {
        $sqlstr = "SELECT fncod, fndsc, fnest, fntyp FROM funciones WHERE fncod = :fncod";
        $params = ["fncod" => $fncod];
        return self::obtenerUnRegistro($sqlstr, $params);
    }

    public static function getAllProducts()
    {
        $sqlstr = "SELECT * FROM funciones;";
        return self::obtenerRegistros($sqlstr, []);
    }


    public static function insert(
        string $fncod,
        string $fndsc,
        string $fnest,
        string $fntyp
    ) {
        $sqlstr = "INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES (:fncod, :fndsc, :fnest, :fntyp)";
        $params = [
            "fncod" => $fncod,
            "fndsc" => $fndsc,
            "fnest" => $fnest,
            "fntyp" => $fntyp
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function update(
        string $fncod,
        string $fndsc,
        string $fnest,
        string $fntyp
    ) {
        $sqlstr = "UPDATE funciones SET fndsc = :fndsc, fnest = :fnest, fntyp = :fntyp WHERE fncod = :fncod";
        $params = [
            "fncod" => $fncod,
            "fndsc" => $fndsc,
            "fnest" => $fnest,
            "fntyp" => $fntyp
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function delete(string $fncod)
    {
        $sqlstr = "DELETE FROM funciones WHERE fncod = :fncod";
        $params = ["fncod" => $fncod];
        return self::executeNonQuery($sqlstr, $params);
    }
}
