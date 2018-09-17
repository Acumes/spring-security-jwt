package com.htf.common.config.security;

import com.htf.common.config.security.model.AuthUserFactory;
import com.htf.po.SysUser;
import com.htf.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author acumes
 * @date 2018/8/3 15:19
 */

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    /**
     * 用户服务
     */
    @Autowired
    private IUserService userService;

    @Override
    public UserDetails loadUserByUsername(String loginName) {
        SysUser user = userService.getUserByUsername(loginName);

        if (user == null) {
            throw new UsernameNotFoundException(String.format("No user found with username '%s'.", loginName));
        } else {
            List<String> permissions = userService.getPermissions(user.getId());
            return AuthUserFactory.create(user,permissions);
        }
    }
}


