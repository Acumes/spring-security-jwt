package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.controller.vo.request.MenuTreeRequest;
import com.htf.po.SysMenu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISysMenuDao extends BaseMapper<SysMenu, String> {
    List<SysMenu> getParentMenu();

    List<SysMenu> getChilds(@Param("id") String id, @Param("menu")MenuTreeRequest request);

    Integer getSort(@Param("parentId")String parentId);

    Integer getCountChild(@Param("parentId")String id);

    List<String> getChildIds(@Param("parentId")String id);

    void deleteRoleMenu(@Param("id")String id);
}