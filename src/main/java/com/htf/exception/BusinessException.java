package com.htf.exception;

/**
 * 业务异常.
 *
 * @author zhangxd
 */
public class BusinessException extends Exception {

    public BusinessException() {
        super();
    }

    public BusinessException(String message) {
        super(message);
    }

}