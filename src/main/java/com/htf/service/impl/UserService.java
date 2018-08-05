package com.htf.service.impl;

import com.htf.common.config.security.model.AuthUser;
import com.htf.controller.vo.response.UserResponse;
import com.htf.dao.ISysUserDao;
import com.htf.po.SysUser;
import com.htf.service.IUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
