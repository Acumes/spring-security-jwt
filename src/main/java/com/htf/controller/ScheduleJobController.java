package com.htf.controller;

import com.htf.common.annotation.LogTrackingByBean;
import com.htf.common.exception.ServiceException;
import com.htf.controller.vo.request.ScheduleListRequest;
import com.htf.controller.vo.request.ScheduleRequest;
import com.htf.controller.vo.response.ScheduleListResult;
import com.htf.controller.vo.response.UserListResult;
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
    public ResponseEntity<ScheduleListResult> getSchedules(@RequestBody(required = false) ScheduleListRequest request){
        ScheduleListResult result = new ScheduleListResult();
        if(request == null){
            request = new ScheduleListRequest();
        }
        result = scheduleJobService.getSchedules(request);
        return new ResponseEntity<ScheduleListResult>(result, HttpStatus.OK);
    }
}
