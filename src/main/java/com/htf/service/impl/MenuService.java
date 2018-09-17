package com.htf.service.impl;

import com.htf.common.utils.CommonUtils;
import com.htf.common.utils.NullUtil;
import com.htf.common.utils.UuidGenerateUtil;
import com.htf.controller.vo.request.AddMenuRequest;
import com.htf.controller.vo.request.MenuTreeRequest;
import com.htf.controller.vo.response.MenuResponse;
import com.htf.controller.vo.response.MenuTreeResponse;
import com.htf.dao.ISysMenuDao;
import com.htf.po.SysMenu;
import com.htf.service.IMenuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
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
    public List<MenuTreeResponse> getMenuTree(MenuTreeRequest request) {
        List<MenuTreeResponse> result = new ArrayList<>();
        List<SysMenu> list = sysMenuDao.getChilds("",request);
        if(NullUtil.hasItem(list)){
            list.forEach(item -> {
                MenuTreeResponse response = new MenuTreeResponse();
                BeanUtils.copyProperties(item, response);
                this.getChild(response,request);
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
        this.delMenuChild(Arrays.asList(id));
    }

    private void delMenuChild(List<String> list) {
        for(int i = 0; i < list.size(); i++){
            String id = list.get(i);
            Integer countChild = this.getCountChild(id);
            if(countChild > 0){
                List<String> ids = sysMenuDao.getChildIds(id);
                this.delMenuChild(ids);
            }
            sysMenuDao.deleteByPrimaryKey(id);
            sysMenuDao.deleteRoleMenu(id);
        }
    }


    @Override
    public void updateMenu(AddMenuRequest request) {
        SysMenu sysMenu = new SysMenu();
        this.setIsShow(request);
        BeanUtils.copyProperties(request,sysMenu);
        sysMenu.setUpdateDate(new Date());
        sysMenu.setUpdateUser(CommonUtils.getCurrentUser().getId());
        sysMenuDao.updateByPrimaryKeySelective(sysMenu);
    }

    @Override
    public String addMenu(AddMenuRequest request) {
        SysMenu sysMenu = new SysMenu();
        this.setIsShow(request);
        BeanUtils.copyProperties(request,sysMenu);
        sysMenu.setId(UuidGenerateUtil.generateUuid());
        sysMenu.setCreateDate(new Date());
        sysMenu.setCreateUser(CommonUtils.getCurrentUser().getId());
        Integer sort = sysMenuDao.getSort(request.getParentId());
        sysMenu.setSort(new BigDecimal(sort == null ? 1 : sort + 1));
        sysMenuDao.insert(sysMenu);
        return sysMenu.getId();
    }

    @Override
    public Integer getCountChild(String id) {
        return sysMenuDao.getCountChild(id);
    }

    private void setIsShow(AddMenuRequest request) {
        if("true".equalsIgnoreCase(request.getIsShow())){
            request.setIsShow("1");
        }else{
            request.setIsShow("0");
        }
    }

    private void getChild(MenuTreeResponse response, MenuTreeRequest request) {
        List<SysMenu> list = sysMenuDao.getChilds(response.getId(),request);
        if(NullUtil.hasItem(list)){
            List<MenuTreeResponse> responses = new ArrayList<>();
            list.forEach(item -> {
                MenuTreeResponse menuTreeResponse = new MenuTreeResponse();
                BeanUtils.copyProperties(item, menuTreeResponse);
                responses.add(menuTreeResponse);
            });
            response.setChildren(responses);
            response.getChildren().forEach(item -> {
                getChild(item, request);
            });
        }
    }
}
