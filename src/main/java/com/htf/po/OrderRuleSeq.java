package com.htf.po;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
/**
 * order_rule_seq 
 */
@Data
public class OrderRuleSeq implements Serializable {
    /* 单据规则主键 */
    private Integer ruleSeqId;
    /* 单据规则编码 */
    private Integer orderRuleId;
    /* 单据规则标识-暂不启用 */
    private String ruleSeqName;
    /* 单据规则公司 */
    private String ruleOrderCompany;
    /* 单据规则客户-暂不启用 */
    private String ruleOrderCustomer;
    /* 单据规则时间-yyyyMMdd */
    private String ruleOrderDate;
    /* 当前数据编号 */
    private Integer ruleCurNo;
    /* 版本号（Optimistic Lock机制） */
    private Integer version;
    /* 更新时间 */
    private Date updateTime;
    /* 记录创建时间 */
    private Date createTime;
}