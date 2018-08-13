package com.htf.po;

import java.util.*;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;
@Data
public class SysMenu {
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
    private String createUser;
    private Date updateDate;
    private String updateUser;
}