package com.swap.service.impl;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.ShopsMapper;
import com.swap.mapper.UsersMapper;
import com.swap.po.Shops;
import com.swap.po.Users;
import com.swap.service.LoginService;

/**
 * <p>Title:LoginServiceImpl </p>
 * <p>Description: </p>
 * @author 郭光辉
 * @date 2016年4月7日下午1:03:03
 */
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private ShopsMapper     shopsMapper;
    /**
    * <p>Description:登入验证 </p>
    * @param username
    * @param password
    * @return
    * @throws Exception
     */
    @Override
    public int login(String username, String password) throws Exception {
        // TODO Auto-generated method stub
        Users users=usersMapper.selectByName(username);
        if(users==null){
            return 0;//用户名不存在返回0
        }
        else{
            if(users.getPassword().equals(password)){
                return users.getId();//登入成功返回2
            }
            else{
                return -1;//密码不正确返回1
            }
        }
    }

    @Override
    public  int insertSelective(Users user) throws Exception{
        //插入数据前先检测是否以存在相同的username,不存在插入，存在返回0
        Users u=usersMapper.selectByName(user.getUsername());
        if(u==null){
            //创建user的同时默认创建商店
            int n=usersMapper.insertSelective(user);
            Shops shops=new Shops();
            shops.setUserId(user.getId());
            shops.setCreatedate(new Date());
            shopsMapper.insertSelective(shops);
            return n;
        }
        else{
            return 0;
        }

    }

}
