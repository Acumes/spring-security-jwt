package com.htf.common.asyn;


import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

/**
 * @author acumes
 * @date 2018/9/10 14:48
 */
@Configuration
// 启用spring 异步处理
@EnableAsync
public class AsyncConfigurerImpl implements AsyncConfigurer {

    /**
     * 获取异步线程池执行对象 corePoolSize： 线程池维护线程的最少数量
     *
     * keepAliveSeconds 线程池维护线程所允许的空闲时间
     *
     * maxPoolSize 线程池维护线程的最大数量
     *
     * queueCapacity 线程池所使用的缓冲队列
     *
     * 当一个任务通过execute(Runnable)方法欲添加到线程池时：
     *
     * l 如果此时线程池中的数量小于corePoolSize，即使线程池中的线程都处于空闲状态，也要创建新的线程来处理被添加的任务。
     *
     * l 如果此时线程池中的数量等于 corePoolSize，但是缓冲队列 workQueue未满，那么任务被放入缓冲队列。
     *
     * l 如果此时线程池中的数量大于corePoolSize，缓冲队列workQueue满，并且线程池中的数量小于maximumPoolSize，
     * 建新的线程来处理被添加的任务。
     *
     * l
     * 如果此时线程池中的数量大于corePoolSize，缓冲队列workQueue满，并且线程池中的数量等于maximumPoolSize，那么通过
     * handler所指定的策略来处理此任务。也就是：处理任务的优先级为：核心线程corePoolSize、任务队列workQueue、最大线程
     * maximumPoolSize，如果三者都满了，使用handler处理被拒绝的任务。
     *
     * l 当线程池中的线程数量大于
     * corePoolSize时，如果某线程空闲时间超过keepAliveTime，线程将被终止。这样，线程池可以动态的调整池中的线程数。
     *
     * @return
     */
    @Override
    public Executor getAsyncExecutor() {
        // 使用Spring内置线程池任务对象
        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
        // 设置线程池参数 线程池维护线程的最少数量
        taskExecutor.setCorePoolSize(5);
        // 线程池维护线程的最大数量
        taskExecutor.setMaxPoolSize(10);
        // 线程池所使用的缓冲队列
        taskExecutor.setQueueCapacity(25);
        // 线程池线程名称前缀
        taskExecutor.setThreadNamePrefix("MyAsync-");
        // 线程池维护线程所允许的空闲时间
        taskExecutor.setKeepAliveSeconds(300);
        // rejection-policy：当pool已经达到max size的时候，如何处理新任务
        // CALLER_RUNS：不在新线程中执行任务，而是由调用者所在的线程来执行
        taskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        taskExecutor.initialize();
        return taskExecutor;
    }

    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        return null;

    }
}

