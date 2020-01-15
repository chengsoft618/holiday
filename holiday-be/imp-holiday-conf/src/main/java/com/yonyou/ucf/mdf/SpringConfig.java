package com.yonyou.ucf.mdf;

import com.yonyou.ucf.mdd.meta.crud.QuerySchemaAllHandlerAdapter;
import com.yonyou.ucf.mdd.service.proxy.MddESQuerySchemaService;
import com.yonyou.ucf.mdd.service.proxy.MddQuerySchemaServie;

import java.util.Arrays;
import com.yonyou.cloud.middleware.rpc.RPCBeanFactory;
import org.imeta.orm.schema.QuerySchemaServiceProxy;
import org.imeta.spring.support.orm.QuerySchemaHandlerAdapter;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource(locations= {"classpath*:/config/applicationContext*.xml","classpath*:spring-sub/*.xml"})
public class SpringConfig {

    @Bean
    public QuerySchemaHandlerAdapter serviceDataFetchHandler (@Qualifier("mddQuerySchemaServie") MddQuerySchemaServie mddQuerySchemaServie){
        QuerySchemaHandlerAdapter serviceDataFetchHandler = new QuerySchemaHandlerAdapter();
        serviceDataFetchHandler.setProxy(mddQuerySchemaServie);
        return serviceDataFetchHandler;
    }

    @Bean
    public QuerySchemaHandlerAdapter esDataFetchHandler (@Qualifier("mddESQuerySchemaServie") MddESQuerySchemaService mddESQuerySchemaServie){
        QuerySchemaHandlerAdapter esDataFetchHandler = new QuerySchemaHandlerAdapter();
        esDataFetchHandler.setProxy(mddESQuerySchemaServie);
        return esDataFetchHandler;
    }

    @Bean
    public QuerySchemaAllHandlerAdapter serviceDataFetchAllHandler (@Qualifier("mddQuerySchemaServie") MddQuerySchemaServie mddQuerySchemaServie){
        QuerySchemaAllHandlerAdapter serviceDataFetchAllHandler = new QuerySchemaAllHandlerAdapter();
        serviceDataFetchAllHandler.setProxy(mddQuerySchemaServie);
        return serviceDataFetchAllHandler;
    }

    @Bean
    public QuerySchemaAllHandlerAdapter esDataFetchAllHandler (@Qualifier("mddESQuerySchemaServie") MddESQuerySchemaService mddESQuerySchemaServie){
        QuerySchemaAllHandlerAdapter esDataFetchAllHandler = new QuerySchemaAllHandlerAdapter();
        esDataFetchAllHandler.setProxy(mddESQuerySchemaServie);
        return esDataFetchAllHandler;
    }

    @Bean
    public QuerySchemaServiceProxy esQuerySchemaServiceProxy(@Qualifier("mddESQuerySchemaServie") MddESQuerySchemaService mddESQuerySchemaServie){
        return mddESQuerySchemaServie;
    }

    @Bean
    public RPCBeanFactory scriptManagerServiceFactory(){
        RPCBeanFactory bf = new RPCBeanFactory("imp-holiday-be",
                Arrays.asList("com.yonyou.ucf.mdd.common.interfaces.rpc.IUIMetaRPCService",
                        "com.yonyou.ucf.mdd.common.interfaces.rpc.IRuleRPCService",
                        "com.yonyou.ucf.mdd.common.interfaces.rpc.ICommonQueryRPCService",
                        "com.yonyou.ucf.mdf.api.bill.MdfBillMetaQueryService",
                        "com.yonyou.ucf.mdf.api.dubbo.common.MdfCommonDubboService"));

        return bf;
    }

}
