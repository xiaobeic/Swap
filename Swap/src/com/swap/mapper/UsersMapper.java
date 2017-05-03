package com.swap.mapper;

import com.swap.po.Users;

public interface UsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer id);
    
    Users selectByName(String username);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
}