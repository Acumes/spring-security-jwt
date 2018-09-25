package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.po.ScheduleJobLog;
import org.springframework.stereotype.Repository;
@Repository
public interface IScheduleJobLogDao extends BaseMapper<ScheduleJobLog, Long> {
}