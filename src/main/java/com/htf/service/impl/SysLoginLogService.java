package com.htf.service.impl;

import com.htf.common.config.security.model.AuthUser;
import com.htf.common.utils.UuidGenerateUtil;
import com.htf.controller.vo.response.IpResponse;
import com.htf.dao.ISysLoginLogDao;
import com.htf.po.SysLoginLog;
import com.htf.service.ISysLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author acumes
 * @date 2018/9/28 10:58
 */
@Service
public class SysLoginLogService implements ISysLoginLogService {
    @Autowired
    private ISysLoginLogDao sysLoginLogDao;
    @Override
    public void insert(IpResponse ip) {
        SysLoginLog sysLoginLog = new SysLoginLog();
        sysLoginLog.setId(UuidGenerateUtil.generateUuid());
        if(ip.getData() != null){
            sysLoginLog.setIp(ip.getData().getIp());
            sysLoginLog.setAddress(ip.getData().getCountry() + "/" + ip.getData().getRegion() + "/" + ip.getData().getCity());
            sysLoginLog.setCarrier(ip.getData().getIsp());
        }
        AuthUser authUser = (AuthUser) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        if(authUser != null){
            sysLoginLog.setLoginId(authUser.getId());
        }
        sysLoginLog.setCreateDate(new Date());
        sysLoginLogDao.insert(sysLoginLog);

    }
}
