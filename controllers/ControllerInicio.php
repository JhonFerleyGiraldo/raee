<?php

//Llamado a clases php
require_once("ControllerBase.php");

//Clase encargada de manejo de inicio de la aplicacion
//Autor: Jhon Giraldo
//Fecha: 2019-08-07 
class ControllerInicio extends ControllerBase{

    public function __construct(){
        parent::__construct();  
    }

    public function inicio(){
        $this->mostrarVista();
    }
    
    public function mostrarVista(){
        $this->view->getVista("inicio/index");
    }

}

?>