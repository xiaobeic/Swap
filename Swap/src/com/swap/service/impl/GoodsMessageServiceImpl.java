package com.swap.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.GoodsMessageCustomMapper;
import com.swap.mapper.GoodsMessageMapper;
import com.swap.po.GoodsMessage;
import com.swap.po.GoodsMessageCustom;
import com.swap.service.GoodsMessageService;

public class GoodsMessageServiceImpl implements GoodsMessageService {

    @Autowired
    private GoodsMessageMapper goodsMessageMapper;

    @Autowired
    private GoodsMessageCustomMapper goodsMessageCustomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(GoodsMessage record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(GoodsMessage record) throws Exception {
        // TODO Auto-generated method stub
        goodsMessageMapper.insertSelective(record);
        return record.getId();
    }

    @Override
    public GoodsMessage selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(GoodsMessage record)
            throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(GoodsMessage record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<GoodsMessageCustom> goodsMessageSelect(Integer id)
            throws Exception {
        // TODO Auto-generated method stub
        return goodsMessageCustomMapper.goodsMessageSelect(id);
    }



}
