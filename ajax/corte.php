<?php 
require_once "../modelos/Venta.php";
$venta = new Venta();
switch ($_GET["op"]) {

	case 'listar_ventas':
   
        $rspta=$venta->listar_corte();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
                

			$data[]=array(
            "0"=>$reg->fecha,
            "1"=>$reg->usuario,
            
            "2"=>$reg->num_comprobante,
            "3"=>$reg->total_venta,
            "4"=>($reg->estado=='Aceptado')?'<span class="label bg-green">Aceptado</span>':'<span class="label bg-red">Anulado</span>'
              );
		}
  
		$results=array(
             "sEcho"=>1,//info para datatables
             "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
             "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
             "aaData"=>$data); 
		echo json_encode($results);
		break;
	


}
?>