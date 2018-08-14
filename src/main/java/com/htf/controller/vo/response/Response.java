package com.htf.controller.vo.response;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.validation.ObjectError;

import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author acumes
 * @date 2018/8/14 8:52
 */
@Data
public class Response {
    public Response() {
    }

    @ApiModelProperty("返回状态")
    public boolean success = true;

    @ApiModelProperty("返回提示")
    public String msg;

    @ApiModelProperty("错误信息集合")
    public List<ResponseError> errors = new ArrayList<ResponseError>();

    public void addResponseError(ResponseError error)
    {
        errors.add(error);
    }

    public void addAllValidateError(List<ObjectError> errorLists)
    {
        for (ObjectError error : errorLists)
        {
            errors.add(new ResponseError(error.getCode(), error.getDefaultMessage()));
        }
    }
}
