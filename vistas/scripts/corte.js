
var tabla;

//funcion que se ejecuta al inicio
function init(){
   listarVentas();
	
  

}

function listarVentas(){
	tabla=$('#ventasDia').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		"ajax":
		{
			url:'../ajax/corte.php?op=listar_ventas',
			type: "get",
			dataType : "json",
			error:function(e){
				console.log(e.responseText);
			}
		},
		"bDestroy":true,
		"iDisplayLength":5,//paginacion
		"order":[[0,"desc"]]//ordenar (columna, orden)
	}).DataTable();
}

init();