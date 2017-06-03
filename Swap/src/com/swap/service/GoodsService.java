package com.swap.service;

import java.util.List;

import com.swap.po.Goods;
import com.swap.po.GoodsCustom;
import com.swap.po.Page;

public interface GoodsService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(Goods record)throws Exception;

    public int insertSelective(Goods record)throws Exception;

    public Goods selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(Goods record)throws Exception;

    public int updateByPrimaryKey(Goods record)throws Exception;

    public List<GoodsCustom> selectAllByShopId(Integer shop_id)throws Exception;

    public List<GoodsCustom> goodsCollectionselectAll(Integer user_id)throws Exception;

    public List<GoodsCustom> selectBygoodsname(Page page,String bigclassify,String smallclassifys)throws Exception;

    public List<GoodsCustom> selectAllBygoodsname(Page page,String bigclassifys)throws Exception;

    public int  getBigclassifysCount(String bigclassifys);

    public int  getSmallclassifysCount(String bigclassify,String smallclassify);

	public int getGoodsCount();

	public List<Goods> adminQueryGoods(Page page);

	public List<Goods> adminSearchGoods(String keyword);
}
