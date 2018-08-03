package com.htf.common.config.mapper;

import java.util.List;
import java.util.Map;

/**
 * @author acumes
 * @date 2018/7/27 15:05
 */
public interface BaseMapper<E, ID> {

    int insert(E entity);

    int insertSelective(E entity);

    int deleteByPrimaryKey(ID id);

    int deleteByPrimaryKeys(List<ID> ids);

    int updateByPrimaryKey(E entity);

    int updateByPrimaryKeySelective(E entity);

    E selectByPrimaryKey(ID id);

    List<E> selectByPrimaryKeys(List<ID> ids);

    List<E> selectAll();

    List<E> selectByRecord(E entity);

    List<E> selectByConditions(@SuppressWarnings("rawtypes") Map conditions);

    int batchInsert(List<E> entities);

    int batchUpdate(List<E> entities);

    Long count();
}
