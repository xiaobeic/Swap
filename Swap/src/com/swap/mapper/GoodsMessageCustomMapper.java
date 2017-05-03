package com.swap.mapper;

import java.util.List;

import com.swap.po.GoodsMessageCustom;

public interface GoodsMessageCustomMapper {
    List<GoodsMessageCustom> goodsMessageSelect(Integer id);
}