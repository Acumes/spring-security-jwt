package com.htf.po;

import lombok.Data;

import java.util.Date;

/**
 * @author acumes
 * @date 2018/9/10 10:05
 */
@Data
public class SysActionLog {
    private Integer logId;
    private String url;
    private String customerId;
    private String ip;
    private String functionName;
    private Date startTime;
    private Date endTime;
    private String resJson;
    private String reqJson;
    private Date createTime;
    private String companyId;
    private Integer status;
}
