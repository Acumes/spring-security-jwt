package com.htf.order.rule.service.impl;

import com.htf.common.exception.ServiceException;
import com.htf.common.utils.CommonUtils;
import com.htf.common.utils.DateUtils;
import com.htf.dao.IOrderRuleDao;
import com.htf.dao.IOrderRuleSeqDao;
import com.htf.order.rule.core.DayCallback;
import com.htf.order.rule.core.DayFetchResult;
import com.htf.order.rule.core.Generator;
import com.htf.order.rule.service.IOrderNoService;
import com.htf.po.OrderRule;
import com.htf.po.OrderRuleSeq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.CollationElementIterator;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author acumes
 * @date 2018/9/28 17:54
 */
@Service
public class OrderNoService implements IOrderNoService{
    @Autowired
    private IOrderRuleDao orderRuleDao;
    @Autowired
    private IOrderRuleSeqDao orderRuleSeqDao;

    private static final String FLAG_Y = "Y";
    private Map<Key, Generator> generators = new ConcurrentHashMap<>();
    private Lock lock = new ReentrantLock();


    @Override
    public String createBizOrderNo(String orderType, String company) throws ServiceException {
        return getGenerator(orderType, company).next();
    }

    private Generator getGenerator(String orderType, String company) throws ServiceException {
        Key key = new Key(orderType, company);
        if (!generators.containsKey(key)) {
            try {
                lock.lock();
                if (!generators.containsKey(key)) {
                    generators.put(key, buildGenerator(orderType, company));
                }
            } catch (ServiceException e) {
                throw e;
            } finally {
                lock.unlock();
            }
        }
         return generators.get(key);
    }

    private Generator buildGenerator(String orderType, String company) throws ServiceException {
        return new DayGenerator(new DayCallback() {
            @Override
            public DayFetchResult fetch(int size) throws ServiceException {
                String nowDate = DateUtils.getFormatYmdString();

                // 查询规则列表
                OrderRule ruleVo = orderRuleDao.queryOrderRuleByOrderTypeId(orderType);
                if (null != ruleVo) {
                    OrderRuleSeq sequence = orderRuleSeqDao.queryOrderRuleSeqInfo(ruleVo.getOrderRuleId(), company);
                    if (sequence == null) {
                        sequence = new OrderRuleSeq();
                        sequence.setOrderRuleId(ruleVo.getOrderRuleId());
                        sequence.setRuleOrderCompany(company);
                        sequence.setRuleOrderDate(nowDate);
                        sequence.setVersion(1);
                        sequence.setRuleCurNo(size);
                        sequence.setCreateTime(new Date());
                        orderRuleSeqDao.insertOrderRuleSeqInfo(sequence);
                    } else {
                        if (nowDate.equals(sequence.getRuleOrderDate())) {
                            sequence.setRuleCurNo(sequence.getRuleCurNo() + size);
                        } else {
                            sequence.setRuleOrderDate(nowDate);
                            sequence.setRuleCurNo(size);
                        }
                        sequence.setVersion(sequence.getVersion() + 1);
                        orderRuleSeqDao.updateOrderRuleSeqInfo(sequence);
                    }

                    Calendar c = Calendar.getInstance();
                    c.setTime(new Date());
                    c.add(Calendar.DAY_OF_YEAR, 1);

                    return new DayFetchResult(sequence.getRuleCurNo() - size, size, nowDate, ruleVo.getOrderPrefix(), ruleVo
                            .getSerialNumber(), ruleVo.getCompanyFlag(), ruleVo.getCustomerFlag(), ruleVo.getDateFlag(), ruleVo
                            .getCharFormat(), sequence.getRuleOrderCompany(), sequence.getRuleOrderCustomer(), c.getTime());
                } else {
                    throw new ServiceException("com.scloud.common.exception.ServiceException:order-rule-not-exist", "该单据的编码规则为空,请检查是否已创建单据编码的规则");
                }
            }

            @Override
            public String format(String orderPrefix, Integer serialNumber, String companyFlag, String customerFlag,
                                 String dateFlag, String company, String customer, String charFormat, long sequence) {
                StringBuffer bizOrderNo = new StringBuffer();
                bizOrderNo.append(orderPrefix);
                if (companyFlag.equals(FLAG_Y)) {
                    String companyStr = CommonUtils.isEmpty(company) ? "" : company;
                    bizOrderNo.append(companyStr.toUpperCase());
                }
                if (customerFlag.equals(FLAG_Y)) {
                    String customerStr = CommonUtils.isEmpty(customer) ? "" : customer;
                    bizOrderNo.append(customerStr.toUpperCase());
                }
                if (dateFlag.equals(FLAG_Y)) {
                    bizOrderNo.append(DateUtils.format(charFormat));
                }
                String result;
                if (String.valueOf(sequence).length() > serialNumber) {
                    result = String.format("%s%0" + (serialNumber + 1) + "d", bizOrderNo, sequence);
                } else {
                    result = String.format("%s%0" + serialNumber + "d", bizOrderNo, sequence);
                }
                return result;
            }
        });
    }

    @Override
    public void run() {
        try {
            String bizOrderNo = this.createBizOrderNo("oms_coi_in", "rjkj");
            System.out.println(bizOrderNo + "=============================" + DateUtils.getStringDate());
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    private static class Key {

        String orderType;
        String company;

        private Key(String orderType, String company) {
            this.orderType = orderType;
            this.company = company;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            Key key = (Key) o;
            return Objects.equals(orderType, key.orderType) &&
                    Objects.equals(company, key.company);
        }

        @Override
        public int hashCode() {
            return Objects.hash(orderType, company);
        }
    }
}
