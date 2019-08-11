<?php

require_once("ModelBase.php");

class ModelTblUsuario extends ModelBase{

    public function __construct(){
        try{
            parent::__construct();
        }catch(Exception $e){
            echo "La clase de error es " . $this->get_class();
            echo "El método de error es " . $this->getMethod();
            echo "La linea del error es : " . $e->getLine() . "<br>";
            echo "El mensaje del error es : " . $e->getMessage();
        }
    }

    public function login($usuario,$clave){
        try{
            $correcto=false;
            $this->abrirConexion();
            $this->stmt="SELECT * FROM tblusuario WHERE docEmple=:usuario";
            $resultado=$this->DBconexion->prepare($this->stmt);
            $resultado->execute(array(":usuario"=>$usuario));

            while($registro=$resultado->fetch(PDO::FETCH_ASSOC)){
                if(password_verify($clave,$registro['clave'])){
                    $correcto=true;
                }
            }

            return $correcto;

        }catch(PDOException $e){
            echo "La linea del error es : " . $e->getLine() . "<br>";
            return false;
        }catch(Exception $er){
            echo "La linea del error es : " . $e->getLine() . "<br>";
            return false;
        }
    }

    public function getAllUsuarios(){
        try{
            $this->abrirConexion();
            $this->stmt="SELECT * FROM tblusuario";
            $datosUsuarios=$this->DBconexion->prepare($this->stmt);
            $datosUsuarios->execute();
            $resultado=$datosUsuarios->fetchAll(PDO::FETCH_ASSOC);
            $this->cerrarConexion();


            
            $jsonstring = json_encode($resultado);
            return $jsonstring;        
        }catch(Exception $e){
            echo "La clase de error es " . $this->get_class();
            echo "El método de error es " . $this->getMethod();
            echo "La linea del error es : " . $e->getLine() . "<br>";
            echo "El mensaje del error es : " . $e->getMessage();
            return $jsonstring;
        }
    }

    

}

?>