package com.swap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swap.po.ShopsMessageCustom;

public interface ShopsMessageCustomMapper{
    //商品留言扩展类
    List<ShopsMessageCustom> selectByPrimary(Integer id);

    List<ShopsMessageCustom> selectByIdshopsMess(@Param("userid") Integer userid,@Param("myid") Integer myid);
}
