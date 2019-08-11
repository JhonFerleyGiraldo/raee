<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>RAEE - Login</title>
    <link rel="stylesheet" type="text/css" href="views/login/login.css">
    <link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
</head>
<style>
  

</style>
<body>
    

<!--Ventana modal para error de usuario -->
<div class="container">
  
  <!-- Button to Open the Modal -->
  <button type="button" id="abrirModal" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Validación</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Usuario o contraseña incorrectos, favor validar.
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>   




    <!-- NAVIGATION  -->
    <nav class="navbar navbar-expand-lg navbar-expand-sm navbar-expand-auto navbar-dark bg-dark">
      <img class="logo" src="<?php echo constant('URL'); ?>img/app/raee2SinFondoApp.png" alt="raee">
      <div class="collapse navbar-collapse" >
          <p class="navbar-nav ml-auto  mx-auto">BIENVENIDOS A RAEE</p>
      </div>
    </nav>

    <!--Formulario para login -->
    <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img class="iconoLogin" src="<?php echo constant('URL'); ?>img/iconos/login.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form id="FormLogin">
      <input required type="text" id="login" class="fadeIn second" name="login" placeholder="login">
      <input required type="password" id="password" class="fadeIn third" name="login" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
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

  //Eventos con JS para manejo de la pagina

  //Evento de submit de boton para login
  //Autor: Jhon Giraldo
  //Fecha: 2019-08-11
  $('#FormLogin').submit(e=>{
    e.preventDefault(); //Quita el efecto de recarga de formulario
    url="login/login";//Apuntamos a la urlque deseamos consultar, es decir controlador y metodo
    //constante con el valor de el usuario y clave a loguear
    const postData={
      login: $('#login').val(),
      password: $('#password').val()
    };
    
    //ejecutamos el metodo post del formulario y capturamos la respuesta
    $.post(url,postData,(response)=>{
      if(response){
        //dataJSON = JSON.parse(response);//parseamos el dato booleano que viene en un json
        console.log(response); //obtiene solo la respuesta json
        //console.log(response);//obtiene la respuesta completa, sive cuando hay errores

        /*if(dataJSON){
          //si el usuario y contraseña es correcto abrimos la aplicacion
          window.location.href="inicio/inicio";
        }else{
          //si no es correcto mandamos mensaje de error de logueo
          $("#abrirModal").click();
        }*/

        //si no hay respuesta
      }else{
        console.log("No se encontro respuesta a la petición");
        console.log(response);
      }
      
    });
  });
  

  //esperamos la carga del documento
  $(document).ready(function() {
    
    $("#abrirModal").hide();

  });




  </script>
</html>