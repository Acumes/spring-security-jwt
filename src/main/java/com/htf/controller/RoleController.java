package com.htf.controller;

import com.htf.controller.vo.request.AddRoleRequest;
import com.htf.controller.vo.request.RoleRequest;
import com.htf.controller.vo.request.UpdateRoleRequest;
import com.htf.controller.vo.request.UserRequest;
import com.htf.controller.vo.response.RoleListResult;
import com.htf.controller.vo.response.RoleResponse;
import com.htf.service.IRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author acumes
 * @date 2018/8/10 16:19
 */
@RestController
@RequestMapping("/roles")
@Api(tags = "角色管理",value = "roles",description = "角色API")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @PostMapping("/getRoles")
    @ApiOperation(value = "获取角色列表")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<RoleListResult> getRoles(@RequestBody(required = false) RoleRequest request){
        RoleListResult result = new RoleListResult();
        if(request == null){
            request = new RoleRequest();
        }
        result = roleService.getRoles(request);
        return new ResponseEntity<RoleListResult>(result, HttpStatus.OK);
    }

    @PostMapping("")
    @ApiOperation(value = "添加角色")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<String> addRole(@RequestBody(required = true) AddRoleRequest request){
        roleService.addRole(request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @PutMapping("")
    @ApiOperation(value = "修改角色")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<String> updateRole(@RequestBody(required = true) UpdateRoleRequest request){
        roleService.updateRole(request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除角色")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<String> delRole(@PathVariable String id){
        roleService.delRole(id);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @DeleteMapping("/batchDel")
    @ApiOperation(value = "批量删除角色")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<String> batchDelRoles(@RequestParam String ids){
        roleService.batchDelRoles(ids);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }


    @GetMapping("/{id}")
    @ApiOperation(value = "获取角色详情")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<RoleResponse> getRole(@PathVariable String id){
        RoleResponse response = roleService.getRole(id);
        return new ResponseEntity<RoleResponse>(response, HttpStatus.OK);
    }

}
