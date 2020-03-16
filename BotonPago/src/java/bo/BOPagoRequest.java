/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class BOPagoRequest {
    private BOResult result;
    private String buildNumber ="";
    private String timestamp="";
    private String ndc="";
    private String id="";
    private String paymentType="";
    private String paymentBrand="";
    private String amount="";
    private String currency="";
    private String descriptor="";
    private BOResultDetails resultDetails = new BOResultDetails();
    private BOCards card = new BOCards();
    private BOCustomer customer = new BOCustomer();
    private BOThreeDSecure threeDSecure = new BOThreeDSecure();
    private BOCustomParameters  customParameters = new BOCustomParameters();
    private BORisk risk = new BORisk();
    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getBuildNumber() {
        return buildNumber;
    }

    public void setBuildNumber(String buildNumber) {
        this.buildNumber = buildNumber;
    }

    public BOCards getCards() {
        return card;
    }

    public void setCards(BOCards cards) {
        this.card = cards;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public BOCustomParameters getCustomParameters() {
        return customParameters;
    }

    public void setCustomParameters(BOCustomParameters customParameters) {
        this.customParameters = customParameters;
    }

    public BOCustomer getCustomer() {
        return customer;
    }

    public void setCustomer(BOCustomer customer) {
        this.customer = customer;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public void setDescriptor(String descriptor) {
        this.descriptor = descriptor;
    }

    public BOResultDetails getDetails() {
        return resultDetails;
    }

    public void setDetails(BOResultDetails details) {
        this.resultDetails = details;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNdc() {
        return ndc;
    }

    public void setNdc(String ndc) {
        this.ndc = ndc;
    }

    public String getPaymentBrand() {
        return paymentBrand;
    }

    public void setPaymentBrand(String paymentBrand) {
        this.paymentBrand = paymentBrand;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public BOResult getResult() {
        return result;
    }

    public void setResult(BOResult result) {
        this.result = result;
    }

    public BORisk getRisk() {
        return risk;
    }

    public void setRisk(BORisk risk) {
        this.risk = risk;
    }

    public BOThreeDSecure getThreeDSecure() {
        return threeDSecure;
    }

    public void setThreeDSecure(BOThreeDSecure threeDSecure) {
        this.threeDSecure = threeDSecure;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
    
    
    
}
