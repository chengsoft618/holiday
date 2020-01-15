package com.yonyou.ucf.mdf.conf;

import com.yonyou.ucf.mdd.conf.DataSourceFactory;
import org.imeta.spring.support.db.DefaultJdbcTemplate;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
public class IMetaDefaultJdbcTemplateConfig {
    @Value("${mapper.url:mapper/**/*Mapper.xml}")
    private String mapUrl;
    @Bean
    public DefaultJdbcTemplate defaultJdbcTemplate() {
        DataSource dataSource = DataSourceFactory.get(DataSourceFactory.dsPerfix + DataSourceFactory.bizDS);
        DefaultJdbcTemplate defaultJdbcTemplate = new DefaultJdbcTemplate();
        defaultJdbcTemplate.setDataSource(dataSource);
        return defaultJdbcTemplate;
    }

    @Bean(name = {"mddUimetaSqlSession"})
    public SqlSessionTemplate uimetaSqlSessionTemplate() {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(DataSourceFactory.get(DataSourceFactory.dsPerfix + DataSourceFactory.uimetaDS));
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        SqlSessionTemplate template = null;
        try {
            bean.setMapperLocations(resolver.getResources("classpath*:"+mapUrl));
            template = new SqlSessionTemplate(bean.getObject());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return template;
    }

    @Bean(name = {"mddBizSqlSession"})
    public SqlSessionTemplate bizSqlSession() {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(DataSourceFactory.get(DataSourceFactory.dsPerfix + DataSourceFactory.bizDS));
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        SqlSessionTemplate template = null;
        try {
            bean.setMapperLocations(resolver.getResources("classpath*:"+mapUrl));
            template = new SqlSessionTemplate(bean.getObject());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return template;
    }

    @Bean(name = {"mddRuleSqlSession"})
    public SqlSessionTemplate ruleSqlSession() {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(DataSourceFactory.get(DataSourceFactory.dsPerfix + DataSourceFactory.ruleDS));
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        SqlSessionTemplate template = null;
        try {
            bean.setMapperLocations(resolver.getResources("classpath*:"+mapUrl));
            template = new SqlSessionTemplate(bean.getObject());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return template;
    }

}
