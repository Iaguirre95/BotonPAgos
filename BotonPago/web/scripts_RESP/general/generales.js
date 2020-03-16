// JavaScript Document
//Encapsulamiento de ScriptComunes 
//Creado por: Roberto Layana Caicer
//Fecha:13-07-2004
 /******************************************** Formatos Fecha y Hora ************************************/
    //da formato a un campo de fecha
	  function formatoFecha(objeto)
	  {
 	  var valor = objeto.value;
 	  if ((valor.length === 2)||(valor.length === 5))
	    {
	    objeto.value = valor+"-";
	    }
      }
    //da formato a un campo de hora
    function formatoHora(objeto)
	{
 	  var valor = objeto.value;
 	  if (valor.length === 2 )
		 {
  		 objeto.value = valor+":";
		 }
		} 
	//da formato a un campo de fechahora
	function formatoFechaHora(objeto)
	{
 	var valor = objeto.value;
 	if ((valor.length === 2)||(valor.length === 5))
	{
  	objeto.value = valor+"-";
  	return;
	}
 	if (valor.length === 13 )
	{
  	objeto.value = valor+":";
  	return;
	}
	}
 /******************************************** Devuelve Fecha  ************************************/	
 function Fecha()
  	{
      var mydate=new Date();
	  var year=mydate.getYear();
	  if (year < 1000) year+=1900;
	      var day=mydate.getDay();
	      var month=mydate.getMonth();
		  var daym=mydate.getDate();
		  if (daym<10) daym="0"+daym;
		  var hours=mydate.getHours();
	      var minutes=mydate.getMinutes();
	      if (minutes<=9) minutes="0"+minutes;
		  month = month +1; //el arrelgo de meses de la funcion empiza desde 0
		  if (month<=9) month="0"+month;
	      var fecha = daym+"-"+month+"-"+year+" "+hours+":"+minutes;	
          //	      var fecha = daym+\"-\"+month+\"-\"+year;	      
        return(fecha);
    }  

 /******************************************** Valida Caracteres Invalidos ************************************/
       function validarCaracteres(forma,pb_opcion,ps_cadena)
	   {
         for(con=0;con<forma.elements.length;con++)
		  {
           if(forma.elements[con].type === "text"||forma.elements[con].type === "textarea")
		     {
             if(!caracterInvalido(forma.elements[con],pb_opcion,ps_cadena))
			   {
       		   return false;
       			}
       		}
       	}
       return true;      
       }
          
       function caracterInvalido(s1,s2,s3)
	   {
       var cad="";  
	   var caracteres="|��#$&=�!�?[]{}*+~^";
       if(s2===null)
	   {
       s2=true;  
       }  
       if(s3===null){
       s3=caracteres;
       }  
       for(i=0;i<s3.length;i++){
       for(j=0;j<s1.value.length;j++){
       if(s1.value.charAt(j)===s3.charAt(i)){
       if(s2){
       alert("No esta permitido el caracter "+s1.value.charAt(j));
       } 
       cad=s1.value.replace(s1.value.charAt(j),"");
       s1.value=cad;                              
       return false;
       }             
       }
       }
       return true;
       }       
 /******************************************** LOV ************************************/		
       function lov(ps_select,ps_from,ps_where,ps_groupBy,ps_having,ps_orderBy,ps_columnaCond,ps_tituloLov,ps_destino1,ps_destino2,ps_posX,ps_posY,ps_ancho, ps_alto, ps_script)
	   {       
       var ls_parametros="/axis/paginas/general/gef_dialogo.jsp?titulo="+ps_tituloLov+"&nombreDialogo=gep_lov.jsp?&";
       
      
       
       if(ps_posX===null){
       ps_posX='400px';
       }
       
       if(ps_posY===null){
       ps_posY='180px';
       }
       
       if(ps_ancho===null){
       ps_ancho='215px';
       }
       
       if(ps_alto===null){
       ps_alto='180px';
       }
       
       if(ps_select!==null && ps_select.length>0){
       ls_parametros=ls_parametros + "ps_select="+ps_select;
       }
       if(ps_from!==null && ps_from.length>0){
       ls_parametros=ls_parametros + "&ps_from="+ps_from;
       }

       if(ps_where!==null && ps_where.length>0){
       var ls_where = ps_where;
       ls_where = ls_where.replace("%",new String("!"));
       ls_parametros=ls_parametros + "&ps_where="+ls_where;
       }

       if(ps_script!==null && ps_script.length>0){
       var ls_script = ps_script;}
       else{
       var ls_script= 'ninguno';};
       ls_parametros=ls_parametros + "&ps_script="+ls_script;


       ls_parametros=ls_parametros+"&ps_groupBy="+ps_groupBy+"&ps_having="+ps_having+"&ps_orderBy="+ps_orderBy;
       if(ps_columnaCond!==null && ps_columnaCond.length>0){
       ls_parametros=ls_parametros + "&ps_columnaCond="+ps_columnaCond;
       }
       if(ps_tituloLov!==null && ps_tituloLov.length>0){
       ls_parametros=ls_parametros + "&ps_tituloLov="+ps_tituloLov;
       }
       if(ps_destino1!==null && ps_destino1.length>0){
       ls_parametros=ls_parametros + "&ps_destino1="+ps_destino1;
       }
       ls_parametros=ls_parametros+ "&ps_destino2="+ps_destino2;             
       window.showModalDialog(ls_parametros, window,"dialogTop="+ps_posY+"; dialogLeft="+ps_posX+"; dialogWidth="+ps_ancho+"; dialogHeight="+ps_alto+"; help=no; status=no; scrolling=NO");
       }
	   
 /******************************************** Auto Tab ************************************/	
	function autotab(original,destino)
	{
	  if (event.keyCode!==8)
            {
            if (original.getAttribute&&original.value.length===original.getAttribute("maxlength")) 
                destino.focus();
            }	
              }
 /******************************************** Control de Movimiento de Logo *************************/
	function iniciaEjecucion(){window.open("../general/gep_control_ejecucion.jsp","control");}
	
	function detieneEjecucion(){window.open("../general/gep_control.jsp","control");}
	 /************************************** Valida Tipo de Dato (Numero y Letra) *************************/
	/*Valida Letras y Numeros dependiendo del parametro.
	  objeto .- Debe ser enviado como this
	  tipoDato.- Indica si lo que se desea validar en Numero o Letra (caracter)
	*/
	function validarTipoDato(objeto,tipoDato)
	{
	//Implementado por Roberto Layana. 
	
	  var error="";
	  var numero="N";
	  if (tipoDato==="C")
	  {
	    error = "No se Permiten Numeros";
	  }
	  else
	   {
	     error="No se Permiten Letras";
	   }
	  var x=objeto.value;
	  var anum=/(^\d+$)|(^\d+\.\d+$)/;
	  if (anum.test(x)) numero="S";
	  else numero="N";
	  if (objeto.value.length>0)	
	     {
	     if ((tipoDato==="C" && numero==="S") || (tipoDato==="N" && numero==="N")) 
	       {
	        alert(error);
	        objeto.focus();
	       }
	    }   
	 } 
    