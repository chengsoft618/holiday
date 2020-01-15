package com.yonyou.ucf.mdf.app.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yonyou.ucf.mdd.common.dto.BaseReqDto;
import com.yonyou.ucf.mdd.common.dto.ViewControlParams;
import com.yonyou.ucf.mdd.common.enums.OperationTypeEnum;
import com.yonyou.ucf.mdd.common.model.Pager;
import com.yonyou.ucf.mdd.common.model.ResultList;
import com.yonyou.ucf.mdd.common.model.RuleExecuteResult;
import com.yonyou.ucf.mdd.common.model.UIMetaBaseInfo;
import com.yonyou.ucf.mdd.common.utils.json.GsonHelper;
import com.yonyou.ucf.mdd.uimeta.UIMetaEngine;
import com.yonyou.ucf.mdd.uimeta.poi.model.POIDto;
import com.yonyou.ucf.mdd.uimeta.util.MetaServiceUtils;
import com.yonyou.ucf.mdf.app.common.ResultMessage;
import com.yonyou.ucf.mdf.app.service.IBillService;
import com.yonyou.ucf.mdf.domain.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/bill")
public class BillController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(BillController.class);

    @Autowired
    private IBillService billService;

    @RequestMapping("/list")
    public void list(@RequestBody BaseReqDto queryParam, HttpServletRequest request, HttpServletResponse response) {
        Pager pager = null;
        try {
            pager = billService.queryByPage(queryParam);
            renderJson(response, ResultMessage.data(pager));
        } catch (Exception e) {
            logger.error(e.getMessage());
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    @RequestMapping("/detail")
    public void detail(String billnum, String id, Long groupSchemaId, HttpServletRequest request, HttpServletResponse response) {
        try {
            BaseReqDto bill = new BaseReqDto();
            bill.setId(id);
            bill.setBillnum(billnum);
            bill.setTenantId(CommonUtil.getTenantId());
            bill.setUserId(CommonUtil.getUserId());
            bill.setGroupSchemaId(groupSchemaId);
            Map map = billService.detail(bill);
            renderJson(response, ResultMessage.data(map));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }
    @RequestMapping("/print")
    public void print(HttpServletRequest request, HttpServletResponse response) {
        try {
            String params = request.getParameter("params");
            JSONObject paramObj = JSONObject.parseObject(params);
            String billNo = paramObj.getString("billNo");
            JSONArray array =paramObj.getJSONArray("ids");
            String ids =array.toString().substring(1,array.toString().length()-1).replaceAll("\"","");
            BaseReqDto bill = new BaseReqDto();
            bill.setIds(ids);
            bill.setBillnum(billNo);
            bill.setTenantId(CommonUtil.getTenantId());
            bill.setUserId(CommonUtil.getUserId());
            Map map = billService.print(bill);
            renderJson(response, GsonHelper.ToJSon(map));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    @RequestMapping("/add")
    public void add(@RequestBody BaseReqDto bill, HttpServletRequest request, HttpServletResponse response) {

        try {
            String json = billService.add(bill);
            renderJson(response, ResultMessage.toMap(json, true));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }

    @RequestMapping("/delete")
    public void delete(@RequestBody BaseReqDto bill, HttpServletRequest request, HttpServletResponse response) {
        try {
            String json = billService.delete(bill);
            renderJson(response, ResultMessage.toMap(json, true));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    @RequestMapping("/export")
    public void export(@RequestBody POIDto poiDto, HttpServletRequest request, HttpServletResponse response) {
        try {
            UIMetaBaseInfo baseInfo = MetaServiceUtils.getUIMetaBaseInfo(poiDto.getBillnum(), CommonUtil.getTenantId());
            poiDto.setTenantId(CommonUtil.getTenantId());
            poiDto.setUserId(CommonUtil.getUserId());
            // 如果模板信息需要过滤需要传入ViewControlParams参数
            String[] ruleLvs = new String[3];
            ruleLvs[0] = "common";
            ruleLvs[1] = baseInfo.getSubid();
            ruleLvs[2] = baseInfo.getBillnum();
            poiDto.setRuleLvs(ruleLvs);
            UIMetaEngine.getInstance().exportExcel(poiDto, response);
        } catch (Exception e) {
            logger.error(e.getMessage());
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    /**
     * 单据 导入数据
     *
     * @param file
     * @param billnum
     * @param request
     * @param response
     */

    @RequestMapping("/billImport")
    public void billImport(@RequestParam("file") MultipartFile file,
                           @RequestParam(value = "billnum", required = false) String billnum, HttpServletRequest request,
                           HttpServletResponse response) {
        try {
            POIDto poiDto = new POIDto();
            poiDto.setBillnum(billnum);
            poiDto.setUserId(CommonUtil.getUserId());
            poiDto.setTenantId(CommonUtil.getTenantId());
            UIMetaBaseInfo baseInfo = MetaServiceUtils.getUIMetaBaseInfo(poiDto.getBillnum(), CommonUtil.getTenantId());
            String[] ruleLvs = new String[3];
            ruleLvs[0] = "common";
            ruleLvs[1] = baseInfo.getSubid();
            ruleLvs[2] = baseInfo.getBillnum();
            poiDto.setRuleLvs(ruleLvs);
            ResultList resultList = UIMetaEngine.getInstance().importData(file, poiDto);
            renderJson(response, ResultMessage.data(resultList));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    /**
     * 保存业务数据
     *
     * @param bill
     * @param request
     * @param response
     */
    @RequestMapping("/save")
    public void save(@RequestBody BaseReqDto bill, HttpServletRequest request, HttpServletResponse response) {
        try {
            RuleExecuteResult result = billService.executeUpdate("save", bill);
            renderJson(response, ResultMessage.data(result.getData(), false));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
            e.printStackTrace();
        }
    }

    /**
     * 批量删除
     *
     * @param bill
     * @param request
     * @param response
     */
    @RequestMapping("/batchdelete")
    public void batchdelete(@RequestBody BaseReqDto bill, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (bill.getData() != null) {
                bill.setAction(request.getParameter("action"));
                ResultList resultList = billService.batchdelete(bill);
                renderJson(response, ResultMessage.data(resultList));
            } else {
                renderJson(response, ResultMessage.error("no data"));
            }
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }


    @RequestMapping("/ref/getRefData")
    public void getRefData(@RequestBody BaseReqDto baseReqDto, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (null == baseReqDto.getTenantId() || StringUtils.isBlank(baseReqDto.getTenantId().toString())) {// 指定租户查询
                baseReqDto.setTenantId(CommonUtil.getTenantId());
            }
            Object refData= UIMetaEngine.getInstance().getRefData(baseReqDto, new ViewControlParams());
            renderJson(response, ResultMessage.data(refData));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.toString()));
        }
    }

    @RequestMapping("/querytree")
    public void querytree(@RequestBody BaseReqDto baseReqDto,HttpServletRequest request,HttpServletResponse response){
        try {
            List list = billService.querytree(baseReqDto);
            renderJson(response,ResultMessage.data(list));
        } catch (Exception e) {
            renderJson(response,ResultMessage.error(e.getMessage()));
            e.printStackTrace();
        }

    }


    @RequestMapping("/movefirst")
    public void movefirst(String billnum, HttpServletRequest request, HttpServletResponse response) {

        try {
            BaseReqDto baseReqDto = new BaseReqDto();
            baseReqDto.setBillnum(billnum);
            Map map = billService.movefirst(baseReqDto);
            renderJson(response, ResultMessage.data(map));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }

    @RequestMapping("/moveprev")
    public void moveprev(String billnum, String id, HttpServletRequest request, HttpServletResponse response) {

        try {
            BaseReqDto baseReqDto = new BaseReqDto();
            baseReqDto.setBillnum(billnum);
            baseReqDto.setId(id);
            Map map = billService.moveprev(baseReqDto);
            renderJson(response, ResultMessage.data(map));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }

    @RequestMapping("/movenext")
    public void movenext(String billnum, String id, HttpServletRequest request, HttpServletResponse response) {

        try {
            BaseReqDto baseReqDto = new BaseReqDto();
            baseReqDto.setBillnum(billnum);
            baseReqDto.setId(id);
            Map map = billService.movenext(baseReqDto);
            renderJson(response, ResultMessage.data(map));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }

    @RequestMapping("/movelast")
    public void movelast(String billnum, HttpServletRequest request, HttpServletResponse response) {
        try {
            BaseReqDto baseReqDto = new BaseReqDto();
            baseReqDto.setBillnum(billnum);
            Map map = billService.movelast(baseReqDto);
            renderJson(response, ResultMessage.data(map));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    @RequestMapping("/check")
    public void check(@RequestBody BaseReqDto  checkItem, HttpServletRequest request, HttpServletResponse response) {
        try {
            RuleExecuteResult result = billService.check(checkItem);
            renderJson(response, ResultMessage.data(result.getData()));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }


    @RequestMapping("/submit")
    public void submit(@RequestBody BaseReqDto baseReqDto, HttpServletRequest request, HttpServletResponse response) {
        try {
            RuleExecuteResult result = billService.executeUpdate(OperationTypeEnum.SUBMIT.getValue(), baseReqDto);
            renderJson(response, ResultMessage.data(result.getData(), false));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    @RequestMapping("/unsubmit")
    public void unsubmit(@RequestBody BaseReqDto baseReqDto, HttpServletRequest request, HttpServletResponse response) {
        try {
            RuleExecuteResult result = billService.executeUpdate(OperationTypeEnum.UNSUBMIT.getValue(), baseReqDto);
            renderJson(response, ResultMessage.data(result.getData(), true));
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }
    }

    /**
     * 批量删除
     *
     * @param bill
     * @param request
     * @param response
     */
    @RequestMapping("/batchsubmit")
    public void batchsubmit(@RequestBody BaseReqDto bill, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (bill.getData() != null) {
                bill.setAction(request.getParameter("action"));
                ResultList resultList = billService.batchsubmit(bill);
                renderJson(response, ResultMessage.data(resultList));
            } else {
                renderJson(response, ResultMessage.error("no data"));
            }
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }
    /**
     * 批量删除
     *
     * @param bill
     * @param request
     * @param response
     */
    @RequestMapping("/batchunsubmit")
    public void batchunsubmit(@RequestBody BaseReqDto bill, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (bill.getData() != null) {
                bill.setAction(request.getParameter("action"));
                ResultList resultList = billService.batchunsubmit(bill);
                renderJson(response, ResultMessage.data(resultList));
            } else {
                renderJson(response, ResultMessage.error("no data"));
            }
        } catch (Exception e) {
            renderJson(response, ResultMessage.error(e.getMessage()));
        }

    }
}