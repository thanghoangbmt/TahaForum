/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Admin
 */
public class EncryptedServices {

    public static String encriptPasswordBySHA256(String password) throws NoSuchAlgorithmException, NullPointerException {
        MessageDigest digest;
        byte[] encodedhash;
        StringBuffer hexString = new StringBuffer();
        digest = MessageDigest.getInstance("SHA-256");
        encodedhash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        for (int i = 0; i < encodedhash.length; i++) {
            String hex = Integer.toHexString(0xff & encodedhash[i]);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
