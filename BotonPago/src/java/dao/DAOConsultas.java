/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bo.BOPersona;
import bo.Credenciales;
import com.yoveri.conexion.Conexion;
import java.io.ByteArrayInputStream;
import java.sql.*;

/**
 *
 * @author yoveri
 */
public class DAOConsultas {
    private Conexion conexion = null;

    public DAOConsultas() {
        super();
    }

    public DAOConsultas(Conexion con) {
        conexion = con;
    } 
    public BOPersona datosPersona(String ps_Identificacion, String ps_idIdent, StringBuffer psb_error) {
        CallableStatement cs = null;
        BOPersona l_persona = new BOPersona();
        int li_idPersona = 0;
        String ls_error = "";
        
        try{                                                       //clk_api_clientes.clf_retorna_persona
            cs = conexion.getConnection().prepareCall("{ call ? := clk_api_clientes.clf_retorna_persona(?,?) }");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setString(2, ps_idIdent);
            cs.setString(3, ps_Identificacion);
            cs.executeQuery();
            li_idPersona = cs.getInt(1);
            
        } catch (SQLException e) {
            System.out.println("Error1:" + e.toString());
            ls_error = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_error == null){
            ls_error = "";
        }
        if (!ls_error.equals("")){
            psb_error.append(ls_error);
            return l_persona;
            
        }
        ls_error = "";
        try{
            cs = conexion.getConnection().prepareCall("{ call clk_api_clientes.clp_consulta_persona( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt(1, li_idPersona);   
            cs.registerOutParameter(2, Types.VARCHAR);//pv_identificacion
            cs.registerOutParameter(3, Types.VARCHAR);//pv_tipoiden
            cs.registerOutParameter(4, Types.VARCHAR);//pv_tipopersona
            cs.registerOutParameter(5, Types.VARCHAR);//pv_apellido1
            cs.registerOutParameter(6, Types.VARCHAR);//pv_apellido2
            cs.registerOutParameter(7, Types.VARCHAR);//pv_nombres
            cs.registerOutParameter(8, Types.VARCHAR);//pv_nombrecompleto
            cs.registerOutParameter(9, Types.VARCHAR);//pv_clasepersona
            cs.registerOutParameter(10, Types.VARCHAR);//pv_activo
            cs.registerOutParameter(11, Types.DATE);//pv_fecharegistro
            cs.registerOutParameter(12, Types.DATE);//pv_inactivo
            cs.registerOutParameter(13, Types.VARCHAR);//pv_clasecliente
            cs.registerOutParameter(14, Types.VARCHAR);//pv_tipo_cliente
            cs.registerOutParameter(15, Types.VARCHAR);//pv_codigoerror
            cs.executeQuery();
            l_persona.setPi_idPersona(li_idPersona);
            l_persona.setPs_identificacion(cs.getString(2));    
            l_persona.setPs_idIdentificacion(cs.getString(3));
            l_persona.setPs_tipo_persona(cs.getString(4));
            l_persona.setPs_apellido1(cs.getString(5));
            l_persona.setPs_apellido2(cs.getString(6));
            l_persona.setPs_nombre(cs.getString(7));
            l_persona.setPs_nombre_completo(cs.getString(8));
            l_persona.setPs_clase_persona(cs.getString(9));        
            l_persona.setPs_clase_cliente(cs.getString(13));
            l_persona.setPs_tipo_cliente(cs.getString(14));
            ls_error = cs.getString(15);
            
        } catch (SQLException e) {
            System.out.println("Error2:" + e.toString());
            ls_error = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_error == null){
            ls_error = "";
        }
        if (!ls_error.equals("")){
            psb_error.append(ls_error);
            return l_persona;
            
        }
        ls_error = "";
        try{
            cs = conexion.getConnection().prepareCall("{ call ? := clk_api_clientes.clf_retona_correo( ? ) }");
            cs.registerOutParameter(1, Types.VARCHAR);
            cs.setInt(2, li_idPersona);
            cs.executeQuery();
            l_persona.setPs_email(cs.getString(1));
            
        } catch (SQLException e) {
            System.out.println("Error3:" + e.toString());
            ls_error = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_error == null){
            ls_error = "";
        }
        if (!ls_error.equals("")){
            psb_error.append(ls_error);
            return l_persona;
            
        }
        ls_error = "";
        try{
            cs = conexion.getConnection().prepareCall("{ call ? := clk_api_clientes.clf_retona_telefono1( ? ) }");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, li_idPersona);
            cs.executeQuery();
            l_persona.setPs_telefono1(cs.getString(1));
            
        } catch (SQLException e) {
            System.out.println("Error4:" + e.toString());
            ls_error = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        return l_persona;
        
    }
    public Credenciales setParametros(String ps_idEmpresa, String ps_idProceso){
        CallableStatement cs = null;
        Credenciales datos = new Credenciales();

        try {
            cs = conexion.getConnection().prepareCall("{call gvk_trx_boton_pago.p_parametros(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, ps_idEmpresa);
            cs.setString(2, ps_idProceso);
            cs.registerOutParameter(3, Types.VARCHAR);
            cs.registerOutParameter(4, Types.VARCHAR);
            cs.registerOutParameter(5, Types.VARCHAR);
            cs.registerOutParameter(6, Types.VARCHAR);
            cs.registerOutParameter(7, Types.VARCHAR);
            cs.registerOutParameter(8, Types.VARCHAR);
            cs.registerOutParameter(9, Types.VARCHAR);
            cs.registerOutParameter(10, Types.VARCHAR);
            cs.registerOutParameter(11, Types.VARCHAR);
            cs.executeUpdate();

            datos.setPs_userid(cs.getString(3));
            datos.setPs_password(cs.getString(4));
            datos.setPs_url(cs.getString(5));
            datos.setPs_entityid(cs.getString(6));
            datos.setPs_paymentType(cs.getString(7));
            datos.setPs_currency(cs.getString(8));
            datos.setPs_protocolo(cs.getString(9));
            datos.setPs_url_script(cs.getString(10));
            datos.setPs_mensaje(cs.getString(11));
            
            System.out.println(datos.getPs_protocolo()+" datos");

            conexion.commit();

        } catch (SQLException e) {
            System.out.println("Error5:" + e.getMessage());
            datos.setPs_mensaje(e.getMessage());
            conexion.rollback();

        } finally {
            conexion.closeQuiet(cs);

        }
        return datos;
}
    
public void valor_parametros(String ps_idEmpresa ,
                             String ps_idProceso ,
                             String ps_parametro ,
                             StringBuffer psb_valorParametro ,
                             StringBuffer psb_salida){
    
    CallableStatement cs = null;
    String ls_salida  = "";
    String ls_valor = "";
    try{
            cs = conexion.getConnection().prepareCall("{ call gvk_trx_boton_pago.p_parametro( ? , ? ,? , ? ,?) }");
            cs.setString(1,ps_idEmpresa);
            cs.setString(2,ps_idProceso);
            cs.setString(3,ps_parametro);
            cs.registerOutParameter(4, Types.VARCHAR);
            cs.registerOutParameter(5, Types.VARCHAR);
            cs.executeQuery();
            ls_salida = cs.getString(5);
            ls_valor  = cs.getString(4);
            
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_salida = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_salida == null){
            ls_salida = "";
        }
       psb_valorParametro.append(ls_valor);
       psb_salida.append(ls_salida);
    
}

public void genera_recaudacion_pendiente(String ps_idEmpresa ,
                                        String ps_idTramite ,
                                        String ps_placa ,
                                        StringBuffer psb_idTrxCajaInfra,
                                        StringBuffer psb_idTrxCajaTram,
                                        StringBuffer psb_idTrxCajaOtr,
                                        StringBuffer psb_valorRecaudar ,
                                        StringBuffer psb_error,
                                        String       ps_origen,
                                        String       ps_tipoConsulta,
                                        String       ps_valorConsulta){

    CallableStatement cs = null;
    String  ls_error    = "";
    String  ls_valor    = "";
    int     li_idTrxCajaInfra   = 0;
    int     li_idTrxCajaTram    = 0;
    int     li_idTrxCajaOtr     = 0;
    Double  ld_valorRec         = 0.0;
    
    try{
            cs = conexion.getConnection().prepareCall("{ call rek_api_boton_pago_dfast.rep_principal_recaudacion( ? , ? ,? , ? ,? ,? , ? ,?, ?, ? ,? ) }");
            cs.setString(1,ps_idEmpresa);
            cs.setString(2,ps_idTramite);
            cs.setString(3,ps_placa);
            cs.registerOutParameter(4, Types.INTEGER);
            cs.registerOutParameter(5, Types.INTEGER);
            cs.registerOutParameter(6, Types.INTEGER);
            cs.registerOutParameter(7, Types.INTEGER);
            cs.registerOutParameter(8, Types.VARCHAR);
            cs.setString(9,ps_origen);
            cs.setString(10,ps_tipoConsulta);
            cs.setString(11,ps_valorConsulta);
            cs.executeQuery();
            li_idTrxCajaInfra   = cs.getInt(4);
            li_idTrxCajaTram    = cs.getInt(5);
            li_idTrxCajaOtr     = cs.getInt(6);
            ld_valorRec         = cs.getDouble(7);
            ls_error            = cs.getString(8);
            conexion.commit();
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_error = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_error == null){
            ls_error = "";
        }
        psb_error.append(ls_error);
        psb_idTrxCajaInfra.append(li_idTrxCajaInfra);
        psb_idTrxCajaTram.append(li_idTrxCajaTram);
        psb_idTrxCajaOtr.append(li_idTrxCajaOtr);
        psb_valorRecaudar.append(ld_valorRec);
    
}
public void valida_pago(String       ps_idEmpresa,
                        String       ps_idTramite,
                        String       ps_tipo,
                        StringBuffer psb_salida,
                        String       ps_proceso,
                        String       ps_parametro){

    CallableStatement cs = null;
    String  ls_salida    = "";
    try{
            cs = conexion.getConnection().prepareCall("{ call rek_api_boton_pago_dfast.rep_valida_pago( ? , ? ,? , ? ,? , ?) }");
            cs.setString(1,ps_idEmpresa);
            cs.setString(2,ps_idTramite);
            cs.setString(3,ps_tipo);
            cs.registerOutParameter(4, Types.VARCHAR);
            cs.setString(5,ps_proceso);
            cs.setString(6,ps_parametro);
            cs.executeQuery();
            ls_salida            = cs.getString(4);
            conexion.commit();
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_salida = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_salida == null){
            ls_salida = "";
        }
        psb_salida.append(ls_salida);

    
}
public void valida_pago_consulta(String       ps_idEmpresa,
                                 String       ps_origen,
                                 String       ps_tipoConsulta,
                                 String       ps_valorConsulta,
                                 StringBuffer psb_salida,
                                String       ps_proceso,
                                String       ps_parametro){
    CallableStatement cs = null;
    String  ls_salida    = "";
    try{
            cs = conexion.getConnection().prepareCall("{ call rek_api_boton_pago_dfast.rep_valida_pago_consulta( ? , ? ,? , ? , ?, ? , ?) }");
            cs.setString(1,ps_idEmpresa);
            cs.setString(2,ps_origen);
            cs.setString(3,ps_tipoConsulta);
            cs.setString(4,ps_valorConsulta);
            cs.registerOutParameter(5, Types.VARCHAR);
            cs.setString(6,ps_proceso);
            cs.setString(7,ps_parametro);
            cs.executeQuery();
            ls_salida            = cs.getString(5);
            conexion.commit();
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_salida = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_salida == null){
            ls_salida = "";
        }
        psb_salida.append(ls_salida);

    
}


public void DatosEmpresa(String       ps_idEmpresa,
                         StringBuffer psb_descEmpresa,
                         StringBuffer psb_error){
    
        String              ls_sql = "SELECT DESCRIPCION FROM GE_EMPRESAS WHERE ID_EMPRESA = ?";
        String              ls_descEmpresa = "";
        PreparedStatement   lps_sql = null;
        ResultSet           lrs_sql = null;
        try{
            lps_sql = conexion.getConnection().prepareStatement(ls_sql);
            lps_sql.setString(1, ps_idEmpresa);
            lrs_sql = lps_sql.executeQuery();
            if (lrs_sql.next()){
                ls_descEmpresa = lrs_sql.getString("DESCRIPCION");
            }
        }catch(SQLException e){
            psb_error.append(e.getMessage());
            System.out.println("Consulta DescEmpre:"+e.getMessage());
        }finally{
           conexion.closeQuiet(lps_sql);
           conexion.closeQuiet(lrs_sql);
        }
    psb_descEmpresa.append(ls_descEmpresa);
    psb_error.append("OK");   
    
    
}
public void verifica_trx_boton(String       ps_idEmpresa,
                               String       ps_origen,
                               int          pi_idTramite,
                               String       ps_tipoConsulta,
                               String       ps_valorConsulta,
                               StringBuffer psb_salida){
    
   CallableStatement cs = null;
    String  ls_salida    = "";
    try{
            cs = conexion.getConnection().prepareCall("{ call rek_api_boton_pago_dfast.rep_verifica_trx_boton( ? , ? ,? , ? , ? , ?) }");
            cs.setString(1,ps_idEmpresa);
            cs.setString(2,ps_origen);
            cs.setInt(3, pi_idTramite);
            cs.setString(4,ps_tipoConsulta);
            cs.setString(5,ps_valorConsulta);
            cs.registerOutParameter(6, Types.VARCHAR);
            cs.executeQuery();
            ls_salida            = cs.getString(6);
            conexion.commit();
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_salida = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_salida == null){
            ls_salida = "";
        }
        psb_salida.append(ls_salida);

}

public void validaCorreo(String       ps_cuenta,
                         StringBuffer psb_salida){
    
   CallableStatement cs = null;
    String  ls_salida    = "";
    try{
            cs = conexion.getConnection().prepareCall("{ call gvk_trx_boton_pago.p_valida_correo( ? , ? ) }");
            cs.setString(1,ps_cuenta);
            cs.registerOutParameter(2, Types.VARCHAR);
            cs.executeQuery();
            ls_salida            = cs.getString(2);
            conexion.commit();
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_salida = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_salida == null){
            ls_salida = "";
        }
        psb_salida.append(ls_salida);

}

public void InforacionPlaca(String       ps_placa,
                            StringBuffer ps_idIdent,
                            StringBuffer ps_identificacion,
                            StringBuffer psb_salida){
    
   CallableStatement cs = null;
    String ls_salida    = "";
    String ls_idIdent   = "";
    String ls_identificacion = "";
    try{
            cs = conexion.getConnection().prepareCall("{ call rek_api_boton_pago_dfast.rep_info_placa( ? , ? ,? , ?) }");
            cs.setString(1,ps_placa);
            cs.registerOutParameter(2, Types.VARCHAR);
            cs.registerOutParameter(3, Types.VARCHAR);
            cs.registerOutParameter(4, Types.VARCHAR);
            cs.executeQuery();
            ls_idIdent           = cs.getString(2);
            ls_identificacion    = cs.getString(3); 
            ls_salida            = cs.getString(4);
            conexion.commit();
        } catch (SQLException e) {
            System.out.println("Error:" + e.toString());
            ls_salida = e.toString();
        } finally {
            conexion.closeQuiet(cs);
        }
        if (ls_salida == null){
            ls_salida = "";
        }
        psb_salida.append(ls_salida);
        ps_idIdent.append(ls_idIdent);
        ps_identificacion.append(ls_identificacion);

}

}