package com.htf.service.impl;

import com.htf.dao.IOrderRuleDao;
import com.htf.dao.IOrderRuleSeqDao;
import com.htf.service.IOrderNoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author acumes
 * @date 2018/9/28 17:54
 */
@Service
public class OrderNoService implements IOrderNoService {
    @Autowired
    private IOrderRuleDao orderRuleDao;
    @Autowired
    private IOrderRuleSeqDao orderRuleSeqDao;


}
