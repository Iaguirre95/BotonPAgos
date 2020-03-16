//***********************************************************************************************/
// JavaScript Document
/// Creado por: Christian Cela F.
//***********************************************************************************************/

//Modal que permite Grabar dependiendo de la configuración
function addRow(contenido,estilo,l_array_campos_cmb,l_array_campos_cmb_change)
	{
		var Objdefinido = document.getElementById("myModal");
		if(Objdefinido==null){
		   window.parent.addRow(contenido,estilo,l_array_campos_cmb,l_array_campos_cmb_change)
		}else
		{
		 	$("#myModal").html(contenido);
		 	$("#myStyle").html(estilo);
		 	var $frm = $("form#crud-form");
		 	//
		 	var fLen,cLen,$Obj,i;
		 	if(l_array_campos_cmb!="")
		 	{
		 		fLen = l_array_campos_cmb.length;
		 		cLen = l_array_campos_cmb_change.length;
		 		for (i = 0; i < cLen; i++) {
					$Obj = $('.Class'+l_array_campos_cmb_change[i]);
					$Obj.change();
				}
		 		for (i = 0; i < fLen; i++) {
				    $(l_array_campos_cmb[i]).attr("class", "selectpicker");
				    $(l_array_campos_cmb[i]).attr("data-live-search", "true");
				    $(l_array_campos_cmb[i]).attr("data-size", "5");
				    $(l_array_campos_cmb[i]).selectpicker('refresh');
				}
		 	}
		    $("#myModal").modal({
				backdrop: 'static'
			});
		}
	}
//***********************************************************************************************/
//Modal que permite editar dependiendo de la configuración
//***********************************************************************************************/
function editRow(contenido,estilo,grid,rowData,Objecto,l_array_campos_cmb,l_array_campos)
	{
		var Objdefinido = document.getElementById("myModal");
		if(Objdefinido==null){
		    window.parent.editRow(contenido,estilo,grid,rowData,Objecto,l_array_campos_cmb,l_array_campos)
		}else
		{
			$("#myModal").html(contenido);
			$("#myStyle").html(estilo);
			var $frm = $("form#crud-form");
			//
			var fLen,cLen,$Obj,i,objetoList;
			//
			if(l_array_campos!="")
			{
				fLen = l_array_campos.length;
				for (i = 0; i < fLen; i++){
					objetoList = rowData[l_array_campos[i]];
					if(objetoList.trim()=='')
						$frm.find("select[id='"+l_array_campos[i]+"']").val('null');
					else
						$frm.find("select[id='"+l_array_campos[i]+"']").val(rowData[l_array_campos[i]]);
					cLen = Objecto.length;
					for (j = 0; j < cLen; j++){
						if(l_array_campos[i] == Objecto[j])
						{
							$Obj = $('.Class'+Objecto[j]);
							$Obj.change();
						}
					}
				}
			}
			if(l_array_campos!="" || l_array_campos_cmb!="")
			{
			 	 $('.selectpicker').attr("class", "selectpicker");
			 	 $('.selectpicker').attr("data-live-search", "true");
			 	 $('.selectpicker').attr("data-size", "5");
			 	 $('.selectpicker').selectpicker('refresh');
			}
			var rowIndx = grid;
			if (rowIndx != null) {
			var row = rowData;
			$("#myModal").modal({
				backdrop: 'static'
			});
			}
		}
	}
//***********************************************************************************************/
///Abrir Modal cuando exista un nuevo Boton e invoque a una nueva pagina
//***********************************************************************************************/
function AbrirModal(pStyle,pURL,pContenido)
{
	var Objdefinido = document.getElementById("myModal");
	if(Objdefinido==null){
	    window.parent.AbrirModal(pStyle,pURL,pContenido);
	}else
	{
		$("#myStyle").html(pStyle);
		$("#myModal").html(pContenido);
		var modal = $('#myModal'), modalBody = $('#myModal .modal-body');
		modal.on('show.bs.modal', function () {
	       modalBody.load(pURL)
	   }).modal();
	}
}
//***********************************************************************************************/

//Modal que permite Grabar dependiendo de la configuración
function Mensaje(Mensaje,ancho,icono)
	{
		var Objdefinido = document.getElementById("myModal");
		if(Objdefinido==null){
		   window.parent.Mensaje(Mensaje,ancho,icono);
		}else
		{
		  var formulario = divMensaje(Mensaje,icono);
		  var htmlcontent =  $('<div>').append(formulario);
			swal({
		      title: "",
		      html: htmlcontent,
		      type: null,
		      width: ancho,
		      showConfirmButton: false,
		      showCancelButton: false
		    });
			$("#bAceptar").focus();
		  //alert(formulario);
		}
	}
