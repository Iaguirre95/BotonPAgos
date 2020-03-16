/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bin;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Hash {
 
    /* Retorna un hash a partir de un tipo y un texto */
    public static String getHash(String txt, String hashType)  {
        ///System.out.println(txt);
        /*try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance(hashType);
            byte[] array = md.digest(txt.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            //return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
            System.out.println(e.getMessage());
        }
        */
        
        /*String original = txt;
        StringBuffer sb = new StringBuffer();
        try{
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(original.getBytes());
		byte[] digest = md.digest();
		
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
        }catch (NoSuchAlgorithmException ex) {
                    System.out.println(ex.toString());
        }
	System.out.println(sb.toString());	
        
        return  sb.toString();*/
        
        String password = txt;
        
         byte[] defaultBytes=null;
        try {
            defaultBytes = password.getBytes("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(Hash.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            final MessageDigest md5MsgDigest = MessageDigest.getInstance("MD5");
            md5MsgDigest.reset();
            md5MsgDigest.update(defaultBytes);
            final byte messageDigest[] = md5MsgDigest.digest();
            final StringBuffer hexString = new StringBuffer();
            for (final byte element : messageDigest) {
                final String hex = Integer.toHexString(0xFF & element);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            password = hexString + "";
        } catch (final NoSuchAlgorithmException nsae) {
            nsae.printStackTrace();
        }
        return password;
        
    }
 
    /* Retorna un hash MD5 a partir de un texto */
    public static String md5(String txt) {
        return Hash.getHash(txt, "MD5");
    }
 
    /* Retorna un hash SHA1 a partir de un texto */
    public static String sha1(String txt) {
        return Hash.getHash(txt, "SHA1");
    }
 public static void main(String[] args) {
  System.out.println(Hash.md5("GALIANZA"+(Character.toString((char) 161))+(Character.toString((char) 33))+"*?2907/08/19"));
  System.out.println(Hash.md5("GALIANZA¡!*?2907/08/19"));

}
}