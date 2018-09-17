package com.htf.controller.vo.response;

import com.htf.po.SysMenu;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author acumes
 * @date 2018/8/13 14:48
 */
@Data
public class MenuTreeResponse {
    private String id;
    private String name;
    private String icon;
    private String permission;
    private String isShow;
    private String remarks;
    private String parentId;
    private List<MenuTreeResponse> children = new ArrayList<>();
}
