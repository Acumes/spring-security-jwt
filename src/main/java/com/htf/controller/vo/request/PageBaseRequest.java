package com.htf.controller.vo.request;

import lombok.Data;

/**
 * @author acumes
 * @date 2018/8/10 16:28
 */
@Data
public class PageBaseRequest {
    private Integer pageSize;
    private Integer pageNo;
    private boolean page = true;
}
