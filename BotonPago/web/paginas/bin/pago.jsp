<%-- 
    Document   : login
    Created on : 12/07/2019, 03:20:35 PM
    Author     : yoveri
--%>



<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="com.google.gson.Gson"%> 
<%@page import="bin.Transacciones"%>
<%@page import="bin.Cotizacion"%>
<%@page import="bo.BODatosCotizacion"%>
<%@page import="bo.BOCotizacion"%>
<%@page import="bo.BODatosPersona"%>
<%@page import="bo.BOPagoRequest"%>
<%@page import="dao.DAOPagoRequest"%>
<%@page import="bin.Parametros"%>
<%@page import="bo.Credenciales"%>
<%@page import="bo.BOCheckoutId"%>
<%@page import="dao.DAOCheckoutId"%>
<%@page import="bin.Consultas"%>
<%@page import="bo.BOPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../../scripts/jquery/2.2.4/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="../../scripts/jquery/2.2.4/jquery-2.2.4.min.js" type="text/javascript"></script>
        <script src="../../scripts/jquery/jquery.ui/1.12/jquery-ui.js" type="text/javascript"></script>
        <link href="../../scripts/jquery/jquery.ui/1.12/jquery-ui.css" rel="stylesheet" type="text/css" media="screen">
        <link href="../../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/> 
        <script src="../../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>   
        <link rel="stylesheet" href="../../scripts/bootstrap/sweetalert/css/sweetalert2.min.css" media="screen">
        <script src="../../scripts/bootstrap/sweetalert/js/sweetalert2.min.js" type="text/javascript"></script>
        <script src="../../scripts/bootstrap/sweetalert/js/sweetalert.js" type="text/javascript"></script> 
        <script src="../../scripts/otros/promise-polyfill.js" type="text/javascript"></script> 
        <script src="../../scripts/otros/core.js" type="text/javascript"></script> 
        <script type="text/javascript" src="../../scripts/otros/jquery-3.2.1.js"></script>
        <style>
            .swal-height {
                height: 90% !important;;
                }
        </style>
        <script>
            function registra_datos(ps_mensaje){
                //alert(ps_mensaje);
                //var divBoton = parent.document.getElementById("divBoton");
                //divBoton.style.display = "none";
                swal({title:'',
                      text:ps_mensaje,
                      type:'warning',
                      allowEscapeKey : false,
                      allowOutsideClick: false,
                      customClass: 'swal-height'
                      
                    }).then(function (isConfirm) {
                                if (isConfirm) {
                                    var divBoton = parent.document.getElementById("divBoton");
                                    var frameBoton = parent.document.getElementById("iframeBoton");
                                    frameBoton.src = "blanca.jsp";
                                    divBoton.style.display = "none";
                                } 
                            });
            }
        </script>
    </head>
        <%
        String ls_idEmpresa         = request.getParameter("empresa");
        String ls_idIdent           = request.getParameter("tipoident");
        System.out.println(ls_idIdent+" IDIDENT");

        String ls_identificacion    = request.getParameter("identificacion");
        String ls_valorTotalPago    = request.getParameter("valortotalpago");
        System.out.println(ls_valorTotalPago+" VALORTOTALPAGO");

        
        String ls_valorImpuesto     = request.getParameter("impuesto");
        String ls_valorSinImp       = request.getParameter("valorsinimp");
        String ls_transaccion       = request.getParameter("trx");
        System.out.println(ls_transaccion+" TRANSACCION");
        String ls_proceso           = request.getParameter("proceso");
        String ls_tramaTrx          = request.getParameter("ps_id_trx_caja");
        String ls_tarifa0           = request.getParameter("valortarcero");
        //=====
        String ls_principal         = request.getParameter("principal");
        String ls_secundaria        = request.getParameter("secundaria");
        String ls_tipoCons          = request.getParameter("ps_tipoCon");
        String ls_valorCons         = request.getParameter("ps_valorCons");
        String ls_origen            = request.getParameter("origen");
        String ls_diferido          = request.getParameter("diferido");
        //=====
        
        String ls_protocolo         = request.getScheme();
        String ls_dominio           = request.getServerName();
        String ls_puerto            = Integer.toString(request.getServerPort());
        String ls_path              = request.getContextPath();
        //String ps_idEmpresa         = ls_idEmpresa;//"09";
        String ps_idProceso         = ls_proceso;//"DTF";
        String ls_modoTest          = "";
        String ls_identCom          = "";
        String ls_termCom           = "";
        String ls_estadoCHOUTID     = "";
        String ls_comercioElect     = "";
        String ls_proveedor         = "";
        String ls_risk              = "";  
        String ls_tarjetas          = "";
        String ls_meses             = "";
        String ls_intereses         = "";
        String ls_gracia            = "";
        String ls_url               = ls_protocolo+"://"+ls_dominio+":"+ls_puerto+ls_path+"/paginas/bin/procesaPago.jsp?empresa="+ls_idEmpresa+"&proceso="+ps_idProceso;
        //=============
                                     ls_url = ls_url+"&origen="+ls_origen+"&principal="+ls_principal+"&secundaria="+ls_secundaria+"&idSecuencia="; 
        //=============
        String              ls_ip           = request.getRemoteAddr();
        String              ls_error        = "";
        StringBuffer        lsb_error       = new StringBuffer("");
        StringBuffer        lsb_valorParametro= new StringBuffer("");
        StringBuffer        lsb_idSecuencia = new StringBuffer(""); 
        StringBuffer        lsb_resultado   = new StringBuffer(""); 
        StringBuffer        lsb_salida      = new StringBuffer(""); 
        StringBuffer        lsb_parametros  = new StringBuffer("");
        Credenciales        l_credenciales  = new Credenciales(); 
        Parametros          l_paramteros    = new Parametros();
        BODatosPersona      l_datosPersona  = new BODatosPersona();
        BOCotizacion        l_cotizacion    = new BOCotizacion();
        BOPersona           l_persona       = new BOPersona();
        BOCheckoutId        ls_result ;  
        Consultas           l_consultas = new Consultas();
        
        //System.out.println(ls_transaccion);
        l_consultas.verifica_trx_boton(ls_idEmpresa, ls_origen, Integer.parseInt(ls_transaccion), ls_tipoCons, ls_valorCons, lsb_salida);
        //System.out.println(lsb_salida.toString());
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_TEST", lsb_valorParametro, lsb_error);
        ls_modoTest = lsb_valorParametro.toString();
        lsb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_COMERCIO", lsb_valorParametro, lsb_error);
        ls_identCom = lsb_valorParametro.toString();
        lsb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_TERMINAL", lsb_valorParametro, lsb_error);
        ls_termCom = lsb_valorParametro.toString();
        lsb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_CHECKOUTID", lsb_valorParametro, lsb_error);
        ls_estadoCHOUTID = lsb_valorParametro.toString();
        lsb_valorParametro = new StringBuffer("");

        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_COMERCIO_ELEC", lsb_valorParametro, lsb_error);
        ls_comercioElect = lsb_valorParametro.toString();
        lsb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_PROVEEDOR", lsb_valorParametro, lsb_error);
        ls_proveedor = lsb_valorParametro.toString();
        lsb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_RISK", lsb_valorParametro, lsb_error);
        ls_risk = lsb_valorParametro.toString();
        lsb_valorParametro = new StringBuffer("");

        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_TARJETAS", lsb_valorParametro, lsb_error);
        ls_tarjetas = lsb_valorParametro.toString(); 
        lsb_valorParametro = new StringBuffer("");  
        StringBuffer ps_idIdent = new StringBuffer("");  
        StringBuffer ps_identificacion = new StringBuffer("");
        System.out.println("ls_identificacion: "+ls_identificacion+" - ls_idIdent: "+ls_idIdent);
        if (ls_idIdent.equals("PLA")){
            l_consultas.InforacionPlaca(ls_identificacion, ps_idIdent, ps_identificacion, lsb_error);
            ls_identificacion =  ps_identificacion.toString();
            ls_idIdent        =  ps_idIdent.toString();
        }
        System.out.println("ls_identificacion: "+ls_identificacion+" - ls_idIdent: "+ls_idIdent); 
        lsb_error = new StringBuffer("");
        l_persona           = l_consultas.datosPersona(ls_identificacion, ls_idIdent, lsb_error);
        System.out.println(lsb_error.toString());
        lsb_salida = new StringBuffer("");
        l_consultas.validaCorreo(l_persona.getPs_email(), lsb_salida);
        //lsb_salida = new StringBuffer("OK");
        
        if (lsb_salida.toString().equals("OK")){
                    l_datosPersona.setGivenName(l_persona.getPs_nombre());
                    l_datosPersona.setMiddleName("");
                    l_datosPersona.setSurname(l_persona.getPs_apellido1());
                    l_datosPersona.setIp(ls_ip); 
                    l_datosPersona.setMerchantCustomerId(Integer.toString(l_persona.getPi_idPersona()));
                    l_datosPersona.setMerchantTransactionId(ls_transaccion);//TRAMITE
                    l_datosPersona.setEmail(l_persona.getPs_email());
                    l_datosPersona.setIdentificationDocType("IDCARD");
                    if (ls_identificacion.length()>10){
                        ls_identificacion = ls_identificacion.substring(0,10);//""; 
                    }else{
                        ls_identificacion = l_persona.getPs_identificacion();
                    }
                    //System.out.println("ls_identificacion: "+ls_identificacion);
                    l_datosPersona.setIdentificationDocId(ls_identificacion);//(l_persona.getPs_identificacion());
                    l_datosPersona.setPhone(l_persona.getPs_telefono1());
                    if (ls_modoTest.equals("S")){
                        l_datosPersona.setTestMode("EXTERNAL");
                    }else{
                        l_datosPersona.setTestMode("N");
                    }
                    /**********************************/
                    double ld_valorTotalPago,ld_valorImpuesto,ld_valorSinImp;
                    try{
                    ld_valorTotalPago = Double.parseDouble(ls_valorTotalPago);
                    }catch(Exception e){
                        System.out.println("Pago Conv. Total");
                        ld_valorTotalPago = 0.01;

                    }
                    /************************************/
                    try{
                    ld_valorImpuesto = Double.parseDouble(ls_valorImpuesto);
                    }catch(Exception e){
                        System.out.println("valorImpuesto");
                        ld_valorImpuesto = 0.00;

                    }
                    /********************************/
                    String[] lsa_imp = ls_valorImpuesto.split("\\.");
                    String ls_imp = "";
                    if (lsa_imp.length > 1){
                        if (lsa_imp[1].length() < 2){
                        ls_imp = lsa_imp[0]+"."+lsa_imp[1]+"0"; 
                        }else{
                            ls_imp = ls_valorImpuesto;
                        }
                    }else{
                        ls_imp = ls_valorImpuesto;
                    }
                    double ld_impuesto = 0.00;
                    try{
                    ld_impuesto = Double.parseDouble(ls_imp);
                    }catch(Exception e){
                        System.out.println("valorImpuesto");
                        ld_impuesto = ld_valorImpuesto;

                    }
                    /***********************/
                    try{
                    ld_valorSinImp = Double.parseDouble(ls_valorSinImp);
                    }catch(Exception e){
                        System.out.println("valorSinImpuesto");
                        ld_valorSinImp = 0.01;

                    } 
                    //ls_valorTotalPago ="2.10111";
                    String[] lsa_total = ls_valorTotalPago.split("\\.");
                    String ls_total2 = "";
                    if (lsa_total.length > 1){
                        if (lsa_total[1].length() < 2){
                        ls_total2 = lsa_total[0]+"."+lsa_total[1]+"0"; 
                        }else{
                            ls_total2 = ls_valorTotalPago;
                        }
                    }else{
                        ls_total2 = ls_valorTotalPago;
                    }
                    
                    double ld_total = 0.00;
                    try{
                    ld_total = Double.parseDouble(ls_total2);
                    }catch(Exception e){
                        System.out.println("Pago Conv. Total");
                        ld_total = ld_valorTotalPago;

                    }
                    /**********************************************************/
                    double ld_tarifa0 = 0.00;
                    String ls_tarifa0_tmp = "";
                    String[] lsa_tarifa0 = ls_tarifa0.split("\\."); 
                    if (lsa_tarifa0.length > 1){
                        if (lsa_tarifa0[1].length() < 2){
                        ls_tarifa0_tmp = lsa_tarifa0[0]+"."+lsa_tarifa0[1]+"0"; 
                        }else{
                            ls_tarifa0_tmp = ls_valorTotalPago;
                        }
                    }else{
                        ls_tarifa0_tmp = ls_valorTotalPago;
                    }
                    
                    try{
                        ld_tarifa0 = Double.parseDouble(ls_tarifa0_tmp);
                    }catch(Exception e){
                        System.out.println("ld_tarifa0");
                        ld_tarifa0 = ld_total;

                    }
                    
                    /************************************************************/
                    l_datosPersona.setTotal(ls_total2);//(ls_valorTotalPago);//("1.01");

                    l_cotizacion.setMid(ls_identCom);//("1000000505");
                    l_cotizacion.setTid(ls_termCom);//("PD100406");
                    l_cotizacion.setIva(ld_impuesto);//(ld_valorImpuesto);//(0.12); 
                    l_cotizacion.setbase12(ld_valorSinImp);//(1.00);
                    l_cotizacion.setTotal(ld_total);//(ld_valorTotalPago);//(1.12); 
                    l_cotizacion.setTarifa0(ld_tarifa0);
                    l_cotizacion.setComercio_elect(ls_comercioElect);
                    l_cotizacion.setProveedor(ls_proveedor);
                    l_cotizacion.setRisk(ls_risk); 

                    l_credenciales  =  l_paramteros.inicializa(ls_idEmpresa, ps_idProceso);
                   
                    if (l_credenciales.getPs_mensaje()==null){
                        
                        

                        ls_result       =  DAOCheckoutId.request(ls_idEmpresa, 
                                                                ps_idProceso, 
                                                                l_credenciales,
                                                                l_datosPersona,
                                                                l_cotizacion,
                                                                lsb_parametros);
                        lsb_resultado.append(new Gson().toJson(ls_result));
                        System.out.println(lsb_resultado+" LSB_RESULTADO");
                        /*System.out.println(lsb_resultado.toString());
                        System.out.println("---------------------");
                        System.out.println("l_credenciales"+(new Gson().toJson(l_credenciales)));
                        System.out.println("---------------------");
                        System.out.println("l_datosPersona"+(new Gson().toJson(l_datosPersona)));
                        System.out.println("---------------------");
                        System.out.println("l_cotizacion"+(new Gson().toJson(l_cotizacion))); 
                        System.out.println("---------------------");
                        System.out.println(ls_origen);*/
                        lsb_error = new StringBuffer("");
                        Transacciones l_transaccion = new Transacciones();
                        if ((ls_result.getResult().getCode().equals(ls_estadoCHOUTID))){
                            //System.out.println("PASO 1");
                            Base64 base64 = new Base64();
                            String decodedString = new String(base64.decode(ls_tramaTrx)); 
                            l_transaccion.registra_datos_trx(ls_idEmpresa, 
                                                            ls_transaccion, 
                                                            decodedString,//ls_tramaTrx, 
                                                            ls_result.getId(), 
                                                            ls_result.getResult().getCode(), 
                                                            l_credenciales.getPs_url_script()+ls_result.getId(), 
                                                            lsb_resultado,  
                                                            "G", 
                                                            "Generación del Scrip de pago", 
                                                            lsb_idSecuencia, 
                                                            lsb_error,
                                                            ls_origen,
                                                            ls_tipoCons,
                                                            ls_valorCons,
                                                            lsb_parametros); 

                            ls_error = lsb_error.toString();
                            if (!(ls_error.equals("OK"))){
                                ls_error =  ls_error.replace("\n", "").replace("\r", "").replace("\"", "");
                            %>
                                <body>
                                    <script>
                                        //alert("Error al Acceder al Botón de Pago. <%=ls_error%>");
                                        //var divBoton = parent.document.getElementById("divBoton");
                                        //divBoton.style.display = "none";
                                        registra_datos("Error al Acceder al Botón de Pago. <%=ls_error%>");
                                    </script>
                                </body>
                            <%    
                            }
                        }else{
                            %>
                            <script>
                                //alert("Error al Acceder al Botón de Pago. <%=ls_result.getResult().getCode()+" : "+ls_result.getResult().getDescription()%>");
                                //var divBoton = parent.document.getElementById("divBoton");
                                //divBoton.style.display = "none";
                            </script>
                            <% 
                        }
                        //--------------------------
                    }else{
                        ls_result = null;
                    }
        
    }else{ 
            ls_result = null;
    %>
            <body>
                <script>
                    registra_datos("<%=lsb_salida.toString().replace("\n", "").replace("\r", "").replace("\"", "")%>");
                </script>
            </body>
  <%}
%>
         
        

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
            .wpwl-label{
                font-family: "Verdana";
            }
            .wpwl-wrapper{
                font-family: "Verdana";
                font-size: 12px;
            }
            
            .wpwl-hint-cardNumberError{
                font-family: "Verdana";
                font-size: 12px;
            }
            .wpwl-hint-expiryError{
                font-family: "Verdana";
                font-size: 12px;
            }
            .wpwl-hint-cardHolderError{
                font-family: "Verdana";
                font-size: 12px;
            }
            .wpwl-hint-cvvError{
                font-family: "Verdana";
                font-size: 12px;
            }
            
            .wpwl-button-pay{  
                background: transparent ;
                background-image: url("../../imagenes/BPagar3.png");
                padding-left: 39px;
                padding-right:  39px;
                background-color: transparent;
                border: none;
                font-size: 12px;
                font-family: "Verdana";
                height: 37px;
               
            }
            
            ::-webkit-input-placeholder { /* Edge */
            font-size: 12px
            }

            :-ms-input-placeholder { /* Internet Explorer */
            font-size: 12px
            }

            ::placeholder {
            font-size: 12px
            }            
        </style>
        <script>
            //document.getElementById("div_contenedor_form_3").style.display = "block";
            //document.getElementById("div_contenedor_form_3").style.top="0px";    
            //document.getElementById("div_contenedor_form_3").style.display = "none";
        </script>
 <%if (lsb_salida.toString().equals("OK")){ %>         
    <%if ((l_credenciales.getPs_mensaje()==null)&& ((ls_error.equals("OK"))) ){%> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bontón de Pago</title>
        <script type="text/javascript">
        function diferidos(ps_accion){
            var ls_diferido  = document.getElementById("recurring.numberOfInstallments").value;
            var ls_intereses = document.getElementById("customParameters[SHOPPER_interes]").value;
            var ls_gracia    = document.getElementById("customParameters[SHOPPER_gracia]").value;
            var ls_tarjeta   = $('.wpwl-form').find('.wpwl-control-brand').val();
            var li_paso      = 0;
            var ls_mensaje   = "";
            if (ls_intereses == "0"){
                    if ((ls_diferido == "9") || (ls_diferido == "12")||(ls_diferido == "3") || (ls_diferido == "6")){
                        //ls_mensaje = "Pago sin Intereses aplica para 3 y 6 meses";
                        ls_mensaje = "La opción Pago Diferido Sin Intereses no se encuentra Activa";
                        //$('.wpwl-control-cardHolder').addClass('wpwl-has-error').after('<div class="wpwl-hint wpwl-hint-cardHolderError">'+ls_mensaje+'</div>');    
                        ///////////////
                        swal({title:'',
                            text:ls_mensaje,
                            type:'warning',
                            allowEscapeKey : false,
                            allowOutsideClick: false,
                            customClass: 'swal-height'
                            }).then(function (isConfirm) {
                                        if (isConfirm) {
                                            return false;
                                        } 
                                    });                    
                        ///////////////                   
                    return false;
                    }
            }
            if (ls_gracia == "1"){
                if ((ls_diferido == "9") || (ls_diferido == "12")){
                    ls_mensaje = "Meses de Gracia aplican para Diferido corriente (aplica para 3 y 6 meses sin intereses)";
                    li_paso = 1;
                }else{
                    if((ls_intereses == "1")){
                      ls_mensaje = "Meses de Gracia aplican para Diferido corriente (aplica para 3 y 6 meses sin intereses)"; 
                      li_paso = 1;
                    }
                }
                if (li_paso == 1){
                        ///////////////
                        swal({title:'',
                            text:ls_mensaje,
                            type:'warning',
                            allowEscapeKey : false,
                            allowOutsideClick: false,
                            customClass: 'swal-height'
                            }).then(function (isConfirm) {
                                        if (isConfirm) {
                                            return false;
                                        } 
                                    });                    
                        /////////////// 
                        return false;
                }
            }//ls_gracia == "1"
            return true;
        }
        var wpwlOptions = {
                 <%if (ls_diferido.equals("S")){
                        String ls_muestra = "";
                        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_MESES", lsb_valorParametro, lsb_error);
                        ls_meses = lsb_valorParametro.toString(); 
                        lsb_valorParametro = new StringBuffer(""); 
                        
                        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_INTERESES", lsb_valorParametro, lsb_error);
                        ls_intereses = lsb_valorParametro.toString(); 
                        lsb_valorParametro = new StringBuffer(""); 
                        
                        l_consultas.valor_parametros(ls_idEmpresa, ls_proceso, "DTF_GRACIA", lsb_valorParametro, lsb_error);
                        ls_gracia = lsb_valorParametro.toString(); 
                        lsb_valorParametro = new StringBuffer("");
                        
                        
                        String ls_select = "<option value=\"0\" selected>0</option>";
                        if (!(ls_meses == null)){
                            String[] lsa_trx  = ls_meses.split("\\|");
                            for (int i=0;i<lsa_trx.length;i++){ 
                                ls_select = ls_select + "<option value=\""+lsa_trx[i]+"\" >"+lsa_trx[i]+"</option>";
                                //System.out.println(ls_select);
                            }
                            
                        }
                        String ls_selectInt = "<option value=\"0\" selected>No</option>"; 
                        if (!(ls_intereses == null)){
                            if (ls_intereses.equals("S")){
                                ls_selectInt = ls_selectInt +"<option value=\"1\">Si</option>";
                                //System.out.println(ls_selectInt);
                            }
                        }
                        
                        String ls_selectGracia = "<option value=\"0\" selected>No</option>";
                        if (ls_gracia == null){
                            ls_gracia = "N";
                        }
                        if (ls_gracia.equals("S")){
                            ls_selectGracia = ls_selectGracia + "<option value=\"1\">1</option>";
                            ls_muestra = "";
                        }else{
                            ls_muestra = ";display: none;";
                        }
                        ;
                %>
                 onReady: function(e) {  
			var numberOfInstallmentsHtml = '<br><table border="0" width="100%">'+ 
                                                            '<tr><td border="0" width="30%">'+
                                                                    '<div class="wpwl-wrapper wpwl-wrapper-custom" style="display:inlineblock">Diferidos:&nbsp;' +
                                                                            '<select name="recurring.numberOfInstallments" id="recurring.numberOfInstallments">'+
                                                                                '<%=ls_select%>'+
                                                                            '</select>' +
                                                                    '</div>'+
                                                            '</td>';
			
			var frecuente = '<td width="30%">'+
                                                '<div class="wpwl-wrapper wpwl-wrapper-custom" style="display:inlineblock">Intereses:&nbsp;' +
                                                        '<select name="customParameters[SHOPPER_interes]" id="customParameters[SHOPPER_interes]">'+
                                                                '<%=ls_selectInt%>'+
                                                        '</select>' +
                                                '</div>'+
                                        '</td>';
			
			var gracia = '<td width="40%">'+
                                            '<div class="wpwl-wrapper wpwl-wrapper-custom" style="display:inline-block<%=ls_muestra%>">Meses&nbsp;de&nbsp;Gracia:&nbsp;' +
                                                            '<select name="customParameters[SHOPPER_gracia]" id="customParameters[SHOPPER_gracia]">'+
                                                                    '<%=ls_selectGracia%>'+
                                                            '</select>' +
                                                    '</div>'+
                                    '</td></tr></table><br>';
                        //
                        var datafast = '<br/><br/><img src='+'"https://www.datafast.com.ec/images/verified.png" style='+'"display:block;margin:0 auto; width:100%;">';
                        //
			$('form.wpwl-form-card').find('.wpwl-button').before(datafast);
			$('.wpwl-form-card').find('.wpwl-button-pay').on('click', function(e){diferidos("B");});
                        },
                        <%}%>  
                            style: "card",
                            locale: "es",
                            iframeStyles: {
                                'card-number-placeholder': {'font-size': '12px'},
                                'cvv-placeholder': {'font-size': '12px'}
                            }
                            ,onBeforeSubmitCard: function(e){return diferidos("S");}
                }; 
        </script>        
        <script src="<%=l_credenciales.getPs_url_script()+ls_result.getId()%>"></script>
        <script>
            function regresar_pago(){
                    var divBoton = parent.document.getElementById("divBoton");
                    divBoton.style.display = "none";
                    
                }
        </script>
        
    </head>
    <body ><!--style="overflow:hidden;"-->
        <!--<br>-->
        <%if (ls_result.getResult().getCode().equals(ls_estadoCHOUTID)){
        System.out.println(ls_url+lsb_idSecuencia.toString()+" <---URL");%>
            <form autocomplete="off" action="<%=ls_url+lsb_idSecuencia.toString()%>" class="paymentWidgets" data-brands="<%=ls_tarjetas%>" method="POST" target="iframeDetalle"></form>
                    <!--<center> 
                        <div id="divSalirModalPag"  style="text-align:center;" >
                            <a href="javascript:regresar_pago();">
                                <img height="37" width="113" style="background:rgba(0,0,0,.8)" src="../../imagenes/BRegresar.png"/>
                            </a>
                        </div>
                    </center>        -->
        <%}else{%>
            <form action="" class="" data-brands="<%=ls_tarjetas%>" method="POST" target="iframeDetalle"></form>
            
            <table border ="0" width="100%">
                <tr>
                    <td>
                        <%=ls_result.getResult().getCode()+" : "+ls_result.getResult().getDescription()%>
                    </td>
                </tr>
                <!--<tr>
                    <td>
                        <center> 
                            <div id="divSalirModalPag"  style="text-align:center;" >
                                <a href="javascript:regresar_pago();">
                                    <img height="37" width="113" style="background:rgba(0,0,0,.8)" src="../../imagenes/BRegresar.png"/>
                                </a>
                            </div>
                        </center>
                    </td>
                </tr>-->
            </table>
        <%}%>
        </form>
    </body>
    <%}else{%>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Error al Generar Comunicación con la Entidad Financiera</title>
            </head>
            <body style="overflow:hidden;">
                <form>
                    <%=l_credenciales.getPs_mensaje()%>
                </form>
            </body>
    <%}%>
   <%}//lsb_salida.toString
      else{%> 
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Error al Generar Comunicación con la Entidad Financiera</title>
            </head>
            <body style="overflow:hidden;">
                <form>
                    <%=lsb_salida.toString()%>
                </form>
            </body>
   <%}%>
    
    
    
    
    
    
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
</html>
