package com.htf.task;

import com.htf.common.exception.ServiceException;
import com.htf.order.rule.service.IOrderNoService;
import com.htf.order.rule.service.impl.OrderNoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author acumes
 * @date 2018/9/20 9:51
 */
@Component("taskBean")
public class TaskTest {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private IOrderNoService orderNoService;

    public void test(String params){
        logger.info("我是带参数的test方法，正在被执行，参数为：" + params);

        try {
            Thread.sleep(1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }

    @Scheduled(fixedDelay = 10000L)
    public void orderRule(){
        ExecutorService newCachedThreadPool = Executors.newCachedThreadPool();
        System.out.println("****************************newCachedThreadPool*******************************");
        for(int i=0;i<8;i++)
        {
            newCachedThreadPool.execute(orderNoService);
        }
    }

}
