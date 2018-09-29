package com.htf.order.rule.core;

import com.htf.common.exception.ServiceException;

/**
 * @author acumes
 * @date 2018/9/29 9:24
 */
public interface DayCallback {
    DayFetchResult fetch(int size) throws ServiceException;

    String format(String orderPrefix, Integer serialNumber, String companyFlag, String customerFlag, String dateFlag, String company,
                  String customer, String charFormat, long sequence) throws ServiceException;
}
