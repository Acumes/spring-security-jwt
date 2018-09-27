package com.htf.service;

import com.htf.controller.vo.request.AddUserRequest;
import com.htf.controller.vo.request.CheckUserRequest;
import com.htf.controller.vo.request.UpdateUserRequest;
import com.htf.controller.vo.request.UserRequest;
import com.htf.controller.vo.response.UserListResult;
import com.htf.controller.vo.response.UserResponse;
import com.htf.po.SysUser;

import java.util.List;

/**
 * @author acumes
 * @date 2018/8/3 15:34
 */
public interface IUserService {
    UserResponse getUser(String id);

    SysUser getUserByUsername(String loginName);

    UserResponse getCurrentUser();

    UserListResult getUsers(UserRequest request);

    void delUser(String id);

    void batchDelUser(String ids);

    void addUser(AddUserRequest request);

    Boolean checkUser(CheckUserRequest request);

    void updateUser(UpdateUserRequest request);

    List<String> getPermissions(String id);
}
