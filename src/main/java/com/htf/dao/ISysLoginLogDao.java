package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.po.SysLoginLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISysLoginLogDao extends BaseMapper<SysLoginLog, String> {
    List<String> getUserLoginLog(@Param("id") String id);
}