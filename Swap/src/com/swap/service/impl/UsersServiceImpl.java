package com.swap.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.UsersMapper;
import com.swap.po.Users;
import com.swap.service.UsersService;

public class UsersServiceImpl implements UsersService {

    @Autowired
    public UsersMapper usersMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(Users record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(Users record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public Users selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return usersMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Users record) throws Exception {
        // TODO Auto-generated method stub
        usersMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Users record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }


}
