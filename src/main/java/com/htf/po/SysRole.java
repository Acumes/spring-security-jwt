package com.htf.po;

import java.util.*;
import java.util.Date;
import lombok.Data;
@Data
public class SysRole {
    private String id;
    private String name;
    private String remarks;
    private String createUser;
    private Date createTime;
    private String enabled;
    private String updateUser;
    private Date updateTime;
}