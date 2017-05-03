package com.swap.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swap.po.GoodsClick;

public interface GoodsClickCustomMapper {

    List<GoodsClick> userAndGoodsSelect(@Param("userId") Integer userId,@Param("goodsId") Integer goodsId);

    int selectAllClick(@Param("clickTime") String clickTime,@Param("shopId") Integer shopId,@Param("numClick") Integer numClick);
}