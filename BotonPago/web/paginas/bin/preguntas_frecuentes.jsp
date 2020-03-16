<%@page import="bo.BOPersona"%> 
<%@page import="bin.Consultas"%>


<%-- 
    Document   : clp_preguntas_frecuentes
    Created on : 19/07/2018, 09:20:50 AM
    Author     : Soporte2
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
<%

String ls_principal         = "aHR0cHM6Ly8xOTIuMTY4LjIuMTI1OjcwMDIvUG9ydGFsV0VCL3BhZ2luYXMvY2xpZW50ZXMvY2xwX2dyaWRfY2l0YWNpb25lcy5qc3A/cHNfdGlwb19pZGVudGlmaWNhY2lvbj1QTEEmcHNfaWRlbnRpZmljYWNpb249R1JXNzAyMCZwc19wbGFjYT0mcHNfaWRfZW1wcmVzYT0wNQ==";//request.getParameter("principal");//ls_principal="11";
String ls_secundaria        = "aHR0cHM6Ly8xOTIuMTY4LjIuMTI1OjcwMDIvUG9ydGFsV0VCL3BhZ2luYXMvY2xpZW50ZXMvY2xwX2dyaWRfY2l0YWNpb25lcy5qc3A/cHNfdGlwb19pZGVudGlmaWNhY2lvbj1QTEEmcHNfaWRlbnRpZmljYWNpb249R1JXNzAyMCZwc19wbGFjYT0mcHNfaWRfZW1wcmVzYT0wNQ==";//request.getParameter("secundaria");//ls_secundaria="22";
String ls_origen            = "POR";//request.getParameter("ps_origen");
String ls_tipoServ          = request.getParameter("ps_tiposerv");
if (ls_origen == null){
    ls_origen = "SVT";
}

if (ls_tipoServ==null){
       ls_tipoServ ="X";
}
%>
<html>
     <head>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preguntas Frecuentes</title>
        <link rel="icon" href="" type="image/x-icon">
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


        <link rel="stylesheet" href="../../scripts/bootstrap/sweetalert/css/sweetalert2.min.css" media="screen">
        <script src="../../scripts/bootstrap/sweetalert/js/sweetalert2.min.js" type="text/javascript"></script>
        <script src="../../scripts/bootstrap/sweetalert/js/sweetalert.js" type="text/javascript"></script> 

        <script src="../../scripts/otros/promise-polyfill.js" type="text/javascript"></script> 
        <script src="../../scripts/otros/core.js" type="text/javascript"></script> 
        <style type="text/css">
            
            .swal-height {
                height: 90% !important;;
                }


            .global {
                height: 310px;
                width: 100%;
                border: 1px solid #ddd;
                background: #ffffff;
                overflow-y: scroll;
            }
            .panel_preguntas_frecuentes {
                height: 370px;
                width: 100%;
                border: 1px solid #ddd;
                background: #ffffff;
                overflow-y: scroll;
                text-align: justify;
            }
            a.nounderline:link 
            { 
                text-decoration:none; 
            } 
            .cab-formulario {
                font-family: "Verdana";
                font-size: 20px;
                color: white;
                background-color: #585858;
            }
            
            .wpwl-button-pay{  
                background: transparent ;
                background-image: url("../../imagenes/BPagar2.png");
                padding-left: 39px;
                padding-right:  39px;
                background-color: white;
                border: none;
                font-size: 12px;
                font-family: "Verdana";
                height: 37px;
               
            }
 
.close {position:fixed;}
 
.closeButton2 {
    background:url("../../imagenes/cancel2.png") no-repeat;
    width:26px;height:26px;
    top:-4px;
    right:-4px;
    
    
}
.closeButton3 {
    background:url("../../imagenes/cancel.png") no-repeat;
    width:26px;height:26px;
    top:-4px;
    right:-4px;
    position:absolute;
}

        .table {
            display: table;   /* Allow the centering to work */
            margin: 0 auto;
        }

        ul#horizontal-list {
            list-style: none;
            }
        ul#horizontal-list li {
                display: inline;
        }

        </style>
        <script>
            
            
            function recaudacion_pend(ps_mensaje){
                //alert(ps_mensaje);
                //swal("", "Para continuar con el proceso es necesario que acepte las condiciones", "warning");
                swal({title:'',
                      text:ps_mensaje,
                      type:'warning',
                      allowEscapeKey : false,
                      allowOutsideClick: false
                    }).then(function (isConfirm) {
                                if (isConfirm) {
                                    var divError = window.parent.document.getElementById("divPago2");
                                    divError.style.display = "none";
                                } 
                            });
               // var divError = window.parent.document.getElementById("divPago2");
               // divError.style.display = "none";
                
            }
            function valida_pago(ps_mensaje){
                //alert(ps_mensaje);
                var ls_urlSec64 = "<%=ls_secundaria%>"; 
                var ls_urlPrin64 = "<%=ls_principal%>";
                var ls_tipoServ = "<%=ls_tipoServ%>";
                var ls_origen   = "<%=ls_origen%>";
                var ls_urlSec   = atob(ls_urlSec64);
                var ls_urlPrin  = atob(ls_urlPrin64);
                var divError    = window.parent.document.getElementById("divPago2");
                //alert(ls_tipoServ+" - "+ls_urlPrin);
                 swal({title:'',
                      text:ps_mensaje,
                      type:'warning',
                      allowEscapeKey : false,
                      allowOutsideClick: false
                    }).then(function (isConfirm) { 
                                if (isConfirm) {
                                    divError.style.display = "none";
                                    
                                    if (ls_origen == "SVT"){
                                        //alert(ls_urlSec);
                                        if (ls_tipoServ == "MAT"){
                                            window.parent.document.getElementById("iframe_cuerpo").src=ls_urlSec;
                                            window.parent.actualizarTituloCAB("DEUDAS PENDIENTES");
                                        }else{
                                            window.open(ls_urlPrin,target="_top");
                                        }
                                    }
                                    if (ls_origen == "POR"){
                                        window.open(ls_urlSec,target="_top");
                                    }                                    
                                } 
                            }); 
                
            }
        </script>
            
    <%  BOPersona   l_persona           = new BOPersona();
        Consultas   l_consultas         = new Consultas();
        
        //String ls_idEmpresa         = request.getParameter("empresa");
        //String ls_idProceso         = request.getParameter("proceso");
       // String ls_tipoIdentificacion= request.getParameter("tipoident");
        //String ls_identificacion    = request.getParameter("identificacion");
       // String ls_totalDeuda        = request.getParameter("valortotalpago");
       // String ls_valorImpuesto     = request.getParameter("impuesto");
       // String ls_valorSinImp       = request.getParameter("valorsini mp");
      //  String ls_tramite           = request.getParameter("trx");
      //  String ls_idTrxCaja         = request.getParameter("ps_id_trx_caja");
      //  String ls_Placa             = request.getParameter("ps_placa");
      //  String ls_tarifa0           = request.getParameter("valortarcero");
        
        String ls_idEmpresa         = "01";
        String ls_idProceso         = "D05";
        String ls_tipoIdentificacion= "PLA";
        String ls_identificacion    = "OBA9354";
        String ls_totalDeuda        = "58.67";
        String ls_valorImpuesto     = "0";
        String ls_valorSinImp       = "0";
        String ls_tramite           = "0";
        String ls_idTrxCaja         = "0";
        String ls_Placa             = "OBA9354";
        String ls_tarifa0           = "0";
        
        
        String ls_nombreLogoEmpresa = "logo_emp_" + ls_idEmpresa + ".png";
        String ls_nombres           = null;
        String ls_placa             = null;
        String ls_datosCabecera     = ls_nombres;
        //String ls_medio             = "";
        //String ls_urlGad            = "";
        String ls_logoRec           = "";
        String ls_logoCom           = "";
        String ls_paso              = "0";
        
        String ls_trxCajaComp       = "";
        String ls_totalDeuda2       = "";
        
        StringBuffer lsb_error      = new StringBuffer("");
        StringBuffer ls_motivo      = new StringBuffer();
        StringBuffer ls_estado      = new StringBuffer();
        StringBuffer psb_valorParametro = new StringBuffer();
        StringBuffer psb_salida     = new StringBuffer("");
        
        
        StringBuffer lsb_idTrxCajaInfra = new StringBuffer(""); 
        StringBuffer lsb_idTrxCajaTram  = new StringBuffer(""); 
        StringBuffer lsb_idTrxCajaOtr   = new StringBuffer(""); 
        StringBuffer lsb_valorRecaudar  = new StringBuffer("");
        
        
        //------------------------------------------------
        
        String ls_idIdent           = "PLA";//request.getParameter("tipoident");
        String ls_valorTotalPago    = "58.67";//request.getParameter("valortotalpago");
        String ls_transaccion       = "0";//request.getParameter("trx");
        String ls_proceso           = request.getParameter("proceso");
        String ls_tramaTrx          = request.getParameter("ps_id_trx_caja");
        //=====
        String ls_tipoCons          = request.getParameter("ps_tipoCon");
        String ls_valorCons         = request.getParameter("ps_valorCons");
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
        String ls_url               = ls_protocolo+"://"+ls_dominio+":"+ls_puerto+ls_path+"/paginas/bin/procesaPago.jsp?empresa="+ls_idEmpresa+"&proceso=D05";
        //=============
                                     ls_url = ls_url+"&origen="+ls_origen+"&principal="+ls_principal+"&secundaria="+ls_secundaria+"&idSecuencia="; 
        //=============
        String              ls_ip           = request.getRemoteAddr();
        StringBuffer        lsb_valorParametro= new StringBuffer("");
        StringBuffer        lsb_idSecuencia = new StringBuffer(""); 
        StringBuffer        lsb_resultado   = new StringBuffer(""); 
        StringBuffer        lsb_salida      = new StringBuffer(""); 
        StringBuffer        lsb_parametros  = new StringBuffer("");
        Credenciales        l_credenciales  = new Credenciales(); 
        Parametros          l_paramteros    = new Parametros();
        BODatosPersona      l_datosPersona  = new BODatosPersona();
        BOCotizacion        l_cotizacion    = new BOCotizacion();
        BOCheckoutId        ls_result       = new BOCheckoutId();  
        
        //-------------------------------------
        
        psb_salida = new StringBuffer("");
        if (ls_origen.equals("SVT")){
            l_consultas.valida_pago(ls_idEmpresa, ls_tramite, "D", psb_salida,ls_idProceso,"DTF_PAGO"); 
        }else{
            l_consultas.valida_pago_consulta(ls_idEmpresa, ls_origen, ls_tipoIdentificacion, ls_identificacion, psb_salida,ls_idProceso,"DTF_PAGO"); 
        }
        if (!(psb_salida.toString().equals("OK"))){
            psb_salida = new StringBuffer(psb_salida.toString().replace("\n", "").replace("\r", "").replace("\"", "")); 
            ls_paso    = "1";
        %>
          <body>
            <script>
                valida_pago("<%=psb_salida.toString()%>");
                //alert("<%=psb_salida.toString()%>");
                //var ls_urlSec64 = "<%=ls_secundaria%>"; 
                //var ls_urlPrin64 = "<%=ls_principal%>";
                //var ls_origen   = "<%=ls_origen%>";
                //var ls_urlSec   = atob(ls_urlSec64);
                //var ls_urlPrin  = atob(ls_urlPrin64);
                //var divError    = window.parent.document.getElementById("divPago2");
                //divError.style.display = "none";
                //if (ls_origen == "SVT"){
                //    window.parent.document.getElementById("iframe_cuerpo").src=ls_urlSec;
                //    window.parent.actualizarTituloCAB("DEUDAS PENDIENTES");
                //}
                //if (ls_origen == "POR"){
                //    window.open(ls_urlSec,target="_top");
                //}
            </script>
          </body>
        <%            
        }
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_DIFERIDO", psb_valorParametro, psb_salida);
        String ls_diferido =  psb_valorParametro.toString();
        psb_valorParametro = new StringBuffer("");
        if (ls_diferido == null){
            ls_diferido = "N";
        }
        //l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_MEDIO", psb_valorParametro, psb_salida);
        //ls_medio = psb_valorParametro.toString();
        //psb_valorParametro = new StringBuffer("");
        
        //l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_URLGAD", psb_valorParametro, psb_salida);
        //ls_urlGad = psb_valorParametro.toString();
        //psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_LOGOREC", psb_valorParametro, psb_salida);
        ls_logoRec = psb_valorParametro.toString();
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_LOGOCOM", psb_valorParametro, psb_salida);
        ls_logoCom = psb_valorParametro.toString();
        psb_valorParametro = new StringBuffer("");
        
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG1", psb_valorParametro, psb_salida);
        String ls_pregunta_1 = psb_valorParametro.toString();
        if (ls_pregunta_1 == null){
            ls_pregunta_1 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP1", psb_valorParametro, psb_salida);
        String ls_respuesta_1 = psb_valorParametro.toString();
        if (ls_respuesta_1 == null){
            ls_respuesta_1 = "";
        }
        psb_valorParametro = new StringBuffer("");

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG2", psb_valorParametro, psb_salida);
        String ls_pregunta_2 = psb_valorParametro.toString();
        if (ls_pregunta_2 == null){
            ls_pregunta_2 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP2", psb_valorParametro, psb_salida);
        String ls_respuesta_2 = psb_valorParametro.toString();
        if (ls_respuesta_2 == null){
            ls_respuesta_2 = "";
        }
        psb_valorParametro = new StringBuffer("");
                      
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG3", psb_valorParametro, psb_salida);
        String ls_pregunta_3 = psb_valorParametro.toString();
        if (ls_pregunta_3 == null){
            ls_pregunta_3 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP3", psb_valorParametro, psb_salida);
        String ls_respuesta_3 = psb_valorParametro.toString();
        if (ls_respuesta_3 == null){
            ls_respuesta_3 = "";
        }
        psb_valorParametro = new StringBuffer("");
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG4", psb_valorParametro, psb_salida);
        String ls_pregunta_4 = psb_valorParametro.toString();
        if (ls_pregunta_4 == null){
            ls_pregunta_4 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP4", psb_valorParametro, psb_salida);
        String ls_respuesta_4 = psb_valorParametro.toString();
        if (ls_respuesta_4 == null){
            ls_respuesta_4 = "";
        }
        psb_valorParametro = new StringBuffer("");
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG5", psb_valorParametro, psb_salida);
        String ls_pregunta_5 = psb_valorParametro.toString();
        if (ls_pregunta_5 == null){
            ls_pregunta_5 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP5", psb_valorParametro, psb_salida);
        String ls_respuesta_5 = psb_valorParametro.toString();
        if (ls_respuesta_5 == null){
            ls_respuesta_5 = "";
        }
        psb_valorParametro = new StringBuffer("");
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG6", psb_valorParametro, psb_salida);
        String ls_pregunta_6 = psb_valorParametro.toString();
        if (ls_pregunta_6 == null){
            ls_pregunta_6 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP6", psb_valorParametro, psb_salida);
        String ls_respuesta_6 = psb_valorParametro.toString();
        if (ls_respuesta_6 == null){
            ls_respuesta_6 = "";
        }
        psb_valorParametro = new StringBuffer("");   
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG7", psb_valorParametro, psb_salida);
        String ls_pregunta_7 = psb_valorParametro.toString();
        if (ls_pregunta_7 == null){
            ls_pregunta_7 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP7", psb_valorParametro, psb_salida);
        String ls_respuesta_7 = psb_valorParametro.toString();
        if (ls_respuesta_7 == null){
            ls_respuesta_7 = "";
        }
        psb_valorParametro = new StringBuffer("");     
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_PRG8", psb_valorParametro, psb_salida);
        String ls_pregunta_8 = psb_valorParametro.toString();
        if (ls_pregunta_8 == null){
            ls_pregunta_8 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_RSP8", psb_valorParametro, psb_salida);
        String ls_respuesta_8 = psb_valorParametro.toString();
        if (ls_respuesta_8 == null){
            ls_respuesta_8 = "";
        }
        psb_valorParametro = new StringBuffer("");                   
        //=========================================================//
        
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER1", psb_valorParametro, psb_salida);
        String ls_titulo_termino_1 = psb_valorParametro.toString();
        if (ls_titulo_termino_1 == null){
            ls_titulo_termino_1 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER1", psb_valorParametro, psb_salida);
        String ls_termino_1 = psb_valorParametro.toString();
        if (ls_termino_1 == null){
            ls_termino_1 = "";
        }
        psb_valorParametro = new StringBuffer("");   
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER2", psb_valorParametro, psb_salida);
        String ls_titulo_termino_2 = psb_valorParametro.toString();
        if (ls_titulo_termino_2 == null){
            ls_titulo_termino_2 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER2", psb_valorParametro, psb_salida);
        String ls_termino_2 = psb_valorParametro.toString();
        if (ls_termino_2 == null){
            ls_termino_2 = "";
        }
        psb_valorParametro = new StringBuffer("");     

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER3", psb_valorParametro, psb_salida);
        String ls_titulo_termino_3 = psb_valorParametro.toString();
        if (ls_titulo_termino_3 == null){
            ls_titulo_termino_3 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER3", psb_valorParametro, psb_salida);
        String ls_termino_3 = psb_valorParametro.toString();
        if (ls_termino_3 == null){
            ls_termino_3 = "";
        }
        psb_valorParametro = new StringBuffer(""); 
        
        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER4", psb_valorParametro, psb_salida);
        String ls_titulo_termino_4 = psb_valorParametro.toString();
        if (ls_titulo_termino_4 == null){
            ls_titulo_termino_4 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER4", psb_valorParametro, psb_salida);
        String ls_termino_4 = psb_valorParametro.toString();
        if (ls_termino_4 == null){
            ls_termino_4 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER5", psb_valorParametro, psb_salida);
        String ls_titulo_termino_5 = psb_valorParametro.toString();
        if (ls_titulo_termino_5 == null){
            ls_titulo_termino_5 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER5", psb_valorParametro, psb_salida);
        String ls_termino_5 = psb_valorParametro.toString();
        if (ls_termino_5 == null){
            ls_termino_5 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER6", psb_valorParametro, psb_salida);
        String ls_titulo_termino_6 = psb_valorParametro.toString();
        if (ls_titulo_termino_6 == null){
            ls_titulo_termino_6 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER6", psb_valorParametro, psb_salida);
        String ls_termino_6 = psb_valorParametro.toString(); 
        if (ls_termino_6 == null){
            ls_termino_2 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER7", psb_valorParametro, psb_salida);
        String ls_titulo_termino_7 = psb_valorParametro.toString();
        if (ls_titulo_termino_7 == null){
            ls_titulo_termino_7 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER7", psb_valorParametro, psb_salida);
        String ls_termino_7 = psb_valorParametro.toString();
        if (ls_termino_7 == null){
            ls_termino_7 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER8", psb_valorParametro, psb_salida);
        String ls_titulo_termino_8 = psb_valorParametro.toString();
        if (ls_titulo_termino_8 == null){
            ls_titulo_termino_8 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER8", psb_valorParametro, psb_salida);
        String ls_termino_8 = psb_valorParametro.toString();
        if (ls_termino_8 == null){
            ls_termino_8 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER9", psb_valorParametro, psb_salida);
        String ls_titulo_termino_9 = psb_valorParametro.toString();
        if (ls_titulo_termino_9 == null){
            ls_titulo_termino_9 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER9", psb_valorParametro, psb_salida);
        String ls_termino_9 = psb_valorParametro.toString();
        if (ls_termino_9 == null){
            ls_termino_9 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER10", psb_valorParametro, psb_salida);
        String ls_titulo_termino_10 = psb_valorParametro.toString();
        if (ls_titulo_termino_10 == null){
            ls_titulo_termino_10 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER10", psb_valorParametro, psb_salida);
        String ls_termino_10 = psb_valorParametro.toString();
        if (ls_termino_10 == null){
            ls_termino_10 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER11", psb_valorParametro, psb_salida);
        String ls_titulo_termino_11 = psb_valorParametro.toString();
        if (ls_titulo_termino_11 == null){
            ls_titulo_termino_11 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER11", psb_valorParametro, psb_salida);
        String ls_termino_11 = psb_valorParametro.toString();
        if (ls_termino_11 == null){
            ls_termino_11 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER12", psb_valorParametro, psb_salida);
        String ls_titulo_termino_12 = psb_valorParametro.toString();
        if (ls_titulo_termino_12 == null){
            ls_titulo_termino_12 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER12", psb_valorParametro, psb_salida);
        String ls_termino_12 = psb_valorParametro.toString();
        if (ls_termino_12 == null){
            ls_termino_12 = "";
        }
        psb_valorParametro = new StringBuffer(""); 

        //=========================================================//
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TIT_TER13", psb_valorParametro, psb_salida);
        String ls_titulo_termino_13 = psb_valorParametro.toString();
        if (ls_titulo_termino_13 == null){
            ls_titulo_termino_13 = "";
        }
        psb_valorParametro = new StringBuffer("");
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF_TER13", psb_valorParametro, psb_salida);
        String ls_termino_13 = psb_valorParametro.toString();
        if (ls_termino_13 == null){
            ls_termino_13 = "";
        }
        psb_valorParametro = new StringBuffer(""); 


        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF-CONTCAB", psb_valorParametro, psb_salida);
        String ls_contactoCab = psb_valorParametro.toString();
        if (ls_contactoCab == null){
            ls_contactoCab = "";
        }
        psb_valorParametro = new StringBuffer(""); 
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF-CONTTEL", psb_valorParametro, psb_salida);
        String ls_contactoTEL = psb_valorParametro.toString();
        if (ls_contactoTEL == null){
            ls_contactoTEL = "";
        }
        psb_valorParametro = new StringBuffer(""); 
        
        l_consultas.valor_parametros(ls_idEmpresa, ls_idProceso, "DTF-CONTPIE", psb_valorParametro, psb_salida);
        String ls_contactoPIE = psb_valorParametro.toString();
        if (ls_contactoPIE == null){
            ls_contactoPIE = "";
        }
        psb_valorParametro = new StringBuffer(""); 
                                                     
        //=========================================================// 
        
       
        if (ls_tipoIdentificacion.equals("PLA")) {
            ls_datosCabecera = ls_identificacion;
        } else {
            l_persona      = l_consultas.datosPersona(ls_identificacion, ls_tipoIdentificacion, lsb_error);
            StringBuffer lsb_nombre = new StringBuffer(l_persona.getPs_nombre_completo()); 
            StringBuffer lsb_idIdentificacion = new StringBuffer(l_persona.getPs_idIdentificacion());
            StringBuffer lsb_identificacion = new StringBuffer(l_persona.getPs_identificacion());
            StringBuffer lsb_tipoPersona = new StringBuffer(l_persona.getPs_tipo_persona());
            ls_nombres = lsb_nombre.toString();
            ls_datosCabecera = ls_tipoIdentificacion + "&nbsp;" + ls_identificacion;
        }

        psb_salida = new StringBuffer("");
        //System.out.println(ls_idEmpresa+" - "+ls_tramite+" - "+ls_Placa+" - "+ls_origen+" - "+ls_tipoIdentificacion+" - "+ls_identificacion);
        l_consultas.genera_recaudacion_pendiente(ls_idEmpresa, 
                                                 ls_tramite, 
                                                 ls_Placa, 
                                                 lsb_idTrxCajaInfra, 
                                                 lsb_idTrxCajaTram, 
                                                 lsb_idTrxCajaOtr, 
                                                 lsb_valorRecaudar, 
                                                 psb_salida,
                                                 ls_origen,
                                                 ls_tipoIdentificacion,
                                                 ls_identificacion);
        
        String ls_error = psb_salida.toString();
        if ((!(ls_error.equals("OK")))&& ls_paso.equals("0")) {
            ls_error =  ls_error.replace("\n", "").replace("\r", "").replace("\"", "");
            %>
            <body>
            <script>
                recaudacion_pend("<%=ls_error%>");
            </script>
            </body>
        <%
        }else{
            ls_trxCajaComp = lsb_idTrxCajaInfra.toString()+"|"+lsb_idTrxCajaTram.toString()+"|"+lsb_idTrxCajaOtr+"|";
            ls_totalDeuda = lsb_valorRecaudar.toString();
            
            String[] lsa_total = ls_totalDeuda.split("\\.");
            
            if (lsa_total.length > 1){
                if (lsa_total[1].length() < 2){
                ls_totalDeuda2 = lsa_total[0]+"."+lsa_total[1]+"0"; 
                }else{
                    ls_totalDeuda2 = ls_totalDeuda;
                }
            }else{
                ls_totalDeuda2 = ls_totalDeuda;
            }
        
        }
        lsb_error = new StringBuffer("");
        StringBuffer lsb_descEmpresa = new StringBuffer("");
        l_consultas.DatosEmpresa(ls_idEmpresa, lsb_descEmpresa, lsb_error);        
        //String ls_descripcionEmpresa = sql.getValor("select descripcion from ge_empresas where id_empresa = ? ",ls_idEmpresa);
        String ls_descripcionEmpresa = lsb_descEmpresa.toString();//"PORTOVIAL EP";
        String ls_datosEmpresa = "<FONT FACE=\"Verdana\" SIZE=2 COLOR=\"#00A6E8\">"
                + ls_descripcionEmpresa + "</FONT>";
        
        //-------------------------------------------
        
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

        
        ps_idProceso = "D05";
                    
        l_credenciales  =  l_paramteros.inicializa(ls_idEmpresa, ps_idProceso);            
        
        System.out.println(l_credenciales.getPs_protocolo()+" L_CREDENCIALES");
        System.out.println(ls_idEmpresa+" pf_ls_idEmpresa");
        System.out.println(ps_idProceso+" pf_ps_idProceso");
        
                    if (l_credenciales.getPs_mensaje()==null){
                        
                        System.out.println(ls_idEmpresa+" pf_ls_idEmpresa");
                        System.out.println(ps_idProceso+" pf_ps_idProceso");
                        System.out.println(l_datosPersona.getMiddleName()+" l_datosPersona.getMiddleName()");
                        System.out.println(l_cotizacion.getIva()+" l_cotizacion.getIva()");
                        System.out.println(lsb_parametros+" lsb_parametros");
                        
                        l_datosPersona.setGivenName("DIANA CAROLINA");
                        l_datosPersona.setSurname("MONTES");
                        l_datosPersona.setMerchantCustomerId("6499533");
                        l_datosPersona.setEmail("");
                        l_datosPersona.setTestMode("EXTERNAL");
                        l_datosPersona.setIdentificationDocId("0706507696");
                        l_cotizacion.setMid("1000000505");
                        l_cotizacion.setTid("PD100406");
                        l_cotizacion.setComercio_elect("0103910");
                        l_cotizacion.setProveedor("17913101");
                        l_cotizacion.setRisk("[USER_DATA2]=PORTOVIAL");
                       
                        ls_result      =  DAOCheckoutId.request(ls_idEmpresa, 
                                                                ps_idProceso, 
                                                                l_credenciales,
                                                                l_datosPersona,
                                                                l_cotizacion,
                                                                lsb_parametros);
                        lsb_resultado.append(new Gson().toJson(ls_result));
                        
                        System.out.println(ls_result.getId()+" LSRESULT");

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
                            <%}%>
                        <%}%>
                        
                    <%}else{
                        ls_result = null;
                    }
        }%>
                            
                         
    
    
    
   
        <!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser
          <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
        -->
        <script>
            $(function() {
                // Since there's no list-group/tab integration in Bootstrap
                $('.list-group-item').on('click',function(e){
                    var previous = $(this).closest(".list-group").children(".active");
                    previous.removeClass('active'); // previous list-item
                    $(e.target).addClass('active'); // activated list-item
                });
              $("#pagar").on('click',function(e){
                    $('.list-group-item').removeClass('active');
                });                  
            });
            function boton_pago(){
                var condiciones = $("#aceptarCondicion").is(":checked");
                if (condiciones) {
                    //swal("", "Para continuar con el proceso es necesario que acepte las condiciones", "warning");
                    //return false;
                    //palerta("Para continuar con el proceso es necesario que acepte las condiciones",'X',null); 
                    swal("", "Para continuar con el proceso es necesario que acepte las condiciones", "warning");
                    //  return false;
                    // alert("Debe aceptar las condiciones");
                }else{
                      //alert("datafast");
                    var ls_empresa = "<%=ls_idEmpresa%>";
                    var ls_identificacion = "<%=ls_identificacion%>";
                    var ls_tipoIdent = "<%=ls_tipoIdentificacion%>";
                    var ls_protocolo = "<%=request.getScheme()%>"; 
                    var ls_dominio   = "<%=request.getServerName()%>";
                    var ls_puerto    = "<%=request.getServerPort()%>";
                    var ls_tramite   = "<%=ls_tramite%>";
                    var ls_diferido  = "<%=ls_diferido%>";
                    var ls_trx_caja  = "<%=ls_trxCajaComp%>";
                    var ls_trx_caja64= btoa(ls_trx_caja);
                    var ls_url = ls_protocolo+"://"+ls_dominio+":"+ls_puerto+"/BotonPago/paginas/bin/pago.jsp"; 
                    //var ls_url = ls_protocolo+"://"+ls_dominio+":"+ls_puerto+"/BotonPago/paginas/bin/preguntas_frecuentes.jsp";  
                    ls_url = ls_url + "?empresa="+ls_empresa+"&tipoident="+ls_tipoIdent;
                    ls_url = ls_url + "&identificacion="+ls_identificacion;
                    
                    ls_url = ls_url + "&valortotalpago=<%=ls_totalDeuda%>&impuesto=<%=ls_valorImpuesto%>";
                    ls_url = ls_url + "&valorsinimp=<%=ls_valorSinImp%>&valortarcero=<%=ls_tarifa0%>&trx="+ls_tramite;
                    //ls_url = ls_url + "&ps_id_trx_caja=<%=ls_trxCajaComp%>&proceso=<%=ls_idProceso%>";
                    ls_url = ls_url + "&ps_id_trx_caja="+ls_trx_caja64+"&proceso=<%=ps_idProceso%>";
                    
                    ls_url = ls_url + "&diferido="+ls_diferido;
                    //=============
                    ls_url = ls_url+"&principal=<%=ls_principal%>&secundaria=<%=ls_secundaria%>&origen=<%=ls_origen%>&ps_tipoCon=<%=ls_tipoIdentificacion%>&ps_valorCons=<%=ls_identificacion%>";
                    //=============
                    var divPago = document.getElementById("divBoton");
                    alert(ls_url);
                    divPago.style.display = "block";
                    window.open(ls_url,target="iframeBoton");
                }
              
            }
            
                function regresar(){
                    var ls_origen = "<%=ls_origen%>"; 
                    var ls_principal64  = "<%=ls_principal%>";
                    var ls_principal = atob(ls_principal64);
                    var divError = "";//window.parent.document.getElementById("divPago2");
                    ///alert(divError);
                    if (ls_origen == "SVT"){
                        //var framePreguntas = window.parent.document.getElementById("iframeDetalle2");
                        //framePreguntas.src = "";
                        
                        document.form1.action=ls_principal;
                        form1.target = "_top";
                        form1.submit();
                    }else{
                        //var framePreguntas = parent.document.getElementById("iframeDetalle2");
                        //alert(framePreguntas);
                        //framePreguntas.src = "";
                        //window.open(ls_principal,target="_top");
                        document.form1.action=ls_principal; 
                        form1.target = "_top";
                        form1.submit();
                    }
                    //divError.style.display = "none";
                }
                
                
                 function regresar_pago(){
                    var divBoton = document.getElementById("divBoton");
                    divBoton.style.display = "none";
                    
                }
                
                
                
        </script>
        <%System.out.println(l_credenciales.getPs_url_script()+ls_result.getId()+" <---URL");%>
        <script src="<%=l_credenciales.getPs_url_script()+ls_result.getId()%>"></script>
        <script>
            var wpwlOptions = {
                locale: "es",
                style: "plain",
                
                onReady: function(e) {
                    
                    var email = '<div class="wpwl-group">'+
                            '<div class="wpwl-label">Email: </div>'+
                            '<input autocomplete="off" type="email" name="emailUsuario placeholder="Correo electronico" value aria-label="Correo Electronico"' +
                            'style="font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;'+ 
                            'font-size: 14px; font-weight: 400; font-style: normal; color: rgb(51, 51, 51);'+ 
                            'text-transform: none; text-decoration: none solid rgb(51, 51, 51); letter-spacing: 0px;'+
                            'word-spacing: 0px; line-height: 20px; text-align: center; vertical-align: baseline;'+
                            'direction: ltr; background-color: rgb(255, 255, 255); background-image: none; '+
                            'background-repeat: repeat; background-position: 0% 0%; background-attachment: scroll;'+
                            ' opacity: 1; box-sizing: border-box;">'+
                            '</div><br>';
                    var term_condi = '<br>'+
                '<div class="checkbox titulo col-md-11" style="text-align: center; margin: auto;"><!-- style="background: gray"-->'+
                        '<label><input id="aceptarCondicion" type="checkbox" value="">Aceptar los Términos y Condiciones</label>'+
                    '</div><br><br>';
           
            $('form.wpwl-form-card').find('.wpwl-button').before(term_condi);
                }
            };
        </script>
    </head>
    <body  style="text-align: justify; padding-bottom: 1px; margin-bottom: 1x;" bgcolor="#FFFFFF" text="#000000" leftmargin="100px" marginwidth="0" topmargin="0" marginheight="0">
    
        <div class="container" style="width: 100%; border: 1;">
                                <%lsb_idSecuencia.append("34"); %>

                <div class="col-md-6"><!-- style="background: red"-->
                <div class="row-md-13" ><!-- style="background: yellow"-->
                    <div class="row" >
                        <div class="row-md-3" style="text-align:center;">
                            <img height="100" width="150" src="../../imagenes/empresa/<%=ls_nombreLogoEmpresa%>"/>
                        </div>
                        <div class="row-md-6"  style = "text-align: center; margin: auto;">
                            <%if (ls_nombres != null) {

                            %> <ul class="list-inline" style="margin-bottom: -5px; margin-top: 5px; font-weight: bold; font-size: 21px;">
                                <li class="link"><%=ls_nombres%></li>
                            </ul>                            
                            <%
                                }   
                            %>                            
                            <ul class="list-inline" style="margin-bottom: -5px; margin-top: 5px; font-weight: bold; font-size: 21px;">
                                <li class="link"><%=ls_datosCabecera%></li>
                            </ul>

                        </div>
                            <div class="row-md-3" style = "text-align: center; margin: auto;" >
                            <ul class="list-inline" style="margin-bottom: -5px;  margin-top: 5px; font-weight: bold; font-size: 38px;">
                                <li class="link"><strong>$ <%=ls_totalDeuda2%></strong></li>
                            </ul>
                        </div>
                    </div>      
                </div>
                            
                 <br>
                 
                 <div class="row">
                     
                     <div class="row">
                            
                        <form action="<%=ls_url+lsb_idSecuencia.toString()%>" class="paymentWidgets" data-brands="VISA MASTER" method="POST"></form>
                     </div>
                    <div id="divSalirModalReporte" class="row" style="text-align:center;">
                       <br>
                       <a>
                            <img height="70" width="326" src="<%=ls_logoRec%>"/>
                        </a>
                    </div>
                
                 </div>
                  
        </div>
        
       

        <div  class="col-md-6" style=" border: 1;" ><!--background: green;-->
            <!--
            style="background-color:lightcyan;"
            <span class="glyphicon glyphicon-user"></span>

       <div class="row col-md-13"   style="width: 100%; text-align: center; margin-top: auto;margin-left: auto; margin-right: auto; padding-bottom: 2%; margin-bottom: auto" ><!--background: pink;-->

                <div class="row"  style="border:2; width: 80%; text-align: center; margin-left: auto; margin-right: auto; margin-top: auto; margin-bottom: auto; "><!--background: purple;-->

                    <%if (ls_estado.toString().equals("PENDING")) {

                    %>
                    <div class="checkbox titulo">
                        <label><STRONG>PAGO PENDIENTE</strong></label>
                    </div>
                    <%}
                    %>
                    
                    <div id="divSalirModalReporte" class="col-md-11" style="text-align: center; margin: auto;" ><!--background: goldenrod-->
                        &nbsp;
                    </div>
                    <br>
                    <div id="divSalirModalReporte" class="col-md-11" style="text-align: center; margin: auto;" ><!--background: goldenrod-->
                        &nbsp;
                    </div>
                    
                    <ul class="list-group help-group" >
                        <div class="faq-list list-group nav nav-tabs col" style="text-align: center; margin: auto;"><!-- style="background: firebrick"-->

                            <a href="#tab1" class="list-group-item" role="tab" data-toggle="tab"><i class="mdi mdi-account"></i>Preguntas  Frecuentes</a>
                            <a href="#tab2" class="list-group-item active" role="tab" data-toggle="tab">Términos y Condiciones</a>
                            <a href="#tab3" class="list-group-item" role="tab" data-toggle="tab"><i class="mdi mdi-account"></i>Contactos</a>
                        </div>

                    </ul>
                    <div id="divSalirModalReporte" class="col-md-11" style="text-align: center; margin: auto;" ><!--background: goldenrod-->
                        &nbsp;
                    </div>
                
                </div>
                       
                <div class="row"  style="width: 80%; text-align: center; margin: auto;" ><!--background: blue;-->
                    <div class="tab-content panels-faq" style="text-align: center; margin: auto;">
                        <div class="tab-pane active" id="tab2" style="text-align: center; margin: auto;">
                            <div class="panel-group panel_preguntas_frecuentes" id="help-accordion-2" style="text-align: center; margin: auto;">      
                                <div class="panel panel-default panel-help" style="text-align: center; margin: auto;">
                                    <a href="#help-three" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-2">
                                        <div class="panel-heading" style="font-weight: bold; font-size: 14px;">
                                            TÉRMINOS Y CONDICIONES PARA LA UTILIZACIÓN DEL CANAL BOTÓN DE PAGOS DE <%=ls_descripcionEmpresa%>
                                        </div>
                                    </a>
                                    <div id="help-three" >
                                        <div class="panel-body" style="font-size: 9px;">
                                            <strong><%=ls_titulo_termino_1%></strong> 
                                            <%=ls_termino_1%>
                                            <strong><%=ls_titulo_termino_2%></strong>
                                            <%=ls_termino_2%>
                                            <strong><%=ls_titulo_termino_3%></strong>
                                            <%=ls_termino_3%>
                                            <strong><%=ls_titulo_termino_4%></strong>
                                            <%=ls_termino_4%>
                                            <strong><%=ls_titulo_termino_5%></strong>
                                            <%=ls_termino_5%> 
                                            <strong><%=ls_titulo_termino_6%></strong>
                                            <%=ls_termino_6%>
                                            <strong><%=ls_titulo_termino_7%></strong>
                                            <%=ls_termino_7%>
                                            <strong><%=ls_titulo_termino_8%></strong>
                                            <%=ls_termino_8%>
                                            <strong><%=ls_titulo_termino_9%></strong>
                                            <%=ls_termino_9%>
                                            <strong><%=ls_titulo_termino_10%></strong>
                                            <%=ls_termino_10%>
                                            <strong><%=ls_titulo_termino_11%></strong>
                                            <%=ls_termino_11%>
                                            <strong><%=ls_titulo_termino_12%></strong>
                                            <%=ls_termino_12%> 
                                            <strong><%=ls_titulo_termino_13%></strong>
                                            <%=ls_termino_13%> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="tab-pane " id="tab1">
                            <div class="panel-group panel_preguntas_frecuentes" id="help-accordion-1">
                                <% if (!(ls_pregunta_1.equals(""))){%>
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-1" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">
                                                <P><%=ls_pregunta_1%></p>
                                            </div>
                                        </a>
                                        <div id="test-1" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_1%></p>
                                            </div>
                                        </div>
                                    </div>
                                <%}%>  
                                
                                <% if (!(ls_pregunta_2.equals(""))){%>
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-2" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">                                         
                                                <P><%=ls_pregunta_2%></p>
                                            </div>
                                        </a>
                                        <div id="test-2" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_2%></p>
                                            </div>
                                        </div>
                                    </div>
                                 <%}%>                
                                 <% if (!(ls_pregunta_3.equals(""))){%>               
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-3" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">                                         
                                                <P><%=ls_pregunta_3%></p>
                                            </div>
                                        </a>
                                        <div id="test-3" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_3%></p>
                                            </div>
                                        </div>
                                    </div>    
                                <%}%>
                                
                                <% if (!(ls_pregunta_4.equals(""))){%>
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-4" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">                                         
                                                <P><%=ls_pregunta_4%></p>
                                            </div>
                                        </a>
                                        <div id="test-4" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_4%></p>
                                            </div>
                                        </div>
                                    </div>
                                <%}%>            
                                
                                <% if (!(ls_pregunta_5.equals(""))){%>
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-5" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">                                         
                                                <P><%=ls_pregunta_5%></p>
                                            </div>
                                        </a>
                                        <div id="test-5" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_5%></p>
                                            </div>
                                        </div>
                                    </div> 
                                <%}%>
                                
                                <% if (!(ls_pregunta_6.equals(""))){%>
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-6" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">                                         
                                                <P><%=ls_pregunta_6%></p>
                                            </div>
                                        </a>
                                        <div id="test-6" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_6%></p>
                                            </div>
                                        </div>
                                    </div> 
                                <%}%>            
                                
                                
                                <% if (!(ls_pregunta_7.equals(""))){%>
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-7" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">                                         
                                                <P><%=ls_pregunta_7%></p>
                                            </div>
                                        </a>
                                        <div id="test-7" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_7%></p>
                                            </div>
                                        </div>
                                    </div>
                                <%}%>
                                
                                
                                <% if (!(ls_pregunta_8.equals(""))){%>
                                    <div class="panel panel-default panel-help">
                                        <a href="#test-8" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-1">
                                            <div class="panel-heading">                                         
                                                <P><%=ls_pregunta_8%></p>
                                            </div>
                                        </a>
                                        <div id="test-8" class="collapse">
                                            <div class="panel-body">
                                                <p><%=ls_respuesta_8%></p>
                                            </div>
                                        </div>
                                    </div> 
                               <%}%>             
                                            

                            </div>
                        </div>

                        <div class="tab-pane" id="tab3">
                            <div class="panel-group panel_preguntas_frecuentes" id="help-accordion-3">      
                                <div class="panel panel-default panel-help">
                                    <a href="#help-three-c" class="nounderline" data-toggle="collapse" data-parent="#help-accordion-3">
                                        <div class="panel-heading" style="font-weight: bold; font-size: 14px;">
                                            CONTÁCTANOS
                                        </div>
                                    </a>
                                    <div id="help-three-c" >
                                        <div class="panel-body" >
                                            <%=ls_contactoCab%>
                                            <%=ls_contactoTEL%>
                                            <%=ls_contactoPIE%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                
                    </div>    
                </div>
            </div>

        </div>
                
        <!--INI FLO-->
        <%
        String ls_height = "55";
        if (ls_diferido.equals("S")){
            ls_height = "75";//65
        }
        %>
        <div id="divBoton" style="top:0px; left: 0px; width: 100%;  height: 100%; position: absolute; background:rgba(0,0,0,.5) ;display: none;border:0" >
            <div style=" top:20px; margin-left: auto; margin-right: auto; width: 55%;  height: <%=ls_height%>%; position:relative;background:white;border: #585858 2px solid;border-radius: 10px; "> 
                <span class="close closeButton2"></span> 
                <iframe name="iframeBoton" id="iframeBoton" src="" style="align:center;width: 100%;  height: 100%;border:0;border-radius: 10px;">
                </iframe>
            </div>
        </div>          
        <script>
            var close=document.querySelectorAll(".closeButton1, .closeButton2");
            close.forEach(function(e){
                e.addEventListener("click",function(){
                    var divBoton = document.getElementById("divBoton");
                    var frameBoton = document.getElementById("iframeBoton");
                    frameBoton.src = "blanca.jsp";
                    divBoton.style.display = "none";
                });
            });
        </script>
        
        <!--FIN FLO--> 
        <input type="hidden" id="principal" name="principal" value="<%=ls_principal%>"> 
        <input type="hidden" id="secundaria" name="secundaria" value="<%=ls_secundaria%>">  
        <input type="hidden" id="pago" name="pago" value="S"> 
        <input type="hidden" id="cancelada" name="cancelada" value="N"> 
        </form>
    </body>
</html>
