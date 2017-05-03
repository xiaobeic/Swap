package com.swap.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.ShopsMessageCustomMapper;
import com.swap.mapper.ShopsMessageMapper;
import com.swap.po.ShopsMessage;
import com.swap.po.ShopsMessageCustom;
import com.swap.service.ShopsMessageService;

public class ShopsMessageServiceImpl implements ShopsMessageService {

    @Autowired
    private ShopsMessageCustomMapper shopsMessageCustomMapper;
    @Autowired
    private ShopsMessageMapper shopsMessageMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return shopsMessageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(ShopsMessage record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(ShopsMessage record) throws Exception {
        // TODO Auto-generated method stub
        return shopsMessageMapper.insertSelective(record);
    }

    @Override
    public ShopsMessage selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(ShopsMessage record)
            throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ShopsMessage record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
	public List<ShopsMessageCustom> selectByPrimary(Integer id)throws Exception{
        return shopsMessageCustomMapper.selectByPrimary(id);
    }

    @Override
    public List<ShopsMessageCustom> selectByIdshopsMess(Integer userid,Integer myid) throws Exception {
        // TODO Auto-generated method stub
        return shopsMessageCustomMapper.selectByIdshopsMess(userid, myid);
    }

}
