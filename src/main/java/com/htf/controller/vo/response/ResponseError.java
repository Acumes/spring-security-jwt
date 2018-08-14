package com.htf.controller.vo.response;

import io.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlElement;

/**
 * @author acumes
 * @date 2018/8/14 9:09
 */
public class ResponseError {
    @ApiModelProperty("错误编码")
    private String code = "0";

    @ApiModelProperty("错误异常描述")
    private String msg = "";

    public ResponseError(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public ResponseError() {}

}
