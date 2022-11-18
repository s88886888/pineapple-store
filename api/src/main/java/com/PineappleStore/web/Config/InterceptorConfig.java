package com.PineappleStore.web.Config;

import com.PineappleStore.web.Interceptor.TokenInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private TokenInterceptor tokenInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(tokenInterceptor)

                .addPathPatterns("/**")//拦截所有

                .excludePathPatterns("/users/**")//放行用户登录
                .excludePathPatterns("/index-img/**")//放行轮播图
                .excludePathPatterns("/category/**")//商品分类
                .excludePathPatterns("/product/**")//商品信息
                .excludePathPatterns("/productimg/**")//商品图片

                .excludePathPatterns("/swagger-ui/**")//放行swagger
                .excludePathPatterns("/doc.html/**")//放行doc
                .excludePathPatterns("/swagger-resources/**")
                .excludePathPatterns("/v2/api-docs")
                .excludePathPatterns("/error")
                .excludePathPatterns("/webjars/**");


    }
}
