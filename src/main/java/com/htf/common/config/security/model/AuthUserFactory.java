package com.htf.common.config.security.model;

import com.htf.po.SysUser;

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
    public static AuthUser create(SysUser user) {
        return new AuthUser(
            user.getId(),
            user.getLoginName(),
            user.getPassword(),
            user.getEnabled()
        );
    }

}
