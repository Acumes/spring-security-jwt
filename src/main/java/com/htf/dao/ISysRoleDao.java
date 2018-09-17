package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.controller.vo.request.RoleRequest;
import com.htf.controller.vo.response.RoleResponse;
import com.htf.po.SysRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISysRoleDao extends BaseMapper<SysRole, String> {
    List<RoleResponse> getRoles(@Param("role") RoleRequest request);

    List<String> getRoleMenuIds(@Param("id")String id);

    void authorization(@Param("roleId")String roleId, @Param("menuId")String menuId, @Param("checked")String check);

    void deleteRoleMenu(@Param("roleId")String roleId);

    List<SysRole> getRolesByUserId(@Param("userId")String userId);
}