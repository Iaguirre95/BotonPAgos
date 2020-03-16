/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.yoveri.conexion.Conexion;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author yoveri
 */
public class DAOTransacciones {
      private Conexion conexion = null;

    public DAOTransacciones() {
        super();
    }

    public DAOTransacciones(Conexion con) {
        conexion = con;
    }   
    
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
    
    CallableStatement cs = null;
    String      ls_error            = "";
    String[]    lsa_trx             = ps_trx.split("\\|");
    System.out.println(ps_trx + "PS_TRX");
    System.out.println("PS_URLSSCRIPT" + ps_urlScript);
    String      ls_idTrxCajaInfra   = lsa_trx[0];
    String      ls_idTrxCajaTram    = lsa_trx[1];
    String      ls_idTrxCajaOtr     = lsa_trx[2];
    int         li_secuencia        = 0;
    
 
    try{
            cs = conexion.getConnection().prepareCall("{ call rek_api_boton_pago_dfast.rep_registra_trx_boton( ? , ? ,? , ? ,? ,? , ? ,? ,? , ? ,? , ? ,? , ? , ? , ? , ?) }");
            cs.setString(1,ps_idEmpresa);
            cs.setString(2,ps_idTramite);
            cs.setString(3,ls_idTrxCajaInfra);
            cs.setString(4,ls_idTrxCajaTram);
            cs.setString(5,ls_idTrxCajaOtr);
            cs.setString(6,ps_idCodScript);
            cs.setString(7,pv_idCodTrxScript);
            cs.setString(8,ps_urlScript);
            cs.setString(9,pc_respuesta_script.toString());
            cs.setString(10,ps_estado);
            cs.setString(11,ps_observacion);
            cs.registerOutParameter(12, Types.INTEGER);
            cs.registerOutParameter(13, Types.VARCHAR);
            cs.setString(14,ps_origen);
            cs.setString(15,ps_tipoConsulta);
            cs.setString(16,ps_valorConsulta);
            cs.setString(17,psb_parametros.toString());
            cs.executeQuery();
            li_secuencia = cs.getInt(12);
            //System.out.println("li_secuencia: "+li_secuencia);
            ls_error            = cs.getString(13);
            conexion.commit();
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_error = e.toString();
            li_secuencia = 0;
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_error == null){
            ls_error = "";
        }
        psb_error.append(ls_error);
        psb_idSecuencia.append(li_secuencia);
        //System.out.println("SALIO: "+ls_error);
        
    
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

    CallableStatement cs = null;
     String ls_error    = "";
     String ls_estado   = "";
     try {
         cs = conexion.getConnection().prepareCall("{ call rek_api_boton_pago_dfast.rep_procesapago( ? , ? ,? , ? ,? ,? , ? ,? ,? , ? ) }");
         cs.setInt(1, pi_idSecuencia); 
         cs.setString(2, ps_idCodscript);
         cs.setString(3, ps_idempresa);
         cs.setString(4, ps_idCodTransaccion);
         cs.setString(5, psb_respuesta_trx.toString());
         cs.setString(6, ps_observacion);
         cs.setString(7, ps_idProceso);
         cs.setString(8, ps_nombre_clave);
         cs.registerOutParameter(9, Types.VARCHAR);
         cs.registerOutParameter(10, Types.VARCHAR);
         cs.executeQuery();
         ls_estado = cs.getString(9);
         ls_error   = cs.getString(10);
         conexion.commit();
     } catch (SQLException e) {
         System.out.println("Error:" + e.toString());
         ls_error = e.toString();
     } finally {
         conexion.closeQuiet(cs);
     }
     if (ls_error == null) {
         ls_error = "";
     }
     psb_estado.append(ls_estado);
     psb_Error.append(ls_error);                          
                          
    }    
    
    
}
