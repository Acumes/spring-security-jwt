package com.htf.controller.vo.response;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class UserListResult {
    private long total = 0;
    private List<UserResponse> users = new ArrayList<>();
}
