package com.htf.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.htf.common.config.security.model.AuthUser;
import com.htf.common.utils.UuidGenerateUtil;
import com.htf.controller.vo.request.AddUserRequest;
import com.htf.controller.vo.request.CheckUserRequest;
import com.htf.controller.vo.request.UpdateUserRequest;
import com.htf.controller.vo.request.UserRequest;
import com.htf.controller.vo.response.UserListResult;
import com.htf.controller.vo.response.UserResponse;
import com.htf.dao.ISysUserDao;
import com.htf.po.SysUser;
import com.htf.service.IUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author acumes
 * @date 2018/8/3 15:34
 */
@Service
@Transactional
public class UserService implements IUserService {
    @Autowired
    private ISysUserDao sysUserDao;

    @Override
    public UserResponse getUser(String id) {
        UserResponse response = new UserResponse();
        SysUser sysUser = sysUserDao.selectByPrimaryKey(id);
        BeanUtils.copyProperties(sysUser,response);
        return response;
    }

    @Override
    public SysUser getUserByUsername(String loginName) {
        SysUser sysUser = sysUserDao.getUserByUsername(loginName);
        return sysUser;
    }

    @Override
    public UserResponse getCurrentUser() {
//        final UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        UserResponse userResponse = new UserResponse();
        AuthUser authUser = (AuthUser) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        System.out.println("===");
        if(authUser != null){
            BeanUtils.copyProperties(authUser,userResponse);
            userResponse.setLoginName(authUser.getUsername());

        }
        return userResponse;
    }

    @Override
    public UserListResult getUsers(UserRequest request) {
        UserListResult result = new UserListResult();
        Page<SysUser> page = PageHelper.startPage(request.getPageNo(),request.getPageSize());
        List<SysUser> list = sysUserDao.getUsers(request);
        result.setTotal(page.getTotal());
        if(list != null && list.size() > 0){
            List<UserResponse> responses = new ArrayList<>();
            list.forEach(item -> {
                UserResponse response = new UserResponse();
                BeanUtils.copyProperties(item,response);
                responses.add(response);
            });
            result.setUsers(responses);
        }
        return result;
    }

    @Override
    public void delUser(String id) {
        sysUserDao.deleteByPrimaryKey(id);
    }

    @Override
    public void batchDelUser(String ids) {
        String [] ids_ = ids.split(",");
        for(String id : ids_){
            sysUserDao.deleteByPrimaryKey(id);
        }
    }

    @Override
    public void addUser(AddUserRequest request) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(request,sysUser);
        sysUser.setPassword(new BCryptPasswordEncoder().encode(request.getPassword()));
        sysUser.setId(UuidGenerateUtil.generateUuid());
        sysUser.setCreateDate(new Date());
        sysUserDao.insertSelective(sysUser);
    }

    @Override
    public Boolean checkUser(CheckUserRequest request) {
        Integer count = sysUserDao.checkUser(request);
        return count > 0 ? true : false;
    }

    @Override
    public void updateUser(String id, UpdateUserRequest request) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(request,sysUser);
        sysUser.setId(id);
        System.out.println(request.getIsEditPassword());
        sysUser.setPassword("true".equals(request.getIsEditPassword() ) ? new BCryptPasswordEncoder().encode(request.getPassword()) : null);
        sysUser.setUpdateDate(new Date());
        sysUserDao.updateByPrimaryKeySelective(sysUser);
    }
}
