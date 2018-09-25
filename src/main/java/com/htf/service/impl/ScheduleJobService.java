package com.htf.service.impl;

import com.fasterxml.jackson.databind.util.BeanUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.htf.common.exception.ServiceException;
import com.htf.common.utils.CommonUtils;
import com.htf.common.utils.NullUtil;
import com.htf.common.utils.ScheduleUtils;
import com.htf.controller.vo.request.ScheduleListRequest;
import com.htf.controller.vo.request.ScheduleRequest;
import com.htf.controller.vo.response.RoleResponse;
import com.htf.controller.vo.response.ScheduleListResult;
import com.htf.controller.vo.response.ScheduleResponse;
import com.htf.dao.IScheduleJobDao;
import com.htf.po.ScheduleJob;
import com.htf.service.IScheduleJobService;
import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author acumes
 * @date 2018/9/18 11:15
 */
@Service("scheduleJobService")
public class ScheduleJobService implements IScheduleJobService {

    @Autowired
    private Scheduler scheduler;

    @Autowired
    private IScheduleJobDao scheduleJobDao;

    /**
     * 项目启动时，初始化定时器
     */
    @PostConstruct
    public void init(){
        List<ScheduleJob> scheduleJobList = scheduleJobDao.selectAll();
        for(ScheduleJob scheduleJob : scheduleJobList){
            try {
                CronTrigger cronTrigger = null;
                cronTrigger = ScheduleUtils.getCronTrigger(scheduler, scheduleJob.getJobId());
                //如果不存在，则创建
                if(cronTrigger == null) {
                    ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
                }else {
                    ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
                }
            }catch (Exception e){
                e.printStackTrace();
            }

        }
    }

    @Override
    public void addSchedule(ScheduleRequest request) throws ServiceException {
        ScheduleJob scheduleJob = new ScheduleJob();
        BeanUtils.copyProperties(request,scheduleJob);
        scheduleJob.setStatus(0);
        scheduleJobDao.insert(scheduleJob);

        ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
    }

    @Override
    public void updateSchedule(ScheduleRequest request) {

    }

    @Override
    public ScheduleListResult getSchedules(ScheduleListRequest request) {
        ScheduleListResult result = new ScheduleListResult();
        Page<ScheduleResponse> page = null;
        if(request.isPage()){
            CommonUtils.pageRequest(request);
            page = PageHelper.startPage(request.getPageNo(),request.getPageSize());
        }
        List<ScheduleResponse> list = scheduleJobDao.getSchedules(request);
        if(NullUtil.hasItem(list)){
            result.setSchedules(list);
        }
        if(request.isPage()){
            result.setTotal(page.getTotal());
        }
        return result;
    }
}
