package com.htf.controller.vo.request;

import lombok.Data;

@Data
public class UpdateUserRequest {
    private String isEditPassword;
    private String loginName;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String mobile;
    private String remarks;
}
