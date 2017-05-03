package com.swap.mapper;

import com.swap.po.GoodsMessClick;

public interface GoodsMessClickMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsMessClick record);

    int insertSelective(GoodsMessClick record);

    GoodsMessClick selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsMessClick record);

    int updateByPrimaryKey(GoodsMessClick record);
}