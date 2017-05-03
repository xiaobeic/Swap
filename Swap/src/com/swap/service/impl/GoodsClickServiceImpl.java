package com.swap.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.GoodsClickCustomMapper;
import com.swap.mapper.GoodsClickMapper;
import com.swap.po.GoodsClick;
import com.swap.po.GoodsClickTotal;
import com.swap.service.GoodsClickService;

public class GoodsClickServiceImpl implements GoodsClickService {

    @Autowired
    private GoodsClickMapper goodsClickMapper;
    @Autowired
    private GoodsClickCustomMapper goodsClickCustomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(GoodsClick record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(GoodsClick record) throws Exception {
        // TODO Auto-generated method stub
        return goodsClickMapper.insertSelective(record);
    }

    @Override
    public GoodsClick selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(GoodsClick record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(GoodsClick record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<GoodsClick> userAndGoodsSelect(Integer userId, Integer goodsId)throws Exception {
        List<GoodsClick> goodsClick=goodsClickCustomMapper.userAndGoodsSelect(userId, goodsId);
        return goodsClick;
    }

    @Override
    public GoodsClickTotal selectAllClick(Integer shopId) {
        //根据shopId查询点赞情况
        GoodsClickTotal gdClick=new GoodsClickTotal();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        Date date=new Date();
        Calendar d=Calendar.getInstance();
        d.setTime(date);
        //最近一周
        d.set(Calendar.DATE, d.get(Calendar.DATE)-7);
        int re1=goodsClickCustomMapper.selectAllClick(sdf.format(d.getTime()),shopId,1);
        int re2=goodsClickCustomMapper.selectAllClick(sdf.format(d.getTime()),shopId,-1);
        gdClick.setClickUp1(re1);
        gdClick.setClickDown1(re2);
        //最近一月
        d.set(Calendar.DATE, d.get(Calendar.DATE)-30);
        int re3=goodsClickCustomMapper.selectAllClick(sdf.format(d.getTime()),shopId,1);
        int re4=goodsClickCustomMapper.selectAllClick(sdf.format(d.getTime()),shopId,-1);
        gdClick.setClickUp2(re3);
        gdClick.setClickDown2(re4);
        //最近半年
        d.set(Calendar.DATE, d.get(Calendar.DATE)-180);
        int re5=goodsClickCustomMapper.selectAllClick(sdf.format(d.getTime()),shopId,1);
        int re6=goodsClickCustomMapper.selectAllClick(sdf.format(d.getTime()),shopId,-1);
        gdClick.setClickUp3(re5);
        gdClick.setClickDown3(re6);
        //半年以上
        String dat="2015/01/01";
        int re7=goodsClickCustomMapper.selectAllClick(dat,shopId,1);
        int re8=goodsClickCustomMapper.selectAllClick(dat,shopId,-1);
        gdClick.setClickUp4(re7);
        gdClick.setClickDown4(re8);
        return gdClick;
    }



}
