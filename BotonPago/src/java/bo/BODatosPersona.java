/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class BODatosPersona {
    
private String givenName            = "";//nombre
private String middleName           = "";//2do nombre
private String surname              = "";//apellido
private String ip                   = "";//ip
private String merchantCustomerId   = "";//id_persona
private String merchantTransactionId = "";//trx axis
private String email                = "";//correo
private String identificationDocType = "IDCARD";//
private String identificationDocId  = "";//identificacion
private String phone                = "";//max 25
private String street1_ent          = "";//direccion entrega max 100
private String street1_com          = "";//direccion de compra max 100
private String country_ent          = "";//País de entrega
private String country_cli          = "";//País del Cliente
private String testMode             = "EXTERNAL";//solo test
private String total                = "";




//cart.items["0"].name --> Nombre del producto
//cart.items["0"].description --> Descripción del producto
//cart.items["0"].price --> Precio del producto
//cart.items["0"].quantity --> cart.items["0"]. quantity

    public String getCountry_cli() {
        return country_cli;
    }

    public void setCountry_cli(String country_cli) {
        this.country_cli = country_cli;
    }

    public String getCountry_ent() {
        return country_ent;
    }

    public void setCountry_ent(String country_ent) {
        this.country_ent = country_ent;
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

    public String getMerchantTransactionId() {
        return merchantTransactionId;
    }

    public void setMerchantTransactionId(String merchantTransactionId) {
        this.merchantTransactionId = merchantTransactionId;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStreet1_com() {
        return street1_com;
    }

    public void setStreet1_com(String street1_com) {
        this.street1_com = street1_com;
    }

    public String getStreet1_ent() {
        return street1_ent;
    }

    public void setStreet1_ent(String street1_ent) {
        this.street1_ent = street1_ent;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getTestMode() {
        return testMode;
    }

    public void setTestMode(String testMode) {
        this.testMode = testMode;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
    
    
}
