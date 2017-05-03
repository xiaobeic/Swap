package com.swap.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.GoodsCustomMapper;
import com.swap.mapper.ShopsCustomMapper;
import com.swap.mapper.ShopsMapper;
import com.swap.po.Shops;
import com.swap.po.ShopsCollection;
import com.swap.po.ShopsCustom;
import com.swap.service.ShopsService;

public class ShopsServiceImpl implements ShopsService {

    @Autowired
    public ShopsMapper shopsMapper;
    @Autowired
    public ShopsCustomMapper shopsCustomMapper;
    @Autowired
    public GoodsCustomMapper goodsCustomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(Shops record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(Shops record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public Shops selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Shops record) throws Exception {
        // TODO Auto-generated method stub
        return shopsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Shops record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public ShopsCustom userAndShopQuery(Integer userid) throws Exception {
        // TODO Auto-generated method stub
        return shopsCustomMapper.userAndShopQuery(userid);
    }

    @Override
    public List<ShopsCollection> shopsCollectionSelect(Integer userid) throws Exception {
        // TODO Auto-generated method stub
        return shopsCustomMapper.shopsCollectionSelect(userid);
    }

    @Override
    public int updateReputationvalue(Shops record) throws Exception {
        // TODO Auto-generated method stub
        return shopsCustomMapper.updateReputationvalue(record);
    }

    @Override
    public ShopsCustom userAndShopSelect(Integer shopid) throws Exception {
        // TODO Auto-generated method stub
        return shopsCustomMapper.userAndShopSelect(shopid);
    }

    @Override
    public int selectByShopname(String shopname) throws Exception {
        Shops shop=shopsCustomMapper.selectByShopname(shopname);
        if(shop==null){
            return 0;
        }else{
            return shop.getId();
        }
    }

}
