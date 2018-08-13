package com.htf.controller.vo.request;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author acumes
 * @date 2018/8/13 17:15
 */
@Data
public class AddMenuRequest {
    private String id;
    private String parentId;
    private String name;
    private BigDecimal sort;
    private String href;
    private String icon;
    private String isShow;
    private String permission;
    private String remarks;
}
