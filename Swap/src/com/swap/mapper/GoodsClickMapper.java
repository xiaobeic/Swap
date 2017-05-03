package com.swap.mapper;

import com.swap.po.GoodsClick;

public interface GoodsClickMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsClick record);

    int insertSelective(GoodsClick record);

    GoodsClick selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsClick record);

    int updateByPrimaryKey(GoodsClick record);
}