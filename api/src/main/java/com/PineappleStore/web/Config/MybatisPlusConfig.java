package com.PineappleStore.web.Config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class MybatisPlusConfig {

    //定义mybatis-plus 拦截器
    @Bean
    public MybatisPlusInterceptor mybatisPlusPageInterceptor() {
        //1 定义拦截器
        MybatisPlusInterceptor mybatisPlusPageInterceptor = new MybatisPlusInterceptor();
        //2 添加具体地拦截器
        mybatisPlusPageInterceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));

        return mybatisPlusPageInterceptor;
    }
}
