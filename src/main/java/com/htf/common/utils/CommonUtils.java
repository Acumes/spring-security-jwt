package com.htf.common.utils;

import com.htf.common.config.security.model.AuthUser;
import com.htf.controller.vo.request.PageBaseRequest;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author acumes
 * @date 2018/8/10 16:27
 */
public class CommonUtils {

    public static void pageRequest(Object o){
        PageBaseRequest pageBaseRequest = (PageBaseRequest) o;
        if(pageBaseRequest.getPageNo() == null || pageBaseRequest.getPageNo() == 0){
            pageBaseRequest.setPageNo(1);
        }
        if(pageBaseRequest.getPageSize() == null || pageBaseRequest.getPageSize() == 0){
            pageBaseRequest.setPageSize(10);
        }
        if(pageBaseRequest.getPageSize() > 100){
            pageBaseRequest.setPageSize(50);
        }
    }

    public static AuthUser getCurrentUser(){
        AuthUser authUser = (AuthUser) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        return authUser;
    }

}
