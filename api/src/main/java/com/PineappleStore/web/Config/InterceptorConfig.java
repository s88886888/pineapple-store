//package com.PineappleStore.web.Config;
//
//import com.PineappleStore.web.Interceptor.TokenInterceptor;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.system.ApplicationHome;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class InterceptorConfig implements WebMvcConfigurer {
//
//
//
//
//    @Autowired
//    private TokenInterceptor tokenInterceptor;
//
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//
//        registry.addInterceptor(tokenInterceptor).addPathPatterns("/**");//拦截所有
//
////                .excludePathPatterns("/users/**")//放行用户登录
////                .excludePathPatterns("/index-img/**")//放行轮播图
////                .excludePathPatterns("/category/**")//商品分类
////                .excludePathPatterns("/product/**")//商品信息
////                .excludePathPatterns("/productimg/**")//商品图片
//
////                .excludePathPatterns("/swagger-ui/**")//放行swagger
////                .excludePathPatterns("/doc.html/**")//放行doc
////                .excludePathPatterns("/swagger-resources/**")
////                .excludePathPatterns("/v2/api-docs")
////                .excludePathPatterns("/error")
////                .excludePathPatterns("/webjars/**");
//
//    }
//
//    //    @Override
////    public void addResourceHandlers(ResourceHandlerRegistry registry) {
////        /**
////         * 配置资源映射
////         * 意思是：如果访问的资源路径是以“/images/”开头的，
////         * 就给我映射到本机的“E:/images/”这个文件夹内，去找你要的资源
////         * 注意：E:/images/ 后面的 “/”一定要带上
////         */
////
////        ApplicationHome applicationHome = new ApplicationHome(this.getClass());
////        String pre = applicationHome.getDir().getParentFile().getParentFile()
////                .getAbsolutePath() + "\\src\\main\\resources\\imgs\\";
////
////        registry.addResourceHandler("/imgs/**")
////                .addResourceLocations("file:" + pre);
////    }
//}
