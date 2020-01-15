package com.yonyou.ucf.mdf.refex;

import com.yonyou.ucf.mdd.common.dto.ViewControlParams;
import com.yonyou.ucf.mdd.common.model.Pager;
import com.yonyou.ucf.mdd.common.model.RefEntity;
import com.yonyou.ucf.mdd.common.model.UIMetaBaseInfo;
import com.yonyou.ucf.mdd.uimeta.ref.itf.IRefDataHandler;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 测试ref 扩展
 */
@Service("rpcRefDataHandler")
public class RpcRefDataHandler implements IRefDataHandler {
    @Override
    public <T> List<?> getTreeData(UIMetaBaseInfo uiMetaBaseInfo, RefEntity entity, Map<String, Object> refpara, T tenantId, ViewControlParams viewControlParams) throws Exception {

        System.out.println("GetTreeData");
        return null;
    }

    @Override
    public <T> Pager getGridData(UIMetaBaseInfo uiMetaBaseInfo, RefEntity entity, Map<String, Object> refpara, T tenantId, ViewControlParams viewControlParams) throws Exception {
        System.out.println("GetGridData");
        return null;
    }
}
