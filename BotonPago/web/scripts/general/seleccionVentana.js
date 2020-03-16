// JavaScript Document
var nombreBrowser = navigator.appName;
var versionBrowser = parseInt(navigator.appVersion);

//CREADO POR:        Jorge Chicala
//FECHA DE CREACION: 05-02-2003
//COMENTARIO:        Procedimiento que permite la selecci�n del tipo de ventana dependiendo del browser con el 
//                   cual se est� trabajando.
//MODIFICADO POR:
//FECHA DE MODIFICACION:
//COMENTARIO:
//PARAMETROS DE ENTRADA: Enre los par�metros de entrada para la presentaci�n de la ventana se encuentran:
//        direccion          ==> Direcci�n de la p�gina que se desea cargar en la ventana
//    nombreVentana          ==> Nombre de la ventana que se est� generando utilizado solamente para el navegador Netscape
//           altura          ==> Tama�o de la ventana que se est� generando
//            ancho          ==> Ancho de la ventana que se est� generando
//  presentaDirectorio       ==> (YES o NO) Presenta el panel de Directorio en Netscape (HOME,NETSCAPE,SEARCH,BOOKMARKS)
//  presentaLocacion         ==> (YES o NO) Presenta el panel de Locacion
//  presentaBarraMenu        ==> (YES o NO) Presentaci�n de la Barra de Menu
//  redimensionar            ==> (YES o NO) Permite redimensionar la pantalla
//  presentaScroll           ==> (YES o NO) Presentaci�n de los scrolls de la ventana
//  presentaBarraEstado      ==> (YES o NO) Presentaci�n de la Barra de Estado
//  presentaBarraHerramienta ==> (YES o NO) Presentaci�n de la Barra de Herramienta
//  presentaAyuda            ==> (YES o NO) Utilizado solamente en la opci�n de presentaci�n de la ventana modal en IE, 
//                               pemite la presentaci�n de ayuda en la ventan
function generacionVentana(direccion,nombreVentana,altura,ancho,presentaDirectorio,presentaLocacion,presentaBarraMenu,redimensionar,presentaScroll,presentaBarraEstado,presentaBarraHerramienta,presentaAyuda)
{
   //si ciertos par�metros de propiedades de la ventana est�n vacios o se ingresan como espacio en blanco el default seria NO
   if (presentaDirectorio == "" || presentaDirectorio == " ")
   {
      presentaDirectorio = "no";
   }
   
   if (presentaLocacion == "" || presentaLocacion == " ")
   {
      presentaLocacion = "no";
   }
   
   if (presentaBarraMenu == "" || presentaBarraMenu == " ")
   {
      presentaBarraMenu = "no";
   }
   
   if (redimensionar == "" || redimensionar == " ")
   {
      redimensionar = "no";
   }
   
   if (presentaScroll == "" || presentaScroll == " ")
   {
      presentaScroll = "no";
   }
   
   if (presentaBarraEstado == "" || presentaBarraEstado == " ")
   {
      presentaBarraEstado = "no";
   }
   
   if (presentaBarraHerramienta == "" || presentaBarraHerramienta == " ")
   {
      presentaBarraHerramienta = "no";
   }
   
   if (presentaAyuda == "" || presentaAyuda == " ")
   {
      presentaAyuda = "no";
   }
   
   //posiciona la ventana en el centro de acuerdo a la pantalla     
   margenIzquierdo = (screen.availWidth-ancho)/2;
   margenSuperior =  (screen.availHeight-altura)/2;
		   
   if (nombreBrowser == "Netscape")
   {
	  datosVentanaNormal = "height="+altura+
	                       ",width="+ancho+
			               ",left="+margenIzquierdo+
			               ",top="+margenSuperior+
			               ",directories="+presentaDirectorio+
			               ",location="+presentaLocacion+
			               ",menubar="+presentaBarraMenu+
			               ",resizable="+redimensionar+
			               ",scrollbars="+presentaScroll+
			               ",status="+presentaBarraEstado+
			               ",toolbar="+presentaBarraHerramienta
	  ventana = window.open(direccion,nombreVentana,datosVentanaNormal);
   }
   else
   {
        datosVentanaModal = 'dialogHeight='+altura+'px'+
	                        ';dialogWidth='+ancho+'px'+
						    ';dialogLeft='+margenIzquierdo+'px'+
						    ';dialogTop='+margenSuperior+'px'+
						    ';help='+presentaAyuda+
						    ';resizable='+redimensionar+
						    ';scrolling='+presentaScroll+
						    ';status='+presentaBarraEstado;
	   r=window.showModalDialog(direccion, window, datosVentanaModal);
   }  
}



//CREADO POR:        Jorge Chicala
//FECHA DE CREACION: 07-02-2003
//COMENTARIO:        Procedimiento que permite la selecci�n del tipo de ventana dependiendo del browser con el 
//                   cual se est� trabajando.
//MODIFICADO POR:
//FECHA DE MODIFICACION:
//COMENTARIO:
function generacionVentana(direccion,nombreVentana,altura,ancho)
{
   //posiciona la ventana en el centro de acuerdo a la pantalla     
   margenIzquierdo = (screen.availWidth-ancho)/2;
   margenSuperior =  (screen.availHeight-altura)/2;
		   
   if (nombreBrowser == "Netscape")
   {
	  datosVentanaNormal = "height="+altura+
	                       ",width="+ancho+
			               ",left="+margenIzquierdo+
			               ",top="+margenSuperior+
			               ",directories=no"+
			               ",location=no"+
			               ",menubar=no"+
			               ",resizable=no"+
			               ",scrollbars=no"+
			               ",status=no"+
			               ",toolbar=no";
	  ventana = window.open(direccion,nombreVentana,datosVentanaNormal);
   }
   else
   {
        datosVentanaModal = 'dialogHeight='+altura+'px'+
	                        ';dialogWidth='+ancho+'px'+
						    ';dialogLeft='+margenIzquierdo+'px'+
						    ';dialogTop='+margenSuperior+'px'+
						    ';help=no'+
						    ';resizable=no'+
						    ';scrolling=no'+
						    ';status=no';
	   r=window.showModalDialog(direccion, window, datosVentanaModal);
   }  
}



//CREADO POR:        Jorge Chicala
//FECHA DE CREACION: 07-02-2003
//COMENTARIO:        Procedimiento que permite la selecci�n del tipo de ventana dependiendo del browser con el 
//                   cual se est� trabajando.
//MODIFICADO POR:
//FECHA DE MODIFICACION:
//COMENTARIO:
function generacionVentana(direccion,nombreVentana)
{
   //posiciona la ventana en el centro de acuerdo a la pantalla     
   margenIzquierdo = (screen.availWidth-400)/2;
   margenSuperior =  (screen.availHeight-320)/2;
		   
   if (nombreBrowser == "Netscape")
   {
	  datosVentanaNormal = "height=320"+
	                       ",width=400"+
			               ",left="+margenIzquierdo+
			               ",top="+margenSuperior+
			               ",directories=no"+
			               ",location=no"+
			               ",menubar=no"+
			               ",resizable=no"+
			               ",scrollbars=no"+
			               ",status=no"+
			               ",toolbar=no";
	  ventana = window.open(direccion,nombreVentana,datosVentanaNormal);
   }
   else
   {
        datosVentanaModal = 'dialogHeight=320'+'px'+
	                        ';dialogWidth=400'+'px'+
						    ';dialogLeft='+margenIzquierdo+'px'+
						    ';dialogTop='+margenSuperior+'px'+
						    ';help=no'+
						    ';resizable=no'+
						    ';scrolling=no'+
						    ';status=no';
	   r=window.showModalDialog(direccion, window, datosVentanaModal);
   }  
}
