package com.htf.service.impl;

import com.htf.common.config.redis.RedisRepository;
import com.htf.common.exception.ServiceException;
import com.htf.service.ISysCaptchaService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.awt.image.BufferedImage;
import java.util.Date;
import com.google.code.kaptcha.Producer;
import org.springframework.stereotype.Service;

/**
 * 验证码
 */
@Service
public class SysCaptchaService implements ISysCaptchaService {

    @Autowired
    private Producer producer;
    @Autowired
    private RedisRepository redisRepository;
    /**
     * 获取图片验证码
     */
    @Override
    public BufferedImage getCaptcha() throws ServiceException {
        //生成文字验证码
        String code = producer.createText();
        //五分钟过期
        redisRepository.setExpire(code,code,1000 * 5 * 60);
        return producer.createImage(code);
    }

    /**
     * 验证码效验
     * @param code  验证码
     * @return  true：成功  false：失败
     */
    @Override
    public boolean validate(String code) {
        String validateCode = redisRepository.get(code);
        if(validateCode != null){
            return true;
        }
        return false;
    }
}
