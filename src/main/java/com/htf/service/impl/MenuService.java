package com.htf.service.impl;

import com.htf.common.utils.CommonUtils;
import com.htf.common.utils.NullUtil;
import com.htf.common.utils.UuidGenerateUtil;
import com.htf.controller.vo.request.AddMenuRequest;
import com.htf.controller.vo.response.MenuResponse;
import com.htf.controller.vo.response.MenuTreeResponse;
import com.htf.dao.ISysMenuDao;
import com.htf.po.SysMenu;
import com.htf.service.IMenuService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author acumes
 * @date 2018/8/13 13:51
 */
@Service
public class MenuService implements IMenuService {

    @Autowired
    private ISysMenuDao sysMenuDao;

    @Override
    public List<MenuTreeResponse> getMenuTree() {
        List<MenuTreeResponse> result = new ArrayList<>();
        List<SysMenu> list = sysMenuDao.getChilds("");
        if(NullUtil.hasItem(list)){
            list.forEach(item -> {
                MenuTreeResponse response = new MenuTreeResponse();
                BeanUtils.copyProperties(item, response);
                this.getChild(response);
                result.add(response);
            });
        }
        return result;
    }

    @Override
    public MenuResponse getMenu(String id) {
        SysMenu sysMenu = sysMenuDao.selectByPrimaryKey(id);
        if(sysMenu == null){

        }
        MenuResponse result = new MenuResponse();
        BeanUtils.copyProperties(sysMenu,result);
        return result;
    }

    @Override
    public void delMenu(String id) {
        sysMenuDao.deleteByPrimaryKey(id);
    }

    @Override
    public void updateMenu(AddMenuRequest request) {
        SysMenu sysMenu = new SysMenu();
        BeanUtils.copyProperties(request,sysMenu);
        sysMenu.setUpdateDate(new Date());
        sysMenu.setUpdateUser(CommonUtils.getCurrentUser().getId());
        sysMenuDao.updateByPrimaryKeySelective(sysMenu);
    }

    @Override
    public void addMenu(AddMenuRequest request) {
        SysMenu sysMenu = new SysMenu();
        BeanUtils.copyProperties(request,sysMenu);
        sysMenu.setId(UuidGenerateUtil.generateUuid());
        sysMenu.setCreateDate(new Date());
        sysMenu.setCreateUser(CommonUtils.getCurrentUser().getId());
        sysMenuDao.insert(sysMenu);
    }

    private void getChild(MenuTreeResponse response) {
        List<SysMenu> list = sysMenuDao.getChilds(response.getId());
        if(NullUtil.hasItem(list)){
            List<MenuTreeResponse> responses = new ArrayList<>();
            list.forEach(item -> {
                MenuTreeResponse menuTreeResponse = new MenuTreeResponse();
                BeanUtils.copyProperties(item, menuTreeResponse);
                responses.add(menuTreeResponse);
            });
            response.setChildren(responses);
            response.getChildren().forEach(item -> {
                getChild(item);
            });
        }
    }
}
