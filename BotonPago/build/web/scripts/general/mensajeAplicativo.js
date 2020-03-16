function mensajeAplicativo(ps_mensaje, ps_script){
  var ls_ruta="/axis/paginas/general/gef_mensaje_ventana.jsp?";
  var ls_mensaje;
  var ls_script;
  if(ps_mensaje!=null && ps_mensaje.length>0){
    ls_ruta=ls_ruta + "ps_mensaje="+ps_mensaje;
  }
  else{
    ls_mensaje="No mensaje";
    ls_ruta=ls_ruta + "ps_mensaje="+ls_mensaje;
  }
  if(ps_script!=null && ps_script.length>0){
  ls_ruta=ls_ruta + "&ps_script="+ps_script;
  }
  else{
    ls_script="";
    ls_ruta=ls_ruta + "&ps_script="+ls_script;
  }
  window.showModalDialog(ls_ruta, window,'dialogTop=200px; dialogWidth=400px; dialogHeight=280px; help=no; status=no; scrolling=NO');
}
        
