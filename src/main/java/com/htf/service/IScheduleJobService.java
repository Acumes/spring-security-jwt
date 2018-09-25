package com.htf.service;

import com.htf.common.exception.ServiceException;
import com.htf.controller.vo.request.ScheduleListRequest;
import com.htf.controller.vo.request.ScheduleRequest;
import com.htf.controller.vo.response.ScheduleListResult;

/**
 * @author acumes
 * @date 2018/9/18 11:15
 */
public interface IScheduleJobService {
    void addSchedule(ScheduleRequest request) throws ServiceException;

    void updateSchedule(ScheduleRequest request);

    ScheduleListResult getSchedules(ScheduleListRequest request);
}
