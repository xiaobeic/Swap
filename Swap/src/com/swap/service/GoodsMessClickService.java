package com.swap.service;

import java.util.List;

import com.swap.po.GoodsMessClick;

public interface GoodsMessClickService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(GoodsMessClick record)throws Exception;

    public int insertSelective(GoodsMessClick record)throws Exception;

    public  GoodsMessClick selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(GoodsMessClick record)throws Exception;

    public int updateByPrimaryKey(GoodsMessClick record)throws Exception;

    public  List<GoodsMessClick> selectByUserAndGdMess(Integer userId,Integer gdMessId)throws Exception;
}
