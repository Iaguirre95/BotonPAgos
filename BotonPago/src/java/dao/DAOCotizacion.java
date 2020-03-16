/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bo.BODatosCotizacion;
import bo.BOProspecto;
import bo.BORegProspecto;
import bo.BOVehiculo;
import com.yoveri.conexion.Conexion;
import java.sql.*;

/**
 *
 * @author yoveri
 */
public class DAOCotizacion {
    private Conexion conexion = null;
    private Connection conn = null;

    public DAOCotizacion() {
        super();
    }

    public DAOCotizacion(Conexion con) {
        conexion = con;
        conn = conexion.getConnection();
    } 
    
    public int secuencia() 
    {
        int li_cotizacion = 0;
        CallableStatement cs = null;
        try {
           
           cs = conexion.getConnection().prepareCall("{call gvk_trx_boton_pago.p_secuencia( ? )}"); 
           cs.registerOutParameter(1, Types.INTEGER);
           cs.executeUpdate();
           li_cotizacion = cs.getInt(1);
        }catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
            conexion.rollback();

        } finally {
            conexion.closeQuiet(cs);

        }
        return li_cotizacion;
    }
    public void requisitos(String ps_placa,
                           String ps_identificacion,
                           StringBuffer ps_prospecto,
                           StringBuffer ps_error,
                           StringBuffer ps_codError){
        CallableStatement cs = null;
        String ls_codError  = "";
        String ls_error     = "";
        int     li_prospecto;
        try{
            cs = conexion.getConnection().prepareCall("{call gmk_alianza.requisitos(? , ? , ? , ? , ?)}");
            cs.setString(1,ps_placa);
            cs.setString(2,ps_identificacion);
            cs.registerOutParameter(3, Types.VARCHAR);
            cs.registerOutParameter(4, Types.VARCHAR);
            cs.registerOutParameter(5, Types.VARCHAR);
            cs.executeQuery();
            li_prospecto = cs.getInt(3);
            ls_error = cs.getString(4);
            ls_codError = cs.getString(5);
            
            ps_codError.append(ls_codError);
            ps_error.append(ls_error);
            ps_prospecto.append(li_prospecto);
            
            
        }catch(SQLException e){
            System.out.println("Error Requisitos: "+e.getMessage());
            ps_error.append(("Error Requisitos: "+e.getMessage().toString()));
            ps_codError.append("990");
        }finally{
            conexion.closeQuiet(cs);
        }
    }
    public BORegProspecto prospecto(String ps_placa,
                                    String ps_identificacion,
                                    String ps_campania,
                                    String ps_tipoProspecto,
                                    StringBuffer psb_codError,
                                    StringBuffer psb_Error) 
    {
        CallableStatement   cs          = null;
        BORegProspecto      l_RegPros   = new BORegProspecto();
        String              ls_sql      = "{call gmk_alianza.reg_pros_veh( ?,?,?,?,?,?,?)}";
        String              ls_campania = "";
        String              ls_tipoPros = "";
        int                 li_prospecto=-1;

        try{
            cs = conexion.getConnection().prepareCall(ls_sql);
            cs.setString(1, ps_placa);
            cs.setString(2, ps_identificacion);
            cs.registerOutParameter(3, Types.VARCHAR);
            cs.registerOutParameter(4, Types.VARCHAR);
            cs.registerOutParameter(5, Types.INTEGER);
            cs.registerOutParameter(6, Types.VARCHAR);
            cs.registerOutParameter(7, Types.VARCHAR);
            cs.executeUpdate();
            ls_campania = cs.getString(3);
            ls_tipoPros = cs.getString(4);
            li_prospecto= cs.getInt(5);
            l_RegPros.setPs_campania(ls_campania);
            l_RegPros.setPs_tipoProspecto(ls_tipoPros);
            l_RegPros.setPi_prospecto(li_prospecto);
            
            psb_Error.append(cs.getString(6)); 
            psb_codError.append(cs.getString(7));
            if  (psb_codError.toString() == null){
                cs.getConnection().commit();
            }else{
                if (psb_codError.toString().equals("0")){
                    ;
                }else{
                   cs.getConnection().rollback(); 
                }
            }
        }catch (SQLException e){
            System.out.println("Error Prospecto: "+e.toString());
            psb_Error.append("Error Prospecto: "+e.toString());
            psb_codError.append("9999");
            l_RegPros = null;
        }catch (Exception x)    {
            System.out.println("Exception: "+x.toString());
            psb_Error.append("Exception: "+x.toString());
            psb_codError.append("9999");
            l_RegPros = null;
        }finally{
            conexion.closeQuiet(cs);
        }
        return l_RegPros;
    }
    public int cotizacion(int pi_secuencia,
                          String ps_identificacion,
                          String ps_placa,
                          StringBuffer psb_resultado,
                          StringBuffer psb_error) 
    {
        CallableStatement cs = null;
        int li_cotizacion = 0;
        String ls_error = "";
        try {
           
           cs = conexion.getConnection().prepareCall("{call gvk_trx_boton_pago.p_cotizacion(?, ?, ?, ?, ?, ?)}"); 
           cs.setInt(1, pi_secuencia);
           cs.setString(2, ps_identificacion);
           cs.setString(3, ps_placa);
           cs.setString(4, psb_resultado.toString());
           cs.registerOutParameter(5, Types.INTEGER);
           cs.registerOutParameter(6, Types.VARCHAR);
           cs.executeUpdate();
           li_cotizacion = cs.getInt(5);
           ls_error = cs.getString(6);
           conexion.commit();
        }catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
            ls_error = "Error:" + e.getMessage();
            conexion.rollback();

        } finally {
            conexion.closeQuiet(cs);

        }
        psb_error.append(ls_error);
        return li_cotizacion;
    }
    public BODatosCotizacion datosCotizacion(int ps_idCotizacion,
                                             StringBuffer psb_salida){
        
        String              ls_sql = "select p.id_identificacion, "+
                                           " p.identificacion, "+
                                           " p.nombre_completo, "+
                                           " secuencia_cotizacion, "+
                                           " to_char(c.fecha,'dd-mm-yyyy') fecha, "+
                                           " subtotal, "+
                                           " valor_impuestos, "+
                                           " valor_total, "+
                                           " id_cotizacion,  "+
                                           " p.nombre,  "+
                                           " p.apellido1,  "+
                                           " p.apellido2,  "+
                                           " p.email,  "+
                                           " to_char(p.id_prospecto) id_prospecto,"+
                                           " p.telefono1 "+
                                      " from gv_cotizaciones c, gv_prospectos p "+
                                    "  where c.id_persona = p.id_persona "+
                                    "    and id_cotizacion = ? ";
        
        PreparedStatement   lps_sql = null;
        ResultSet           lrs_sql = null;
        BODatosCotizacion   l_datos = new BODatosCotizacion();
        try{
            lps_sql = conn.prepareStatement(ls_sql);
            lps_sql.setInt(1, ps_idCotizacion);
            lrs_sql = lps_sql.executeQuery();
            if (lrs_sql.next()){
                l_datos.setPi_idCotizacion(lrs_sql.getInt("id_cotizacion"));
                l_datos.setPs_fecha(lrs_sql.getString("fecha"));
                l_datos.setPs_idCotExt(lrs_sql.getString("secuencia_cotizacion"));
                l_datos.setPs_idIdent(lrs_sql.getString("id_identificacion"));
                l_datos.setPs_identificacion(lrs_sql.getString("identificacion"));
                l_datos.setPs_nombre_completo(lrs_sql.getString("nombre_completo"));
                l_datos.setPs_primaNeta(lrs_sql.getString("subtotal"));
                l_datos.setPs_primaTotal(lrs_sql.getString("valor_total"));
                l_datos.setPs_tasa(lrs_sql.getString("valor_impuestos"));
                
                l_datos.setPs_nombre(lrs_sql.getString("nombre"));
                l_datos.setPs_apellido1(lrs_sql.getString("apellido1"));
                l_datos.setPs_apellido2(lrs_sql.getString("apellido2"));
                l_datos.setPs_email(lrs_sql.getString("email"));
                l_datos.setPs_idprospecto(lrs_sql.getString("id_prospecto"));
                l_datos.setPs_telefono1(lrs_sql.getString("telefono1"));

                
            }
        }catch(SQLException e){
            psb_salida.append(e.getMessage());
            System.out.println("Consulta Cot:"+e.getMessage());
        }finally{
           conexion.closeQuiet(lps_sql);
           conexion.closeQuiet(lrs_sql);
        }
    psb_salida.append("OK");   
    return l_datos;
}
    
public BOProspecto DatosProspecto(String ps_identificacion,
                                  StringBuffer psb_error){
    BOProspecto l_prospecto = new BOProspecto();
    
         String    ls_sql = "select id_identificacion, "+
                              "      decode(id_identificacion, 'CED', 'C', 'RUC', 'R', 'C') tipo_id, "+
                              "      identificacion, "+
                              "      apellido1, "+
                              "      apellido2, "+
                              "      nombre, "+
                              "      nombre_completo, "+
                              "      email, "+
                              "      telefono1, "+
                              "      p.id_localidad, "+
                              "     (select l.cod_Area "+
                              "          from ge_localidades l "+
                              "          where l.id_localidad = p.id_localidad "+
                              "          and l.id_provincia = p.id_provincia) prov_alt, "+
                              "      p.id_provincia, "+
                              "      (select p1.siglas "+
                              "          from ge_provincias p1 "+
                              "          where p1.id_provincia = p.id_provincia) loc_alt, " +
                              "     id_prospecto "+
                              "  from gv_prospectos p "+
                              "  where p.identificacion = ? ";
        
        PreparedStatement   lps_sql = null;
        ResultSet           lrs_sql = null;
        try{
            lps_sql = conn.prepareStatement(ls_sql);
            lps_sql.setString(1, ps_identificacion);
            lrs_sql = lps_sql.executeQuery();
            if (lrs_sql.next()){
                l_prospecto.setPs_identificacion(lrs_sql.getString("id_identificacion"));
                l_prospecto.setPs_tipo_id(lrs_sql.getString("tipo_id"));
                l_prospecto.setPs_identificacion(lrs_sql.getString("identificacion"));
                l_prospecto.setPs_apellido1(lrs_sql.getString("apellido1"));
                l_prospecto.setPs_apellido2(lrs_sql.getString("apellido2"));
                l_prospecto.setPs_nombre(lrs_sql.getString("nombre"));
                l_prospecto.setPs_nombre_completo(lrs_sql.getString("nombre_completo"));
                l_prospecto.setPs_email(lrs_sql.getString("email"));
                l_prospecto.setPs_telefono1(lrs_sql.getString("telefono1"));
                
                l_prospecto.setPs_id_localidad(lrs_sql.getString("id_localidad"));
                l_prospecto.setPs_prov_alt(lrs_sql.getString("prov_alt"));
                l_prospecto.setPs_id_provincia(lrs_sql.getString("id_provincia"));
                l_prospecto.setPs_loc_alt(lrs_sql.getString("loc_alt"));
                l_prospecto.setPi_idProspecto(lrs_sql.getInt("id_prospecto")); 

                
            }
        }catch(SQLException e){
            psb_error.append(e.getMessage());
            System.out.println("Consulta Pros:"+e.getMessage());
        }finally{
           conexion.closeQuiet(lps_sql);
           conexion.closeQuiet(lrs_sql);
        }
    psb_error.append("OK");   
    
    
    return l_prospecto;
}


public BOVehiculo DatosVehiculo(String ps_placa,
                                StringBuffer psb_error){
    BOVehiculo l_datos = new BOVehiculo();
    String ls_sql = "select placa,"
                       + "  vin, "
                       + "  motor,"
                       + "  marca, "
                       + "  modelo, "
                       + "  color1,"
                       + "  capacidad, "
                       + "  anio_fabricacion, "
                       + "  clase_transporte "
                    +" from st_v_vehiculos "
                  + " where placa = ? ";
    
    PreparedStatement lp_sql=null;
    ResultSet         lr_sql=null;
    try{
        lp_sql= conn.prepareStatement(ls_sql);
        lp_sql.setString(1, ps_placa);
        lr_sql =  lp_sql.executeQuery();
        if (lr_sql.next()){
            l_datos.setPs_placa(lr_sql.getString("placa"));
            l_datos.setPs_vin(lr_sql.getString("vin"));
            l_datos.setPs_motor(lr_sql.getString("motor"));
            l_datos.setPs_modelo(lr_sql.getString("modelo"));
            l_datos.setPs_color(lr_sql.getString("color1"));
            l_datos.setPs_capacidad(lr_sql.getString("capacidad"));
            l_datos.setPs_anio(lr_sql.getString("anio_fabricacion"));
            l_datos.setPs_clase(lr_sql.getString("clase_transporte"));
            
        }
        
    }catch(SQLException e){
         psb_error.append(e.getMessage());
         System.out.println("Consulta Veh:"+e.getMessage());
    }finally{
        conexion.closeQuiet(lr_sql);
        conexion.closeQuiet(lp_sql);
    }
    return l_datos;
}


public BOVehiculo DatosVehiculo(String ps_idEmpresa,
                                int pi_idProspecto,
                                String ps_placa,
                                StringBuffer psb_error){
    BOVehiculo l_datos = new BOVehiculo();
    String ls_sql = "select t.id_tipo_metrica, t.descripcion,valor "
                     +"   from gm_metricas m, gm_tipos_metricas t "
                     +"   where t.id_tipo_metrica = m.id_tipo_metrica "
                     //   --and t.id_empresa = m.id_empresa "
                     +"   and m.id_prospecto = 14  "
                     +"   and m.estado= 'A'  "
                     +"   and m.aprobada = 'S'  "
                     +"   and m.id_empresa = '09' ";
    
    PreparedStatement lp_sql=null;
    ResultSet         lr_sql=null;
    try{
        lp_sql= conn.prepareStatement(ls_sql); 
        //lp_sql.setInt(1, pi_idProspecto);
        //lp_sql.setString(2, ps_idEmpresa);
        lr_sql =  lp_sql.executeQuery();
         while (lr_sql.next()){
             if ((lr_sql.getInt("id_tipo_metrica")) == 21){
                  l_datos.setPs_vin(lr_sql.getString("valor"));
             }else{
                 if ((lr_sql.getInt("id_tipo_metrica")) == 22){
                  l_datos.setPs_motor(lr_sql.getString("valor"));
                 }else{
                     if ((lr_sql.getInt("id_tipo_metrica")) == 24){
                        l_datos.setPs_modelo(lr_sql.getString("valor"));
                     }else{
                         if ((lr_sql.getInt("id_tipo_metrica")) == 29){
                            l_datos.setPs_color(lr_sql.getString("valor"));
                        }else{
                             if ((lr_sql.getInt("id_tipo_metrica")) == 32){
                                l_datos.setPs_capacidad(lr_sql.getString("valor"));
                            }else{
                                if ((lr_sql.getInt("id_tipo_metrica")) == 26){
                                    l_datos.setPs_anio(lr_sql.getString("valor"));
                                }else{
                                   if ((lr_sql.getInt("id_tipo_metrica")) == 27){
                                        l_datos.setPs_clase(lr_sql.getString("valor"));
                                    }else{
                                        if ((lr_sql.getInt("id_tipo_metrica")) == 23){
                                            l_datos.setPs_marca(lr_sql.getString("valor"));
                                        } else{
                                            if ((lr_sql.getInt("id_tipo_metrica")) == 35){
                                                l_datos.setPs_servicio(lr_sql.getString("valor"));
                                            }  
                                        }
                                   }
                                }
                             }
                         }
                     }
                 }
             }
             
            
        }
        psb_error.append("OK");
    }catch(SQLException e){
         psb_error.append(e.getMessage());
         System.out.println("Consulta Veh:"+e.toString());
    }catch(Exception x){
         psb_error.append(x.getMessage());
         System.out.println("Consulta Veh:"+x.toString());
    }finally{
        conexion.closeQuiet(lr_sql);
        conexion.closeQuiet(lp_sql);
    }
    return l_datos;
}




public void metrica(String ps_idEmpresa,
                    int    pi_prospecto,
                    int    pi_tipo,
                    StringBuffer psb_desc,
                    StringBuffer psb_valor,
                    StringBuffer psb_error) {
    String ls_sql = "select t.descripcion,"
                        + " valor "
                    +" from gm_metricas m, gm_tipos_metricas t"
                   +" where t.id_tipo_metrica = m.id_tipo_metrica"
                     +" and m.id_prospecto = ? "
                     +" and m.estado= 'A' "
                     +" and m.aprobada = 'S' "
                     +" and m.id_empresa = ? "
                     +" and m.id_tipo_metrica = ? ";
    //   --and t.id_empresa = m.id_empresa
    PreparedStatement lp_sql=null;
    ResultSet         lr_sql=null;
    String            ls_descripcion="";
    String            ls_valor = "";
    try{
        lp_sql = conn.prepareStatement(ls_sql);
        lp_sql.setInt(1, pi_prospecto);
        lp_sql.setString(2, ps_idEmpresa);
        lp_sql.setInt(3,pi_tipo);
        lr_sql = lp_sql.executeQuery();
        if (lr_sql.next()){
           ls_descripcion = lr_sql.getString(1) ;
           ls_valor       = lr_sql.getString(2);
        }
    }catch(SQLException e){
        ls_descripcion = "";
           ls_valor    = "";
        psb_error.append(e.toString());
    }finally{
         conexion.closeQuiet(lr_sql);
         conexion.closeQuiet(lp_sql);
    }
    psb_desc.append(ls_descripcion);
    psb_valor.append(ls_valor);
    psb_error.append("");
    }
}
