package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.controller.vo.request.CheckUserRequest;
import com.htf.controller.vo.request.UserRequest;
import com.htf.po.SysUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author acumes
 * @date 2018/8/1 16:16
 */
@Repository
public interface ISysUserDao extends BaseMapper<SysUser, String> {
    List<SysUser> searchUsers();

    SysUser getUserByUsername(@Param("loginName") String loginName);

    List<SysUser> getUsers(@Param("user") UserRequest request);

    Integer checkUser(@Param("user") CheckUserRequest request);

    List<String> getPermissions(@Param("id")String id);

    void insertRole(@Param("roleId")String roleId, @Param("userId")String userId);

    void deleteRole(@Param("userId")String id);
}
