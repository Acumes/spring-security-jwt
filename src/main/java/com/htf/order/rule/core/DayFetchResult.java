package com.htf.order.rule.core;

import lombok.Data;

import java.util.Date;

/**
 * @author acumes
 * @date 2018/9/29 9:26
 */
@Data
public class DayFetchResult {
    private long start;
    private int size;
    private String date;
    private String orderPrefix;
    private Integer serialNumber;
    private String companyFlag;
    private String customerFlag;
    private String dateFlag;
    private String charFormat;
    private String company;
    private String customer;
    private Date expiry;

    public DayFetchResult(int start, int size, String date, String orderPrefix, Integer serialNumber, String companyFlag, String
            customerFlag, String dateFlag, String charFormat, String company, String customer, Date expiry) {
        this.start = start;
        this.size = size;
        this.date = date;
        this.orderPrefix = orderPrefix;
        this.serialNumber = serialNumber;
        this.companyFlag = companyFlag;
        this.customerFlag = customerFlag;
        this.dateFlag = dateFlag;
        this.charFormat = charFormat;
        this.company = company;
        this.customer = customer;
        this.expiry = expiry;
    }
}
