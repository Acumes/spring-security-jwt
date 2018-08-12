package com.htf.controller.vo.response;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class RoleListResult {
    private long total = 0;
    private List<RoleResponse> roles = new ArrayList<>();
}
