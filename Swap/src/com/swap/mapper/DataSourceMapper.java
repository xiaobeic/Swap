package com.swap.mapper;

import java.util.List;

import com.swap.po.Goods;

public interface DataSourceMapper {
    List<Goods> selectAllGoods();

    List<Goods> searchGoodsInfo(List<Integer> goodsIds);
}
