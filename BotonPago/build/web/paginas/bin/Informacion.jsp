<%-- 
    Document   : Informacion
    Created on : 29/07/2019, 12:48:42 PM
    Author     : yoveri
--%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="bin.Hash"%>
<%@page import="bo.BOVehiculo"%>
<%@page import="bo.BOProspecto"%>
<%@page import="bo.BODatosCotizacion"%>
<%@page import="bin.Cotizacion"%>
<%@page import="cotizacion.SdtCotizacion"%>
<%@page import="javax.xml.datatype.DatatypeFactory"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.xml.datatype.XMLGregorianCalendar"%>
<%@page import="cotizacion.SdtCotizacionAcces"%>
<%@page import="cotizacion.SdtCotizacionVehiculo"%>
<%@page import="cotizacion.SdtCotizacionCliente"%>
<%@page import="cotizacion.SdtCotizacionProducto"%>
<%@page import="java.net.URL"%> 
<%
String ls_cedula = request.getParameter("cedulah");
String ls_placa  = request.getParameter("placah");
String ls_monto  = request.getParameter("montoh");
String ls_idEmpresa = "09";
StringBuffer lsb_error = new StringBuffer();
%>

    <%
    SdtCotizacionProducto   l_producto      = new SdtCotizacionProducto();
    SdtCotizacionCliente    l_cliente       = new SdtCotizacionCliente();
    SdtCotizacionVehiculo   l_vehiculo      = new SdtCotizacionVehiculo();
    SdtCotizacionAcces      l_acces         = new SdtCotizacionAcces();
    SdtCotizacion           l_cotizacion    = new SdtCotizacion();
    BODatosCotizacion       l_datCotizacion = new BODatosCotizacion();
    BOProspecto             l_prospecto     = new BOProspecto();
    BOVehiculo              l_DatVehiculo   = new BOVehiculo();
    Cotizacion              l_reg_cotizacion = new Cotizacion();
    int                     li_secuencia;
    int                     li_cotizacion;
    StringBuffer            ls_error        = new StringBuffer("");
    StringBuffer            ls_resultado    = new StringBuffer("");
    StringBuffer            lsb_valor       = new StringBuffer("");
    //StringBuffer            lsb_descripcion = new StringBuffer("");       
    String                  ls_token        = "";
    String                  ls_fecha        = (new SimpleDateFormat("dd/MM/yy")).format(new Date());
    String                  ls_clave        = "";
    //String                  ls_chasis = "";
    //String                  ls_motor = "";
    //String                  ls_modelo = "";
    //String                  ls_marca = "";
    //String                  ls_anio = "";
    //String                  ls_color = "";
    //String                  ls_capacidad = "";
    //String                  ls_clase = "";
    String                  ls_errorGral = "";
    String                  ls_errorClass = "";

    ls_clave = "GALIANZA¡!*?29"+ls_fecha;
    ls_token   = Hash.md5(ls_clave); 
    ls_token   = ls_token.substring(2, 4)+ls_token.substring(0, 2)+ls_token.substring(4);
    
    try {
            l_prospecto = l_reg_cotizacion.DatosProspecto(ls_cedula, 
                                                          lsb_error);
            if ((lsb_error.toString().equals("OK"))){
                lsb_error = new StringBuffer("");
                //l_DatVehiculo = l_reg_cotizacion.DatosVehiculo(ls_placa, lsb_error);
                l_DatVehiculo = l_reg_cotizacion.DatosVehiculo(ls_idEmpresa, 
                                                               l_prospecto.getPi_idProspecto(), 
                                                               ls_placa, 
                                                               lsb_error);
                if (lsb_error.toString().equals("OK")){
                        lsb_error = new StringBuffer("");
                        li_secuencia = l_reg_cotizacion.secuencia(lsb_error);

                        cotizacion.Cotizacion service = new cotizacion.Cotizacion(new URL("http://64.46.75.92:8585/iagJavaEnvironment/servlet/com.iag.acotizacion?wsdl"));
                        cotizacion.CotizacionSoapPort port = service.getCotizacionSoapPort();
                        cotizacion.CotizacionExecute parameters = new cotizacion.CotizacionExecute();// null;

                        l_producto.setRamo("08");
                        l_producto.setTipoPlan("1Q");

                        l_cliente.setCedula(l_prospecto.getPs_identificacion());//("1001466828");
                        l_cliente.setNombre1(l_prospecto.getPs_nombre());//("VICTOR");
                        l_cliente.setNombre2("");//("HUGO");
                        l_cliente.setApellidos1(l_prospecto.getPs_apellido1());//("GUZMAN");
                        l_cliente.setApellidos2(l_prospecto.getPs_apellido2());//("ALMEIDA");
                        //---
                            Date date = new SimpleDateFormat("yyyy-MM-dd").parse("1982-10-09");
                            GregorianCalendar cal = new GregorianCalendar();
                            cal.setTime(date);
                            XMLGregorianCalendar xmlGregCal =  DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
                        //l_cliente.setFechaNacimiento(xmlGregCal);// echaNacimiento("09/10/1982");  
                        //------
                        l_cliente.setNacionalidad("ECS");       
                        l_cliente.setEmail1(l_prospecto.getPs_email());//("victorguzman09@hotmail.com");       
                        l_cliente.setEmail2("");
                        //l_cliente.setSueldo(Double.parseDouble("0")); //DOUBLE
                        l_cliente.setProvincia("09");//(l_prospecto.getPs_prov_alt());//09
                        l_cliente.setCanton("01");//(l_prospecto.getPs_loc_alt());//01
                        l_cliente.setParroquia("01");//01
                        l_cliente.setTelefono(l_prospecto.getPs_telefono1());//("062612499");
                        l_cliente.setTelefono2("");
                        l_cliente.setTelefono3("");
                        l_cliente.setSexo("");//M
                        l_cliente.setEstadoCivil("");//C
                        l_cliente.setEmpresa("");
                        l_cliente.setProfesion("");
                        l_cliente.setCargoLaboral("");         
                        l_cliente.setActividadEco("");//A023
                        l_cliente.setCallePrincipal("");
                        l_cliente.setNro("");
                        l_cliente.setCalleSecundaria("");
                        l_cliente.setReferencia("");
                        l_cliente.setTipoIDentificacion(l_prospecto.getPs_tipo_id());//C

                        l_vehiculo.setPlaca(ls_placa);//("TDQ0217");//("IBA8967");
                        l_vehiculo.setChasis(l_DatVehiculo.getPs_vin());//"8LATD587780007236");//("KNADG411AB6824625");        
                        l_vehiculo.setMotor(l_DatVehiculo.getPs_motor());//("F14D3856073C");//("G4EEBH448772");
                        //l_vehiculo.setMarca(0);
                        l_vehiculo.setMarcaDesc(l_DatVehiculo.getPs_marca());//l_vehiculo.setMarca(61);//l_DatVehiculo.getPs_marca()
                        //l_vehiculo.setModelo(0);
                        l_vehiculo.setModeloDesc(l_DatVehiculo.getPs_modelo());//l_vehiculo.setModelo(312);//l_DatVehiculo.getPs_modelo()
                        l_vehiculo.setClase("");
                        l_vehiculo.setClaseDesc(l_DatVehiculo.getPs_clase());
                        //--
                        l_DatVehiculo.setPs_anio("2018");
                        //--
                        l_vehiculo.setAnio(new Short(l_DatVehiculo.getPs_anio()));//l_DatVehiculo.getPs_anio()));//"2018"));
                        l_vehiculo.setColor(l_DatVehiculo.getPs_color());//"ROJO");
                        l_vehiculo.setOcupantes(new Short(l_DatVehiculo.getPs_capacidad()));//"4"));
                        l_vehiculo.setUso(l_DatVehiculo.getPs_servicio());//"PARTICULAR");
                        l_vehiculo.setMonto(new Double(ls_monto));//(18000.00);
                        l_vehiculo.setTipo("");
                        l_acces.setToken(ls_token);
                        l_acces.setControl(li_secuencia);

                        l_cotizacion.setAcces(l_acces);
                        l_cotizacion.setCliente(l_cliente);
                        l_cotizacion.setProducto(l_producto);
                        l_cotizacion.setVehiculo(l_vehiculo);

                        parameters.setSdtcotizacion(l_cotizacion);
                        cotizacion.CotizacionExecuteResponse result = port.execute(parameters);

                        //out.println("Result = "+result.getSdtcotizacionerror().getDescripcion());
                        //System.out.println("WS Cot: "+result.getSdtcotizacionerror().getDescripcion()); 
                        
                        if (String.valueOf(result.getSdtcotizacionerror().getError()).toString().equals("0")){
                                ls_resultado.append(result.getSdtcotizacionerror().getDescripcion());
                                li_cotizacion = l_reg_cotizacion.cotizacion(li_secuencia,
                                                                            l_prospecto.getPs_identificacion(), 
                                                                            ls_placa, 
                                                                            ls_resultado, 
                                                                            ls_error);
                                if ((ls_error.toString() == null) || (ls_error.toString().equals("")) || (ls_error.toString().equals("null"))) {
                                    ls_error = new StringBuffer("");
                                    l_datCotizacion = l_reg_cotizacion.DatosCotizacion(li_cotizacion, 
                                                                                       ls_error);
                                    if (!(ls_error.toString().equals("OK"))){
                                        ls_errorGral = ls_error.toString();
                                    }
                                }else{
                                    ls_errorGral = ls_error.toString();
                                }//fin if creacion cotizacion axis
                    }else{
                           ls_errorGral =  result.getSdtcotizacionerror().getDescripcion();
                    }//fin if consumo de WS de Alianza
                }else{
                    ls_errorGral = lsb_error.toString(); 
                }//fin datos vehiculo
            }else{
                ls_errorGral = lsb_error.toString(); 
            }//fin if datos del prospecto        
    } catch (Exception ex) {
	System.out.println(ex.toString());
        ls_errorGral    = ex.toString();
        //ls_errorGral    = "*"+ex.getMessage();
        ls_errorClass   = ex.getCause().toString();
        //System.out.println("=========================");
        //System.out.println(ex.getMessage());
        //System.out.println("=========================");
        //System.out.println(ls_errorClass);
    }
    //System.out.println("Error: "+ls_errorGral);

    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cotizaci&oacute;n</title>
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
        document.getElementById("div_contenedor_form_3").style.display = "block";
        document.getElementById("div_contenedor_form_3").style.top="0px";    



            document.getElementById("div_contenedor_form_3").style.display = "none";
            function pagar(){
                //window.open("pago.jsp",target="_self");
                //alert(document.informacion.idcotizacion.value);
                document.getElementById("div_contenedor_form_3").style.display = "block";
                document.getElementById("div_contenedor_form_3").style.top="0px"; 
                informacion.submit();
            }
        </script>
    </head>
    <body>
        <form name="informacion" id="informacion" action="pago.jsp"  method="post">
             <div id="div_contenedor_form_3" class="div_contenedor_form_3" style=" display: none;">
            <center>
                <!--<table style=" position: absolute; background: #ffffff; margin-left:38%; margin-top: 5%; width: 240px; height: 180px; boder:1 ">-->
                <table align="center"  style=" background: #ffffff;opacity: 0.8;  margin-top: 5%; width: 240px; height: 180px; boder:1 ">
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
            </center>
        </div> 
            
            <table border="2" with="100%" align="center" height="100%" style="margin-top: 5%">
                <tr>
                    <td>
                        <table border="0">
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center"><b><u>Informaci&oacute;n de la Cotizaci&oacute;n</u></b></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr> 
                        <tr>
                            <td>&nbsp;</td> 
                            <td><b>C&oacute;digo de Cotizaci&oacute;n:</b></td>
                            <td>
                                <input type="text" readonly name="codCot" id="codCot" value="<%=l_datCotizacion.getPs_idCotExt()%>">
                            </td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td> 
                            <td><b>Identificaci&oacute;n:</b></td>
                            <td>
                                <input type="text" readonly name="identificacion" id="identifacion" value="<%=l_datCotizacion.getPs_identificacion()%>">
                            </td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td> 
                            <td><b>Nombre:</b></td>
                            <td>
                                <input type="text" readonly name="nombre" id="nombre" value="<%=l_datCotizacion.getPs_nombre_completo()%>">
                            </td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td> 
                            <td><b>C&oacute;digo Cotizaci&oacute;n</b></td>
                            <td>
                                <input type="text" readonly name="secuencia" id="secuencia" value="<%=l_datCotizacion.getPs_idCotExt()%>">
                            </td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td> 
                            <td><b>Valor Tasa:</b></td>
                            <td>
                                <input type="text" readonly name="tasa" id="tasa" value="<%=l_datCotizacion.getPs_tasa()%>">
                            </td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td>&nbsp;</td> 
                            <td><b>Prima Neta</b></td>
                            <td>
                                <input type="text" readonly name="neta" id="neta" value="<%=l_datCotizacion.getPs_primaNeta()%>">
                            </td>
                            <td>&nbsp;</td> 
                        </tr>   
                        <tr>
                            <td>&nbsp;</td> 
                            <td><b>Prima Total:</b></td>
                            <td>
                                <input type="text" readonly name="total" id="total" value="<%=l_datCotizacion.getPs_primaTotal()%>">
                            </td>
                            <td>&nbsp;</td> 
                        </tr>
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr>
                        <%if (ls_errorGral.equals("")){%>
                        <tr>
                            <td colspan="4" align="center"><input type="button" name="datafast" id="datafast" value="Pagar" onClick="pagar()"></td>
                        </tr>
                        <%}else{%>
                        <tr>
                            <td colspan="4">
                                <b>Mensaje:</b>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <textarea name="mensaje" id="mensaje" rows="5" cols="50" style="columns: auto auto; font-size: 8pt;resize: none;" readonly>
                                    <%=ls_errorGral.trim()%>
                                </textarea>
                            </td>
                        </tr>
                        <%}%>
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr>
                        </table>
                </td></tr></table>
        <INPUT type="hidden" id="idcotizacion" name="idcotizacion" value="<%=l_datCotizacion.getPi_idCotizacion()%>">
        </form>
    </body>
</html>


