<h1>Selección de libros digitales</h1>

<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>
          {{ifnot OrderByidlibro}}
          <a href="index.php?page=BooksList&orderBy=idlibro&orderDescending=0">Código <i class="fas fa-sort"></i></a>
          {{endifnot OrderByidlibro}}
          {{if OrderidlibroDesc}}
          <a href="index.php?page=BooksList&orderBy=clear&orderDescending=0">Código <i class="fas fa-sort-down"></i></a>
          {{endif OrderidlibroDesc}}
          {{if Orderidlibro}}
          <a href="index.php?page=BooksList&orderBy=idlibro&orderDescending=1">Código <i class="fas fa-sort-up"></i></a>
          {{endif Orderidlibro}}
        </th>
        <th class="left">
          {{ifnot OrderBytitulo}}
          <a href="index.php?page=BooksList&orderBy=titulo&orderDescending=0">Título <i class="fas fa-sort"></i></a>
          {{endifnot OrderBytitulo}}
          {{if OrdertituloDesc}}
          <a href="index.php?page=BooksList&orderBy=clear&orderDescending=0">Título <i class="fas fa-sort-down"></i></a>
          {{endif OrdertituloDesc}}
          {{if Ordertitulo}}
          <a href="index.php?page=BooksList&orderBy=titulo&orderDescending=1">Título <i class="fas fa-sort-up"></i></a>
          {{endif Ordertitulo}}
        </th>
        <th class="left">
          {{ifnot OrderByautor}}
          <a href="index.php?page=BooksList&orderBy=autor&orderDescending=0">Autor <i class="fas fa-sort"></i></a>
          {{endifnot OrderByautor}}
          {{if OrderautorDesc}}
          <a href="index.php?page=BooksList&orderBy=clear&orderDescending=0">Autor <i class="fas fa-sort-down"></i></a>
          {{endif OrderautorDesc}}
          {{if Orderautor}}
          <a href="index.php?page=BooksList&orderBy=autor&orderDescending=1">Autor <i class="fas fa-sort-up"></i></a>
          {{endif Orderautor}}
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>ID</th>
        <th>Titulo</th>
        <th>Autor</th>
        <th>Fecha</th>
        <th>Código de Licencia</th>
        <th>Precio</th>
        <th><em><a href="index.php?page=BooksForm&mode=INS">AGREGAR NUEVO</a></em></th>

      </tr>
      {{foreach books}}
      <tr>
        <td>{{idlibro}}</td>
        <td>{{titulo}}</td>
        <td>{{autor}}</td>
        <td>{{fecha}}</td>
        <td>{{codlicencia}}</td>
        <td>{{precio}}</td>
        <td class="center">
          <a href="index.php?page=BooksForm&mode=UPD&id={{idlibro}}">Editar</a>
          &nbsp;
          <a href="index.php?page=BooksForm&mode=DEL&id={{idlibro}}">Eliminar</a>
        </td>
      </tr>
      {{endfor books}}
    </tbody>
  </table>
  {{pagination}}
</section>