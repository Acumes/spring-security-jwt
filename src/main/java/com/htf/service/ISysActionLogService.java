package com.htf.service;

import com.htf.po.SysActionLog;

/**
 * @author acumes
 * @date 2018/9/10 14:41
 */
public interface ISysActionLogService {
    public void asyncSave(SysActionLog log);
}
