package com.htf.controller;

import com.htf.common.annotation.LogTrackingByBean;
import com.htf.common.annotation.LogTrackingByString;
import com.htf.common.annotation.PermissionTracking;
import com.htf.common.exception.ServiceException;
import com.htf.controller.vo.request.ScheduleListRequest;
import com.htf.controller.vo.request.ScheduleRequest;
import com.htf.controller.vo.response.ScheduleListResult;
import com.htf.service.IScheduleJobService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * 定时任务
 * @author acumes
 * @date 2018/9/18 11:14
 */
@RestController
@RequestMapping("/schedule")
public class ScheduleJobController extends BaseController{
    @Autowired
    private IScheduleJobService scheduleJobService;

    @PostMapping("/")
    @ApiOperation(value = "添加任务")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @LogTrackingByBean(methodName = "getJobId", value = ScheduleRequest.class)
    @PermissionTracking(methodName = "sys:task:add")
    public ResponseEntity<String> addSchedule(@RequestBody ScheduleRequest request) throws ServiceException {
        scheduleJobService.addSchedule(request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @PutMapping("/")
    @ApiOperation(value = "更新任务")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @LogTrackingByBean(methodName = "getJobId", value = ScheduleRequest.class)
    @PermissionTracking(methodName = "sys:task:edit")
    public ResponseEntity<String> updateSchedule(@RequestBody ScheduleRequest request) throws ServiceException {
        scheduleJobService.updateSchedule(request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }


    @PostMapping("/getSchedules")
    @ApiOperation(value = "获取任务列表")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @PermissionTracking(methodName = "sys:task:search")
    public ResponseEntity<ScheduleListResult> getSchedules(@RequestBody(required = false) ScheduleListRequest request){
        ScheduleListResult result = new ScheduleListResult();
        if(request == null){
            request = new ScheduleListRequest();
        }
        result = scheduleJobService.getSchedules(request);
        return new ResponseEntity<ScheduleListResult>(result, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除任务")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @LogTrackingByString(value = 0)
    @PermissionTracking(methodName = "sys:task:delete")
    public ResponseEntity<String> delSchedule(@PathVariable Long jobId){
        try {
            scheduleJobService.delSchedule(jobId);
        } catch (ServiceException e) {
            e.printStackTrace();
            return new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @PutMapping("/pause/{id}")
    @ApiOperation(value = "暂停任务")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @LogTrackingByString(value = 0)
    public ResponseEntity<String> pauseSchedule(@PathVariable Long jobId){
        try {
            scheduleJobService.pauseSchedule(jobId);
        } catch (ServiceException e) {
            e.printStackTrace();
            return new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @PutMapping("/resume/{id}")
    @ApiOperation(value = "恢复任务")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @LogTrackingByString(value = 0)
    public ResponseEntity<String> resumeSchedule(@PathVariable Long jobId){
        try {
            scheduleJobService.resumeSchedule(jobId);
        } catch (ServiceException e) {
            e.printStackTrace();
            return new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

}
