package com.htf.order.rule.service;

import com.htf.common.exception.ServiceException;

/**
 * @author acumes
 * @date 2018/9/28 17:54
 */
public interface IOrderNoService extends Runnable{
    /**
     * 根据业务单据类型和公司编号返回单据编码
     *
     * @param orderType 业务单据类型
     * @param company   公司编号
     * @return
     */
    String createBizOrderNo(String orderType, String company) throws ServiceException;
}
