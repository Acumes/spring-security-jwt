package com.htf.service;

import com.htf.common.exception.ServiceException;

import java.awt.image.BufferedImage;

public interface ISysCaptchaService {
    /**
     * 获取图片验证码
     */
    BufferedImage getCaptcha() throws ServiceException;

    /**
     * 验证码效验
     * @param code  验证码
     * @return  true：成功  false：失败
     */
    boolean validate(String code);
}
