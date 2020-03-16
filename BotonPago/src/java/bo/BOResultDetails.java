/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 * {"":"APPROVE","":"00","":"Acceptance Test","":"700003447737","RiskResponseCode":"0100","":"000022269351"}
 */
public class BOResultDetails {
       private String RiskStatusCode="";
       private String ResponseCode="";
       private String clearingInstituteName="";
       private String RequestId="";
       private String RiskResponseCode="";
       private String OrderId="";
       
        private String AuthCode   ="";
        private String ConnectorTxID1 ="";
        private String RiskFraudStatusCode ="";
        private String ReferenceNbr ="";
        private String EXTERNAL_SYSTEM_LINK ="";
        private String ExtendedDescription ="";
        private String action ="";
        private String AcquirerResponse ="";
        private String RiskOrderId ="";
/*============================================*/

        
/*============================================*/

    public String getAcquirerResponse() {
        return AcquirerResponse;
    }

    public void setAcquirerResponse(String AcquirerResponse) {
        this.AcquirerResponse = AcquirerResponse;
    }

    public String getAuthCode() {
        return AuthCode;
    }

    public void setAuthCode(String AuthCode) {
        this.AuthCode = AuthCode;
    }

    public String getConnectorTxID1() {
        return ConnectorTxID1;
    }

    public void setConnectorTxID1(String ConnectorTxID1) {
        this.ConnectorTxID1 = ConnectorTxID1;
    }

    public String getEXTERNAL_SYSTEM_LINK() {
        return EXTERNAL_SYSTEM_LINK;
    }

    public void setEXTERNAL_SYSTEM_LINK(String EXTERNAL_SYSTEM_LINK) {
        this.EXTERNAL_SYSTEM_LINK = EXTERNAL_SYSTEM_LINK;
    }

    public String getExtendedDescription() {
        return ExtendedDescription;
    }

    public void setExtendedDescription(String ExtendedDescription) {
        this.ExtendedDescription = ExtendedDescription;
    }

    public String getReferenceNbr() {
        return ReferenceNbr;
    }

    public void setReferenceNbr(String ReferenceNbr) {
        this.ReferenceNbr = ReferenceNbr;
    }

    public String getRiskFraudStatusCode() {
        return RiskFraudStatusCode;
    }

    public void setRiskFraudStatusCode(String RiskFraudStatusCode) {
        this.RiskFraudStatusCode = RiskFraudStatusCode;
    }

    public String getRiskOrderId() {
        return RiskOrderId;
    }

    public void setRiskOrderId(String RiskOrderId) {
        this.RiskOrderId = RiskOrderId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
        
        
        
        
        
    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String OrderId) {
        this.OrderId = OrderId;
    }

    public String getRequestId() {
        return RequestId;
    }

    public void setRequestId(String RequestId) {
        this.RequestId = RequestId;
    }

    public String getResponseCode() {
        return ResponseCode;
    }

    public void setResponseCode(String ResponseCode) {
        this.ResponseCode = ResponseCode;
    }

    public String getRiskResponseCode() {
        return RiskResponseCode;
    }

    public void setRiskResponseCode(String RiskResponseCode) {
        this.RiskResponseCode = RiskResponseCode;
    }

    public String getRiskStatusCode() {
        return RiskStatusCode;
    }

    public void setRiskStatusCode(String RiskStatusCode) {
        this.RiskStatusCode = RiskStatusCode;
    }

    public String getClearingInstituteName() {
        return clearingInstituteName;
    }

    public void setClearingInstituteName(String clearingInstituteName) {
        this.clearingInstituteName = clearingInstituteName;
    }
       
}
