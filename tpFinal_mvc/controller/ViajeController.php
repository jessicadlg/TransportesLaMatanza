<?php


class ViajeController
{
    private $modelo;
    private $render;
    private $pdf;
    private $genQR;

    public function __construct($modelo, $render, $pdf, $qr)
    {
        $this->modelo = $modelo;
        $this->render = $render;
        $this->pdf = $pdf;
        $this->genQR = $qr;
    }

    public function execute()
    {
        header("location: consultar");
    }

    public function nuevo()
    {
        $this->controlAccesoSupervisor();
        $data['datoPrincipal'] = "numero";
        $data = $this->getEquipo();
        $data['url'] = $this->getUrl();
        echo $this->render->render("views/viaje.pug", $data);
    }

    public function consultar()
    {
        if (isset($_SESSION['mensaje'])) {
            $data['mensaje'] = $_SESSION['mensaje'];
            $_SESSION['mensaje'] = null;
        }
        $this->controlAccesoChofer();
        $data['cabeceras'] = $this->getCabeceras();
        if ($_SESSION['rol'] == 1 || $_SESSION['rol'] == 2) {
            if (isset($_GET['cuit'])) {
                $cuit = $_GET['cuit'];
                $data['listado'] = $this->modelo->getViajesCliente($cuit);
            } else
                $data['listado'] = $this->modelo->getViajeInfo();
            $data['botones'] = true;
            $data['noEliminar'] = true;
            if ($_SESSION['rol'] == 2) {
                $data['botonNuevo'] = true;
            }

        } else {
            if (isset($_SESSION['chofer']['vehiculo_asignado'])) {
                $patente = $_SESSION['chofer']['vehiculo_asignado'];
                $data['listado'] = $this->modelo->getViajesPorVehiculo($patente);
            } else
                $data['listado'] = [];
        }
        $data['titulo_listado'] = "viajes";
        $data['sector'] = "Viaje";
        $data['datoPrincipal'] = "numero";

        echo $this->render->render("views/listas.pug", $data);
    }

    public function costeo()
    {
        $this->controlEdicionSupervisor();
        $numero = $_GET['numero'];
        $viaje = $this->modelo->getCodigoViaje($numero);
        $viaje = $viaje[0]['numero'] ?? null;
        $data['listado'] = $this->modelo->getCosteo($viaje);
        $data['titulo_listado'] = "costeo";
        $data['cabeceras'] = ["Código", "Código de viaje", "Número de factura", "Detalles", "Dirección", "Litros de combustible", "Precio", "Conceptos"];
        $data['reportes'] = true;
        $data['acciones'] = true;
        $data['costeo'] = true;
        $data['sector'] = "Costeo";
        $total = $this->modelo->getTotalCosteo($numero);
        $data['total']=$total[0]["SUM(precio)"];
        echo $this->render->render("views/listas.pug", $data);
    }

    public function editar()
    {
        $this->controlEdicionSupervisor();
        $codigo = $_GET['numero'];
        $info = $this->modelo->getViaje($codigo);
        $data = $this->getEquipo();
        $data['info'] = $info[0];
        $data['accion'] = "Editar";
        $data['editar'] = true;
        $data['url'] = $this->getUrl();
        echo $this->render->render("views/viaje.pug", $data);
    }

    public function eliminar()
    {
        $this->controlEdicionSupervisor();
        $numero = $_GET['numero'];
        if ($this->modelo->deleteViaje($numero))
            $_SESSION['mensaje'] = "El viaje se eliminó correctamente";
        else
            $_SESSION['mensaje'] = "El viaje no se pudo eliminar";
        header("location:consultar");
    }


    public function factura()
    {
        $this->controlAcceso();
        if (isset($_GET['numero'])) {
            $numero = $_GET['numero'];
            $this->pdf->generarFactura($numero);
        }
    }

    public function generar()
    {
        $this->controlAcceso();
        if (isset($_GET['numero'])) {
            $numero = $_GET['numero'];
            $this->pdf->informePdf($numero, "viaje", "numero");
        } else {
            $this->pdf->listaPdf("viaje");
        }
    }

    public function informe()
    {
        $this->controlAcceso();
        $numero = $_GET['numero'];
        $resultado = $this->modelo->getViaje($numero);
        $data['qr'] = md5($numero);
        $data['titulo_listado'] = "viaje";
        $patente = $resultado[0]['patente_vehiculo'];
        $posicion = $this->modelo->getPosicion($patente);
        if ($resultado[0]['estado'] == 2)
            $resultado[0]['posicion_actual'] = $posicion[0]['posicion_actual'];
        $data['posicion'] = $posicion[0]['posicion_actual'];
        $data['mapa'] = true;
        $data['factura'] = true;
        $data['datoPrincipal'] = "numero";
        $data['info'] = $resultado[0];
        echo $this->render->render("views/informe.pug", $data);
    }


    public function pdf()
    {
        $data['fecha'] = date('d-m-Y');
        if (isset($_GET['numero'])) {
            $numero = $_GET['numero'];
            $resultado = $this->modelo->getViaje($numero);
            $data['info'] = $resultado[0];
            $data['qr'] = md5($numero);
            $data['titulo_listado'] = "viajes";
            echo $this->render->render("views/pdf_template.pug", $data);
        } else {
            $data['listado'] = $this->modelo->getViajeInfo();
            $data['titulo_listado'] = "Viajes";
            $data['estados'] = ["No iniciado", "En viaje", "Finalizado"];
            $data['cabeceras'] = $this->getCabeceras();
            echo $this->render->render("views/pdf_listas.pug", $data);
        }
    }

    public function pdfFactura()
    {
        if (isset($_GET['numero'])) {
            $numero = $_GET['numero'];
            $resultado = $this->modelo->getViaje($numero);
            $data['info'] = $resultado[0];
            $data['fecha'] = date('d-m-Y');

            echo $this->render->render("views/detalle.pug", $data);
        }
    }

    public function procesar()
    {
        $this->controlAccesoSupervisor();
        $datos = $_POST;
        if (isset($_POST['numero'])) {
            if ($this->modelo->editViaje($datos))
                $_SESSION['mensaje'] = "Los datos han sido editados correctamente";
            else
                $_SESSION['mensaje'] = "Hubo un error en la edición de datos";
        } else {
            $codigo = $this->modelo->registrar($datos);
            if ($codigo) {
                $this->genQR->generarQR($codigo);
                header("location:informe?numero=" . $codigo);
                die();
            } else {
                header("location:nuevo");
                die();
            }
        }
        header("location:consultar");
    }

    public function reportar()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 4 || !isset($_GET['numero'])) {
            header("location:../index");
            exit();
        }
        $viaje=$this->modelo->getViaje($_GET['numero']);
        $chofer=$viaje[0]['dni_chofer'];
        if($chofer==$_SESSION['chofer']['dni_chofer']) {
            $data['codigo'] = $_GET['numero'];
            $data['conceptos'] = $this->modelo->getConceptos();
            echo $this->render->render("views/reporteChofer.pug", $data);
        }
        else header("location:../index");
    }

    public function procesarReporte()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 4) {
            header("location:../index");
            die();
        }
        $datos = $_POST;
        $codigo = $datos['codigo'];
        $resultado = $this->modelo->getPatente($codigo);
        $datos['patente'] = $resultado[0]['patente_vehiculo'];
        if ($this->modelo->registrarReporte($datos)) {
            header("location:confirmar?numero=" . $codigo);
        } else {
            header("location:reportar?numero=" . $codigo);
        }

    }

    public function confirmar()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 4) {
            header("location:../index");
            die();
        }
        $data['codigo'] = $_GET['numero'];
        echo $this->render->render("views/confirmacion.pug", $data);

    }


    public function gastos()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 4) {
            header("location:../index");
            die();
        }
        $data['numero'] = $_GET['numero'];
        echo $this->render->render("views/listas.pug", $data);

    }

    private function getEquipo()
    {
        $data['vehiculos'] = $this->modelo->getVehiculos();
        $data['arrastres'] = $this->modelo->getArrastres();
        $data['choferes'] = $this->modelo->getChoferes();
        $data['celulares'] = $this->modelo->getCelulares();
        $data['clientes'] = $this->modelo->getClientes();
        return $data;
    }

    private function getUrl()
    {
        $url = "https://" . $_SERVER['SERVER_NAME'] . dirname($_SERVER['PHP_SELF']);
        return $url;
    }

    private function getCabeceras()
    {
        $cabeceras = ['Número', 'Fecha de emision', 'Cuit del cliente', 'Fecha del viaje', 'Localidad de origen', 'Localidad de destino', 'Estado', 'Patente del vehiculo', 'Patente del arrastre', 'Dni del chofer'];
        return $cabeceras;
    }

    private function controlAcceso()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 1 && $_SESSION['rol'] != 2) {
            header("location:../index");
            die();
        }
    }

    private function controlAccesoSupervisor()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 2) {
            header("location:../index");
            die();
        }
    }

    private function controlEdicionSupervisor()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 1 && $_SESSION['rol'] != 2 || !isset($_GET['numero'])) {
            header("location:../index");
            die();
        }
    }

    private function controlAccesoChofer()
    {
        if (!isset($_SESSION['iniciada']) || $_SESSION['rol'] != 1 && $_SESSION['rol'] != 2 && $_SESSION['rol'] != 4) {
            header("location:../index");
            die();
        }
    }

}