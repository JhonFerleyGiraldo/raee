<?php

    //Llamado a clases php
    require_once("ControllerBase.php");
    require_once("config/database.php");

    //Clase encargada de el manejo de errores
    //Autor: Jhon Giraldo
    //Fecha: 2019-08-07
    class ControllerErrores extends ControllerBase{

        //Constantes para errores
        private const ERRORPAGINANOENCONTRADA = "Lo sentimos el recurso que intenta abrir no existe. Validar con el administrador.";
        private const ERRORCLASENOENCONTRADA = "Lo sentimos la clase consultada no ha sido encontrada. Validar con el administrador.";
        private const ERRORMETODONOENCONTRADO = "Lo sentimos la acción o método no fue encontrado. Validar con el administrador";

        //Llamado a la vista y envio de mensaje de error
        public function __construct($codigoError){
            parent::__construct();
            $mensaje=$this->mensajeError($codigoError);
            $this->view->mensajeError=$mensaje;
            $this->view->getVista('errores/index');
        }

        //Metodo que valida cual tipo de error es y lo devuelve
        //Autor: Jhon Giraldo
        //Fecha: 2019-08-07
        public function mensajeError($codError){

            $result="";

            switch($codError){
                case 0:
                    $result=self::ERRORPAGINANOENCONTRADA;
                    break;
                case 1:
                    $result=self::ERRORCLASENOENCONTRADA;
                    break;
                case 2:
                    $result=self::ERRORMETODONOENCONTRADO;
                    break;
                default:
                    $result="Error desconocido, validar con el administrador";   
                    break;         
            }

            return $result;

        }

    }

?>