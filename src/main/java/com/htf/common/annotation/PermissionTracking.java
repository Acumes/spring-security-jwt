package com.htf.common.annotation;

import java.lang.annotation.*;

/**
 * @author acumes
 * @date 2018/9/21 9:04
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
@Inherited
public @interface PermissionTracking {
    String methodName();
}
