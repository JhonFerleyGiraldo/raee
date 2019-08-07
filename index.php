<?php

    //Llamado a clases php
    require_once("controllers/ControllerErrores.php");

    //llamamos clase encargada de validar los archivos y metodos cargados, 
    //y realizar los llamados de enrutamiento
    $enrutamiento=new Enrutamiento();

    //Clase encargada de administrar las rutas, el controlador y el metodo a ejecutar
    //Autor: Jhon Giraldo
    //Fecha: 2019-07-08
    class Enrutamiento{

        //Configurar la iniciacion de clase y metodo a ejecutar
        //Autor: Jhon Giraldo
        //Fecha: 2019-07-08
        public function __construct(){
            
            //Validamos si hay parametros solicitados por url (configuracion en .htaccess)
            if(isset($_GET["url"])){

                $urlSolicitada=$_GET["url"]; //almacena su valor en $urlSolicitada
                $urlSolicitada=rtrim($urlSolicitada,"/"); //toma la cadena de texto incluyendo /
                $urlSolicitada=explode("/",$urlSolicitada); //crea un arreglo dividido por /

                //se crea string para la ruta de archivo controlador
                //se debe anteponer la palabra controller, ya que todos
                //los controladores la tienen
                $archivoControlador="controllers/Controller" . $urlSolicitada[0] . ".php";

                //validar si existe el archivo
                if(file_exists($archivoControlador)){
                    //llamamos ese archivo
                    require_once($archivoControlador);

                    //Validamos si la clase existe
                    if(class_exists("Controller" . $urlSolicitada[0])){
                        //Guardamos clase controladora
                        $claseController="Controller" . $urlSolicitada[0];
                        //instanciamos la clase
                        $controller=new $claseController;

                        //Validamos si en la segunda posicion que seria la de el metodo esta lleno
                        //es decir, si hay metodo a ejecutar
                        if(isset($urlSolicitada[1])){

                            $metodo=$urlSolicitada[1];//se agrega el nombre del metodo a la variable
                            
                            //Se valida si el metodo escrito en la url si existe
                            if(method_exists($claseController,$metodo)){
                                //se realiza el llamado a ese metodo
                                $controller->{$urlSolicitada[1]}();
                            //Si no existe el metodo
                            }else{
                                //se ejecuta controlador de errores y se pasa el 2 que es 
                                //igual a la constante de no encontrar metodo
                                $error=new ControllerErrores(2);
                            }

                            
                        }

                    }else{
                        //se ejecuta controlador de errores y se pasa el 1 que es 
                        //igual a la constante de no encontrar clase controladora
                        $error=new ControllerErrores(1);
                    }
                //Si no existe el archivo
                }else{
                    //se ejecuta controlador de errores y se pasa el 0 que es 
                    //igual a la constante de no encontrar archivo
                    $error=new ControllerErrores(0);
                }
            
            //Si no hay parametros url, nos encontramos en el home de el proyecto
            }else{
                echo "vacio, aca va el index o login";
            }
        }
        

    }

?>