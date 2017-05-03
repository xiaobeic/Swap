package com.swap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swap.po.ShopsCollection;

public interface ShopsCollectionCustomMapper {

    List<ShopsCollection> selectByUserAndShop(@Param("userId") Integer userId,@Param("shopId")Integer shopId);
}