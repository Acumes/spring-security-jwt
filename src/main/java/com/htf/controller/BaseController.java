package com.htf.controller;

import com.htf.common.editor.DateEditor;
import com.htf.common.editor.StringEditor;
import com.htf.common.exception.PermissionException;
import com.htf.common.utils.BeanValidators;
import com.htf.common.utils.Collections3;
import com.htf.common.utils.Message;
import com.htf.common.utils.ReturnCode;
import com.htf.exception.BusinessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.validation.ConstraintViolationException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 控制器支持类
 * @author acumes
 * @date 2018/8/4 14:13
 */
public abstract class BaseController {

    /**
     * 初始化数据绑定
     * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
     * 2. 将字段中Date类型转换为String类型
     *
     * @param binder the binder
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        // String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
        binder.registerCustomEditor(String.class, new StringEditor());
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    /**
     * Handle business exception map.
     *
     * @param ex the ex
     * @return the map
     */
    @ExceptionHandler(BusinessException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Map<String, Object> handleBusinessException(BusinessException ex) {
        return makeErrorMessage(ReturnCode.INTERNAL_SERVER_ERROR, "Business Error", ex.getMessage());
    }

    @ExceptionHandler(PermissionException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Map<String, Object> handlePermissionException(PermissionException ex) {
        System.out.println();
        return makeErrorMessage(ReturnCode.INTERNAL_SERVER_ERROR, "Business Error", ex.getMessage());
    }

    /**
     * Handle constraint violation exception map.
     *
     * @param ex the ex
     * @return the map
     */
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, Object> handleConstraintViolationException(ConstraintViolationException ex) {
        List<String> list = BeanValidators.extractMessage(ex);
        return makeErrorMessage(ReturnCode.INVALID_FIELD,
            "Invalid Field", Collections3.convertToString(list, ";"));
    }

    /**
     * Make error message map.
     *
     * @param code  the code
     * @param error the error
     * @param desc  the desc
     * @return the map
     */
    protected Map<String, Object> makeErrorMessage(String code, String error, String desc) {
        Map<String, Object> message = new HashMap<>();
        message.put(Message.RETURN_FIELD_CODE, code);
        message.put(Message.RETURN_FIELD_ERROR, error);
        message.put(Message.RETURN_FIELD_ERROR_DESC, desc);
        return message;
    }

}
