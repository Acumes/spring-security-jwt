package com.htf.controller.vo.request;

import lombok.Data;

@Data
public class UserRequest {
    private String loginName;
    private String mobile;
    private String enable;
    private Integer pageSize;
    private Integer pageNo;
}
