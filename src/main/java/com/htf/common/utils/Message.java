package com.htf.common.utils;

import org.springframework.http.HttpStatus;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * 返回数据常量
 *
 * @author zhangxd
 */
public final class Message {

    /**
     * 状态
     */
    public static final String RETURN_FIELD_CODE = "code";
    /**
     * 错误信息
     */
    public static final String RETURN_FIELD_ERROR = "error";
    /**
     * 错误描述
     */
    public static final String RETURN_FIELD_ERROR_DESC = "error_description";
    /**
     * 返回数据
     */
    public static final String RETURN_FIELD_DATA = "data";

    /**
     * HTTP状态码与系统错误代码对应关系
     */
    public static final Map<Integer, String> STATUS_CODE_MAP;

    static {
        Map<Integer, String> codeMappingMap = new HashMap<>();
        codeMappingMap.put(HttpStatus.INTERNAL_SERVER_ERROR.value(), ReturnCode.INTERNAL_SERVER_ERROR);
        codeMappingMap.put(HttpStatus.METHOD_NOT_ALLOWED.value(), ReturnCode.METHOD_NOT_ALLOWED);
        codeMappingMap.put(HttpStatus.BAD_REQUEST.value(), ReturnCode.BAD_REQUEST);
        codeMappingMap.put(HttpStatus.NOT_FOUND.value(), ReturnCode.NOT_FOUND);
        codeMappingMap.put(HttpStatus.UNSUPPORTED_MEDIA_TYPE.value(), ReturnCode.UNSUPPORTED_MEDIA_TYPE);
        codeMappingMap.put(HttpStatus.NOT_ACCEPTABLE.value(), ReturnCode.NOT_ACCEPTABLE);
        codeMappingMap.put(HttpStatus.UNAUTHORIZED.value(), ReturnCode.UNAUTHORIZED);
        codeMappingMap.put(HttpStatus.FORBIDDEN.value(), ReturnCode.FORBIDDEN);

        STATUS_CODE_MAP = Collections.unmodifiableMap(codeMappingMap);
    }

    private Message() {
        throw new IllegalAccessError("Utility class");
    }
}
