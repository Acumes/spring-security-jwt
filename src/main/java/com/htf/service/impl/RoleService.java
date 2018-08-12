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
        Page<SysRole> page = PageHelper.startPage(request.getPageNo(),request.getPageSize());
        List<SysRole> list = sysRoleDao.getRoles(request);
        if(NullUtil.hasItem(list)){
            List<RoleResponse> roleResponses = new ArrayList<>();
            list.forEach(item -> {
                RoleResponse response = new RoleResponse();
                BeanUtils.copyProperties(item,response);
                roleResponses.add(response);
            });
            result.setRoles(roleResponses);
        }
        result.setTotal(page.getTotal());
        return result;
    }

    @Override
    public void addRole(AddRoleRequest request) {
        SysRole sysRole = new SysRole();
        BeanUtils.copyProperties(request,sysRole);
        sysRole.setId(UuidGenerateUtil.generateUuid());
        sysRole.setCreateTime(new Date());
        sysRole.setEnabled("1");
        sysRole.setCreateUser(CommonUtils.getCurrentUser().getId());
        sysRoleDao.insertSelective(sysRole);
    }

    @Override
    public void updateRole(UpdateRoleRequest request) {
        SysRole sysRole = new SysRole();
        BeanUtils.copyProperties(request,sysRole);
        sysRole.setUpdateTime(new Date());
        sysRole.setUpdateUser(CommonUtils.getCurrentUser().getId());
        sysRoleDao.updateByPrimaryKeySelective(sysRole);
    }

}
