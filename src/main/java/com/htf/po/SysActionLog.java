package com.htf.po;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;
/**
 * sys_action_log 
 */
@Data
public class SysActionLog implements Serializable {
    /* 日志编号 */
    private Integer logId;
    /* 请求地址 */
    private String url;
    /* 创建用户 */
    private String createUser;
    /* ip地址 */
    private String ip;
    /* 接口名 */
    private String functionName;
    /* 请求时间 */
    private Date startTime;
    /* 响应时间 */
    private Date endTime;
    /* 响应内容 */
    private String resJson;
    /* 请求内容 */
    private String reqJson;
    /* 日志保存时间 */
    private Date createTime;
    /* 状态 ，1：成功，0：失败 */
    private Integer status;
    /* 操作类型 */
    private String logType;
    /* 关联ID */
    private String externalId;
    /* Http方法 */
    private String httpMethod;

}