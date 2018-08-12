package com.htf.controller.vo.request;

import lombok.Data;

@Data
public class UserRequest  extends PageBaseRequest {
    private String loginName;
    private String mobile;
    private String enable;
}
