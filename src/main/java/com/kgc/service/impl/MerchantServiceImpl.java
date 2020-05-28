package com.kgc.service.impl;

import com.kgc.LogUtil.LogAnnotation;
import com.kgc.dao.MerchantDao;
import com.kgc.entity.Merchant;
import com.kgc.entity.MerchantPage;
import com.kgc.entity.ResponseResult;
import com.kgc.service.MerchantService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author GJT
 * @create 2020/4/8 22:43
 */
@Service("merchantService")
public class MerchantServiceImpl implements MerchantService {
    @Resource
    private MerchantDao merchantDao;
    @Override
    public MerchantPage fy(MerchantPage merchantPage) {
        merchantPage.setPageIndex((merchantPage.getCurPage()-1)*merchantPage.getPageSize());
        int count=merchantDao.count(merchantPage);
        List<Merchant> list=merchantDao.mfenye(merchantPage);
        MerchantPage merchantPage1=new MerchantPage();
        merchantPage1.setCurPage(merchantPage.getCurPage());
        merchantPage1.setPageSize(merchantPage.getPageSize());
        merchantPage1.setTotalCount(count);
        merchantPage1.setTotalPageCount(count/merchantPage.getPageSize()+(count%merchantPage.getPageSize()==0?0:1));
        merchantPage1.setEndTime(merchantPage.getEndTime());
        merchantPage1.setStartTime(merchantPage.getStartTime());
        merchantPage1.setPageIndex((merchantPage.getCurPage()-1)*merchantPage.getPageSize());
        merchantPage1.setMerchantList(list);
        return merchantPage1;
    }
    @LogAnnotation(moduleName="商户信息",operate = "添加商户信息")
    @Override
    public ResponseResult add(Merchant merchant) {
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(merchant)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            if(merchantDao.add(merchant)>0){
                rs.setResult(true);
                rs.setFlag(1);
            }
        }
        return rs;
    }
    @LogAnnotation(moduleName="商户信息",operate = "修改商户信息")
    @Override
    public ResponseResult update(Merchant merchant) {
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(merchant)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            if(merchantDao.update(merchant)>0){
                rs.setResult(true);
                rs.setFlag(1);
            }
        }
        return rs;
    }
    @LogAnnotation(moduleName="商户信息",operate = "根据id删除商户信息")
    @Override
    public ResponseResult del(String id) {
        ResponseResult rs=new ResponseResult();
        if(StringUtils.isEmpty(id)){
            rs.setFlag(0);
            rs.setResult(false);
        }else {
            if(merchantDao.del(id)>0){
                rs.setResult(true);
                rs.setFlag(1);
            }
        }
        return rs;
    }
    @LogAnnotation(moduleName="商户信息",operate = "商户信息导出excel")
    @Override
    public List<Merchant> excel() {
        return merchantDao.excel();
    }

    @Override
    public Merchant byId(String id) {
        if(StringUtils.isEmpty(id)){
            return null;
        }
        return merchantDao.byId(id);
    }
}
