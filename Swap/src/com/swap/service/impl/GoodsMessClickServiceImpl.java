package com.swap.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.GoodsMesClickCustomMapper;
import com.swap.mapper.GoodsMessClickMapper;
import com.swap.po.GoodsMessClick;
import com.swap.service.GoodsMessClickService;

public class GoodsMessClickServiceImpl implements GoodsMessClickService {

    @Autowired
    private GoodsMessClickMapper goodsMessClickMapper;
    @Autowired
    private GoodsMesClickCustomMapper goodsMesClickCustomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(GoodsMessClick record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(GoodsMessClick record) throws Exception {
        // TODO Auto-generated method stub
        return goodsMessClickMapper.insertSelective(record);
    }

    @Override
    public GoodsMessClick selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(GoodsMessClick record)
            throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(GoodsMessClick record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<GoodsMessClick> selectByUserAndGdMess(Integer userId, Integer gdMessId)
            throws Exception {
        // TODO Auto-generated method stub
        return goodsMesClickCustomMapper.selectByUserAndGdMess(userId, gdMessId);
    }

}
