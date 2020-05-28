package com.kgc.service.impl;

import com.kgc.LogUtil.LogAnnotation;
import com.kgc.dao.TraderecordDao;
import com.kgc.entity.*;
import com.kgc.service.TraderecordService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 *
 * @author yoyo
 * @since 2020-03-24 17:58:25
 */
@Service("traderecordService")
public class TraderecordServiceImpl implements TraderecordService {
    @Resource
    private TraderecordDao traderecordDao;



    @Override
    public Page<Traderecord> query(Integer pageon,
                                   Integer gname,
                                   Integer pname,
                                   String sname,
                                   String aname,
                                   String source,
                                   String merchantNo,
                                   String startTime,
                                   String endTime

    ) {
        Page<Traderecord> p = new Page<Traderecord>();
        p.setPageon(pageon);//设置当前页
        int i = traderecordDao.getCount(gname,pname,sname,aname,source,merchantNo,startTime,endTime);//获得总记录数

        p.setCount(i);//设置总记录数
        if (i % 10 == 0) { //写死了每页显示5条     可以用三目运算 就 0；0?1这个
            p.setPages(i / 10);
        } else {
            p.setPages((i / 10) + 1);
        }
        int start = (pageon - 1) * 10; //设置起始页下标 和每页显示的条数
        p.setList(traderecordDao.query(start, gname, pname, sname,
                aname, source, merchantNo, startTime, endTime));//每个条数里面的内容
        return p;

    }

    @LogAnnotation(moduleName="交易信息",operate = "导出Excel")
    /**
     * 导出Excel需要的接口
     *
     * @return
     */
    @Override
    public List<Traderecord> excle() {

        return traderecordDao.excel();
    }
    @LogAnnotation(moduleName="交易信息",operate = "导入信息")
    @Override
    public ResponseResult insert(Traderecord traderecord) {
        ResponseResult rs = new ResponseResult();
        if (StringUtils.isEmpty(traderecord)) {
            rs.setFlag(0);
            rs.setData("参数为空");
        }
        if (StringUtils.isEmpty(traderecord.getPid())) {
            rs.setData("平台不能为空");
            rs.setFlag(1);
        }

        if (StringUtils.isEmpty(traderecord.getTradedate())) {
            rs.setData("交易日期不能为空");
            rs.setFlag(2);
        }


        if (StringUtils.isEmpty(traderecord.getBankcard())) {
            rs.setData("银行卡号不能为空");
            rs.setFlag(3);
        }
        if (StringUtils.isEmpty(traderecord.getTrademoney())) {
            rs.setData("交易金额不能为空");
            rs.setFlag(4);
        }
        if (StringUtils.isEmpty(traderecord.getRealamount())) {
            rs.setData("结算金额不能为空");
            rs.setFlag(5);
        }
        if (StringUtils.isEmpty(traderecord.getPoundage())) {
            rs.setData("交易手续费不能为空");
            rs.setFlag(6);
        }
        if (StringUtils.isEmpty(traderecord.getPoundage())) {
            rs.setData("交易手续费不能为空");
            rs.setFlag(7);
        }

        if (StringUtils.isEmpty(traderecord.getRate())) {
            rs.setData("费率不能为空");
            rs.setFlag(8);
        }
        if (StringUtils.isEmpty(traderecord.getPosid())) {
            rs.setData("机具ID不能为空");
            rs.setFlag(9);
        }
        int flag = traderecordDao.insert(traderecord);
        if (flag > 0) {
            rs.setFlag(10);
            rs.setResult(true);

        } else {
            rs.setFlag(11);
            rs.setData("修改失败");
        }


        return rs;
    }
    @LogAnnotation(moduleName="交易信息",operate = "修改交易信息")
    @Override
    public ResponseResult updeateCord(Traderecord traderecord) {
        ResponseResult rs = new ResponseResult();

        if (StringUtils.isEmpty(traderecord)) {
            rs.setData("参数为空");
            rs.setFlag(0);
        }
        if (StringUtils.isEmpty(traderecord.getPid())) {
            rs.setData("平台不能为空");
            rs.setFlag(1);
        }

        if (StringUtils.isEmpty(traderecord.getTradedate())) {
            rs.setData("交易日期不能为空");
            rs.setFlag(2);
        }


        if (StringUtils.isEmpty(traderecord.getBankcard())) {
            rs.setData("银行卡号不能为空");
            rs.setFlag(3);
        }
        if (StringUtils.isEmpty(traderecord.getTrademoney())) {
            rs.setData("交易金额不能为空");
            rs.setFlag(4);
        }
        if (StringUtils.isEmpty(traderecord.getRealamount())) {
            rs.setData("结算金额不能为空");
            rs.setFlag(5);
        }
        if (StringUtils.isEmpty(traderecord.getPoundage())) {
            rs.setData("交易手续费不能为空");
            rs.setFlag(6);
        }
        if (StringUtils.isEmpty(traderecord.getPoundage())) {
            rs.setData("交易手续费不能为空");
            rs.setFlag(7);
        }

        if (StringUtils.isEmpty(traderecord.getRate())) {
            rs.setData("费率不能为空");
            rs.setFlag(8);
        }
        if (StringUtils.isEmpty(traderecord.getPosid())) {
            rs.setData("机具ID不能为空");
            rs.setFlag(9);
        }
        int flag = traderecordDao.update(traderecord);
        if (flag > 0) {
            rs.setFlag(10);
            rs.setResult(true);

        } else {
            rs.setFlag(11);
            rs.setData("修改失败");
        }


        return rs;
    }
    @LogAnnotation(moduleName="交易信息",operate = "删除交易信息")
    @Override
    public ResponseResult deletCord(String id) {
        int flag = traderecordDao.deleteById(id);
        ResponseResult rs = new ResponseResult();
        if (flag > 0) {
            rs.setResult(true);
            rs.setFlag(1);
        } else {
            rs.setFlag(2);
        }
        return rs;
    }

    @Override
    public ResponseResult deleArry(String[] array) {
        ResponseResult rs = new ResponseResult();
        if (StringUtils.isEmpty(array)) {
            rs.setFlag(0);
        }
       int flag = traderecordDao.deleteArray(array);
             if (flag > 0) {
                rs.setResult(true);
                rs.setFlag(1);
            } else {
                rs.setFlag(2);
            }
           return rs;
    }



        public Traderecord getById (String id){
            if (StringUtils.isEmpty(id)) {
                return null;
            }
            return traderecordDao.getById(id);
        }

    @Override
    public List<Traderecord> tubiao(TraderecordParam param) {


        return traderecordDao.tubiao(param);
    }

    @Override
    public List<Agent> agentList() {
        return traderecordDao.agentList();
    }

    @Override
    public List<Merchant> merchantsList() {
        return traderecordDao.merchantsList();
    }

    @Override
    public Page<Traderecord> echarsBaobiao(Integer pageon,
                                           Integer gname,
                                           Integer pname,
                                           String aname,
                                           String startTime,
                                           String endTime,
                                           String orderBy) {





        Page<Traderecord> p = new Page<Traderecord>();
        p.setPageon(pageon);//设置当前页
        int i = traderecordDao.tubiaocount(gname,pname,aname,startTime,endTime);//获得总记录数

        p.setCount(i);//设置总记录数
        if (i % 10 == 0) { //写死了每页显示5条     可以用三目运算 就 0；0?1这个
            p.setPages(i / 10);
        } else {
            p.setPages((i / 10) + 1);
        }
        int start = (pageon - 1) * 10; //设置起始页下标 和每页显示的条数
        p.setList(traderecordDao.echarsBaobiao(start, gname,pname,aname,startTime,endTime,orderBy));//每个条数里面的内容
        return p;

    }


}






