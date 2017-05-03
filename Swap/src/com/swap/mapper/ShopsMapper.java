package com.swap.mapper;

import com.swap.po.Shops;

public interface ShopsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shops record);

    int insertSelective(Shops record);

    Shops selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shops record);

    int updateByPrimaryKey(Shops record);
}