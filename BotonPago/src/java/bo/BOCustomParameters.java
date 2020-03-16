/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class BOCustomParameters {
 private String SHOPPER_EndToEndIdentity="";
 private String CTPE_DESCRIPTOR_TEMPLATE="";

    public String getCTPE_DESCRIPTOR_TEMPLATE() {
        return CTPE_DESCRIPTOR_TEMPLATE;
    }

    public void setCTPE_DESCRIPTOR_TEMPLATE(String CTPE_DESCRIPTOR_TEMPLATE) {
        this.CTPE_DESCRIPTOR_TEMPLATE = CTPE_DESCRIPTOR_TEMPLATE;
    }

    public String getSHOPPER_EndToEndIdentity() {
        return SHOPPER_EndToEndIdentity;
    }

    public void setSHOPPER_EndToEndIdentity(String SHOPPER_EndToEndIdentity) {
        this.SHOPPER_EndToEndIdentity = SHOPPER_EndToEndIdentity;
    }
 
    
}
