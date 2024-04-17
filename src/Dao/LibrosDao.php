<?php

namespace Dao;

use Dao\Table;

class LibrosDao extends Table
{
    public static function getProducts(
        string $partialName = "",
        string $status = "",
        string $orderBy = "",
        bool $orderDescending = false,
        int $page = 0,
        int $itemsPerPage = 10
    ) {
        $sqlstr = "SELECT idlibro, titulo, autor, fecha, codlicencia, precio FROM Libros";
        $sqlstrCount = "SELECT COUNT(*) as count FROM Libros";
        $conditions = [];
        $params = [];
        if ($partialName != "") {
            $conditions[] = "titulo LIKE :partialName";
            $params["partialName"] = "%" . $partialName . "%";
        }
        if (!in_array($status, ["ACT", "INA", ""])) {
            throw new \Exception("Error Processing Request Status has invalid value");
        }
        if ($status != "") {
            $conditions[] = "autor = :status";
            $params["status"] = $status;
        }
        if (count($conditions) > 0) {
            $sqlstr .= " WHERE " . implode(" AND ", $conditions);
            $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
        }
        if (!in_array($orderBy, ["idlibro", "titulo", "autor", "fecha", "codlicencia", "precio", ""])) {
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

    public static function getById(string $idlibro)
    {
        $sqlstr = "SELECT idlibro, titulo, autor, fecha, codlicencia, precio FROM Libros WHERE idlibro = :idlibro";
        $params = ["idlibro" => $idlibro];
        return self::obtenerUnRegistro($sqlstr, $params);
    }

    public static function insert(
        string $titulo,
        string $autor,
        int $fecha,
        int $codlicencia,
        int $precio
    ) {
        $sqlstr = "INSERT INTO Libros (titulo, autor, fecha, codlicencia, precio) VALUES (:titulo, :autor, :fecha, :codlicencia, :precio)";
        $params = [
            "titulo" => $titulo,
            "autor" => $autor,
            "fecha" => $fecha,
            "codlicencia" => $codlicencia,
            "precio" => $precio
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function update(
        string $idlibro,
        string $titulo,
        string $autor,
        int $fecha,
        int $codlicencia,
        int $precio
    ) {
        $sqlstr = "UPDATE Libros SET titulo = :titulo, autor = :autor, fecha = :fecha, codlicencia = :codlicencia, precio = :precio WHERE idlibro = :idlibro";
        $params = [
            "idlibro" => $idlibro,
            "titulo" => $titulo,
            "autor" => $autor,
            "fecha" => $fecha,
            "codlicencia" => $codlicencia,
            "precio" => $precio
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function delete(int $idlibro)
    {
        $sqlstr = "DELETE FROM Libros WHERE idlibro = :idlibro";
        $params = ["idlibro" => $idlibro];
        return self::executeNonQuery($sqlstr, $params);
    }

}

?>
