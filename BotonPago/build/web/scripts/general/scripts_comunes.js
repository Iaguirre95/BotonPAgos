///EN DESARROLLO
//<!--/******* BLOQUEA CLICK DERECHO *******/-->

//<script type="text/javascript">


var message="Accion desabilitada"; // Your no right click message here
var closeWin="0"; // Do you want to close window after message (1 for yes 0 for no)

// JavaScript by Dave Lauderdale
// Published at: www.digi-dl.com

function IE(e) 
{
     if (navigator.appName === "Microsoft Internet Explorer" && (event.button === "2" || event.button === "3"))
     {
          alert(message); if(closeWin === "1") self.close();
          return false;
     }
}
function NS(e) 
{
     if (document.layers || (document.getElementById && !document.all))
     {
          if (e.which === "2" || e.which === "3")
          {
               alert(message); if(closeWin === "1") self.close();
               return false;
          }
     }
}
document.onmousedown=IE;document.onmouseup=NS;document.oncontextmenu=new Function("return false");

//-->

//<!--/******* VALIDA CARACTERES INVALIDOS *******/-->
   
    function validarCaracteres(forma,pb_opcion,ps_cadena){
         for(con=0;con<forma.elements.length;con++){
             if(forma.elements[con].type === "text"||forma.elements[con].type === "textarea"){
                 if(!caracterInvalido(forma.elements[con],pb_opcion,ps_cadena)){
                     return false;
                 }
             }
        }
        return true;
    }
   
       
    function caracterInvalido(s1,s2,s3){
        var cad="";
        if(s2===null){
            s2=true; 
        }
        if(s3===null){
            s3='"+ps_caracteres+"';
        }
        for(i=0;i<s3.length;i++){
            for(j=0;j<s1.value.length;j++){
                if(s1.value.charAt(j)===s3.charAt(i)){
                    if(s2){
                        alert("No esta permitido el caracter "+s1.value.charAt(j));
                    }
                    cad = s1.value.replace(s1.value.charAt(j),"");
                    s1.value=cad;
                    return false;
                }
            }
        }
        return true;
    }
//</script>
//<!--/******* LOV *******/-->
       m_out.println("<script type=\"text/javascript\" language=\"JavaScript\">");
       m_out.println("function lov(ps_select,ps_from,ps_where,ps_groupBy,ps_having,ps_orderBy,ps_columnaCond,ps_tituloLov,ps_destino1,ps_destino2,ps_posX,ps_posY,ps_ancho, ps_alto, ps_script){");          
       
       m_out.println("var ls_parametros=\"/axis/paginas/general/gef_dialogo.jsp?titulo=\"+ps_tituloLov+\"&nombreDialogo=gep_lov.jsp?&\";");
       
       m_out.println("if(ps_posX==null){");
       m_out.println("ps_posX='400px';");
       m_out.println("}");
       
       m_out.println("if(ps_posY==null){");
       m_out.println("ps_posY='180px';");
       m_out.println("}");
       
       m_out.println("if(ps_ancho==null){");
       m_out.println("ps_ancho='215px';");
       m_out.println("}");
       
       m_out.println("if(ps_alto==null){");
       m_out.println("ps_alto='180px';");
       m_out.println("}");
       
       m_out.println("if(ps_select!=null && ps_select.length>0){");
       m_out.println("ls_parametros=ls_parametros + \"ps_select=\"+ps_select;");
       m_out.println("}");
       m_out.println("if(ps_from!=null && ps_from.length>0){");
       m_out.println("ls_parametros=ls_parametros + \"&ps_from=\"+ps_from;");
       m_out.println("}");

       m_out.println("if(ps_where!=null && ps_where.length>0){");
       m_out.println("var ls_where = ps_where;");
       m_out.println("ls_where = ls_where.replace(\"%\",new String(\"!\"));");
       m_out.println("ls_parametros=ls_parametros + \"&ps_where=\"+ls_where;");
       m_out.println("}");

       m_out.println("if(ps_script!=null && ps_script.length>0){");
       m_out.println("var ls_script = ps_script;}");
       m_out.println("else{");
       m_out.println("var ls_script= 'ninguno'}");
       m_out.println("ls_parametros=ls_parametros + \"&ps_script=\"+ls_script;");
       //m_out.println("}");

       m_out.println("ls_parametros=ls_parametros+\"&ps_groupBy=\"+ps_groupBy+\"&ps_having=\"+ps_having+\"&ps_orderBy=\"+ps_orderBy;");
       m_out.println("if(ps_columnaCond!=null && ps_columnaCond.length>0){");
       m_out.println("ls_parametros=ls_parametros + \"&ps_columnaCond=\"+ps_columnaCond;");
       m_out.println("}");
       m_out.println("if(ps_tituloLov!=null && ps_tituloLov.length>0){");
       m_out.println("ls_parametros=ls_parametros + \"&ps_tituloLov=\"+ps_tituloLov;");
       m_out.println("}");
       m_out.println("if(ps_destino1!=null && ps_destino1.length>0){");
       m_out.println("ls_parametros=ls_parametros + \"&ps_destino1=\"+ps_destino1;");
       m_out.println("}");
       m_out.println("ls_parametros=ls_parametros+ \"&ps_destino2=\"+ps_destino2;");             
       m_out.println("window.showModalDialog(ls_parametros, window,\"dialogTop=\"+ps_posY+\"; dialogLeft=\"+ps_posX+\"; dialogWidth=\"+ps_ancho+\"; dialogHeight=\"+ps_alto+\"; help=no; status=no; scrolling=NO\");");
       m_out.println("}");
       m_out.println("</script>");        
         m_out.println("<!--/******* LOV  WF*******/-->");		
       m_out.println("<script type=\"text/javascript\" language=\"JavaScript\">");
       m_out.println("function lovWf(ps_select,ps_tituloLov,ps_etiqueta,ps_destino1,ps_destino2,ps_posX,ps_posY,ps_ancho, ps_alto){");          

       m_out.println("var ls_parametros=\"/axis/paginas/general/gef_dialogo.jsp?titulo=\"+ps_tituloLov+\"&nombreDialogo=gep_lovwf.jsp?&\";");
       
       m_out.println("if(ps_select!=null && ps_select.length>0){");
       m_out.println("ls_parametros=ls_parametros + \"ps_select=\"+ps_select;");
       m_out.println("}");
       
       m_out.println("if(ps_destino1!=null && ps_destino1.length>0){");
       m_out.println("ls_parametros=ls_parametros + \"&ps_destino1=\"+ps_destino1;");
       m_out.println("}");
       m_out.println("ls_parametros=ls_parametros + \"&ps_destino2=\"+ps_destino2;");
       m_out.println("ls_parametros=ls_parametros + \"&ps_etiqueta=\"+ps_etiqueta;");
       
       m_out.println("window.showModalDialog(ls_parametros, window,\"dialogTop=\"+ps_posY+\"; dialogLeft=\"+ps_posX+\"; dialogWidth=\"+ps_ancho+\"; dialogHeight=\"+ps_alto+\"; help=no; status=no; scrolling=NO\");");
       m_out.println("}");
       m_out.println("</script>"); 
         m_out.println("<!--/******* Formatos Fecha y Hora *******/-->");
    //da formato a un campo de fecha		   	
    m_out.println("<script language=\"JavaScript\" type=\"text/JavaScript\">");	   	  
	m_out.println("  function formatoFecha(objeto)");
	m_out.println("  {");
 	m_out.println("  var valor = objeto.value;");
 	m_out.println("  if ((valor.length == 2)||(valor.length == 5))");
	  m_out.println("  {");
	  m_out.println("  objeto.value = valor+\"-\";");
	  m_out.println("  }");
    m_out.println("  }");
    //da formato a un campo de hora
    m_out.println("function formatoHora(objeto)");
	m_out.println("{");
 	m_out.println("  var valor = objeto.value;");
 	m_out.println("  if (valor.length == 2 )");
	m_out.println("	 {");
  	m_out.println("	 objeto.value = valor+\":\";");
	m_out.println("	 }");
	m_out.println("	} ");
	//da formato a un campo de fechahora
	m_out.println("function formatoFechaHora(objeto)");
	m_out.println("{");
 	m_out.println("var valor = objeto.value;");
 	m_out.println("if ((valor.length == 2)||(valor.length == 5))");
	m_out.println("{");
  	m_out.println("objeto.value = valor+\"-\";");
  	m_out.println("return;");
	m_out.println("}");
 	m_out.println("if (valor.length == 13 )");
	m_out.println("{");
  	m_out.println("objeto.value = valor+\":\";");
  	m_out.println("return;");
	m_out.println("}");
	m_out.println("}");
	m_out.println("</script>");
	         m_out.println("<!--/******* FECHA*******/-->");		
	m_out.println("<script language=\"JavaScript\" type=\"text/JavaScript\">");
  m_out.println("function Fecha()");
  	m_out.println("{");
      m_out.println("var mydate=new Date()");
	  m_out.println("var year=mydate.getYear()");
	  m_out.println("if (year < 1000) year+=1900");
	      m_out.println("var day=mydate.getDay()");
	      m_out.println("var month=mydate.getMonth();");
		  m_out.println("var daym=mydate.getDate();");
		  m_out.println("if (daym<10) daym=\"0\"+daym");
		  m_out.println("var hours=mydate.getHours();");
	      m_out.println("var minutes=mydate.getMinutes();");
	      m_out.println("if (minutes<=9) minutes=\"0\"+minutes");
		  m_out.println("month = month +1; //el arrelgo de meses de la funcion empiza desde 0");
		  m_out.println("if (month<=9) month=\"0\"+month");
	      m_out.println("var fecha = daym+\"-\"+month+\"-\"+year+\" \"+hours+\":\"+minutes;	");
          m_out.println("//	      var fecha = daym+\"-\"+month+\"-\"+year;	      ");
        m_out.println("return(fecha);");
    m_out.println("}  ");
    m_out.println("</script>  ");