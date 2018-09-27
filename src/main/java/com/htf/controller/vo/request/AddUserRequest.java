package com.htf.controller.vo.request;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class AddUserRequest {
    private String id;
    private String loginName;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String mobile;
    private String remarks;
    private List<String> role;
}
