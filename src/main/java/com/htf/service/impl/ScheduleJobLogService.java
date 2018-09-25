package com.htf.service.impl;

import com.htf.dao.IScheduleJobLogDao;
import com.htf.po.ScheduleJobLog;
import com.htf.service.IScheduleJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author acumes
 * @date 2018/9/18 11:33
 */
@Service
public class ScheduleJobLogService implements IScheduleJobLogService {
    @Autowired
    private IScheduleJobLogDao scheduleJobLogDao;
    @Override
    public void insert(ScheduleJobLog log) {
        scheduleJobLogDao.insert(log);
    }
}
