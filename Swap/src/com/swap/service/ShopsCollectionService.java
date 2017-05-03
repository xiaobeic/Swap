package com.swap.service;


import java.util.List;

import com.swap.po.ShopsCollection;

public interface ShopsCollectionService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(ShopsCollection record)throws Exception;

    public int insertSelective(ShopsCollection record)throws Exception;

    public ShopsCollection selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(ShopsCollection record)throws Exception;

    public int updateByPrimaryKey(ShopsCollection record)throws Exception;

    public List<ShopsCollection> selectByUserAndShop(Integer userId,Integer shopId)throws Exception;
}
