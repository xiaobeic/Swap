package com.swap.service;

import java.util.List;

import com.swap.po.ShopsMessage;
import com.swap.po.ShopsMessageCustom;

public interface ShopsMessageService {
    public int deleteByPrimaryKey(Integer id)throws Exception;

    public int insert(ShopsMessage record)throws Exception;

    public int insertSelective(ShopsMessage record)throws Exception;

    public ShopsMessage selectByPrimaryKey(Integer id)throws Exception;

    public int updateByPrimaryKeySelective(ShopsMessage record)throws Exception;

    public int updateByPrimaryKey(ShopsMessage record)throws Exception;

    public List<ShopsMessageCustom> selectByPrimary(Integer id)throws Exception;

    public List<ShopsMessageCustom> selectByIdshopsMess(Integer userid,Integer myid)throws Exception;
}
