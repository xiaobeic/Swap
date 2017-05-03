package com.swap.service;

import com.swap.po.Users;

public interface UsersService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(Users record)throws Exception;

    public int insertSelective(Users record)throws Exception;

    public Users selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(Users record)throws Exception;

    public int updateByPrimaryKey(Users record)throws Exception;
}
