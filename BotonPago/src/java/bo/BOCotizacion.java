/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo;

/**
 *
 * @author yoveri
 */
public class BOCotizacion {
    private String Mid = "";
    private String Tid = "";
    private double iva = 0;
    private double base12 = 0;
    private double total = 0;
    private double tarifa0 =0;
    private String comercio_elect = "";
    private String proveedor = "";
    private String Risk = "";

    public double getBase12() {
        return base12;
    }

    public void setBase12(double base12) {
        this.base12 = base12;
    }

    public double getTarifa0() {
        return tarifa0;
    }

    public void setTarifa0(double tarifa0) {
        this.tarifa0 = tarifa0;
    }
    
    
    
    public String getMid() {
        return Mid;
    }

    public void setMid(String Mid) {
        this.Mid = Mid;
    }

    public String getTid() {
        return Tid;
    }

    public void setTid(String Tid) {
        this.Tid = Tid;
    }

    public double getIva() {
        return iva;
    }

    public void setIva(double iva) {
        this.iva = iva;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getbase12() {
        return base12;
    }

    public void setbase12(double total12) {
        this.base12 = total12;
    }

    public String getRisk() {
        return Risk;
    }

    public void setRisk(String Risk) {
        this.Risk = Risk;
    }

    public String getComercio_elect() {
        return comercio_elect;
    }

    public void setComercio_elect(String comercio_elect) {
        this.comercio_elect = comercio_elect;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }
    
}
