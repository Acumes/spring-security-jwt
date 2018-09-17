package com.htf.common.config.security.model;

import com.htf.po.SysUser;

import java.util.ArrayList;
import java.util.List;

/**
 * @author acumes
 * @date 2018/8/4 14:13
 */
public final class AuthUserFactory {

    private AuthUserFactory() {
    }

    /**
     * Create auth user.
     *
     * @param user the user
     * @return the auth user
     */
    public static AuthUser create(SysUser user, List<String> permissions) {
        return new AuthUser(
            user.getId(),
            user.getLoginName(),
            user.getPassword(),
            user.getEnabled(),
            user.getMobile(),
            permissions
        );
    }

}
