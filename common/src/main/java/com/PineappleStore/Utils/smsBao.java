package com.PineappleStore.Utils;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;


@Component
public class smsBao {


    @Bean
    public void getSmsBao() {
        System.out.println("---------------------------短信宝环境配置成功---------------------------");
    }


    public int getSmsCode(String phone, Integer code) {

        String Content = "您的验证码是" + code + ",５分钟内有效。您正在进行身份验证,打死不要告诉别人哦！。"; // 注意测试时，也请带上公司简称或网站签名，发送正规内容短信。千万不要发送无意义的内容：例如 测一下、您好。否则可能会收不到


        String httpUrl = "http://api.smsbao.com/sms";

        String httpArg = "u=" + "linson_h" + "&" +
                "p=" + "00c359ff62ed7c1e02a69007d20afbe8" + "&" +
                "m=" + phone + "&" +
                "c=" + encodeUrlString(Content, "UTF-8");

        String result = request(httpUrl, httpArg);

        if (result.equals("0")) {
            return 1;
        } else if (result.equals("41")) {
            return 2;
        } else {
            return 0;
        }
    }

    public String request(String httpUrl, String httpArg) {
        BufferedReader reader;
        String result = null;
        StringBuilder sbf = new StringBuilder();
        httpUrl = httpUrl + "?" + httpArg;

        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
            String strRead = reader.readLine();
            if (strRead != null) {
                sbf.append(strRead);
                while ((strRead = reader.readLine()) != null) {
                    sbf.append("\n");
                    sbf.append(strRead);
                }
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public String encodeUrlString(String str, String charset) {
        String strret;
        if (str == null)
            return null;
        try {
            strret = java.net.URLEncoder.encode(str, charset);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return strret;
    }

}
