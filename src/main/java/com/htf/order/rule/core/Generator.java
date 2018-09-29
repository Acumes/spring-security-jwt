package com.htf.order.rule.core;

import com.htf.common.exception.ServiceException;

/**
 * @author acumes
 * @date 2018/9/29 9:22
 */
public interface Generator {
    String next() throws ServiceException;
}
