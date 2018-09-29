package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.po.OrderRuleSeq;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface IOrderRuleSeqDao extends BaseMapper<OrderRuleSeq, Integer> {
    OrderRuleSeq queryOrderRuleSeqInfo(@Param("orderRuleId") Integer orderRuleId, @Param("ruleOrderCompany") String ruleOrderCompany);

    void insertOrderRuleSeqInfo(OrderRuleSeq sequence);

    void updateOrderRuleSeqInfo(OrderRuleSeq sequence);
}