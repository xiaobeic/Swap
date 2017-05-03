package com.swap.mapper;

import com.swap.po.ShopsMessage;

public interface ShopsMessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ShopsMessage record);

    int insertSelective(ShopsMessage record);

    ShopsMessage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopsMessage record);

    int updateByPrimaryKey(ShopsMessage record);
}