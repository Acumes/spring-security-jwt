package com.htf.controller;

import com.htf.controller.vo.request.AddMenuRequest;
import com.htf.controller.vo.response.MenuResponse;
import com.htf.controller.vo.response.MenuTreeResponse;
import com.htf.service.IMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author acumes
 * @date 2018/8/13 13:50
 */
@RequestMapping("/menu")
@Api(tags = "菜单管理")
@RestController
public class MenuController {


    @Autowired
    private IMenuService menuService;

    @GetMapping("/tree")
    @ApiOperation(value = "获取菜单树")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<List<MenuTreeResponse>> getMenuTree(){
        List<MenuTreeResponse> result= menuService.getMenuTree();
        return new ResponseEntity<List<MenuTreeResponse>>(result, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "获取菜单详情")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<MenuResponse> getMenu(@PathVariable String id){
        MenuResponse result= menuService.getMenu(id);
        return new ResponseEntity<MenuResponse>(result, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除菜单")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<String> delMenu(@PathVariable String id){
        menuService.delMenu(id);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @PutMapping("")
    @ApiOperation(value = "修改菜单")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<String> updateMenu(@PathVariable AddMenuRequest request){
        menuService.updateMenu(request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }
    @PostMapping("")
    @ApiOperation(value = "新增菜单")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                            dataType = "string", value = "authorization header", defaultValue = "Bearer ")
            }
    )
    public ResponseEntity<String> addMenu(@PathVariable AddMenuRequest request){
        menuService.addMenu(request);
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

}
