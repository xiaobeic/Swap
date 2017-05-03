package com.swap.service;

import java.util.List;

import com.swap.po.GoodsCollection;

public interface GoodsCollectionService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(GoodsCollection record)throws Exception;

    public int insertSelective(GoodsCollection record)throws Exception;

    public GoodsCollection selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(GoodsCollection record)throws Exception;

    public int updateByPrimaryKey(GoodsCollection record)throws Exception;

    public List<GoodsCollection> selectByUserAndGoods(Integer userId,Integer goodId)throws Exception;
}
