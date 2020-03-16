<%-- 
    Document   : index
    Created on : 16/07/2019, 09:25:04 AM
    Author     : yoveri
--%>

<%@page import="dao.DAOCheckoutId"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function cargar(){
                //w = window.open("paginas/bin/login.jsp","_self");
                //w = window.open("paginas/bin/Ingreso.jsp","_self");
                index.submit();
            }
            
            
        </script> 
    </head>
     <body  onload="cargar();">  <input type="hidden" name="empresa" id="empresa" value="01">
    <input type="hidden" name="tipoident" id="tipoident" value="PLA">
    <input type="hidden" name="identificacion" id="identificacion" value="OBA9354">
    <input type="hidden" name="valortotalpago" id="valortotalpago" value="58.67">
    <input type="hidden" name="impuesto" id="impuesto" value="0">
    <input type="hidden" name="valorsinimp" id="valorsinimp" value="0">
    <input type="hidden" name="trx" id="trx" value="0">
    <input type="hidden" name="ps_id_trx_caja" id="ps_id_trx_caja" value="0">
    <input type="hidden" name="proceso" id="proceso" value="D05">
    <input type="hidden" name="ps_origen" id="ps_origen" value="POR">
    <input type="hidden" name="principal" id="principal" value="aHR0cHM6Ly8xOTIuMTY4LjIuMTI1OjcwMDIvUG9ydGFsV0VCL3BhZ2luYXMvY2xpZW50ZXMvY2xwX2dyaWRfY2l0YWNpb25lcy5qc3A/cHNfdGlwb19pZGVudGlmaWNhY2lvbj1QTEEmcHNfaWRlbnRpZmljYWNpb249R1JXNzAyMCZwc19wbGFjYT0mcHNfaWRfZW1wcmVzYT0wNQ==">
    <input type="hidden" name="secundaria" id="secundaria" value="aHR0cHM6Ly8xOTIuMTY4LjIuMTI1OjcwMDIvUG9ydGFsV0VCL3BhZ2luYXMvY2xpZW50ZXMvY2xwX2dyaWRfY2l0YWNpb25lcy5qc3A/cHNfdGlwb19pZGVudGlmaWNhY2lvbj1QTEEmcHNfaWRlbnRpZmljYWNpb249R1JXNzAyMCZwc19wbGFjYT0mcHNfaWRfZW1wcmVzYT0wNQ==">
    
         <form name="index" id="index" action="paginas/bin/preguntas_frecuentes.jsp" target="_self" method="post">
         <h1></h1>

         </form> 
    </body>
</html>
