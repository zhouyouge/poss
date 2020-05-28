package com.kgc.dao;

import com.kgc.entity.Agent;
import com.kgc.entity.Merchant;
import com.kgc.entity.Traderecord;
import com.kgc.entity.TraderecordParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (交易记录)表数据库访问层
 *
 * @author yoyo
 * @since 2020-03-24 17:58:22
 */
@Repository("traderecord")
public interface TraderecordDao {
    /**
     * 交易记录表全查
     * @return
     */
    List<Traderecord> query(@Param("start") Integer start,
                            @Param("gname") Integer gname,
                            @Param("pname") Integer pname,
                            @Param("sname") String sname,
                            @Param("aname") String aname,
                            @Param("source") String source,
                            @Param("merchantNo") String merchantNo,
                            @Param("startTime") String startTime,
                            @Param("endTime") String endTime

    );

    /**
     * 分页计算总条数
     * @return
     */
    int getCount(@Param("gname") Integer gname,
                 @Param("pname") Integer pname,
                 @Param("sname") String sname,
                 @Param("aname") String aname,
                 @Param("source") String source,
                 @Param("merchantNo") String merchantNo,
                 @Param("startTime") String startTime,
                 @Param("endTime") String endTime

    );

    /**
     * 导出Excel需要的全查
     * @return
     */
    List<Traderecord> excel();

    /**
     * 新增数据
     *
     * @param traderecord 实例对象
     * @return 影响行数
     */
    int insert(Traderecord traderecord);
    /**
     * 修改数据
     *
     * @param traderecord 实例对象
     * @return 影响行数
     */
    int update(Traderecord traderecord);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String id);

    /**
     * 批量删除
     * @param array
     * @return
     */
    int deleteArray(String[] array);

    /**
     * 根据id 获取全部信息
     * @param id
     * @return
     */
    Traderecord getById(String id);

    /**
     *
     * 交易图表条件查询  没有条件就是全查
     * @return
     */
    List<Traderecord> tubiao(TraderecordParam param);



    /**
     * 报表条件查询  没有条件就是全查
     * @param
     * @return
     */
    List<Traderecord> echarsBaobiao(@Param("start") Integer start,
                                    @Param("gname") Integer gname,
                                    @Param("pname") Integer pname,
                                    @Param("aname") String aname,
                                    @Param("startTime") String startTime,
                                    @Param("endTime") String endTime,
                                    @Param("orderBy") String OrderBy
    );
    /**
     *
     * 报表条件查询 计算总个数  没有条件就是全查
     * @return
     */
    int tubiaocount(@Param("gname") Integer gname,
                    @Param("pname") Integer pname,
                    @Param("aname") String aname,
                    @Param("startTime") String startTime,
                    @Param("endTime") String endTime);

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



}