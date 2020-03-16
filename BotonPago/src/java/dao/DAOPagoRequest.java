/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bo.BOCheckoutId;
import bo.BOPagoRequest;
import bo.Credenciales;
import com.google.gson.Gson;
import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;
import javax.net.ssl.HttpsURLConnection;

/**
 *
 * @author yoveri
 */
public class DAOPagoRequest {
 public static BOPagoRequest PagoRequest(String ps_idEmpresa, 
                        String ps_idProceso,
                        String ps_monto,
                        Credenciales p_datos,
                        BOCheckoutId p_result) throws IOException {
        java.lang.System.setProperty("https.protocols",p_datos.getPs_protocolo());//"TLSv1,TLSv1.1,TLSv1.2");
	//URL url = new URL(p_datos.getPs_url()+"/"+p_result.getId()+"/payment");
        URL url = new URL(null, p_datos.getPs_url()+"/"+p_result.getId()+"/payment", new sun.net.www.protocol.https.Handler());
        StringBuilder textBuilder  = new StringBuilder();
	HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
	conn.setRequestMethod("GET");
        //conn.setRequestProperty("Authorization", "Bearer OGE4Mjk0MTg1MzNjZjMxZDAxNTMzZDA2ZmQwNDA3NDh8WHQ3RjIyUUVOWA==");
	conn.setDoInput(true);
	conn.setDoOutput(true);
        String data = ""
                + "authentication.userId="+p_datos.getPs_userid()
                + "&authentication.password="+p_datos.getPs_password()
		+ "&entityId="+p_datos.getPs_entityid()
		+ "&amount="+ps_monto
		+ "&currency="+p_datos.getPs_currency()
		+ "&paymentType="+p_datos.getPs_paymentType();
        int responseCode = conn.getResponseCode();
	InputStream is;

	if (responseCode >= 400) is = conn.getErrorStream();
	else is = conn.getInputStream();
        try 
            (Reader reader = new BufferedReader(new InputStreamReader(is, Charset.forName(StandardCharsets.UTF_8.name())))) {
            int c = 0;
            String ls_tempo = "";
            while ((c = reader.read()) != -1) {
                textBuilder.append((char) c);
                ls_tempo = ls_tempo+(String.valueOf(c).substring(0, 1)); 
            }System.out.println(ls_tempo);
        }
        BOPagoRequest l_pagosRequest = null;
        Gson gson = new Gson(); 
        l_pagosRequest=gson.fromJson(textBuilder.toString(), BOPagoRequest.class); 
	///return IOUtils.toString(is);
        return l_pagosRequest;
}   
 public static BOPagoRequest PagoRequest(String ps_idEmpresa, 
                                        String ps_idProceso,
                                        String ps_monto,
                                        Credenciales p_datos,
                                        String p_idckid) throws IOException {
        java.lang.System.setProperty("https.protocols",p_datos.getPs_protocolo());//"TLSv1,TLSv1.1,TLSv1.2");
	//URL url = new URL(p_datos.getPs_url()+"/"+p_result.getId()+"/payment");
        String data = "?authentication.userId="+p_datos.getPs_userid()
                + "&authentication.password="+p_datos.getPs_password()
		+ "&entityId="+p_datos.getPs_entityid();
        URL url = new URL(null, p_datos.getPs_url()+"/"+p_idckid+"/payment"+data, new sun.net.www.protocol.https.Handler());
        //URL url = new URL(null, p_datos.getPs_url()+"/"+p_idckid+"/payment", new sun.net.www.protocol.https.Handler());
        StringBuilder textBuilder  = new StringBuilder();
	HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
	conn.setRequestMethod("GET");
        //conn.setRequestProperty("Authorization", "Bearer OGE4Mjk0MTg1MzNjZjMxZDAxNTMzZDA2ZmQwNDA3NDh8WHQ3RjIyUUVOWA==");
	conn.setDoInput(true);
	conn.setDoOutput(true);
        //String data = ""
        //        + "authentication.userId="+p_datos.getPs_userid()
        //        + "&authentication.password="+p_datos.getPs_password()
	//	+ "&entityId="+p_datos.getPs_entityid();
                
                
                
		//+ "&amount="+ps_monto
		//+ "&currency="+p_datos.getPs_currency()
		//+ "&paymentType="+p_datos.getPs_paymentType();
        int responseCode = conn.getResponseCode();
	InputStream is;
      
      /*Scanner sc = new Scanner(conn.getInputStream());
      //Reading line by line from scanner to StringBuffer
      StringBuffer sb = new StringBuffer();
      while(sc.hasNext()){
         sb.append(sc.nextLine());
      }
      System.out.println(sb.toString());;
      */
      
	if (responseCode >= 400) is = conn.getErrorStream();
	else is = conn.getInputStream();
        try 
            (Reader reader = new BufferedReader(new InputStreamReader(is, Charset.forName(StandardCharsets.UTF_8.name())))) {
            int c = 0;
            while ((c = reader.read()) != -1) {
                textBuilder.append((char) c);
            }
        }
        //System.out.println(textBuilder.toString());
        BOPagoRequest l_pagosRequest = null;
        Gson gson = new Gson();
        l_pagosRequest=gson.fromJson(textBuilder.toString(), BOPagoRequest.class); 
	///return IOUtils.toString(is);
        return l_pagosRequest;
}   
}
