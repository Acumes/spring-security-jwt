package com.htf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import springfox.documentation.annotations.ApiIgnore;

/**
 * @author acumes
 * @date 2018/8/8 10:11
 */
@ApiIgnore
@RequestMapping("/")
@Controller
public class MainController {

    @RequestMapping("")
    public String apiHome(){
        return "index";
    }


    @RequestMapping("/index")
    public String index(){
        return "index";
    }

}
