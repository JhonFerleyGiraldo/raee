<?php

//Llamados a clases
require_once("views/ViewBase.php");

//Clase encargada de ser una base para los controladores
//Autor: Jhon Giraldo
//Fecha: 2019-07-08
class ControllerBase{

    //Declaracion de campos
    public $view; //Vista para el controlador

    //Metodo que da el estado inicial a la clase,
    //asignandole una vista llamando a la base de las vistas
    //Autor: Jhon Giraldo
    //Fecha: 2019-07-08
    public function __construct(){
        $this->view=new ViewBase();
    }

}

?>