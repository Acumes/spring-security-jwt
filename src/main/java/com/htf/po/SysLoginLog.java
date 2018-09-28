package com.htf.po;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * sys_login_log 
 */
@Data
public class SysLoginLog implements Serializable {
    /*  */
    private String id;
    /* 登录者id */
    private String loginId;
    /* 添加日期 */
    private Date createDate;
    /* 登录者ip */
    private String ip;
    /* ip所属地址 */
    private String address;
    /* 运营商 */
    private String carrier;
}