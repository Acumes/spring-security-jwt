package com.htf.common.editor;


import com.htf.common.utils.DateHelper;

import java.beans.PropertyEditorSupport;

/**
 * @author acumes
 * @date 2018/8/4 14:13
 */
public class DateEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        setValue(DateHelper.parseDate(text));
    }

}
