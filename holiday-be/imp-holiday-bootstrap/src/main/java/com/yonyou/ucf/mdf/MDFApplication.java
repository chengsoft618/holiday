package com.yonyou.ucf.mdf;

import com.yonyou.diwork.config.DiworkEnv;
import com.yonyou.diwork.filter.DiworkRequestListener;
import com.yonyou.iuap.ucf.log.filter.MDCLogFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ImportResource;
import com.yonyou.cloud.hpapaas.J2v8.filter.J2v8DebugHelperFilter;


/**
 * spring-boot 入口类
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@ComponentScan(basePackages = {"com.yonyou", "com.yonyoucloud","com"}, excludeFilters = {@ComponentScan.Filter(type = FilterType.REGEX, pattern = { "com.yonyoucloud.uretail.controller.*","com.yonyoucloud.uretail.*.controller.*","com.yonyoucloud.uretail.util.file.oss.AliOss"})})
@ImportResource({DiworkEnv.DIWORK_CONFIG_XML, "classpath:applicationContext-dubbo.xml"})
public class MDFApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        ApplicationContext app = SpringApplication.run(MDFApplication.class, args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        // 注意这里要指向原先用main方法执行的Application启动类
        return builder.sources(MDFApplication.class);
    }

    /**
     * 配置请求上下文拦截器
     */
    @Bean
    public FilterRegistrationBean RequestListener() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(new DiworkRequestListener());
        registrationBean.addUrlPatterns("/*");
        registrationBean.addInitParameter("excludedPages", "/pub/fileupload/download,/bpm/complete,/bpm/registerInterface,/bpm/,/upd/,/graphql,/yonyoucloud-healthcheck/index.html");
        return registrationBean;
    }

    /**
     * ucf-log 日志接入
     * @return
     */
	@Bean
	public FilterRegistrationBean LogFilter() {
		FilterRegistrationBean registrationBean = new FilterRegistrationBean();
		registrationBean.setFilter(new MDCLogFilter());
		registrationBean.addUrlPatterns("/*");
		return registrationBean;
	}

    /**
     * J2v8 debugHelper
     * @return
     */
    @Bean
    public FilterRegistrationBean debugHelperFilter() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(new J2v8DebugHelperFilter());
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }

}
