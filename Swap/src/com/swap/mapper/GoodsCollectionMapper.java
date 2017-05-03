package com.swap.mapper;

import com.swap.po.GoodsCollection;

public interface GoodsCollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsCollection record);

    int insertSelective(GoodsCollection record);

    GoodsCollection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsCollection record);

    int updateByPrimaryKey(GoodsCollection record);
}