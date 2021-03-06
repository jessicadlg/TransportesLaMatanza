<?php

class UsuariosController
{
    private $modelo;
    private $render;

    public function __construct($modelo, $render)
    {
        $this->modelo = $modelo;
        $this->render = $render;
    }

    public function login()
    {
        if (isset($_SESSION['iniciada']))
            header("location:../home");
        if (!isset($_POST['email'])) {
            header("location:../");
            die();
        }
        $email = $_POST['email'];
        $password = $_POST['password'];
        $data["usuario"] = $this->modelo->getLogin($email, $password);
        if ($data['usuario']) {
            $rol = $data['usuario'][0]['rol'];
            $_SESSION['rol']=$rol;
            $_SESSION['datos'] = $data['usuario'][0];
            $_SESSION['iniciada'] = true;
            $dni=$data['usuario'][0]['dni'];
            if($rol==4){
                $datosChofer=$this->modelo->getDatosChofer($dni);
                $_SESSION['chofer']=$datosChofer[0];
            }
            header("location:../home");
        } else {
            $_SESSION['email'] = $email;
            $_SESSION['error'] = "Email y/o contraseña incorrecta";
            header("location: ../index");
        }
    }

    public function registrar()
    {
        if (isset($_SESSION['iniciada']))
            header("location:home");
        $datos=$_POST;
        if ($this->modelo->setRegistro($datos))
            $_SESSION['error']="El registro fue exitoso. Por favor inicie sesión";
        else
            $_SESSION['error']="Hubo problemas con el registro. Intente más tarde";
        header("location:../index");
    }

    public function api(){
        $dni=$_GET['dni'];
        $email=$_GET['email'];
        $resultadoDni=$this->modelo->dniExistente($dni);
        $resultadoEmail=$this->modelo->emailExistente($email);
        $registrar=[];
        $registrar["registro"]=false;
        if($resultadoDni){
            $registrar['registro']=true;
            if($resultadoDni[0]['dni']==$dni){
                $registrar['dni']=true;
            }
            else {
                $registrar['dni']=false;
            }
        }
        if($resultadoEmail){
            $registrar['registro']=true;
            if($resultadoEmail[0]['email']==$email){
                $registrar['email']=true;
            }
            else {
                $registrar['email']=false;
            }
        }
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($registrar);
    }

    public function consultar()
    {
        if (isset($_SESSION['mensaje'])) {
            $data['mensaje'] = $_SESSION['mensaje'];
            $_SESSION['mensaje'] = null;
        }
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 1) {
            header("location:../index");
            die();
        }
        $data['empleados'] = $this->modelo->getEmpleados();
        echo $this->render->render("views/listaempleados.pug", $data);
    }

    public function modificar()
    {
        $this->controlEdicion();
        $dni = $_GET['dni'];
        $data['dni'] = $dni;
        $data['roles'] = $this->modelo->getRoles();
        $rol = $this->modelo->getDatos($dni);
        $data['rol'] = $rol[0]['rol'];
        if ($data['rol'] || $data['rol']==0)
            echo $this->render->render("views/rol_usuario.pug", $data);
        else header("location: consultar");
    }

    public function bloquear(){
        $this->controlEdicion();
        $dni=$_GET['dni'];
        if($this->modelo->bloquearUsuario($dni))
            $_SESSION['mensaje'] = "Se bloqueó al usuario con éxito";
        else
            $_SESSION['mensaje'] = "Hubo un error en la edición de datos";
        header("location:consultar");
    }

    public function modificardatos()
    {
        if (!isset($_GET['dni']) || !isset($_SESSION['iniciada']) || $_SESSION['datos']['dni'] != $_GET['dni']) {
            header("location:../index");
            die();
        }
        $dni = $_GET['dni'];
        $data['roles'] = $this->modelo->getRoles();
        $datos=$this->modelo->getDatos($dni);
        if($datos[0]['cod_area']==4) {
            $chofer = $this->modelo->getDatosChofer($dni);
            $data['tipo_licencia']=$chofer[0]['tipo_licencia'];
        }
        $data['datos'] = $datos[0];
        $data['area']=$datos[0]['cod_area'];
        echo $this->render->render("views/modificar_usuario.pug", $data);
    }

    public function eliminar()
    {
        $this->controlEdicion();
        $dni = $_GET['id'];
        if ($this->modelo->deleteUser($dni))
            $_SESSION['mensaje'] = "El usuario se eliminó correctamente";
        else
            $_SESSION['mensaje'] = "El usuario no se pudo eliminar";
        header("location:consultar");
    }

    public function procesar()
    {
        if (!isset($_GET['dni']) || !isset($_SESSION['iniciada'])) {
            header("location:../index");
            die();
        }
        $dni = intval($_GET['dni']);
        if (isset($_POST['rol'])) {
            $rol = $_POST['rol'];
            if ($this->modelo->editRol($dni, $rol))
                $_SESSION['mensaje'] = "Los datos han sido editados correctamente";
            else
                $_SESSION['mensaje'] = "Hubo un error en la edición de datos";
            header("location:consultar");
            die();
        } else {
            $datos = $_POST;
            if(isset($_POST['tipo_licencia']))
                $datos['tipo_licencia']=$_POST['tipo_licencia'];
            if ($this->modelo->editDatos($datos))
                header("location:../home");
            else
                header("location:modificardatos?dni=".$dni);
        }
    }

    public function execute()
    {
        header("location:consultar");
    }

    private function controlEdicion()
    {
        if (!isset($_GET['dni']) || !isset($_SESSION['iniciada']) || $_SESSION['rol'] != 1) {
            header("location:../index");
            die();
        }
    }
}