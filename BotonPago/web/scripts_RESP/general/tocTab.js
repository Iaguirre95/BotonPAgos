var tocTab = new Array();var ir=0;
tocTab[ir++] = new Array ("Top", " Transacciones");//, "TocMenu_0.htm#Top");
tocTab[ir++] = new Array ("1", "Personas");//, "TocMenu_0.htm#0");
tocTab[ir++] = new Array ("1.1", "Informaci&oacute;n del Tr&aacute;mite" , "../workflow/wff_informacion.jsp");//, "TocMenu_0.htm#0.1");
tocTab[ir++] = new Array ("1.2", "Crear Tr&aacute;mites", "../workflow/wfp_crear_tramite.jsp");//, "TocMenu_0.htm#0.1");
tocTab[ir++] = new Array ("1.3", "Consulta Cliente" , "../cliente/clp_consulta_cliente.jsp");//, "TocMenu_0.htm#0.1");


tocTab[ir++] = new Array ("2", "Contratos");//, "TocMenu_1.htm#1");
tocTab[ir++] = new Array ("2.1", "Cambio de Contrato");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("2.2", "Inactivar Contratos");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("2.3", "Cambiar Forma de Pago");//, "TocMenu_1.htm#1.1");


tocTab[ir++] = new Array ("3", "Servicios");//, "TocMenu_1.htm#1");
tocTab[ir++] = new Array ("3.1", "Activaci&oacute;n de Servicio");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("3.2", "Inactivaci&oacute;n de Servicios","../gestioncliente/GCF_INACTIVACION_SERVICIO.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("3.3", "Cambio de Servicio","../gestioncliente/GCF_CambioServicio.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("3.5", "Bloqueos de Servicios","../gestioncliente/GCF_F_DatosCliente.jsp");//, "TocMenu_1.htm#1.1");


tocTab[ir++] = new Array ("4", "Servicios Adicionales");//, "TocMenu_1.htm#1");
//tocTab[ir++] = new Array ("4.1", "Activaci&oacute;n de Servicio","../cliente/clf_datos_generales_persona.jsp?ps_idPersona=1351016");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("4.1", "Activaci&oacute;n de Servicio","../garantia/dgf_consulta_deposito_garantia.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("4.2", "Inactivaci&oacute;n de Servicios","../garantia/carlos/parametros_21.jsp");//dgf_relacion_deposito.jsp, "TocMenu_1.htm#1.1");

tocTab[ir++] = new Array ("5", "Gestion Clientes");//, "TocMenu_1.htm#1");
tocTab[ir++] = new Array ("5.1", "Inactivaci&oacute;n de Contrato","../gestioncliente/gcf_inactivacion_contrato.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.2", "Crea Accion","../credito/crk_html_accion_crp_crea_accion.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.3", "Inactivaci&oacute;n de Servicio","../gestioncliente/gcf_inactivacion_servicio.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.4", "Trans. Detalle Mensaje Error","../gestioncliente/gcf_detalleservicio_tran_er.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.5", "Cambio Servicio","../gestioncliente/gcf_cambio_servicio.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.6", "Transaccion Detalle","../gestioncliente/gcf_detalleservicio_tran.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.7", "Traspaso Servicio","../gestioncliente/gcf_traspaso_servicio.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.8", "Cambio de Plan","../gestioncliente/gcf_cambio_plan.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("5.9", "Bloqueos","../gestioncliente/gcf_bloqueo.jsp");//, "TocMenu_1.htm#1.1");

tocTab[ir++] = new Array ("6", "WorkFlow");//, "TocMenu_1.htm#1");
tocTab[ir++] = new Array ("6.1", "Importar Pagina","../workflow/wff_importa_pagina.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("6.2", "Agenda","../../pruebas/nestor/wfp_prueba_agenda.jsp");//, "TocMenu_1.htm#1.1");

tocTab[ir++] = new Array ("7", "Deposito Garantia");//, "TocMenu_1.htm#1");
tocTab[ir++] = new Array ("7.1", "Anulacion Deposito","../garantia/dgp_anulacion_deposito.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("7.2", "Ingreso Deposito","../garantia/dgf_ingreso_deposito.jsp");//, "TocMenu_1.htm#1.1");
tocTab[ir++] = new Array ("7.3", "Devolucion Deposito","../garantia/dgp_devolucion_deposito.jsp");//, "TocMenu_1.htm#1.1");
//tocTab[ir++] = new Array ("6.2", "Agenda","../../pruebas/nestor/wfp_prueba_agenda.jsp");//, "TocMenu_1.htm#1.1");


var nCols = 0;
for (i=1; i<tocTab.length; i++) {
	nCols = Math.max(nCols,tocTab[i][0].split(".").length);
}