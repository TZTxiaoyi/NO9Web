package com.common.utils;


import java.security.MessageDigest;

public class SHA1Utils {

    public static String getSHA1(String str) {
        try {
            //String[] array = new String[]{token, timestamp, nonce,bodyHashKey};
            /*StringBuffer sb = new StringBuffer();
            //Arrays.sort(array);

            for(int i = 0; i < array.length; ++i) {
                sb.append(array[i]);
            }

            String str = sb.toString();*/
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(str.getBytes());
            byte[] digest = md.digest();
            StringBuffer hexstr = new StringBuffer();
            String shaHex = "";

            for(int i = 0; i < digest.length; ++i) {
                shaHex = Integer.toHexString(digest[i] & 255);
                if (shaHex.length() < 2) {
                    hexstr.append(0);
                }

                hexstr.append(shaHex);
            }

            return hexstr.toString();
        } catch (Exception var12) {
            var12.printStackTrace();
            //throw new AesException(-40003);
        }
        return "";
    }
}
