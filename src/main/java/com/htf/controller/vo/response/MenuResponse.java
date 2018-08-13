package com.htf.controller.vo.response;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author acumes
 * @date 2018/8/13 16:13
 */
@Data
public class MenuResponse {

    private String id;
    private String parentId;
    private String name;
    private BigDecimal sort;
    private String href;
    private String icon;
    private String isShow;
    private String permission;
    private String remarks;
    private Date createDate;
    private Date updateDate;
    private String createUser;
    private String updateUser;
}
