package com.PineappleStore.Utils;

import com.dingxianginc.ctu.client.CaptchaClient;
import com.dingxianginc.ctu.client.model.CaptchaResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class DingxiangCheck {


    @Bean
    public void getDingXiangCheck() throws Exception {

        if (Checktoken("1234567890000000000000000000Linson")) {
            System.out.println("---------------------------顶象验证环境配置失败请检查服务是否过期---------------------------");
        } else {
            System.out.println("---------------------------顶象验证环境配置成功---------------------------");
        }
    }


    public static boolean Checktoken(String token) throws Exception {
        /**构造入参为appId和appSecret
         * appId和前端验证码的appId保持一致，appId可公开
         * appSecret为秘钥，请勿公开
         * token在前端完成验证后可以获取到，随业务请求发送到后台，token有效期为两分钟
         * ip 可选，提交业务参数的客户端ip
         **/
        String appId = "670f56a070bea7d2a1e1939169f4967d";
        String appSecret = "0f968f02d47d9d58d6c65d6a3e3653b1";
        CaptchaClient captchaClient = new CaptchaClient(appId, appSecret);
        captchaClient.setCaptchaUrl("https://proxy-api.dingxiang-inc.com/api/tokenVerify");
//指定服务器地址，saas可在控制台，应用管理页面最上方获取
        CaptchaResponse response = captchaClient.verifyToken(token);

//CaptchaResponse response = captchaClient.verifyToken(token, ip);
//针对一些token冒用的情况，业务方可以采集客户端ip随token一起提交到验证码服务，验证码服务除了判断token的合法性还会校验提交业务参数的客户端ip和验证码颁发token的客户端ip是否一致
//        System.out.println(response.getCaptchaStatus());
//确保验证状态是SERVER_SUCCESS，SDK中有容错机制，在网络出现异常的情况会返回通过
//System.out.println(response.getIp());
//验证码服务采集到的客户端ip
//        System.out.println(token+"--------------------------------------------------------0");
//        System.out.println(response.getCode()+"--------------------------------------------------------1");
//        System.out.println(response.getResult()+"--------------------------------------------------------2");
//        System.out.println(response.getIp()+"--------------------------------------------------------3");

        if (response.getResult()) {
            /**token验证通过，继续其他流程**/
            return true;
        } else {
            /**token验证失败，业务系统可以直接阻断该次请求或者继续弹验证码**/
            return false;
        }
    }

}
