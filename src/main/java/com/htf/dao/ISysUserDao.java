package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
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
}
