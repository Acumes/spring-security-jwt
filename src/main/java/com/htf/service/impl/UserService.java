package com.htf.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.htf.common.config.security.model.AuthUser;
import com.htf.common.utils.NullUtil;
import com.htf.common.utils.UuidGenerateUtil;
import com.htf.controller.vo.request.AddUserRequest;
import com.htf.controller.vo.request.CheckUserRequest;
import com.htf.controller.vo.request.UpdateUserRequest;
import com.htf.controller.vo.request.UserRequest;
import com.htf.controller.vo.response.UserListResult;
import com.htf.controller.vo.response.UserResponse;
import com.htf.dao.ISysRoleDao;
import com.htf.dao.ISysUserDao;
import com.htf.po.SysRole;
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
import java.util.stream.Collectors;

/**
 * @author acumes
 * @date 2018/8/3 15:34
 */
@Service
@Transactional
public class UserService implements IUserService {
    @Autowired
    private ISysUserDao sysUserDao;
    @Autowired
    private ISysRoleDao sysRoleDao;

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
            List<String> permissions = this.getPermissions(authUser.getId());
            userResponse.setPermissions(permissions);
        }
        return userResponse;
    }

    @Override
    public List<String> getPermissions(String id){
        return sysUserDao.getPermissions(id);
    }

    @Override
    public UserListResult getUsers(UserRequest request) {
        UserListResult result = new UserListResult();
        Page<SysUser> page = null;
        if(request.isPage()){
            page = PageHelper.startPage(request.getPageNo(),request.getPageSize());
        }
        List<SysUser> list = sysUserDao.getUsers(request);
        if(request.isPage()){
            result.setTotal(page.getTotal());
        }
        if(list != null && list.size() > 0){
            List<UserResponse> responses = new ArrayList<>();
            list.forEach(item -> {
                UserResponse response = new UserResponse();
                BeanUtils.copyProperties(item,response);
                List<SysRole> roles = sysRoleDao.getRolesByUserId(item.getId());
                List<String> roleId = new ArrayList<>();
                List<String> roleName = new ArrayList<>();
                if(NullUtil.hasItem(roles)){
                    roleId = roles.stream().map(SysRole::getId).collect(Collectors.toList());
                    roleName = roles.stream().map(SysRole::getName).collect(Collectors.toList());
                }
                response.setRoles(String.join(",", roleId));
                response.setRolesName(String.join(",", roleName));
                responses.add(response);
            });
            result.setUsers(responses);
        }
        return result;
    }

    @Override
    public void delUser(String id) {
        sysUserDao.deleteByPrimaryKey(id);
        sysUserDao.deleteRole(id);
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
        insertRole(request.getRole(),sysUser.getId());
    }

    @Override
    public Boolean checkUser(CheckUserRequest request) {
        Integer count = sysUserDao.checkUser(request);
        return count > 0 ? true : false;
    }

    private void insertRole(List<String> role,String userId){
        if(NullUtil.hasItem(role)){
            role.forEach(item -> {
                sysUserDao.insertRole(item,userId);
            });
        }
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
        sysUserDao.deleteRole(sysUser.getId());
        this.insertRole(request.getRole(),sysUser.getId());
    }
}
