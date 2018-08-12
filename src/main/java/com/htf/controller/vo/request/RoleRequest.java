package com.htf.controller.vo.request;

import lombok.Data;

@Data
public class RoleRequest extends PageBaseRequest{
    private String name;
    private String enable;

}
