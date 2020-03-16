/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bin;

import bo.BODatosCotizacion;
import bo.BOProspecto;
import bo.BORegProspecto;
import bo.BOVehiculo;
import com.yoveri.conexion.Conexion;
import dao.DAOCotizacion;

/**
 *
 * @author yoveri
 */
public class Cotizacion {
    private static final String GSDATASOURCE = "jdbc/gventas";//jdbc/botonpago";
    //private static final String GSDATASOURCE = "java:/comp/env/jdbc/gventas";// para tomcat
    public int cotizacion(int pi_secuencia,
                          String ps_identificacion ,
                          String ps_placa,
                          StringBuffer psb_resultado,
                          StringBuffer psb_error){
       int li_cotizacion = 0;
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOCotizacion l_consultas = new DAOCotizacion(db_conn);
           li_cotizacion = l_consultas.cotizacion(pi_secuencia,ps_identificacion, ps_placa,psb_resultado,psb_error);
       }else {
            psb_error.append(db_conn.getERROR());
        }
       db_conn.close();
       return li_cotizacion;
    }
    public int secuencia(StringBuffer psb_error){
        
       int li_cotizacion = 0;
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOCotizacion l_consultas = new DAOCotizacion(db_conn);
           li_cotizacion = l_consultas.secuencia();
       }else {
            psb_error.append(db_conn.getERROR());
            li_cotizacion = -1;
        }
       db_conn.close();
       return li_cotizacion;
    
    }
    public BODatosCotizacion DatosCotizacion(int pi_idCotizacion,
                                StringBuffer psb_error){
        
       BODatosCotizacion l_cotizacion = null;
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOCotizacion l_consultas = new DAOCotizacion(db_conn);
           l_cotizacion = l_consultas.datosCotizacion(pi_idCotizacion, psb_error);
       }else {
            psb_error.append(db_conn.getERROR());
            l_cotizacion = null;
        }
       db_conn.close();
       return l_cotizacion;
    
    }
    
    public BOProspecto DatosProspecto(String ps_identificacion,
                                      StringBuffer psb_error){
        
       BOProspecto l_datos = null;
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOCotizacion l_consultas = new DAOCotizacion(db_conn);
           l_datos = l_consultas.DatosProspecto(ps_identificacion, psb_error);
       }else {
            psb_error.append(db_conn.getERROR());
            l_datos = null;
        }
       db_conn.close();
       return l_datos;
    
    }

    public BOVehiculo DatosVehiculo(String ps_placa,
                                    StringBuffer psb_error){
        
       BOVehiculo l_datos = null;
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOCotizacion l_consultas = new DAOCotizacion(db_conn);
           l_datos = l_consultas.DatosVehiculo(ps_placa, psb_error);
       }else {
            psb_error.append(db_conn.getERROR());
            l_datos = null;
        }
       db_conn.close();
       return l_datos;
    
    }
    
     public BOVehiculo DatosVehiculo(String ps_idEmpresa,
                                     int pi_idProspecto,
                                     String ps_placa,
                                     StringBuffer psb_error){
        
       BOVehiculo l_datos = null;
       Conexion db_conn = new Conexion(GSDATASOURCE);
       if (db_conn.isConectado()) {
           DAOCotizacion l_consultas = new DAOCotizacion(db_conn);
           l_datos = l_consultas.DatosVehiculo(ps_idEmpresa, pi_idProspecto, ps_placa, psb_error);
       }else {
            psb_error.append(db_conn.getERROR());
            l_datos = null;
        }
       db_conn.close();
       return l_datos;
    
    }
    
    
    
    public void requisitos(String       ps_placa,
                           String       ps_identificacion,
                           StringBuffer ps_prospecto,
                           StringBuffer ps_error,
                           StringBuffer ps_codError){ 

             Conexion db_conn = new Conexion(GSDATASOURCE);
                if (db_conn.isConectado()) {
                    DAOCotizacion l_consultas = new DAOCotizacion(db_conn);
                    l_consultas.requisitos(ps_placa, 
                                           ps_identificacion, 
                                           ps_prospecto, 
                                           ps_error, 
                                           ps_codError);
                }else {
                        ps_error.append(db_conn.getERROR());
                        ps_codError.append("991");
                    }
                db_conn.close();
            
        }
    public BORegProspecto prospecto(String ps_placa,
                                    String ps_identificacion,
                                    String ps_campania,
                                    String ps_tipoProspecto,
                                    StringBuffer psb_codError,
                                    StringBuffer psb_Error){
        Conexion        db_conn = new Conexion(GSDATASOURCE);
        BORegProspecto  l_RegPros = null;
        if (db_conn.isConectado()) {
            DAOCotizacion l_regProsp = new DAOCotizacion(db_conn);
            l_RegPros = l_regProsp.prospecto(ps_placa, 
                                             ps_identificacion, 
                                             ps_campania, 
                                             ps_tipoProspecto, 
                                             psb_codError, 
                                             psb_Error);
        }else {
                psb_Error.append(db_conn.getERROR());
                psb_codError.append("9998");
                l_RegPros = null;
            }
        db_conn.close();
        return l_RegPros;
    }
    public void metrica(String ps_idEmpresa,
                        int    pi_prospecto,
                        int    pi_tipo,
                        StringBuffer psb_desc,
                        StringBuffer psb_valor,
                        StringBuffer psb_error) {
        Conexion        db_conn = new Conexion(GSDATASOURCE);
        if (db_conn.isConectado()) {
            DAOCotizacion l_metrica = new DAOCotizacion(db_conn);
            l_metrica.metrica(ps_idEmpresa, 
                              pi_prospecto, 
                              pi_tipo, 
                              psb_desc, 
                              psb_valor, 
                              psb_error);
            
        }else{
            psb_error.append(db_conn.getERROR());
            psb_desc.append("");
            psb_valor.append("");
            
        }
        db_conn.close();        
        
    }
            
}
