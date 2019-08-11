<?php

//Llamado a clases php
require_once("ControllerBase.php");
require_once(__DIR__ . "/../models/ModelTblUsuario.php");
require_once(__DIR__ . "/../config/database.php");



//Clase encargada de manejar el login
//Autor: Jhon Giraldo
//Fecha: 2019-08-07
class ControllerLogin extends ControllerBase{

    public function __construct(){
        parent::__construct(); 
    }


    public function mostrarVista(){
        $this->view->getVista("login/index");
    }

    public function login(){

        try{
            if(isset($_POST['login']) && isset($_POST['password'])){
                //echo "<script> alert('si');</script>";
                $user=$_POST["login"];
                $clave=$_POST['password'];
    
                $usuario=new ModelTblUsuario();
                $logueo=$usuario->login($user,$clave);
    
                if($logueo){
                    echo "true";
                    return true;
                }else{
                    echo "false";
                    return false;
                }
                
                //$datos=$usuario->getAllUsuarios();
                //echo $datos;
                //return $datos;
            }
        }catch(Exception $e){
            echo "La clase de error es " . $this->get_class();
            echo "El método de error es " . $this->getMethod();
            echo "La linea del error es : " . $e->getLine() . "<br>";
            echo "El mensaje del error es : " . $e->getMessage();
            return false;
        }

             
    }

}

?>
