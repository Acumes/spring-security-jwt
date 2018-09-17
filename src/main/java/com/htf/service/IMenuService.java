package com.htf.service;

import com.htf.controller.vo.request.AddMenuRequest;
import com.htf.controller.vo.request.MenuTreeRequest;
import com.htf.controller.vo.response.MenuResponse;
import com.htf.controller.vo.response.MenuTreeResponse;

import java.util.List;

/**
 * @author acumes
 * @date 2018/8/13 13:51
 */
public interface IMenuService {
    List<MenuTreeResponse> getMenuTree(MenuTreeRequest request);

    MenuResponse getMenu(String id);

    void delMenu(String id);

    void updateMenu(AddMenuRequest request);

    String addMenu(AddMenuRequest request);

    Integer getCountChild(String id);
}
