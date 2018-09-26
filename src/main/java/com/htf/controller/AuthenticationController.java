package com.htf.controller;

import com.htf.common.config.security.AuthenticationTokenFilter;
import com.htf.common.config.security.utils.TokenUtil;
import com.htf.common.exception.ServiceException;
import com.htf.common.utils.Message;
import com.htf.common.utils.ReturnCode;
import com.htf.service.ISysCaptchaService;
import io.swagger.annotations.*;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * The type Authentication controller.
 * @author acumes
 * @date 2018/8/4 14:13
 */
@RestController
@RequestMapping("/auth")
@Api(tags = "权限管理",description = "权限API")
public class AuthenticationController extends BaseController{

    /**
     * 权限管理
     */
    @Autowired
    private AuthenticationManager authenticationManager;

    /**
     * 验证码服务
     */
    @Autowired
    private ISysCaptchaService sysCaptchaService;

    /**
     * 用户信息服务
     */
    @Autowired
    private UserDetailsService userDetailsServiceImpl;
    /**
     * Token工具类
     */
    @Autowired
    private TokenUtil jwtTokenUtil;

    /**
     * Create authentication token map.
     *
     * @param username the username
     * @param password the password
     * @return the map
     */
    @PostMapping(value = "/token", produces = "application/json; charset=UTF-8")
    @ApiOperation(value = "获取token")
    public Map<String, Object> createAuthenticationToken(
        @ApiParam(required = true, value = "用户名") @RequestParam("username") String username,
        @ApiParam(required = true, value = "密码") @RequestParam("password") String password,
        @ApiParam(required = true, value = "验证码") @RequestParam("captchaCode") String captchaCode
    ) {

        Map<String, Object> message = new HashMap<>();

        boolean capthcha = sysCaptchaService.validate(captchaCode);
        if(!capthcha){
            message.put(Message.RETURN_FIELD_CODE, ReturnCode.INVALID_CAPTCHA_ERROR);
            return message;
        }

        //完成授权
        final Authentication authentication = authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(username, password)
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);

        final UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        final String token = jwtTokenUtil.generateToken(userDetails); //生成Token

        Map<String, Object> tokenMap = new HashMap<>();

        tokenMap.put("access_token", token);
        tokenMap.put("expires_in", jwtTokenUtil.getExpiration());
        tokenMap.put("token_type", TokenUtil.TOKEN_TYPE_BEARER);


        message.put(Message.RETURN_FIELD_CODE, ReturnCode.SUCCESS);
        message.put(Message.RETURN_FIELD_DATA, tokenMap);

        return message;
    }

    /**
     * Refresh and get authentication token map.
     *
     * @param request the request
     * @return the map
     */
    @GetMapping(value = "/refresh", produces = "application/json; charset=UTF-8")
    @ApiOperation(value = "刷新token")
    @ApiImplicitParams(
        {
            @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                dataType = "string", value = "authorization header", defaultValue = "Bearer ")
        }
    )
    public Map<String, Object> refreshAndGetAuthenticationToken(
        HttpServletRequest request) {

        String tokenHeader = request.getHeader(AuthenticationTokenFilter.TOKEN_HEADER);
        String token = tokenHeader.split(" ")[1];

        //重新生成Token
        String username = jwtTokenUtil.getUsernameFromToken(token);
        final UserDetails userDetails = userDetailsServiceImpl.loadUserByUsername(username);
        final String refreshedToken = jwtTokenUtil.generateToken(userDetails);

        Map<String, Object> tokenMap = new HashMap<>();
        tokenMap.put("access_token", refreshedToken);
        tokenMap.put("expires_in", jwtTokenUtil.getExpiration());
        tokenMap.put("token_type", TokenUtil.TOKEN_TYPE_BEARER);

        Map<String, Object> message = new HashMap<>();
        message.put(Message.RETURN_FIELD_CODE, ReturnCode.SUCCESS);
        message.put(Message.RETURN_FIELD_DATA, tokenMap);

        return message;
    }

    /**
     * Delete authentication token map.
     *
     * @param request the request
     * @return the map
     */
    @DeleteMapping(value = "/token", produces = "application/json; charset=UTF-8")
    @ApiOperation(value = "清空token")
    @ApiImplicitParams(
        {
            @ApiImplicitParam(name = "Authorization", required = true, paramType = "header",
                dataType = "string", value = "authorization header", defaultValue = "Bearer ")
        }
    )
    public Map<String, Object> deleteAuthenticationToken(
        HttpServletRequest request) {

        String tokenHeader = request.getHeader(AuthenticationTokenFilter.TOKEN_HEADER);
        String token = tokenHeader.split(" ")[1];

        //移除token
        jwtTokenUtil.removeToken(token);

        Map<String, Object> message = new HashMap<>();
        message.put(Message.RETURN_FIELD_CODE, ReturnCode.SUCCESS);

        return message;
    }

    /**
     * 验证码
     */
    @GetMapping("captcha")
    public void captcha(HttpServletResponse response, String uuid)throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        //获取图片验证码
        BufferedImage image = null;
        try {
            image = sysCaptchaService.getCaptcha();
        } catch (ServiceException e) {
            e.printStackTrace();
        }

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        IOUtils.closeQuietly(out);
    }


    /**
     * Handle business exception map.
     *
     * @param ex the ex
     * @return the map
     */
    @ExceptionHandler(BadCredentialsException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, Object> handleBusinessException(BadCredentialsException ex) {
        //用户名或密码错误
        return makeErrorMessage(ReturnCode.INVALID_GRANT, "Bad credentials", ex.getMessage());
    }

    /**
     * Handle business exception map.
     *
     * @param ex the ex
     * @return the map
     */
    @ExceptionHandler(DisabledException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public Map<String, Object> handleBusinessException(DisabledException ex) {
        //用户被停用
        return makeErrorMessage(ReturnCode.DISABLED_USER, "User Disabled", ex.getMessage());
    }

}
