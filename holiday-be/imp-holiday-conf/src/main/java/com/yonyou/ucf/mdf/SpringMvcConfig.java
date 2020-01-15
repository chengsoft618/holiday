package com.yonyou.ucf.mdf;

import com.yonyou.ucf.mdf.app.interceptor.SnWebAppInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SpringMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SnWebAppInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/*.ico")
                .excludePathPatterns("/pub/fileupload/download/**")
                .excludePathPatterns("/bpm/**");
    }
}
