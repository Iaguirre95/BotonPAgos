/*var qs = document.getElementById("modojs").src.match(/\w+=\w+/g);

//array para almacenar las variables
var _GET= {};

var t,i = qs.length;
while (i--) {

     //t[0] nombre del parametro y t[1] su valor
     t = qs[i].split("=");

     //opción 1: a modo de PHP
     _GET[t[0]] = t[1];

    //opción2: variables con el mismo nombre usando eval
    eval('var '+t[0]+'="'+t[1]+'";');
}

//mostrará el nombre 2 veces
//alert(_GET['modo'] + " " + modo);
alert(imagen);
alert(mensaje);*/

$(document).on('click', '.aceptar', function () {
   // Event Handler Code here
   swal.close();
});
/*$(document).on('click', '.ayuda', function () {
	if (document.getElementById('accion').value == "O")
	 {
		document.getElementById('accion').value = "V";
		alert("1");
	 }else{
		alert("2");
		document.getElementById('accion').value = "O";
	 }
});*/
function createBtn(text, cb) {
	return $(text).on('click', cb);
}
function divMensaje(imagen, mensaje, TipoMensaje){
	var ltipoMensaje = "";
	if(TipoMensaje!="M")
		ltipoMensaje ='							<button tabindex="2"  type="button" name="bAyuda" value=""  class="btn btn-primary btn btn-info ayuda" id="bAyuda"><img src="../../imagenes/icoayuda.png" width="15" height="15" border="0" alt="">&nbsp;&nbsp;Ayuda&nbsp;</button>'
	return ' <form id="cuerpo" name="cuerpo">'
    +'   <input type="hidden" name="accion" id="accion" value="O">'
    +'		<div class="row center-block" style="width: 570px; margin-top: 0px; margin-left: -20px; margin-bottom: -40px;height: 32%; position: relative; ">'
	+'		    <div id="signupbox" class="mainbox col-md-12">'
	+'		        <div class="panel panel-info">'
	+'		            <div class="panel-heading" style="height: 1px">'
	+'		                <div class="panel-title titulo" style="margin-top: -10px"><div class="text-left">Mensaje del Sistema - Axis Versión 4.1</div></div>'
	+'		            </div>'
	+'		            <div class="panel-body">'
	+'						  <div class="col-xs-2 center" style="margin-left: -10px;margin-bottom: 0px;">'
	+'							<img  src="../../imagenes/'+imagen+'" align="middle"  border="0" alt="" height="70" width="70">'
	+'			              </div>'
	+'						  <div class="col-xs-9 center_text" style="margin-bottom: 0px;">'
	+'						    <textarea class="" cols="16" rows="4" style="border: none;background-color:#FFFFF"  readonly>'+mensaje+'</textarea>'
	+'			              </div>'
	+'						  <div class="col-xs-1 center_btn" style="margin-bottom: 0px;">'
	+'							<button tabindex="1" style="outline: 0;" type="button" name="bAceptar" value=""  class="btn btn-primary btn btn-info aceptar" id="bAceptar"><img src="../../imagenes/icoaceptar2.png" width="15" height="15" border="0" alt="">&nbsp;Aceptar</button><br><br>'
	+ltipoMensaje
	+'						  </div>'
	+'		              	  <div id="ayuda" class="row col-xs-12" style="width: 111.1%;margin-left: -30px;display:none"></div>'
	+'  				</div>'//body
	+'		        </div>'
	+'		    </div>'
	+'		</div>'
	+'   </form>';
}