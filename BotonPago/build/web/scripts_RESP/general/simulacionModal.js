// JavaScript Document
// Creado por: Jorge Chicala
// Fecha de Creaci�n: 05-02-2003
// Descripci�n: Procedimiento que se llama desde la pantalla que se va a cargar en la pantalla modal
//              Se lo utiliza solamente para generar la simulaci�n de una pantalla mnodal en el navegador Netscape   
var nombreBrowser = navigator.appName;
var versionBrowser = parseInt(navigator.appVersion);

if (nombreBrowser=="Netscape")
{
  document.onload=foco();
}	
		
function foco()
{
   window.focus(); 
   tiempo = setTimeout('foco()',0);
}