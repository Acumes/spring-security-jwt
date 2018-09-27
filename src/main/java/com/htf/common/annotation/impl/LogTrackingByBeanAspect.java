package com.htf.common.annotation.impl;

import com.alibaba.fastjson.JSON;
import com.htf.common.annotation.LogTrackingByBean;
import com.htf.common.config.security.model.AuthUser;
import com.htf.common.utils.DateUtils;
import com.htf.po.SysActionLog;
import com.htf.service.ISysActionLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author acumes
 * @date 2018/9/10 10:03
 */
@Aspect // 开启AOP操作
@Component
@Order(2) // 设置切面的顺序
public class LogTrackingByBeanAspect {

    private Logger logger = LoggerFactory.getLogger(LogTrackingByBeanAspect.class);

    @Autowired
    private ISysActionLogService sysActionLogService;
    //
    // 如果需要通过方法的入参进行切面
    // ,如入参类型是Java.lang包下的类，可以直接使用类名，否则必须使用全限定类名，如(com.htf.common.annotation.LogTrackingByBean,..)
    // @Pointcut(value =
    // "@annotation(com.htf.common.annotation.LogTrackingByBean)")

    // 添加操作处理后，日志后置记录
    @AfterReturning(returning = "ret", pointcut = "@annotation(com.htf.common.annotation.LogTrackingByBean)")
    public void doAfterReturning(JoinPoint joinPoint, Object ret) {
        try {
            Signature signature = joinPoint.getSignature();
            Method method = ((MethodSignature) signature).getMethod();
            LogTrackingByBean operationLog = method.getAnnotation(LogTrackingByBean.class);
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();
            if (!operationLog.enable()) {
                // 如果注解设置为false ,表示不启用日志记录 。跳出AOP日志操作。
                return;
            }
            Class<?> cls = operationLog.value();
            for (Object arg : joinPoint.getArgs()) {
                if (cls.isInstance(arg)) {
                    Long time = System.currentTimeMillis();
                    // 非嵌套对象读取
                    SysActionLog log = new SysActionLog();

                    AuthUser authUser = (AuthUser) SecurityContextHolder.getContext()
                            .getAuthentication()
                            .getPrincipal();
                    if(authUser != null){
                        log.setCreateUser(authUser.getId());
                    }
                    log.setHttpMethod(request.getMethod());
                    log.setIp(request.getRemoteAddr());
                    log.setUrl(request.getRequestURL().toString());
                    log.setFunctionName(joinPoint.getSignature().getName());
                    // 将请求参数转换成json.
                    String argString = JSON.toJSONString(arg);
                    String resString = JSON.toJSONString(ret);
                    Map argMap = new HashMap();
                    if(!(argString instanceof String)){
                        argMap =JSON.parseObject(argString);
                    }
                    Map resMap = JSON.parseObject(resString);
                    if(!"null".equals(String.valueOf(argMap.get("startTime")))) {
                        log.setStartTime(DateUtils.strToDateLong(String.valueOf(argMap.get("startTime"))));
                    }else {
                        //添加容错  数据库时间不能为空
                        log.setStartTime(DateUtils.getNow());
                    }

                    // 如果设置了methodName 为空，表示不从对象获取 ，直接根据指定index 获取关联外键，如果设置了
                    // methodName那么即跟cla属性结合获取关联外键
                    Method m = cls.getMethod(operationLog.methodName());
                    if (null != m) {
                        log.setExternalId(String.valueOf(m.invoke(arg)));
                    }

                    log.setReqJson(argString);
                    log.setEndTime(DateUtils.getNow());
                    log.setCreateTime(DateUtils.getNow());
                    log.setResJson(resString);
                    log.setIp(request.getRemoteAddr());
                    String uri = request.getRequestURI();
                    log.setUrl(request.getRequestURL().toString());
                    log.setFunctionName(uri);
                    log.setEndTime(new Date());
                    if(Integer.valueOf(String.valueOf(resMap.get("statusCodeValue"))) == 200) {
                        log.setStatus(1);
                    }else {
                        log.setStatus(0);
                    }
//					// 异步持久化操作日志
                    sysActionLogService.asyncSave(log);
                    break;
                }
            }
        } catch (Exception e)

        {
            logger.error(e.getMessage(), e);
        }
    }

}
