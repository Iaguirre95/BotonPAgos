<html>

<head>

<script language="JavaScript">
  function openLov(lovName) {
    anchoLov=60
    newwind = window.open(lovName, "LabelWin","height=160,width="+anchoLov+",left=50,top=100,toolbar=no,resizable=yes,scrollbars=no,location=no");
  }
</script>

</head>

<body>
<%@ page import="biblioteca.*" %>

<%

JavaScriptLib jsl=new JavaScriptLib(pageContext);
//RequestDispatcher rd = application.getRequestDispatcher("/scripts/general/abrirPagina.jsp");
//rd.include(request,response);
jsl.incluirScript("general/abrirPagina.jsp");

%>

hola
<input type="button" value="click" onclick=openLov("/axis/paginas/lov/lov.jsp");>
</body>

</html>



