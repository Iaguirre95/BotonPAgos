<%-- 
    Document   : login
    Created on : 12/07/2019, 03:20:35 PM
    Author     : yoveri
--%>

<%@page import="bo.BOCotizacion"%>
<%@page import="bo.BODatosPersona"%>
<%@page import="bo.BOPagoRequest"%>
<%@page import="dao.DAOPagoRequest"%>
<%@page import="bin.Parametros"%>
<%@page import="bo.Credenciales"%>
<%@page import="bo.BOCheckoutId"%>
<%@page import="dao.DAOCheckoutId"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <%
        String              ps_idEmpresa    = "01";
        String              ps_idProceso    = "DTF";
        Credenciales        l_credenciales  = new Credenciales();
        Parametros          l_paramteros    = new Parametros();
        BODatosPersona      l_datosPersona  = new BODatosPersona();
        BOCotizacion        l_cotizacion    = new BOCotizacion();
        BOCheckoutId        ls_result;
        
        l_datosPersona.setGivenName("Juan");
        l_datosPersona.setMiddleName("Fernando");
        l_datosPersona.setSurname("Castro");
        l_datosPersona.setIp("192.0.0.2");
        l_datosPersona.setMerchantCustomerId("000000000001");
        l_datosPersona.setMerchantTransactionId("65456");
        l_datosPersona.setEmail("prueba@gmail.com.ec");
        l_datosPersona.setIdentificationDocType("IDCARD");
        l_datosPersona.setIdentificationDocId("999999999");
        l_datosPersona.setPhone("1234567890");
        l_datosPersona.setTestMode("EXTERNAL");
        l_datosPersona.setTotal("1.01");
        
        l_cotizacion.setMid("1000000505");
        l_cotizacion.setTid("PD100406");
        l_cotizacion.setIva(0.12); 
        l_cotizacion.setbase12(1.00);
        l_cotizacion.setTotal(1.12); 
        
        
        l_credenciales  =  l_paramteros.inicializa(ps_idEmpresa, ps_idProceso);
        ls_result       =  DAOCheckoutId.request(ps_idEmpresa, ps_idProceso, l_credenciales,l_datosPersona,l_cotizacion);

        System.out.println(ls_result.getResult().getDescription()+"   "+ls_result.getResult().getCode());;

        
        
        
%>
        
        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="<%=l_credenciales.getPs_url_script()+ls_result.getId()%>"></script>
    </head>
    <body>
        <%if (ls_result.getResult().getCode().equals("000.200.100")){%>
        <form action="http://192.168.2.128:7001/mkBotonPago/paginas/bin/procesaPago.jsp?empresa=<%=ps_idEmpresa%>&proceso=<%=ps_idProceso%>" class="paymentWidgets" data-brands="VISA MASTER AMEX" method="POST" target="card_738317284702"></form>
        <!--<%//=l_datos.getPs_url()+"/"+ls_result.getId()+"/payment"%>-->
        <%}else{%>
        <form action="http://192.168.2.128:7001/mkBotonPago/paginas/bin/procesaPago.jsp?empresa=<%=ps_idEmpresa%>&proceso=<%=ps_idProceso%>" class="paymentWidgets" data-brands="VISA MASTER AMEX" method="POST" target="card_738317284702"></form>
        <%=ls_result.getResult().getCode()+" : "+ls_result.getResult().getDescription()%>
        
        <%}%>
        </form>
    </body>
</html>
