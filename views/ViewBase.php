<?php

//Clase encargada de ser una base para las vistas
//Autor: Jhon Giraldo
//Fecha: 2019-07-08
class ViewBase{
    
    //Declaracion de campos
    public $mensajeError; //Mensaje de error por si se debe pasar

    public function __construct(){

    }

    //Metodo encargado de llamar la vista para ser mostrada
    //Autor: Jhon Giraldo
    //Fecha: 2019-07-08
    function getVista($nombreVista){
        require_once($nombreVista . '.php');
    }

}

?>