/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class BORegProspecto {
    private String ps_campania = new String("");
    private String ps_tipoProspecto = new String("");
    private int    pi_prospecto;

    public int getPi_prospecto() {
        return pi_prospecto;
    }

    public void setPi_prospecto(int pi_prospecto) {
        this.pi_prospecto = pi_prospecto;
    }

    public String getPs_campania() {
        return ps_campania;
    }

    public void setPs_campania(String ps_campania) {
        this.ps_campania = ps_campania;
    }

    public String getPs_tipoProspecto() {
        return ps_tipoProspecto;
    }

    public void setPs_tipoProspecto(String ps_tipoProspecto) {
        this.ps_tipoProspecto = ps_tipoProspecto;
    }

}
