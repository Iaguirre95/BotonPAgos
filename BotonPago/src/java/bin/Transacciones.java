/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bin;

import com.yoveri.conexion.Conexion;
import dao.DAOTransacciones;

/**
 *
 * @author yoveri
 */
public class Transacciones {
  private static final String GSDATASOURCE = "jdbc/gventas";//jdbc/botonpago";
  //private static final String GSDATASOURCE = "java:/comp/env/jdbc/gventas";// para tomcat
    public void registra_datos_trx(String       ps_idEmpresa ,
                                   String       ps_idTramite ,
                                   String       ps_trx ,
                                   String       ps_idCodScript,
                                   String       pv_idCodTrxScript,
                                   String       ps_urlScript,
                                   StringBuffer pc_respuesta_script,
                                   String       ps_estado,
                                   String       ps_observacion,
                                   StringBuffer psb_idSecuencia ,
                                   StringBuffer psb_error,
                                   String       ps_origen,
                                   String       ps_tipoConsulta,
                                   String       ps_valorConsulta,
                                   StringBuffer psb_parametros){
       
       Conexion db_conn = new Conexion(GSDATASOURCE);
       System.out.println("-------------");
       System.out.println("ps_idEmpresa: "+ps_idEmpresa);
       System.out.println("ps_idTramite: "+ps_idTramite);
       System.out.println("ps_trx: "+ps_trx);
       System.out.println("ps_idCodScript: "+ps_idCodScript);
       System.out.println("pv_idCodTrxScript: "+pv_idCodTrxScript);
       System.out.println("ps_urlScript: "+ps_urlScript);
       System.out.println("ps_origen: "+ps_origen);
       System.out.println("-------------");
       if (db_conn.isConectado()) {
           DAOTransacciones l_transaccion = new DAOTransacciones(db_conn);
           l_transaccion.registra_datos_trx(ps_idEmpresa, 
                                            ps_idTramite, 
                                            ps_trx, 
                                            ps_idCodScript, 
                                            pv_idCodTrxScript, 
                                            ps_urlScript, 
                                            pc_respuesta_script, 
                                            ps_estado, 
                                            ps_observacion, 
                                            psb_idSecuencia, 
                                            psb_error,
                                            ps_origen,
                                            ps_tipoConsulta,
                                            ps_valorConsulta,
                                            psb_parametros);
       }else {
            psb_idSecuencia.append("0");
            psb_error.append("Sin Conexión");
        }
       db_conn.close();
    }  

 public void procesaPago(int            pi_idSecuencia,
                         String         ps_idCodscript,
                         String         ps_idempresa,
                         String         ps_idCodTransaccion,
                         StringBuffer   psb_respuesta_trx,
                         String         ps_observacion,
                         String         ps_idProceso,
                         String         ps_nombre_clave,
                         StringBuffer   psb_estado,
                         StringBuffer   psb_Error){
       
       Conexion db_conn = new Conexion(GSDATASOURCE);
       //System.out.println("-------------");
       //System.out.println("ps_idEmpresa: "+ps_idempresa);
       //System.out.println("ps_idCodscript: "+ps_idCodscript);
       //System.out.println("pi_idSecuencia: "+pi_idSecuencia);
       //System.out.println("ps_idCodTransaccion: "+ps_idCodTransaccion);
       //System.out.println("psb_respuesta_trx: "+psb_respuesta_trx.toString());
       //System.out.println("ps_idProceso: "+ps_idProceso);
       //System.out.println("ps_nombre_clave: "+ps_nombre_clave);
       //System.out.println("-------------");
       if (db_conn.isConectado()) {
           DAOTransacciones l_transaccion = new DAOTransacciones(db_conn);
           l_transaccion.procesaPago(pi_idSecuencia, 
                                     ps_idCodscript, 
                                     ps_idempresa, 
                                     ps_idCodTransaccion, 
                                     psb_respuesta_trx, 
                                     ps_observacion, 
                                     ps_idProceso, 
                                     ps_nombre_clave, 
                                     psb_estado, 
                                     psb_Error);
       }else {
            psb_Error.append("Sin Conexión");
        }
       db_conn.close();
    }
}
