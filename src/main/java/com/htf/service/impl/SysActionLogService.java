package com.htf.service.impl;

import com.htf.dao.ISysActionLogDao;
import com.htf.po.SysActionLog;
import com.htf.service.ISysActionLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;


/**
* @author acumes
* @创建时间：2018年3月27日 上午9:18:48
*/
@Service
public class SysActionLogService implements ISysActionLogService {
	
	@Autowired
	private ISysActionLogDao sysActionLogDao;

	@Override
	@Async
	public void asyncSave(SysActionLog log) {
		sysActionLogDao.insert(log);
	}

}
