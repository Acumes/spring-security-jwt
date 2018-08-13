package com.htf.service;

import com.htf.controller.vo.request.AddMenuRequest;
import com.htf.controller.vo.response.MenuResponse;
import com.htf.controller.vo.response.MenuTreeResponse;

import java.util.List;

/**
 * @author acumes
 * @date 2018/8/13 13:51
 */
public interface IMenuService {
    List<MenuTreeResponse> getMenuTree();

    MenuResponse getMenu(String id);

    void delMenu(String id);

    void updateMenu(AddMenuRequest request);

    void addMenu(AddMenuRequest request);
}
