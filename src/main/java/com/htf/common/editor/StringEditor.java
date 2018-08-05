package com.htf.common.editor;

import org.apache.commons.lang3.StringEscapeUtils;

import java.beans.PropertyEditorSupport;

/**
 * @author acumes
 * @date 2018/8/4 14:13
 */
public class StringEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
    }

    @Override
    public String getAsText() {
        Object value = getValue();
        return value != null ? value.toString() : "";
    }
    
}
