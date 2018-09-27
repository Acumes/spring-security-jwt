package com.htf.common.annotation.impl;

import com.alibaba.fastjson.JSON;
import com.htf.common.annotation.LogTrackingByString;
import com.htf.common.config.security.model.AuthUser;
import com.htf.common.utils.StringHelper;
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
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Map;

/**
 * @author acumes
 * @date 2018/9/27 14:24
 */
@Aspect // 开启AOP操作
@Component
@Order(2) // 设置切面的顺序
public class LogTrackingByStringAspect {
    private Logger logger = LoggerFactory.getLogger(LogTrackingByBeanAspect.class);

    @Autowired
    private ISysActionLogService sysActionLogService;

    @AfterReturning(returning = "ret", pointcut = "@annotation(com.htf.common.annotation.LogTrackingByString)")
    public void doAfterReturning(JoinPoint joinPoint, Object ret) {
        try {
            Date startTime = new Date();
            ResponseEntity responseEntity = (ResponseEntity) ret;
            //沒有執行成功 不插入日志
            if(!"success".equals(responseEntity.getBody())){
                return;
            }
            Signature signature = joinPoint.getSignature();
            Method method = ((MethodSignature) signature).getMethod();
            LogTrackingByString operationLog = method.getAnnotation(LogTrackingByString.class);
            if (!operationLog.enable()) {
                // 如果注解设置为false ,表示不启用日志记录 。跳出AOP日志操作。
                return;
            }
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();

            SysActionLog log = new SysActionLog();
            AuthUser authUser = (AuthUser) SecurityContextHolder.getContext()
                    .getAuthentication()
                    .getPrincipal();
            if(authUser != null){
                log.setCreateUser(authUser.getId());
            }
            log.setCreateTime(startTime);
            log.setEndTime(new Date());
            log.setFunctionName(joinPoint.getSignature().getName());
            log.setHttpMethod(request.getMethod());
            log.setIp(request.getRemoteAddr());
            log.setUrl(request.getRequestURL().toString());
            log.setReqJson(String.valueOf(joinPoint.getArgs()[operationLog.value()]));
            log.setExternalId(String.valueOf(joinPoint.getArgs()[operationLog.value()]));
            String resString = JSON.toJSONString(ret);
            log.setResJson(resString);
            Map resMap = JSON.parseObject(resString);
            if(Integer.valueOf(String.valueOf(resMap.get("statusCodeValue"))) == 200) {
                log.setStatus(1);
            }else {
                log.setStatus(0);
            }
            sysActionLogService.asyncSave(log);
        }catch (Exception e){

        }

    }
}
