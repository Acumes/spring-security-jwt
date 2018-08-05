package com.htf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author acumes
 * @date 2018/8/3 15:13
 */
@SpringBootApplication
@RestController
@ServletComponentScan
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class,args);

    }

    @GetMapping("/hello")
    public String hello(@RequestParam String name){
        return "hello " + name;
    }

    public static Long test(int num){
        Long l = 0l;
        for(int i = 1 ; i <= num; i++){
            l = (l+20) * i;
        }
        return l;
    }
}
