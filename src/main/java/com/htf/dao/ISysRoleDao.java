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
}