<h2> Tabla de Categorias </h2>

<section class="WWList">

    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Status</th>
                <th><a href="index.php?page=Productos_CategoryForm&mode=INS" class="btn "> Nuevo</a></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                {{foreach categories}}
                <td> {{category_id}} </td>
                <td> {{category_name}} </td>
                <td> {{category_status}} </td>
                <td> 
                    <a href="index.php?page=Productos_CategoryForm&mode=DPS&category_id= {{category_id}} " >
                        Ver</a>&nbsp;
                    <a href="index.php?page=Productos_CategoryForm&mode=UPD&category_id= {{category_id}}" > 
                        Editar</a>&nbsp;
                    <a href="index.php?page=Productos_CategoryForm&mode=DEL&category_id= {{category_id}}" > 
                        Eliminar</a>&nbsp;
                </td>
                {{endfor categories}}
            </tr>
        </tbody>
    </table>
</section>