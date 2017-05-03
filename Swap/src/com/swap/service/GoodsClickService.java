package com.swap.service;


import java.util.List;

import com.swap.po.GoodsClick;
import com.swap.po.GoodsClickTotal;

public interface GoodsClickService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(GoodsClick record)throws Exception;

    public int insertSelective(GoodsClick record)throws Exception;

    public GoodsClick selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(GoodsClick record)throws Exception;

    public int updateByPrimaryKey(GoodsClick record)throws Exception;

    public List<GoodsClick> userAndGoodsSelect(Integer userId,Integer goodsId)throws Exception;

    public GoodsClickTotal selectAllClick(Integer shopId);
}
