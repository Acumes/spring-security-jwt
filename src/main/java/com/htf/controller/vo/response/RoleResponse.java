package com.htf.controller.vo.response;

import lombok.Data;

import java.util.Date;

/**
 * @author acumes
 * @date 2018/8/3 15:32
 */
@Data
public class RoleResponse {
    private String id;
    private String name;
    private String remarks;
    private String createUser;
    private Date createDate;
    private String enabled;
    private String updateUser;
    private Date updateDate;

}
