<%-- 
    Document   : IngresoDatos
    Created on : 29/07/2019, 12:35:36 PM
    Author     : yoveri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cotiza tu p&oacute;liza</title>
        <script src="../../scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../scripts/jquery/jquery.ui/1.12/jquery-ui.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../../scripts/bootstrap/css/bootstrap.min.css" media="screen">
        <link rel="stylesheet" href="../../scripts/jquery/jquery.ui/1.12/jquery-ui.css">
        <link rel="stylesheet" href="../../scripts/bootstrap/css/bootstrap-select.min.css" type="text/css" media="screen">
        <script src="../../scripts/bootstrap/js/bootstrap-select.js" type="text/javascript"></script>
        <script src="../../scripts/general/jqgridAccion.js" type="text/javascript"></script>
        <link rel='stylesheet' href='../../scripts/css/principal.css'/>

        <!-- Alert -->
        <link rel="stylesheet" href="../../scripts/bootstrap/sweetalert/css/sweetalert2.min.css" media="screen">
        <script src="../../scripts/bootstrap/sweetalert/js/sweetalert2.min.js" type="text/javascript"></script>
        <script src="../../scripts/bootstrap/sweetalert/js/sweetalert.js" type="text/javascript"></script>   
         <style>
            .expandAbsolute{
                position: absolute; top: 0px; left: 0px; height: 90%; width: 90%;
            }
            .expandRelative{
                position: relative; top: 0px; left: 0px; height: 90%; width: 90%;margin-top: 5px;
            }

            .cab-formulario {
                font-family: "Verdana";
                font-size: 20px;
                color: white;
                background-color: #585858;
            }

            .div_contenedor_form_3{
                position: absolute;
                top: 0%;
                left: 0%;
                width: 99.90%;
                height: 99.90%;
                overflow: hidden;
                display: table;
                background: rgba(36,36,36,0.4);
                border: 1px solid #BEBEBE;
                z-index: 350;
            }

        </style>
        <script>
            
            function cotizar(){
                if (document.datos.placa.value == ""){
                    //alert("El ingreso de la placa es obligatorio");
                    document.getElementById('requisitos').value = "El ingreso de la placa es obligatorio";
                    return;
                }
                if (document.datos.cedula.value == ""){
                    //alert("El ingreso de la cédula es obligatorio");
                    document.getElementById('requisitos').value ="El ingreso de la cédula es obligatorio";
                    return;
                }
                if (document.datos.monto.value == ""){
                    //alert("El ingreso de la cédula es obligatorio");
                    document.getElementById('requisitos').value ="El ingreso del monto es obligatorio";
                    return;
                }
                var ls_resultado = "";
                ls_resultado = requisitos(document.datos.placa.value,document.datos.cedula.value);
            }
            function requisitos(ps_placa,ps_identificacion){
                //////////
                document.getElementById("div_contenedor_form_3").style.display = "block";
                document.getElementById("div_contenedor_form_3").style.top="0px";
                //////////
                var url="requisitos.jsp"+"?ps_placa="+ps_placa+"&ps_identificacion="+ps_identificacion;
                window.open(url,target="iframeDetalle");
                /*return;
                $.getJSON(url, function(datos) {
                    //alert(datos.mensaje);
                    if(datos.mensaje!=null ){
                        if (datos.mensaje=="OK"){
                            ls_resultado = "1";
                        }
                        else{
                            //alert("paso"+datos.codError+" - "+datos.mensaje);
                            //return(datos.mensaje);
                            ls_resultado =datos.mensaje;
                            alert("2:"+ls_resultado);
                        }

                    }
                });
                 
               //return ls_resultado; 
            */}
       
       function validacion_req(ps_mensaje,ps_codigo){
           if (ps_codigo=="0"){
               document.datos.placah.value  = document.datos.placa.value;
               document.datos.cedulah.value = document.datos.cedula.value;
               document.datos.montoh.value  = document.datos.monto.value;
               datos.submit();
               //document.getElementById("div_contenedor_form_3").style.display = "none";
           }else{
           //document.getElementById('mensaje').innerHTML = ps_mensaje;
           document.getElementById('requisitos').value = ps_mensaje;
           document.getElementById("div_contenedor_form_3").style.display = "none";
           //return ps_codigo;
           }
           
       }
        </script>
        
    </head>
    <body >
        <form name="datos" id="datos" action="Informacion.jsp"  method="post" >
        <table border="2" with="100%" align="center" height="100%" style="margin-top: 5%">
            <tr>
                <td>
                    <table border="0">
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center"><b><u>Cotiza tu P&oacute;liza</u></b></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>    
                            <td>Placa: </td>
                            <td><input type="text" name="placa" id="placa"></td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td> 
                                <td>C&eacute;dula:</td>
                                <td><input type="text" name="cedula" id="cedula"></td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td> 
                                <td>Monto:</td>
                                <td><input type="text" name="monto" id="monto"></td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td> 
                            <td>&nbsp;</td> 
                        </tr>
                        <tr> 
                            <td colspan ="4" align="center" height="30">
                                <font face="Verdana">
                                    <font color="#000088">
                                        <font size=1>
                                            <i>
                                                <div id="mensaje" align="center">&nbsp;
                                                    <textarea name="requisitos" id="requisitos" rows="2" COLS=38 style="border:0;font-size: 7pt;resize: none;" readonly>

                                                    </textarea>
                                                    &nbsp;
                                                </div>
                                            </i>
                                        </font>
                                    </font>
                                </font>
                            </td>
                        </tr> 
                        <tr>
                            <td colspan="4" align="center">
                                <table with="100%" border="0">
                                    <tr>
                                        <td with="50%">
                                            <input type="button" name="bconsultar" id="bconsultar" value="Consultar" onClick="consultar()">
                                        </td>
                                        <td with="50%">
                                            <input type="button" name="bcotizar" id="bcotizar" value="Cotizar" onClick="cotizar()">
                                        </td>                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr>
                        </table>
                        <INPUT type="hidden" id="placah" name="placah" >
                        <INPUT type="hidden" id="cedulah" name="cedulah" >
                        <INPUT type="hidden" id="montoh" name="montoh" >
                   </td>
            </tr>
        </table>
            <table>
            <tr>
                <td>
                    <div style=" display: none;">
                        <iframe name="iframeDetalle" id="iframeDetalle" src="blanca.jsp">
                        </iframe>
                    </div>                    
                </td>
            </tr>
            </table>

            
            
        <div id="div_contenedor_form_3" class="div_contenedor_form_3" style=" display: none;">

                <table align="center"  style=" background: #ffffff;opacity: 0.8;  margin-top: 5%; width: 265px; height: 185px; boder:1 ">
                    <tr  align="center">
                        <td>
                            <font size="2" ><b ><font class="letra">
                                <b class="titulo"><br>Procesando... </b><br>
                                </font></b></font>
                        </td>
                    </tr>
                    <tr style=" height: 90%;">
                        <td style=" background-image:url('loop.gif'); background-size: 100px 100px, auto; background-repeat: no-repeat; background-position: center center;  "></td>
                    </tr>
                    <tr  style=" height: 90%;" align="center">
                        <td>
                            <font size="2" ><b ><font class="letra">
                                <b class="titulo">Por favor espere un momento.</b><br><br>
                                </font></b></font>

                        </td>
                    </tr>
                </table>
        </div>            
            
            
            
        </form>
        
    </body>
</html>
