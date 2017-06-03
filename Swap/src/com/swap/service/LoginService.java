package com.swap.service;

import com.swap.po.Users;

/**
 * <p>
 * Title:LoginService
 * </p>
 * <p>
 * Description:登录注册
 * </p>
 *
 * @author 郭光辉
 * @date 2016年4月7日下午12:54:46
 */
public interface LoginService {
    public int login(String username, String password) throws Exception;

    public int adminLogin(String adminname, String password) throws Exception;

    public int insertSelective(Users record) throws Exception;
}
