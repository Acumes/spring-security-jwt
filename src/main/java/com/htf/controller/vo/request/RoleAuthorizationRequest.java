package com.htf.controller.vo.request;

import lombok.Data;

import java.util.List;

/**
 * @author acumes
 * @date 2018/9/14 10:25
 */
@Data
public class RoleAuthorizationRequest {
    private String roleId;
    private List<String> checkIds;
    private List<String> noCheckIds;
}
