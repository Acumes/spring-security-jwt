package com.htf.controller.vo.response;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author acumes
 * @date 2018/9/19 17:33
 */
@Data
public class ScheduleListResult {
    private long total = 0;
    private List<ScheduleResponse> schedules = new ArrayList<>();
}
