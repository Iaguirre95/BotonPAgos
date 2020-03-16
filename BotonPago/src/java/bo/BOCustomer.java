/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class BOCustomer {
    private String givenName    = "";
    private String surname      = "";
    private String middleName   = "";
    private String merchantCustomerId = "";
    private String email        = "";
    private String identificationDocType = "";
    private String identificationDocId  = "";
    private String ip           = "";
    private BOBrowserFingerprint  browserFingerprint = new BOBrowserFingerprint();

    public BOBrowserFingerprint getBrowserFingerprint() {
        return browserFingerprint;
    }

    public void setBrowserFingerprint(BOBrowserFingerprint browserFingerprint) {
        this.browserFingerprint = browserFingerprint;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getIdentificationDocId() {
        return identificationDocId;
    }

    public void setIdentificationDocId(String identificationDocId) {
        this.identificationDocId = identificationDocId;
    }

    public String getIdentificationDocType() {
        return identificationDocType;
    }

    public void setIdentificationDocType(String identificationDocType) {
        this.identificationDocType = identificationDocType;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getMerchantCustomerId() {
        return merchantCustomerId;
    }

    public void setMerchantCustomerId(String merchantCustomerId) {
        this.merchantCustomerId = merchantCustomerId;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    
}
