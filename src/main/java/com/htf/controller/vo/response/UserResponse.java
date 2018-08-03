package com.htf.controller.vo.response;

import lombok.Data;

import java.util.Date;

/**
 * @author acumes
 * @date 2018/8/3 15:32
 */
@Data
public class UserResponse {
    private Integer id;
    private String loginName;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String mobile;
    private String enabled;
    private String remarks;
    private Date createDate;
    private Date updateDate;
    private String delFlag;
}
