package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.po.SysMenu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISysMenuDao extends BaseMapper<SysMenu, String> {
    List<SysMenu> getParentMenu();

    List<SysMenu> getChilds(@Param("id") String id);
}