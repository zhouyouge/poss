package com.kgc.service;

import com.kgc.entity.*;

import java.util.List;

/**
 * (Traderecord)表服务接口
 *
 * @author makejava
 * @since 2020-03-24 17:58:24
 */
public interface TraderecordService {

    /**
     * 交易记录表全查
     * @param  pageon 为当前页
     * @return
     */
    Page<Traderecord> query(Integer pageon,
                            Integer gname,
                            Integer pname,
                            String sname,
                            String aname,
                            String source,
                            String merchantNo,
                            String startTime,
                            String endTime
    );

    /**
     * 导出Excel需要的接口
     * @return
     */
    List<Traderecord> excle();


    /**
     * 新增数据  批量导入
     *
     * @param traderecord 实例对象
     * @return 实例对象
     */
    ResponseResult insert(Traderecord traderecord);

    /**
     *修改数据
     */
    ResponseResult updeateCord(Traderecord traderecord);

    /**
     * 根据id删除信息
     * @param id
     * @return
     */
    ResponseResult deletCord(String id);

    /**
     * 批量删除
     * @param array
     * @return
     */
    ResponseResult deleArry(String[] array);

    /**
     * 根据id获取全部信息
     * @param id
     * @return
     */

    Traderecord getById(String id);

    /**
     * 图表全查 带条件查询
     * @param param
     * @return
     */
    List<Traderecord> tubiao(TraderecordParam param);

    /**
     * 代理商全查
     * @return
     */
    List<Agent> agentList();

    /**
     * 商户表全查
     * @return
     */
    List<Merchant> merchantsList();

    /**
     * 报表条件查询  没有条件就是全查
     * @para
     * @return
     */
    Page<Traderecord> echarsBaobiao(Integer pageon,
                                    Integer gname,
                                    Integer pname,
                                    String aname,
                                    String startTime,
                                    String endTime,
                                    String OrderBy);


}