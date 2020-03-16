  function abrirDialogoModal(nombre,ventana) {
    var r=window.showModalDialog(nombre, ventana, 'dialogTop=200px; dialogWidth=400px; dialogHeight=320px; help=no; status=no; scrolling=NO');
//    return r;
  }

  function abrirPagina(pagina,target,top,left,height,width,resizable,toolbar,scrollbars,location) {
    newwind = window.open(pagina,target, "height=" + height+ ",width=" + width + ",left=" + left + ",top=" + top + ",toolbar=" + toolbar + ",resizable=" + resizable + ",scrollbars=" + scrollbars + ",location=" + location);
  }

  function abrirLov(lov,width) {
    abrirPagina(lov,"",100,50,160,width,"no","no","no","no");
  }
                                                