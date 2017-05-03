package com.swap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swap.po.GoodsCustom;

public interface GoodsCustomMapper {

    List<GoodsCustom> selectAllByShopId(Integer shop_id);

    List<GoodsCustom> goodsCollectionselectAll(Integer user_id);

    List<GoodsCustom> selectBygoodsname(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="bigclassify") String bigclassify,@Param(value="smallclassify") String smallclassify);

    List<GoodsCustom> selectAllBygoodsname(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="bigclassifys") String bigclassifys);

    int  getBigclassifysCount(String bigclassifys);

    int getSmallclassifysCount(@Param(value="bigclassify") String bigclassify,@Param(value="smallclassify") String smallclassify);
}