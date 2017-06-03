package com.swap.mapper;

import java.util.List;

import com.swap.po.Goods;
import com.swap.po.Page;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

    int getGoodsCount();

	List<Goods> adminQueryGoods(Page page);

	List<Goods> adminSearchGoods(String keyword);
}