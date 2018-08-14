package com.htf.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.htf.common.utils.CommonUtils;
import com.htf.common.utils.NullUtil;
import com.htf.common.utils.UuidGenerateUtil;
import com.htf.controller.vo.request.AddRoleRequest;
import com.htf.controller.vo.request.RoleRequest;
import com.htf.controller.vo.request.UpdateRoleRequest;
import com.htf.controller.vo.response.RoleListResult;
import com.htf.controller.vo.response.RoleResponse;
import com.htf.dao.ISysRoleDao;
import com.htf.po.SysRole;
import com.htf.service.IRoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author acumes
 * @date 2018/8/10 16:20
 */
@Service
@Transactional
public class RoleService implements IRoleService {

    @Autowired
    private ISysRoleDao sysRoleDao;

    @Override
    public RoleListResult getRoles(RoleRequest request) {
        RoleListResult result = new RoleListResult();
        CommonUtils.pageRequest(request);
        Page<RoleResponse> page = PageHelper.startPage(request.getPageNo(),request.getPageSize());
        List<RoleResponse> list = sysRoleDao.getRoles(request);
        if(NullUtil.hasItem(list)){
            result.setRoles(list);
        }
        result.setTotal(page.getTotal());
        return result;
    }

    @Override
    public void addRole(AddRoleRequest request) {
        SysRole sysRole = new SysRole();
        BeanUtils.copyProperties(request,sysRole);
        sysRole.setId(UuidGenerateUtil.generateUuid());
        sysRole.setCreateDate(new Date());
        sysRole.setEnabled("1");
        sysRole.setCreateUser(CommonUtils.getCurrentUser().getId());
        sysRoleDao.insertSelective(sysRole);
    }

    @Override
    public void updateRole(UpdateRoleRequest request) {
        SysRole sysRole = new SysRole();
        BeanUtils.copyProperties(request,sysRole);
        sysRole.setUpdateDate(new Date());
        sysRole.setUpdateUser(CommonUtils.getCurrentUser().getId());
        sysRoleDao.updateByPrimaryKeySelective(sysRole);
    }

    @Override
    public void delRole(String id) {
        sysRoleDao.deleteByPrimaryKey(id);
    }

    @Override
    public void batchDelRoles(String ids) {
        String [] ids_ = ids.split(",");
        for(String id : ids_){
            this.delRole(id);
        }
    }

    @Override
    public RoleResponse getRole(String id) {
        SysRole sysRole = sysRoleDao.selectByPrimaryKey(id);
        if(sysRole == null){

        }
        RoleResponse result = new RoleResponse();
        BeanUtils.copyProperties(sysRole,result);
        return result;
    }

}
