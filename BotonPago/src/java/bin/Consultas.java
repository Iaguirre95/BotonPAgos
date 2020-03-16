/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bin;

import bo.BOPersona;
import com.yoveri.conexion.Conexion;
import dao.DAOConsultas;

/**
 *
 * @author yoveri
 */
public class Consultas {
    private static final String GSDATASOURCE = "jdbc/gventas";//jdbc/botonpago";
   //private static final String GSDATASOURCE = "java:/comp/env/jdbc/gventas";//jdbc/botonpago"; para tomcat
    public BOPersona datosPersona(String ps_Identificacion, String ps_idIdent, StringBuffer psb_error){
       BOPersona l_datos = new BOPersona();
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_datos = l_consultas.datosPersona(ps_Identificacion, ps_idIdent, psb_error);
       }else {
            l_datos = new BOPersona();
        }
       db_conn.close();
       return l_datos;
    }
    
public void valor_parametros(String ps_idEmpresa ,
                             String ps_idProceso ,
                             String ps_parametro ,
                             StringBuffer psb_valorParametro ,
                             StringBuffer psb_salida){
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.valor_parametros(ps_idEmpresa, 
                                        ps_idProceso, 
                                        ps_parametro, 
                                        psb_valorParametro, 
                                        psb_salida);
       }else {
            psb_salida.append("Error de Conexion");
        }
       db_conn.close();
    }  
public void genera_recaudacion_pendiente(String         ps_idEmpresa ,
                                         String         ps_idTramite ,
                                         String         ps_placa ,
                                         StringBuffer   psb_idTrxCajaInfra,
                                         StringBuffer   psb_idTrxCajaTram,
                                         StringBuffer   psb_idTrxCajaOtr,
                                         StringBuffer   psb_valorRecaudar ,
                                         StringBuffer   psb_error,
                                         String         ps_origen,
                                         String         ps_tipoConsulta,
                                         String         ps_valorConsulta){
    Conexion db_conn = new Conexion(GSDATASOURCE);
     if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.genera_recaudacion_pendiente(ps_idEmpresa, 
                                                    ps_idTramite, 
                                                    ps_placa, 
                                                    psb_idTrxCajaInfra, 
                                                    psb_idTrxCajaTram, 
                                                    psb_idTrxCajaOtr, 
                                                    psb_valorRecaudar, 
                                                    psb_error,
                                                    ps_origen,
                                                    ps_tipoConsulta,
                                                    ps_valorConsulta);
       }else {
            psb_error.append("Error de Conexion");
        }
       db_conn.close();
    
     }
public void valida_pago(String       ps_idEmpresa,
                        String       ps_idTramite,
                        String       ps_tipo,
                        StringBuffer psb_salida,
                        String       ps_proceso,
                        String       ps_parametro){
     Conexion db_conn = new Conexion(GSDATASOURCE);
     if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.valida_pago(ps_idEmpresa, ps_idTramite, ps_tipo, psb_salida,ps_proceso,ps_parametro);
            
        }else{
            psb_salida.append("Error de Conexion");
     }
       db_conn.close();    
}
public void valida_pago_consulta(String       ps_idEmpresa,
                                 String       ps_origen,
                                 String       ps_tipoConsulta,
                                 String       ps_valorConsulta,
                                 StringBuffer psb_salida,
                                String       ps_proceso,
                                String       ps_parametro){
     Conexion db_conn = new Conexion(GSDATASOURCE);
     if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.valida_pago_consulta(ps_idEmpresa, 
                                            ps_origen, 
                                            ps_tipoConsulta, 
                                            ps_valorConsulta, 
                                            psb_salida,ps_proceso,ps_parametro);
            
        }else{
            psb_salida.append("Error de Conexion");
     }
       db_conn.close();     
    
}

public void DatosEmpresa(String       ps_idEmpresa,
                         StringBuffer psb_descEmpresa,
                         StringBuffer psb_error){
     Conexion db_conn = new Conexion(GSDATASOURCE);
     if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.DatosEmpresa(ps_idEmpresa, psb_descEmpresa, psb_error);
            
        }else{
            psb_error.append("Error de Conexion");
     }
       db_conn.close();    
}
public void verifica_trx_boton(String       ps_idEmpresa,
                               String       ps_origen,
                               int          pi_idTramite,
                               String       ps_tipoConsulta,
                               String       ps_valorConsulta,
                               StringBuffer psb_salida){
      Conexion db_conn = new Conexion(GSDATASOURCE);
     if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.verifica_trx_boton(ps_idEmpresa, 
                                          ps_origen, 
                                          pi_idTramite, 
                                          ps_tipoConsulta, 
                                          ps_valorConsulta, 
                                          psb_salida);
            
        }else{
            psb_salida.append("Error de Conexion");
     }
       db_conn.close();     
    
}
public void validaCorreo(String       ps_cuenta,
                         StringBuffer psb_salida){
      Conexion db_conn = new Conexion(GSDATASOURCE);
     if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.validaCorreo(ps_cuenta, psb_salida);
            
        }else{
            psb_salida.append("Error de Conexion");
     }
       db_conn.close();      
    
}

public void InforacionPlaca(String       ps_placa,
                            StringBuffer ps_idIdent,
                            StringBuffer ps_identificacion,
                            StringBuffer psb_salida){
      Conexion db_conn = new Conexion(GSDATASOURCE);
     if (db_conn.isConectado()) {
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_consultas.InforacionPlaca(ps_placa, ps_idIdent, ps_identificacion, psb_salida);
            
        }else{
            psb_salida.append("Error de Conexion");
     }
       db_conn.close();      
    
}
}
