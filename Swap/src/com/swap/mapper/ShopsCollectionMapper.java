package com.swap.mapper;

import com.swap.po.ShopsCollection;

public interface ShopsCollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ShopsCollection record);

    int insertSelective(ShopsCollection record);

    ShopsCollection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopsCollection record);

    int updateByPrimaryKey(ShopsCollection record);
}