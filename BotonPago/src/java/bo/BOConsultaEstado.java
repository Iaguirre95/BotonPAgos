/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class BOConsultaEstado {
    private String ps_codigo        = "";
    private StringBuffer psb_descripcion   = new StringBuffer("");

    public String getPs_codigo() {
        return ps_codigo;
    }

    public void setPs_codigo(String ps_codigo) {
        this.ps_codigo = ps_codigo;
    }

    public StringBuffer getPsb_descripcion() {
        return psb_descripcion;
    }

    public void setPsb_descripcion(StringBuffer psb_descripcion) {
        this.psb_descripcion = psb_descripcion;
    }
    
}
