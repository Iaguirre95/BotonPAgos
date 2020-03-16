/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bin.Parametros;
import bo.BOCheckoutId;
import bo.BOCotizacion;
import bo.BODatosPersona;
import bo.Credenciales;
import com.google.gson.Gson;
import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import javax.net.ssl.HttpsURLConnection;

/**
 *
 * @author yoveri
 */
public class DAOCheckoutId {
     public static BOCheckoutId request(String         ps_idEmpresa, 
                                        String         ps_idProceso,
                                        BODatosPersona p_datosPer,
                                        BOCotizacion   p_cotizacion,
                                        StringBuffer   psb_parametros) throws IOException {
        Credenciales        l_credenciales  = new Credenciales(); 
        Parametros          l_paramteros    = new Parametros();
        BOCheckoutId        l_checkoutid    = new BOCheckoutId();
        
        l_credenciales = l_paramteros.inicializa(ps_idEmpresa, ps_idProceso);
        
        l_checkoutid = request(ps_idEmpresa, ps_idProceso, l_credenciales,p_datosPer,p_cotizacion,psb_parametros);
	
	return l_checkoutid;//textBuilder.toString();
}
     
     public static BOCheckoutId request(String          ps_idEmpresa,
                                        String          ps_idProceso,
                                        Credenciales    p_credenciales,
                                        BODatosPersona  p_datosPer,
                                        BOCotizacion    p_cotizacion,
                                        StringBuffer    psb_parametros) throws IOException {
        Credenciales        l_credenciales  = new Credenciales(); 
        StringBuilder       textBuilder     = new StringBuilder();
        String              ls_iva          = "";
        String              ls_base12       = "";
        String              ls_total        = "";
        /*****  I V A ************/
        ls_iva = Integer.toString((int)((p_cotizacion.getIva()*100)));
        while (ls_iva.length() < 12) {
         ls_iva = "0"+ls_iva;
        }
        ls_iva = "004012"+ls_iva;
        //System.out.println("IVA: "+ls_iva+ " - "+ls_iva.length());
        
        /******** T A R I F A 0% *******/
        
        String ls_tarifa0 = Integer.toString((int)((p_cotizacion.getTarifa0()*100)));
        while (ls_tarifa0.length() < 12) {
         ls_tarifa0 = "0"+ls_tarifa0;
        }
        ls_tarifa0 = "052012"+ls_tarifa0;
        //System.out.println("TARIFA0: "+ls_tarifa0+ " - "+ls_tarifa0.length());
        
        /****** T A R I F A 12% ************/
        
        ls_base12 = Integer.toString((int)((p_cotizacion.getbase12()*100)));
        while (ls_base12.length() < 12) {
         ls_base12 = "0"+ls_base12;
        }
        ls_base12 = "053012"+ls_base12;
        //System.out.println("TARIFA12: "+ls_base12+ " - "+ls_base12.length());
        /***** COMERCIO ELECTRONICO ******/
        String ls_comercio = "003007"+p_cotizacion.getComercio_elect();//"0103910";
        //System.out.println("COMERCIO: "+ls_comercio+ " - "+ls_comercio.length());
        
        /*******PROVEEDOR************/
        String ls_proveedor = "051008"+p_cotizacion.getProveedor();//"17913101";
        //System.out.println("PROVEEDOR: "+ls_comercio+ " - "+ls_proveedor.length());
        int li_total = ls_iva.length()+ls_tarifa0.length()+ls_base12.length()+ls_comercio.length()+ls_comercio.length();
        /********************/
        //System.out.println("TOTAL: "+li_total);
        String ls_customerParameters = "0081"+ls_comercio+ls_iva+ls_proveedor+ls_tarifa0+ls_base12;
        //System.out.println("ls_customerParameters: "+ls_customerParameters);
        l_credenciales = p_credenciales;
        String ls_customParameters ="customParameters["+p_cotizacion.getMid()+"_"+p_cotizacion.getTid()+"]=";
        //System.out.println(l_credenciales.getPs_url());
        
	java.lang.System.setProperty("https.protocols",l_credenciales.getPs_protocolo());//"TLSv1,TLSv1.1,TLSv1.2");
        URL url = new URL(null, l_credenciales.getPs_url(), new sun.net.www.protocol.https.Handler());
        //URL url = new URL(l_credenciales.getPs_url());
	HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
	conn.setRequestMethod("POST");
        //conn.setRequestProperty("Authorization", "Bearer OGE4Mjk0MTg1MzNjZjMxZDAxNTMzZDA2ZmQwNDA3NDh8WHQ3RjIyUUVOWA==");
	conn.setDoInput(true);
	conn.setDoOutput(true);
        String ls_testMode = "";
        if (!(p_datosPer.getTestMode().equals("N"))){
            ls_testMode = "&testMode="+p_datosPer.getTestMode();
        }else{
            ls_testMode = "";
        }
        String data = "" 
                +"authentication.userId="+l_credenciales.getPs_userid()
                +"&authentication.password="+l_credenciales.getPs_password()
		+"&authentication.entityId="+l_credenciales.getPs_entityid()
		+"&amount="+p_datosPer.getTotal()
		+"&currency="+l_credenciales.getPs_currency()
		+"&paymentType="+l_credenciales.getPs_paymentType()
                +"&customer.givenName="+p_datosPer.getGivenName()
                +"&customer.middleName="+p_datosPer.getMiddleName()
                +"&customer.surname="+p_datosPer.getSurname()
                +"&customer.ip="+p_datosPer.getIp()
                +"&customer.merchantCustomerId="+p_datosPer.getMerchantCustomerId()
                +"&merchantTransactionId=transaction_"+p_datosPer.getMerchantTransactionId()
                +"&customer.email="+p_datosPer.getEmail()
                
                +"&customer.identificationDocType="+p_datosPer.getIdentificationDocType()
                +"&customer.identificationDocId="+p_datosPer.getIdentificationDocId()
                //+"&testMode="+p_datosPer.getTestMode()
                +ls_testMode
                +"&"+ls_customParameters+ls_customerParameters//"0081"+ls_iva+ls_base12 
                +"&risk.parameters"+p_cotizacion.getRisk();//[USER_DATA2]=PORTOVIAL"
                ;
                
                System.out.println(data+"<-----DATA");
        
        psb_parametros.append(data);
        //System.out.println("data: "+data);        
        
	DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
	wr.writeBytes(data);
	wr.flush();
	wr.close();
	int responseCode = conn.getResponseCode();
	InputStream is;
        
         System.out.println(Integer.toString(responseCode)+"RESPONSECODE");
        
	if (responseCode >= 400) 
            is = conn.getErrorStream();
	else 
            is = conn.getInputStream();
        
        try 
            (Reader reader = new BufferedReader(new InputStreamReader(is, Charset.forName(StandardCharsets.UTF_8.name())))) {
            int c = 0;
            while ((c = reader.read()) != -1) {
                textBuilder.append((char) c);
            }
        }
        BOCheckoutId l_checkoutid = null;
        Gson gson = new Gson();
        l_checkoutid=gson.fromJson(textBuilder.toString(), BOCheckoutId.class); 
        
         System.out.println(l_checkoutid.getId()+" CHECKOUTID");
        
	return l_checkoutid;
}
     
     
//    public static void main(String arg[]) {
//       try{
//        System.out.println(request("01", "DTF", "1.0",""));
//       }catch(Exception e){System.out.println(e.toString());}
//       
//    }
}
