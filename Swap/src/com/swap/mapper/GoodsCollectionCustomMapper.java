package com.swap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swap.po.GoodsCollection;

public interface GoodsCollectionCustomMapper {

    List<GoodsCollection>  selectByUserAndGoods(@Param("userId") Integer userId,@Param("goodId") Integer goodId);

}