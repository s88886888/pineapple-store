package com.PineappleStore.Utils;

import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.Config;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;


@Component
public class alipayConfig {
    @ApiModelProperty("应用ID")
    @Value("${alipayConfig.appId}")
    private String appId;
    @ApiModelProperty("请求的协议")
    @Value("${alipayConfig.protocol}")
    private String protocol;
    @ApiModelProperty("请求网关的路径")
    @Value("${alipayConfig.gatewayHost}")
    private String gatewayHost;
    @ApiModelProperty("应用私钥")
    @Value("${alipayConfig.merchantPrivateKey}")
    private String merchantPrivateKey;
    @ApiModelProperty("支付宝公钥")
    @Value("${alipayConfig.alipayPublicKey}")
    private String alipayPublicKey;
    @ApiModelProperty("签名加密类型")
    @Value("${alipayConfig.signType}")
    private String signType;
    @ApiModelProperty("支付回调地址")
    @Value("${alipayConfig.notifyUrl}")
    private String notifyUrl;


    @Bean
    public void getaliPayConfig() {
        Config config = new Config();
        config.protocol = this.protocol;
        config.gatewayHost = this.gatewayHost;
        config.signType = this.signType;
        config.appId = this.appId;
        config.merchantPrivateKey = this.merchantPrivateKey;
        config.alipayPublicKey = this.alipayPublicKey;
        config.notifyUrl = this.notifyUrl;
        Factory.setOptions(config);
        System.out.println("---------------------------支付宝环境配置成功---------------------------");
    }


}

