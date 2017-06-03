package com.swap.mapper;

import java.util.List;

import com.swap.po.Page;
import com.swap.po.Users;

public interface UsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer id);

    Users selectByName(String username);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);

    List<Users> adminQueryUsers(Page page);

    int getUsersCount();

	List<Users> adminSearchUsers(String keyword);

}