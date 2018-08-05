package com.htf.controller;

import com.htf.common.config.redis.RedisRepository;
import com.htf.common.config.security.AuthenticationTokenFilter;
import com.htf.controller.vo.response.UserResponse;
import com.htf.service.IUserService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author acumes
 * @date 2018/8/3 15:31
 */
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private RedisRepository redisRepository;

    @GetMapping("/{id}")
    @ApiOperation(value = "获取用户详情")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<UserResponse> getUser(@PathVariable String id){
        UserResponse response = new UserResponse();
        response = userService.getUser(id);
        redisRepository.set("user_"+id,response.getLoginName());
        return new ResponseEntity<UserResponse>(response, HttpStatus.OK);
    }

    @GetMapping("/redis")
    public String testRedis(){
        return redisRepository.get("user_3");
    }

    @GetMapping("/getCurrentUser")
    @ApiOperation(value = "获取当前用户")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<UserResponse> getCurrentUser(){

//        final UserDetails userDetails = getUserDetails();
        UserResponse response = new UserResponse();
        response = userService.getCurrentUser();
        return new ResponseEntity<UserResponse>(response, HttpStatus.OK);
    }


}
