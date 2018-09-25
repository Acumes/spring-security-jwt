package com.htf.common.annotation.impl;

import com.htf.common.annotation.PermissionTracking;
import com.htf.common.config.security.model.AuthUser;
import com.htf.common.exception.PermissionException;
import com.htf.common.exception.ServiceException;
import com.htf.common.utils.NullUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;

/**
 * @author acumes
 * @date 2018/9/21 9:05
 */
@Aspect // 开启AOP操作
@Component
@Order(2) // 设置切面的顺序
public class PermissionTrackingAspect {

    private Logger logger = LoggerFactory.getLogger(PermissionTrackingAspect.class);


    @Pointcut("@annotation(com.htf.common.annotation.PermissionTracking)")
    public void permissionAspect(){}

    @Before("permissionAspect()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        // 记录下请求内容
        logger.info("URL : " + request.getRequestURL().toString());
        logger.info("HTTP_METHOD : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
        logger.info("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        logger.info("ARGS : " + Arrays.toString(joinPoint.getArgs()));

        Signature signature = joinPoint.getSignature();
        Method method = ((MethodSignature) signature).getMethod();
        PermissionTracking operationLog = method.getAnnotation(PermissionTracking.class);
        System.out.println(operationLog.methodName());
        AuthUser authUser = (AuthUser) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        if(authUser!=null){
            System.out.println(authUser.getPermissions());
            List<String> permissions = authUser.getPermissions();
            System.out.println(permissions.contains(operationLog.methodName()));
            if(permissions == null || (NullUtil.hasItem(permissions) && !permissions.contains(operationLog.methodName()))){
                throw new PermissionException("你没有权限访问");
            }
        }else{
            throw new PermissionException("请登录");
        }



    }

}
