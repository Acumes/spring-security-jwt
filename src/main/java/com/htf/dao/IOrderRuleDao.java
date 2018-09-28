package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.po.OrderRule;
import org.springframework.stereotype.Repository;
@Repository
public interface IOrderRuleDao extends BaseMapper<OrderRule, Integer> {
}