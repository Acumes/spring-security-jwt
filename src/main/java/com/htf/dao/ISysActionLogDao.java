package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.po.SysActionLog;
import org.springframework.stereotype.Repository;
@Repository
public interface ISysActionLogDao extends BaseMapper<SysActionLog, Integer> {
}