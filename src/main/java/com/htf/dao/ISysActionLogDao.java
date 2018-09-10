package com.htf.dao;

import com.htf.common.config.mapper.BaseMapper;
import com.htf.po.SysActionLog;
import org.springframework.stereotype.Repository;


/**
* @author huangtf
* @创建时间：2018年3月29日 上午11:04:12
*/
@Repository()
public interface ISysActionLogDao extends BaseMapper<SysActionLog, String> {
}
