/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bin;

import bo.Credenciales;
import com.yoveri.conexion.Conexion;
import dao.DAOConsultas;


/**
 *
 * @author yoveri
 */
public class Parametros {
    private static final String GSDATASOURCE = "jdbc/gventas";//jdbc/botonpago";
    //private static final String GSDATASOURCE = "java:/comp/env/jdbc/gventas";// para tomcat
    public Credenciales inicializa(String ps_idEmpresa,String ps_idProceso){
       Credenciales l_datos = new Credenciales();
       Conexion db_conn = new Conexion(GSDATASOURCE);
        System.out.println("PARAMETROS");
       if (db_conn.isConectado()) {
           System.out.println("PARAMETROS SUCCESS");
           DAOConsultas l_consultas = new DAOConsultas(db_conn);
           l_datos = l_consultas.setParametros(ps_idEmpresa, ps_idProceso);
       }else {
           System.out.println("PARAMETROS FAIL");
            l_datos = new Credenciales();
            l_datos.setPs_mensaje(db_conn.getERROR());
        }
       db_conn.close();
        System.out.println(l_datos.getPs_protocolo()+" l_datos");
       return l_datos;
    }
   
}
