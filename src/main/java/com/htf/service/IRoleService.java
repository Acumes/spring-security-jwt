package com.htf.service;

import com.htf.controller.vo.request.AddRoleRequest;
import com.htf.controller.vo.request.RoleRequest;
import com.htf.controller.vo.request.UpdateRoleRequest;
import com.htf.controller.vo.response.RoleListResult;
import com.htf.controller.vo.response.RoleResponse;

/**
 * @author acumes
 * @date 2018/8/10 16:20
 */
public interface IRoleService {
    RoleListResult getRoles(RoleRequest request);

    void addRole(AddRoleRequest request);

    void updateRole(UpdateRoleRequest request);

    void delRole(String id);

    void batchDelRoles(String ids);

    RoleResponse getRole(String id);
}
