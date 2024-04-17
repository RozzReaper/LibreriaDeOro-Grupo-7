<?php

namespace Dao;

use Dao\Table;

class Product extends Table 
{
    public static function getAllNavajas()
    {
        $sqlstr = "SELECT * FROM navajas;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getNavaja($sku)
    {
        $sqlstr = "SELECT * FROM navajas WHERE sku = :sku;";
        return self::obtenerUnRegistro($sqlstr, ["sku" => $sku]);
    }

    public static function insertNavaja(
        $sku,
        $nombre,
        $precio,
        $descripcion
    )
    {
        $sqlstr = "INSERT INTO navajas (sku, nombre, precio, descripcion)
        VALUES (:sku, :nombre, :precio, :descripcion);";
        return self::executeNonQuery(
            $sqlstr,
            [
                "sku" => $sku,
                "nombre" => $nombre,
                "precio" => $precio,
                "descripcion" => $descripcion
            ]
        );
    }

    // Puedes agregar más métodos según tus necesidades (update, delete, etc.)
}

?>
