package com.swap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swap.po.GoodsMessClick;

public interface GoodsMesClickCustomMapper {

    List<GoodsMessClick> selectByUserAndGdMess(@Param("userId") Integer userId,@Param("gdMessId") Integer gdMessId);
}