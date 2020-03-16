<%-- 
    Document   : prueba
    Created on : 19/07/2019, 10:52:09 AM
    Author     : yoveri
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="bin.Transacciones"%>
<%@page import="bin.Consultas"%>
<%@page import="bin.Parametros"%>
<%@page import="bo.Credenciales"%>
<%@page import="dao.DAOPagoRequest"%>
<%@page import="bo.BOPagoRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String ls_id            = request.getParameter("id");
    String ls_resourcePath  = request.getParameter("resourcePath");
    String shopperResultURL = request.getParameter("shopperResultUrl");
    String ls_empresa       = request.getParameter("empresa");
    String ls_proceso       = request.getParameter("proceso");
    String ls_secuencia     = request.getParameter("idSecuencia");
    //=====
    String ls_principal         = request.getParameter("principal");
    String ls_secundaria        = request.getParameter("secundaria");
    String ls_origen            = request.getParameter("origen");
    //=====    
    String ls_estadoPago    = "";

    StringBuffer lsb_valorParametro = new StringBuffer("");
    StringBuffer lsb_error          = new StringBuffer("");
    StringBuffer lsb_resultado      = new StringBuffer("");
    StringBuffer lsb_estado         = new StringBuffer("");
    
    String ls_estadoTrx = "";
    String ls_mensajeTrx = "";
    
    Consultas       l_consultas     = new Consultas();
    Parametros      l_paramteros    = new Parametros();
    Credenciales    l_datos         = l_paramteros.inicializa(ls_empresa, ls_proceso);
    BOPagoRequest   l_pagosRequest  = DAOPagoRequest.PagoRequest(ls_empresa, ls_proceso,"0.01",l_datos,ls_id); 

    //System.out.println(l_pagosRequest.getResult().getCode()); 
    ls_estadoTrx    = l_pagosRequest.getResult().getCode();
    ls_mensajeTrx   = l_pagosRequest.getResult().getDescription();
    System.out.println("");
    System.out.println("");
    
    l_consultas.valor_parametros(ls_empresa, ls_proceso, "DTF_PAGO", lsb_valorParametro, lsb_error);
    ls_estadoPago = lsb_valorParametro.toString();
    lsb_valorParametro = new StringBuffer("");

    lsb_resultado.append(new Gson().toJson(l_pagosRequest));
    //System.out.println(lsb_resultado.toString());
    lsb_error = new StringBuffer("");
    lsb_estado = new StringBuffer("");
    Transacciones l_transaccion = new Transacciones();
    System.out.println("PROCESA PAGO OK");
    /*l_transaccion.procesaPago(Integer.parseInt(ls_secuencia), 
                              ls_id, 
                              ls_empresa, 
                              l_pagosRequest.getResult().getCode(), 
                              lsb_resultado, 
                              "Transacción de Pago", 
                              ls_proceso, 
                              "DTF_PAGO", 
                              lsb_estado, 
                              lsb_error);*/
    ;
    //System.out.println("lsb_estado: "+lsb_estado.toString());
    //System.out.println("ls_mensajeTrx "+ls_mensajeTrx);
    
 

    
    //System.out.println(l_pagosRequest.getResult().getDescription());
    //System.out.println(ls_id);
    //System.out.println(ls_resourcePath); 

/*out.println("<table border=\"1\">");
out.println("<tr>");
out.println("<td>"+l_pagosRequest.getResult().getCode()+"</td>");
out.println("<td>"+l_pagosRequest.getResult().getDescription()+"</td>");
out.println("</tr>");
out.println("<tr><td>id</td>");out.println("<td>"+l_pagosRequest.getId()+"</td></tr>"); 
out.println("<tr><td>paymentType</td>");out.println("<td>"+l_pagosRequest.getPaymentType()+"</td></tr>"); 
out.println("<tr><td>paymentBrand</td>");out.println("<td>"+l_pagosRequest.getPaymentBrand()+"</td></tr>"); 
out.println("<tr><td>amount</td>");out.println("<td>"+l_pagosRequest.getAmount()+"</td></tr>"); 
out.println("<tr><td>currency</td>");out.println("<td>"+l_pagosRequest.getCurrency()+"</td></tr>"); 
out.println("<tr><td>descriptor</td>");out.println("<td>"+l_pagosRequest.getDescriptor()+"</td></tr>"); 
out.println("<tr><td>buildNumber</td>");out.println("<td>"+l_pagosRequest.getBuildNumber()+"</td></tr>"); 
out.println("<tr><td>timestamp</td>");out.println("<td>"+l_pagosRequest.getTimestamp()+"</td></tr>"); 
out.println("<tr><td>ndc</td>");out.println("<td>"+l_pagosRequest.getNdc()+"</td></tr>"); 

out.println("<tr><td colspan=2>resultDetails</td></tr>");
out.println("<tr><td>RiskStatusCode</td>");out.println("<td>"+l_pagosRequest.getDetails().getRiskStatusCode()+"</td></tr>"); 
out.println("<tr><td>ResponseCode</td>");out.println("<td>"+l_pagosRequest.getDetails().getResponseCode()+"</td></tr>"); 
out.println("<tr><td>clearingInstituteName</td>");out.println("<td>"+l_pagosRequest.getDetails().getClearingInstituteName()+"</td></tr>"); 
out.println("<tr><td>RiskResponseCode</td>");out.println("<td>"+l_pagosRequest.getDetails().getRiskResponseCode()+"</td></tr>"); 
out.println("<tr><td>RequestId</td>");out.println("<td>"+l_pagosRequest.getDetails().getRequestId()+"</td></tr>"); 
out.println("<tr><td>OrderId</td>");out.println("<td>"+l_pagosRequest.getDetails().getOrderId()+"</td></tr>");

out.println("<tr><td colspan=2>card</td></tr>");
out.println("<tr><td>bin</td>");out.println("<td>"+l_pagosRequest.getCards().getBin()+"</td></tr>"); 
out.println("<tr><td>last4Digits</td>");out.println("<td>"+l_pagosRequest.getCards().getLast4Digits()+"</td></tr>"); 
out.println("<tr><td>holder</td>");out.println("<td>"+l_pagosRequest.getCards().getHolder()+"</td></tr>"); 
out.println("<tr><td>expiryMonth</td>");out.println("<td>"+l_pagosRequest.getCards().getExpiryMonth()+"</td></tr>"); 
out.println("<tr><td>expiryYear</td>");out.println("<td>"+l_pagosRequest.getCards().getExpiryYear()+"</td></tr>"); 

out.println("<tr><td colspan=2>customer</td></tr>");
out.println("<tr><td>givenName</td>");out.println("<td>"+l_pagosRequest.getCustomer().getGivenName()+"</td></tr>");
out.println("<tr><td>surname</td>");out.println("<td>"+l_pagosRequest.getCustomer().getSurname()+"</td></tr>");
out.println("<tr><td>middleName</td>");out.println("<td>"+l_pagosRequest.getCustomer().getMiddleName()+"</td></tr>");
out.println("<tr><td>merchantCustomerId</td>");out.println("<td>"+l_pagosRequest.getCustomer().getMerchantCustomerId()+"</td></tr>");
out.println("<tr><td>email</td>");out.println("<td>"+l_pagosRequest.getCustomer().getEmail()+"</td></tr>");
out.println("<tr><td>identificationDocType</td>");out.println("<td>"+l_pagosRequest.getCustomer().getIdentificationDocType()+"</td></tr>"); 
out.println("<tr><td>identificationDocId</td>");out.println("<td>"+l_pagosRequest.getCustomer().getIdentificationDocId()+"</td></tr>");
out.println("<tr><td>ip</td>");out.println("<td>"+l_pagosRequest.getCustomer().getIp()+"</td></tr>");

out.println("<tr><td>browserFingerprint-value</td>");out.println("<td>"+l_pagosRequest.getCustomer().getBrowserFingerprint().getValue()+"</td></tr>"); 

out.println("<tr><td colspan=2>threeDSecure</td></tr>");
out.println("<tr><td>eci</td>");out.println("<td>"+l_pagosRequest.getThreeDSecure().getEci()+"</td></tr>"); 

out.println("<tr><td colspan=2>customParameters</td></tr>");
out.println("<tr><td>SHOPPER_EndToEndIdentity</td>");out.println("<td>"+l_pagosRequest.getCustomParameters().getSHOPPER_EndToEndIdentity()+"</td></tr>"); 
out.println("<tr><td>CTPE_DESCRIPTOR_TEMPLATE</td>");out.println("<td>"+l_pagosRequest.getCustomParameters().getCTPE_DESCRIPTOR_TEMPLATE()+"</td></tr>"); 

out.println("<tr><td colspan=2>risk</td></tr>");
out.println("<tr><td>score</td>");out.println("<td>"+l_pagosRequest.getRisk().getScore()+"</td></tr>"); 
out.println("<tr></tr>");
out.println("</table>");*/

%>

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
        <script>
            function validar(){
                var ls_error = "<%=lsb_error.toString().replace("\n", "").replace("\r", "").replaceAll("\"", "")%>";
                if (ls_error=="OK"){
                    var ls_principal64  = "<%=ls_principal%>";
                    var ls_secundario64 = "<%=ls_secundaria%>";
                    var ls_principal = atob(ls_principal64);
                    var ls_secundario = atob(ls_secundario64);
                    document.form1.cancelada.value="S";
                    document.form1.action=ls_principal;
                    //form1.submit();                     
                    swal({title:'',
                          text:'Pago Realizado con Éxito. Código de Pago: <%=l_pagosRequest.getId()%>',
                          type:'success',
                          allowEscapeKey : false,
                          allowOutsideClick: false
                        }).then(function (isConfirm) {
                                    if (isConfirm) {
                                        form1.submit();
                                    } 
                                });
                }else{
                    var ls_error = "<%=lsb_error.toString().replace("\n", "").replace("\r", "").replaceAll("\"", "")%>";
                    var ls_estado = "<%=lsb_estado.toString()%>";
                    if (ls_estado == "E")
                        ls_error = ls_error + ". (<%=ls_estadoTrx%>) - <%=ls_mensajeTrx%>";
                    var ls_principal64  = "<%=ls_principal%>";
                    var ls_secundario64 = "<%=ls_secundaria%>";
                    var ls_principal = atob(ls_principal64);
                    var ls_secundario = atob(ls_secundario64);
                    //alert(ls_error);
                    document.form1.cancelada.value="N"; 
                    document.form1.action=ls_principal; 
                    //form1.submit(); 
                    
                    swal({title:'',
                          text:ls_error,
                          type:'warning',
                          allowEscapeKey : false,
                          allowOutsideClick: false
                        }).then(function (isConfirm) {
                                    if (isConfirm) {
                                        form1.submit();
                                    } 
                                });
                }
            }
        </script>
    </head>
    <body onLoad="validar();">
        <form name="form1" id="form1" action="" method="POST">
           <input type="hidden" id="principal" name="principal" value="<%=ls_principal%>"> 
           <input type="hidden" id="secundaria" name="secundaria" value="<%=ls_secundaria%>">  
           <input type="hidden" id="pago" name="pago" value="S"> 
           <input type="hidden" id="cancelada" name="cancelada" value=""> 
        </form>
    </body>
</html>