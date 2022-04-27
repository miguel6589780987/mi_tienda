<?php
//activamos almacenamiento en el buffer
ob_start();
session_start();
if (!isset($_SESSION['nombre'])) {
  header("Location: login.html");
}else{


require 'header.php';

if ($_SESSION['corte']==1) {

 ?>
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="row">
        <div class="col-md-12">
      <div class="box">
<div class="box-header with-border">
  <h1 class="box-title">Corte </h1>
  <div class="box-tools pull-right">
  
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Ventas</label>
      <input type="text" class="form-control" id="t_ventas">
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Compras</label>
      <input type="text" class="form-control" id="t_compras">
    </div>
    <div class="form-group col-md-4">
    <label for="inputPassword4"></label>
    <button type="button" class="btn btn-primary">Primary</button>
    </div>
  </div>
</div>
<!--box-header-->
<!--centro-->
<div class="panel-body table-responsive" id="listadoregistros">

<table id="ventasDia" class="table table-striped table-bordered table-condensed table-hover">
    <thead>
     
      <th>Fecha</th>
      <th>Usuario</th>
      <th>Número</th>
      <th>Total Venta</th>
      <th>Estado</th>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
     
      <th>Fecha</th>
      <th>Usuario</th>
      <th>Número</th>
      <th>Total Venta</th>
      <th>Estado</th>
    </tfoot>   
  </table>
</div>
<!--fin centro-->
      </div>
      </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>


<?php 
}else{
 require 'noacceso.php'; 
}

require 'footer.php';
 ?>
 <script src="scripts/corte.js"></script>
 <?php 
}

ob_end_flush();
  ?>

