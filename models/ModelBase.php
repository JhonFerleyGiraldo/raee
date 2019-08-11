<?php

require_once(__DIR__ . "/../config/database.php");

//Clase encargada de ser una base para los modelos
//Autor: Jhon Giraldo
//Fecha: 2019-08-07
class ModelBase{
    
    protected $DBconexion;
    protected $stmt;

    public function __construct(){
        
    }

    public function abrirConexion(){
        try{

            $this->DBconexion= new PDO("mysql:host=" . HOST . ";dbname=" . DB , USER, PASSWORD);
            $this->DBconexion->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            $this->DBconexion->exec("SET CHARACTER SET " . CHARSET);
            return $this->DBconexion;
        }catch(PDOException $e){
            
            if($e->getCode()==2002){
                echo "No se puede conectar al servidor MySQL local a través de " . HOST;
            }else if($e->getCode()==1049){
                echo "Base de datos " . BD . " desconocida";
            }else if($e->getCode()==1045){
                echo "Acceso negado para usuario " . USER . " usando la clave xxxxx";
            }else if($e->getCode()==42000){
                echo "Error de caracteres";
            }else{
                echo "Error de conexión desconocido";
            }
            return $this->DBconexion;
        }
    }

    public function cerrarConexion(){
        $this->DBconexion=null;
        $this->stmt=null;
    }

}

?>