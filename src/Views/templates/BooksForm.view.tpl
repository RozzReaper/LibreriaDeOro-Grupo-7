<section class="container-m row px-4 py-4">
  <h1>{{FormTitle}}</h1>
</section>
<section class="container-m row px-4 py-4">
  <form action="index.php?page=BooksForm&mode={{mode}}&idlibro={{idlibro}}" method="POST" class="col-12 col-m-8 offset-m-2">
    <div class="row my-2 align-center">
      <label class="col-12 col-m-3" for="idlibro">Código</label>
      <input class="col-12 col-m-9" readonly disabled type="text" name="idlibro" id="idlibro" placehoder="Código" value="{{idlibro}}" />
      <input type="hidden" name="mode" value="{{mode}}" />
      <input type="hidden" name="idlibro" value="{{idlibro}}" />
      <input type="hidden" name="token" value="{{libro_xss_token}}" />
    </div>
    <div class="row my-2 align-center">
      <label class="col-12 col-m-3" for="titulo">Título</label>
      <input class="col-12 col-m-9" {{readonly}} type="text" name="titulo" id="titulo" placeholder="Título" value="{{titulo}}" />
    </div>
    <div class="row my-2 align-center">
      <label class="col-12 col-m-3" for="autor">Autor</label>
      <input class="col-12 col-m-9" {{readonly}} type="text" name="autor" id="autor" placeholder="Autor" value="{{autor}}" />
    </div>
    <div class="row my-2 align-center">
      <label class="col-12 col-m-3" for="fecha">Fecha</label>
      <input class="col-12 col-m-9" {{readonly}} type="text" name="fecha" id="fecha" placeholder="Fecha" value="{{fecha}}" />
    </div>
    <div class="row my-2 align-center">
      <label class="col-12 col-m-3" for="codlicencia">Código Licencia</label>
      <input class="col-12 col-m-9" {{readonly}} type="text" name="codlicencia" id="codlicencia" placeholder="Código Licencia" value="{{codlicencia}}" />
    </div>
    <div class="row my-2 align-center">
      <label class="col-12 col-m-3" for="precio">Precio</label>
      <input class="col-12 col-m-9" {{readonly}} type="text" name="precio" id="precio" placeholder="Precio" value="{{precio}}" />
    </div>
    <div class="row my-4 align-center flex-end">
      <button class="primary col-12 col-m-2" type="submit" name="btnConfirmar">Confirmar</button>
      &nbsp;
      <button class="col-12 col-m-2" type="button" id="btnCancelar">Cancelar</button>

      </button>
    </div>
  </form>
</section>

<script>
  document.addEventListener("DOMContentLoaded", ()=>{
    const btnCancelar = document.getElementById("btnCancelar");
    btnCancelar.addEventListener("click", (e)=>{
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=BooksList");
    });
  });
</script>
