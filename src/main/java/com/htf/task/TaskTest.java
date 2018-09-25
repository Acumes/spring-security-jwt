package com.htf.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * @author acumes
 * @date 2018/9/20 9:51
 */
@Component("taskBean")
public class TaskTest {
    private Logger logger = LoggerFactory.getLogger(getClass());

    public void test(String params){
        logger.info("我是带参数的test方法，正在被执行，参数为：" + params);

        try {
            Thread.sleep(1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
