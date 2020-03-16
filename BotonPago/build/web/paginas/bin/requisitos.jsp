<%-- 
    Document   : requisitos
    Created on : 05/08/2019, 11:30:08 AM
    Author     : yoveri
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="bin.Cotizacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String          ls_cedula       = request.getParameter("ps_identificacion");
String          ls_placa        = request.getParameter("ps_placa");
String          ls_mensaje      = "";
String          ls_codigo       = "";
StringBuffer    lsb_prospecto   = new StringBuffer();
StringBuffer    lsb_error       = new StringBuffer();
StringBuffer    lsb_Coderror    = new StringBuffer();
Cotizacion      l_req_cotizacion= new Cotizacion();

   l_req_cotizacion.requisitos(ls_placa, ls_cedula, lsb_prospecto, lsb_error, lsb_Coderror);
   if (lsb_Coderror.toString().equals("0")) {
       lsb_Coderror = new StringBuffer("");
       lsb_error    = new StringBuffer("");
       l_req_cotizacion.prospecto(ls_placa, 
                                  ls_cedula, 
                                  "", 
                                  "", 
                                  lsb_Coderror, 
                                  lsb_error);
   }
   /* JSONObject obj = new JSONObject();
    if (lsb_Coderror.toString().equals("0")) {
        ls_mensaje = "OK";
        ls_codigo  = "0";
    }else{
        ls_mensaje = lsb_error.toString();
        ls_codigo  = lsb_Coderror.toString();        
    }
    obj.put("mensaje",  ls_mensaje);
    obj.put("coderror", ls_codigo);

    response.setContentType("text/x-json;charset=UTF-8");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    out.print(obj);
    out.flush();*/
%>
<script>
    parent.validacion_req("<%=lsb_error.toString()%>","<%=lsb_Coderror.toString()%>");
            
</script>


