package com.swap.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.ShopsCollectionCustomMapper;
import com.swap.mapper.ShopsCollectionMapper;
import com.swap.po.ShopsCollection;
import com.swap.service.ShopsCollectionService;

public class ShopsCollectionServiceImpl implements ShopsCollectionService {

    @Autowired
    private ShopsCollectionMapper shopsCollectionMapper;
    @Autowired
    private ShopsCollectionCustomMapper shopsCollectionCustomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return shopsCollectionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(ShopsCollection record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(ShopsCollection record) throws Exception {
        // TODO Auto-generated method stub
        shopsCollectionMapper.insertSelective(record);
        return record.getId();
    }

    @Override
    public ShopsCollection selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(ShopsCollection record)
            throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ShopsCollection record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<ShopsCollection> selectByUserAndShop(Integer userId, Integer shopId)
            throws Exception {
        // TODO Auto-generated method stub
        return shopsCollectionCustomMapper.selectByUserAndShop(userId, shopId);
    }



}
