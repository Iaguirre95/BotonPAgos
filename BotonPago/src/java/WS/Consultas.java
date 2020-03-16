/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package WS;

import bin.Parametros;
import bo.BOConsultaEstado;
import bo.BOPagoRequest;
import bo.Credenciales;
import com.yoveri.conexion.Conexion;
import dao.DAOPagoRequest;
import java.io.IOException;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

/**
 *
 * @author yoveri
 */
@WebService(name = "Consultas", serviceName = "Consultas",
targetNamespace = "http://www.yoveri.com.ec/")
public class Consultas {
    @WebMethod(operationName = "consultarpago")//Ingreso_Citaciones
    public BOConsultaEstado consultarpago(
            @WebParam(name = "institucion") String psInstitucion,
            @WebParam(name = "proceso")     String psProceso,
            @WebParam(name = "scriptid")    String psScriptID) throws IOException {
            Parametros      l_paramteros    = new Parametros();
            BOConsultaEstado l_consulta     = new BOConsultaEstado();
            StringBuffer    lsb_descripcion = new StringBuffer("");
            Credenciales    l_datos         = l_paramteros.inicializa(psInstitucion, psProceso);
            BOPagoRequest   l_pagosRequest  = DAOPagoRequest.PagoRequest(psInstitucion, psProceso,"0.01",l_datos,psScriptID);
            l_consulta.setPs_codigo(l_pagosRequest.getResult().getCode());
            lsb_descripcion.append(l_pagosRequest.getResult().getDescription());
            l_consulta.setPsb_descripcion(lsb_descripcion);
            
        return l_consulta;
    } 
}
