package com.htf.controller.vo.request;

import lombok.Data;

import java.util.Date;

@Data
public class AddUserRequest {
    private String loginName;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String mobile;
    private String remarks;
}
