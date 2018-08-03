package com.htf.common.config.security.model;

import com.htf.po.SysUser;

/**
 * The type Auth user factory.
 *
 * @author zhangxd
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
