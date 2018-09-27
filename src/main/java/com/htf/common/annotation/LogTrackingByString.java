package com.htf.common.annotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
@Inherited
/**
 * 用于记录基础信息的操作日志，AOP注解 ，该注解只针对于单个对象的增加、修改、删除、日志记录，批量导入、等使用BatchOperationLog注解。
 * 该注解支持2种关联外键记录方案：
 *
 * 1.请求参数为对象类型，需要从对象中获取跟日志记录进行关联的外键
 *
 * 配置方式： index (参数索引，表示从那个参数获取主键) + cls(获取参数对应的对象类型，如果从对象类型获取必填) +
 * methodName(反射获取外键方法名称)
 *
 * 2.请求参数为基础类型，直接以参数作为跟日志记录进行关联的外键
 *
 * 配置方式： index(参数索引，表示从那个参数获取主键)
 *
 * @author acumes
 * @date 2018/9/10 10:03
 *
 */
public @interface LogTrackingByString {


    /**
     * 是否启用 ， 可以通过设置为false 禁用 日志记录
     * @return
     */
    boolean enable() default true;

    /**
     * AOP 函数对应的参数索引
     *
     * @return
     */
    int value();

}

