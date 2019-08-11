<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>RAEE - Error</title>
    <link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">
</head>
<style>
.ColorFondoError{
    background-color:rgba(255,0,0, 0.8);
}
.imagenError{
    width:100px;
    height:100px;
}
.fuenteTextoMensaje{
    color:#000000;
    margin-top:30px; 
    font-size:15px;
}
body{
    background:rgba(66,174,249,0.8);   
}
</style>
<body>

<div class=" modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header ColorFondoError">
        <h5 class="modal-title">Error</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <div class="modal-body">

        <div class="row">
          <div class="col-4">
            <!-- Se agrega la imagen a la modal, se trae la constante de el archivo de configuracion -->
            <img class="imagenError img-fluid" src="<?php echo constant('URL'); ?>img/errores/error1.png" alt="Imagen error">
          </div> 
          <div class="col-8">
            <p class=fuenteTextoMensaje><strong><?php echo  $this->mensajeError; ?></strong></p>   
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
<script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous">
</script>
<script>
  //En esta seccion de codigo, se realizan todos los eventos js
  //que tienen que ver con la carga de informacion y animacion de objetos html

    //cuando el documento este listo
    $(document).ready(function() {
        
        getModal(".modal");

        $(".close").click(function(){
          closeModal(".modal");
        });

    });

   //abre ventana modal
    //param idModal : id de la ventana modal
    //autor: Jhon Giraldo
    //fecha: 2019-08-07
    function getModal(idModal){
      $(idModal).show();
    }

    //cierra ventana modal
    //param idModal : id de la ventana modal
    //autor: Jhon Giraldo
    //fecha: 2019-08-07
    function closeModal(idModal){
      $(idModal).hide();
    }

</script>
</html>