package com.PineappleStore.Utils;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.security.MessageDigest;

@Component
public class Md5Utils {


    /***
     * MD5加码 生成32位md5码
     */
    public static String md5(String inStr) {
        MessageDigest md5;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        char[] charArray = inStr.toCharArray();
        byte[] byteArray = new byte[charArray.length];

        for (int i = 0; i < charArray.length; i++)
            byteArray[i] = (byte) charArray[i];
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuilder hexValue = new StringBuilder();
        for (byte md5Byte : md5Bytes) {
            int val = ((int) md5Byte) & 0xff;
            if (val < 16)
                hexValue.append("0");
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();

    }

    /**
     * 加密解密算法 执行一次加密，两次解密
     */
    public static String convertMD5(String inStr) {

        char[] passWord = inStr.toCharArray();
        for (int i = 0; i < passWord.length; i++) {
            passWord[i] = (char) (passWord[i] ^ 't');
        }
        return new String(passWord);

    }

//    /**
//     * 判断输入的密码和数据库中保存的MD5密码是否一致
//     * @param inputPassword 输入的密码
//     * @param md5DB 数据库保存的密码
//     * @return
//     */
//    public static boolean passwordIsTrue(String inputPassword,String md5DB) {
//        String md5 = md5(inputPassword);
//        return md5DB.equals(md5);
//    }


    @Bean
    public void checkmd5() {

        String passWord = "Linson";

        if (passWord.equals(convertMD5(convertMD5(passWord)))) {
            System.out.println("---------------------------MD5加密环境配置成功---------------------------");
            System.out.println("原始：" + passWord);
            System.out.println("MD5后：" + md5(passWord));
            System.out.println("加密的：" + convertMD5(passWord));
            System.out.println("解密的：" + convertMD5(convertMD5(passWord)));

        } else {
            System.out.println("---------------------------MD5加密环境配置失败---------------------------");
            System.out.println("原始密文：" + passWord);
            System.out.println("MD5后的密文：" + md5(passWord));
            System.out.println("加密后的密文：" + convertMD5(passWord));
            System.out.println("加密后的密文：" + convertMD5(convertMD5(passWord)));
        }

    }


}
