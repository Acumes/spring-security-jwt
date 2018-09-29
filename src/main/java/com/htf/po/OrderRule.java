package com.htf.po;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
/**
 * order_rule 
 */
@Data
public class OrderRule implements Serializable {
    /* 单据规则编码 */
    private Integer orderRuleId;
    /* 业务类型 数据字典（oms-销售，wms-仓储...） */
    private String bizType;
    /* 单据类型编码 */
    private String orderType;
    /* 前缀编码 */
    private String orderPrefix;
    /* 流水号位数 */
    private Integer serialNumber;
    /* 引用公司编码表(Y-是 N-否) */
    private String companyFlag;
    /* 引用客户编码标记(Y-是 N-否) */
    private String customerFlag;
    /* 引用日期标记（Y-是，N-否） */
    private String dateFlag;
    /* 日期格式 */
    private String charFormat;
    /* 创建时间 */
    private Date createTime;
    /* 创建用户 */
    private String createUser;
    /* 公司编码 */
    private String companyId;
    /* 状态 */
    private String status;
}