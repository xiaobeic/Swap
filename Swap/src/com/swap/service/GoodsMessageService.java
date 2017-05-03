package com.swap.service;

import java.util.List;

import com.swap.po.GoodsMessage;
import com.swap.po.GoodsMessageCustom;

public interface GoodsMessageService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(GoodsMessage record)throws Exception;

    public int insertSelective(GoodsMessage record)throws Exception;

    public GoodsMessage selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(GoodsMessage record)throws Exception;

    public int updateByPrimaryKey(GoodsMessage record)throws Exception;

    public List<GoodsMessageCustom> goodsMessageSelect(Integer id)throws Exception;
}
