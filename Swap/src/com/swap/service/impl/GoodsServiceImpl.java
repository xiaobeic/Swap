package com.swap.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.GoodsCustomMapper;
import com.swap.mapper.GoodsMapper;
import com.swap.po.Goods;
import com.swap.po.GoodsCustom;
import com.swap.po.Page;
import com.swap.service.GoodsService;
/**
* <p>Title:GoodsServiceImpl </p>
* <p>Description: </p>
* <p>Company: </p>
* @author guanghui
* @date 2016年4月17日
 */
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    public GoodsMapper goodsMapper;
    @Autowired
    public GoodsCustomMapper goodsCustomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return goodsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Goods record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    /**
     * 物品上传
     */
    @Override
    public int insertSelective(Goods record) throws Exception {
        // TODO Auto-generated method stub
        goodsMapper.insertSelective(record);
        if(record.getId()==null){
            return 0;
        }else{
            return record.getId();
        }
    }

    @Override
    public Goods selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return goodsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Goods record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Goods record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<GoodsCustom> selectAllByShopId(Integer shop_id) throws Exception {
        // TODO Auto-generated method stub
        return goodsCustomMapper.selectAllByShopId(shop_id);
    }

    @Override
    public List<GoodsCustom> goodsCollectionselectAll(Integer user_id)throws Exception {

        return goodsCustomMapper.goodsCollectionselectAll(user_id);
    }

    @Override
    public List<GoodsCustom> selectAllBygoodsname(Page page,String bigclassifys)throws Exception {
        // TODO Auto-generated method stub
        List<GoodsCustom> goodsCustoms = new ArrayList<GoodsCustom>();
        goodsCustoms = this.goodsCustomMapper.selectAllBygoodsname(page.getStartPos(), page.getPageSize(), bigclassifys);
        return goodsCustoms;

    }

    @Override
    public int getBigclassifysCount(String bigclassifys) {
        // TODO Auto-generated method stub
        return goodsCustomMapper.getBigclassifysCount(bigclassifys);
    }


    @Override
    public List<GoodsCustom> selectBygoodsname(Page page,String bigclassify,String smallclassifys)throws Exception {
        // TODO Auto-generated method stub
        return goodsCustomMapper.selectBygoodsname(page.getStartPos(), page.getPageSize(),bigclassify,smallclassifys);
    }


    @Override
    public int getSmallclassifysCount(String bigclassify, String smallclassify) {
        // TODO Auto-generated method stub
        return goodsCustomMapper.getSmallclassifysCount(bigclassify,smallclassify);
    }

}
