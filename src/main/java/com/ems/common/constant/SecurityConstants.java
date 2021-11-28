package com.ems.common.constant;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 11:07
 **/
public class SecurityConstants {

    private SecurityConstants(){
        throw new IllegalStateException("无法创建静态常量类");
    }

    /**
     * 登录url
     */
    public static final String AUTH_LOGIN_URL = "/auth/login";
    public static final String HTML_LOGIN_URL = "/login.html";

    /**
     * JWT签名密钥，用的512-bit Encryption key
     * 地址 https://www.allkeysgenerator.com/
     */
    public static final String JWT_SECRET_KEY = "B?E(H+MbQeShVmYq3t6w9z$C&F)J@NcRfUjWnZr4u7x!A%D*G-KaPdSgVkYp3s5v";

    /**
     * token前缀,用在请求头里Authorization
     */
    public static final String TOKEN_PREFIX = "Bearer ";
    public static final String COOKIE_PREFIX = "Bearer%20";

    /**
     * 请求头
     */
    public static final String TOKEN_HEADER = "Authorization";

    /**
     * token类型
     */
    public static final String TOKEN_TYPE = "JWT";

    /**
     * 声明用户角色
     */
    public static final String TOKEN_ROLE_CLAIM = "role";

    /**
     * token颁发者身份标识
     */
    public static final String TOKEN_ISSUER = "security";

    /**
     * token覆盖范围
     */
    public static final String TOKEN_AUDIENCE = "security-all";

    /**
     * token有效期2小时（当remember为false时）
     */
    public static final Long TOKEN_EXPIRATION_TIME = 60 * 60 * 2L;

    /**
     * token有效期为7天（当remember为true时）
     */
    public static final Long TOKEN_EXPIRATION_REMEMBER_TIME = 60 * 60 * 24 * 7L;
}
