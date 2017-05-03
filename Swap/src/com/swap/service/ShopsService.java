package com.swap.service;

import java.util.List;

import com.swap.po.Shops;
import com.swap.po.ShopsCollection;
import com.swap.po.ShopsCustom;

public interface ShopsService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(Shops record)throws Exception;

    public int insertSelective(Shops record)throws Exception;

    public Shops selectByPrimaryKey(Integer id)throws Exception;

    public int selectByShopname(String shopname)throws Exception;

    public int updateByPrimaryKeySelective(Shops record)throws Exception;

    public int updateByPrimaryKey(Shops record)throws Exception;

    public ShopsCustom userAndShopQuery(Integer userid)throws Exception;

    public ShopsCustom userAndShopSelect(Integer shopid)throws Exception;

    public List<ShopsCollection> shopsCollectionSelect(Integer userid)throws Exception;

    public int updateReputationvalue(Shops record)throws Exception;

}
