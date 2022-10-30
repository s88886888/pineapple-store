package com.pineapplestore.Config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class mybatisPlusConfig {

    //定义mybatis-plus 拦截器
    @Bean
    public MybatisPlusInterceptor mybatisPlusPageInterceptor() {
        //1 定义拦截器
        MybatisPlusInterceptor mybatisPlusPageInterceptor = new MybatisPlusInterceptor();
        //2 添加具体的拦截器
        mybatisPlusPageInterceptor.addInnerInterceptor(new PaginationInnerInterceptor());

        return mybatisPlusPageInterceptor;
    }
}
