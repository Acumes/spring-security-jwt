package com.htf.controller;

import com.htf.common.annotation.PermissionTracking;
import com.htf.common.config.redis.RedisRepository;
import com.htf.common.config.security.AuthenticationTokenFilter;
import com.htf.controller.vo.request.AddUserRequest;
import com.htf.controller.vo.request.CheckUserRequest;
import com.htf.controller.vo.request.UpdateUserRequest;
import com.htf.controller.vo.request.UserRequest;
import com.htf.controller.vo.response.UserListResult;
import com.htf.controller.vo.response.UserResponse;
import com.htf.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

/**
 * @author acumes
 * @date 2018/8/3 15:31
 */
@RestController
@RequestMapping("/users")
@Api(tags = "用户管理",value = "/users", description = "用户API")
public class UserController extends BaseController{

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
    @PermissionTracking(methodName = "sys:user:view")
    public ResponseEntity<UserResponse> getUser(@PathVariable String id){
        UserResponse response = new UserResponse();
        response = userService.getUser(id);
        redisRepository.set("user_"+id,response.getLoginName());
        return new ResponseEntity<UserResponse>(response, HttpStatus.OK);
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

    @PostMapping("/getUsers")
    @ApiOperation(value = "获取用户列表")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @PermissionTracking(methodName = "sys:user:view")
    public ResponseEntity<UserListResult> getUsers(@RequestBody(required = false) UserRequest request){
        UserListResult result = new UserListResult();
//        UserRequest request = new UserRequest();
        if(request == null){
            request = new UserRequest();
        }
        result = userService.getUsers(request);
        return new ResponseEntity<UserListResult>(result, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除用户")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @PermissionTracking(methodName = "sys:user:delete")
    public ResponseEntity<String> delUser(@PathVariable String id){
        userService.delUser(id);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @DeleteMapping("/batchDel")
    @ApiOperation(value = "批量删除用户")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @PermissionTracking(methodName = "sys:user:delete")
    public ResponseEntity<String> batchDelUser(@RequestParam String ids){
        userService.batchDelUser(ids);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @PostMapping("/add")
    @ApiOperation(value = "添加用户")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @PermissionTracking(methodName = "sys:user:add")
    public ResponseEntity<String> addUser(@RequestBody AddUserRequest request){
        userService.addUser(request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @PostMapping("/checkUser")
    @ApiOperation(value = "校验用户名是否存在")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<Boolean> checkUser(@RequestBody CheckUserRequest request){
        Boolean b = userService.checkUser(request);
        return new ResponseEntity<Boolean>(b, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    @ApiOperation(value = "修改用户")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    @PermissionTracking(methodName = "sys:user:edit")
    public ResponseEntity<String> updateUser(@PathVariable String id,@RequestBody UpdateUserRequest request){
        userService.updateUser(id,request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }



}
