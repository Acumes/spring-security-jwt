package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.controller.vo.request.ScheduleListRequest;
import com.htf.controller.vo.response.ScheduleResponse;
import com.htf.po.ScheduleJob;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IScheduleJobDao extends BaseMapper<ScheduleJob, Long> {
    List<ScheduleResponse> getSchedules(ScheduleListRequest request);

    void updateStatus(@Param("jobId") Long jobId, @Param("status")Integer status);
}