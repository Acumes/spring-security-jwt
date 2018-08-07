package com.htf.controller.vo.request;

import lombok.Data;

@Data
public class CheckUserRequest {
    private String loginName;
    private boolean edit;
    private String userId;
}
