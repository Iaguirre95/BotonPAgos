<%-- 
    Nombre      : clp_pagina_intermedia
    Fecha       : 24/07/2013, 05:42:33 PM
    Por         : Francis López
    Comentario  : Pagina intermedia llamada desde le WF para invocar otras paginas
--%>

<%@page import="biblioteca.JspLib"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Ejecución de Reporte</title>
        <script>
            function ejecutar()
            {

                var ls_pag = "../../../../../../paginas/cliente/clf_impresiones.jsp";
                window.open(ls_pag, target="NewWin1",'height=620,width=750,,left=100,top=0,toolbar=no,resizable=yes,scrollbars=YES, status=no, location=no');        
            }
        </script>
    </head>
    <body onload="ejecutar()">
        
    </body>
</html>
