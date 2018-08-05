package com.htf.service;

import com.htf.controller.vo.response.UserResponse;
import com.htf.po.SysUser;

/**
 * @author acumes
 * @date 2018/8/3 15:34
 */
public interface IUserService {
    UserResponse getUser(String id);

    SysUser getUserByUsername(String loginName);

    UserResponse getCurrentUser();
}
