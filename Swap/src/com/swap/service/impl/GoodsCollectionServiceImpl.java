package com.swap.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.GoodsCollectionCustomMapper;
import com.swap.mapper.GoodsCollectionMapper;
import com.swap.po.GoodsCollection;
import com.swap.service.GoodsCollectionService;

public class GoodsCollectionServiceImpl implements GoodsCollectionService {
    @Autowired
    private GoodsCollectionMapper goodsCollectionMapper;
    @Autowired
    private GoodsCollectionCustomMapper goodsCollectionCustomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return goodsCollectionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(GoodsCollection record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(GoodsCollection record) throws Exception {
        // TODO Auto-generated method stub
        //返回创建的id
        goodsCollectionMapper.insertSelective(record);
        return record.getId();
    }

    @Override
    public GoodsCollection selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(GoodsCollection record)
            throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(GoodsCollection record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<GoodsCollection> selectByUserAndGoods(Integer userId, Integer goodId)
            throws Exception {
        // TODO Auto-generated method stub
        return goodsCollectionCustomMapper.selectByUserAndGoods(userId, goodId);
    }

}
