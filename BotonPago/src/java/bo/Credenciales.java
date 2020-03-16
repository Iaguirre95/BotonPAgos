/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class Credenciales {


private String ps_userid;//    DTF_USERID
private String ps_password;// DTF_PASSWD
private String ps_entityid;// DTF_ENTITYID
private String ps_url;// DTF_URL
private String ps_currency;// DTF_CURRENCY
private String ps_paymentType;// DTF_PAYMENTTYPE
private String ps_mensaje;
private String ps_protocolo;
private String ps_url_script;

    public String getPs_currency() {
        return ps_currency;
    }

    public String getPs_protocolo() {
        return ps_protocolo;
    }

    public void setPs_protocolo(String ps_protocolo) {
        this.ps_protocolo = ps_protocolo;
    }

    public void setPs_currency(String ps_currency) {
        this.ps_currency = ps_currency;
    }

    public String getPs_entityid() {
        return ps_entityid;
    }

    public void setPs_entityid(String ps_entityid) {
        this.ps_entityid = ps_entityid;
    }

    public String getPs_password() {
        return ps_password;
    }

    public void setPs_password(String ps_password) {
        this.ps_password = ps_password;
    }

    public String getPs_paymentType() {
        return ps_paymentType;
    }

    public void setPs_paymentType(String ps_paymentType) {
        this.ps_paymentType = ps_paymentType;
    }
    public String getPs_url_script() {
        return ps_url_script;
    }

    public void setPs_url_script(String ps_url_script) {
        this.ps_url_script = ps_url_script;
    }
    
    public String getPs_url() {
        return ps_url;
    }

    public void setPs_url(String ps_url) {
        this.ps_url = ps_url;
    }

    public String getPs_userid() {
        return ps_userid;
    }

    public void setPs_userid(String ps_userid) {
        this.ps_userid = ps_userid;
    }

    public String getPs_mensaje() {
        return ps_mensaje;
    }

    public void setPs_mensaje(String ps_mensaje) {
        this.ps_mensaje = ps_mensaje;
    }


    
}
