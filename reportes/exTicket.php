<?php 
//activamos almacenamiento en el buffer
ob_start();
if (strlen(session_id())<1) 
  session_start();

if (!isset($_SESSION['nombre'])) {
  echo "debe ingresar al sistema correctamente para vosualizar el reporte";
}else{

if ($_SESSION['ventas']==1) {

?>

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="../public/css/ticket.css">
</head>
<body onload="window.print();">
	<?php 
// incluimos la clase venta
require_once "../modelos/Venta.php";

$venta = new Venta();

//en el objeto $rspta obtenemos los valores devueltos del metodo ventacabecera del modelo
$rspta = $venta->ventacabecera($_GET["id"]);

$reg=$rspta->fetch_object();

//establecemos los datos de la empresa
$empresa = "MOTO SERVICIO KITERIO";
$nombre = "EDUARDO QUITERIO GUZMAN";
$rfc  = "R.F.C. QUGE-840422-S12";
$cesit = "CESIT  4828";
$direccion = "Calle Prolog. Ocampo #367 Colonia los Olivos Actopan Hgo C.P. 42510";


$telefono = "7727270544";

$email = "equiterio@hotmail.com";
	 ?>
<div class="zona_impresion">
	<!--codigo imprimir-->
	<br>
	<table border="0" align="center" width="300px">
			
			<tr>
			<td colspan="3">************************************</td>
		</tr>
		<tr>
			<td align="center">
				<!--mostramos los datos de la empresa en el doc HTML-->
			
				...::::::<strong> <?php echo $empresa; ?></strong>::::::..<br>
				<?php echo $nombre; ?><br>
				<?php echo $rfc; ?><br>
				<?php echo $direccion; ?><br>
				<?php echo $telefono; ?><br>
				<?php echo $cesit; ?><br>
			</td>
		</tr>
		<tr>
			<td>FECHA: <?php echo $reg->fecha; ?></td>
		</tr>
		<tr> 
			<td align="center"></td>
		</tr>
		<tr>
			<!--mostramos los datos del cliente -->
			<td>Cliente: <?php echo $reg->cliente; ?>
			</td>
		</tr>
		
		<tr>
			<td>
				<?php echo $reg->tipo_documento.": ".$reg->num_documento; ?>
			</td>
		</tr>
		<tr>
			<td>
				N° de venta: <?php echo $reg->serie_comprobante." - ".$reg->num_comprobante; ?>
			</td>
		</tr>
	</table>
	<br>

	<!--mostramos lod detalles de la venta -->

	<table border="0" align="center" width="300px">
		<tr>
			<td>CANT.</td>
			<td>DESCRIPCION</td>
			<td align="right">IMPORTE</td>
		</tr>
		<tr>
			<td colspan="3">************************************</td>
		</tr>
		<?php
		$rsptad = $venta->ventadetalles($_GET["id"]);
		$cantidad=0;
		while ($regd = $rsptad->fetch_object()) {
		 	echo "<tr>";
		 	echo "<td>".$regd->cantidad."</td>";
		 	echo "<td>".$regd->articulo."</td>";
		 	echo "<td align='right'>$".$regd->subtotal."</td>";
		 	echo "</tr>";
		 	$cantidad+=$regd->cantidad;
		 } 

		 ?>
		 <!--mostramos los totales de la venta-->
		<tr>
			<td>&nbsp;</td>
			<td align="right"><b>TOTAL:</b></td>
			<td align="right"><b>$ <?php echo $reg->total_venta; ?></b></td>
		</tr>
		<tr>
			<td colspan="3">N° de articulos: <?php echo $cantidad; ?> </td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3" align="center">¡Gracias por su compra!</td>
		</tr>
		<tr>
			<td colspan="3" align="center">DESPUES DE 30 DIAS NO NOS HACEMOS RESPONSABLES </td>
		</tr>
		<tr>
			<td colspan="3" align="center">***********************************</td>
		</tr>
	</table>
	<br>
</div>
<p>&nbsp;</p>
</body>
</html>



<?php

	}else{
echo "No tiene permiso para visualizar el reporte";
}

}


ob_end_flush();
  ?>