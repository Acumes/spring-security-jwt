package com.htf.order.rule.service.impl;

import com.htf.common.exception.ServiceException;
import com.htf.order.rule.core.DayCallback;
import com.htf.order.rule.core.DayFetchResult;
import com.htf.order.rule.core.Generator;

import java.util.Date;

/**
 * @author acumes
 * @date 2018/9/29 9:23
 */
public class DayGenerator implements Generator {
    private static final int DEFAULT_SIZE = 500;
    private DayCallback callback;
    private int size;
    private DayFetchResult day;
    private long currentIndex;
    private long endIndex;

    public DayGenerator(DayCallback callback) throws ServiceException {
        this(callback, DEFAULT_SIZE);
    }

    public DayGenerator(DayCallback callback, int size) throws ServiceException {
        this.callback = callback;
        this.size = size;

        synchronized (this) {
            fetch();
        }
    }


    private void fetch() throws ServiceException {
        day = this.callback.fetch(size);
        this.currentIndex = day.getStart();
        this.endIndex = this.currentIndex + day.getSize();
    }

    @Override
    public String next() throws ServiceException {
        Date now = new Date();
        String orderPrefix;
        Integer serialNumber;
        String companyFlag;
        String customerFlag;
        String dateFlag;
        String company;
        String customer;
        String charFormat;
        long sequence;
        synchronized (this) {
            if (now.before(this.day.getExpiry()) && ++this.currentIndex > endIndex) {
                fetch();
                ++this.currentIndex;
            }
            if (!now.before(this.day.getExpiry())) {
                fetch();
            }
            orderPrefix = this.day.getOrderPrefix();
            serialNumber = this.day.getSerialNumber();
            companyFlag = this.day.getCompanyFlag();
            customerFlag = this.day.getCustomerFlag();
            dateFlag = this.day.getDateFlag();
            company = this.day.getCompany();
            customer = this.day.getCustomer();
            charFormat = this.day.getCharFormat();
            sequence = this.currentIndex;
        }
        return callback.format(orderPrefix, serialNumber, companyFlag, customerFlag, dateFlag, company, customer, charFormat, sequence);
    }
}
