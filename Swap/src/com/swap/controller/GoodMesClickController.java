package com.swap.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swap.po.GoodsMessClick;
import com.swap.service.GoodsMessClickService;

@RequestMapping("/goodMesClick")
@Controller
public class GoodMesClickController {

    @Autowired
    private GoodsMessClickService    goodsMessClickService;

    /**
    * <p>Title:goodsCollectionDelete </p>
    * <p>Description: Blurb评论点赞操作
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/goodMesClickInsert")
    public @ResponseBody String goodMesClickInsert(HttpSession session,Integer gdMessId) throws Exception{
        List<GoodsMessClick> goodMesClick = goodsMessClickService.selectByUserAndGdMess((Integer)session.getAttribute("id"), gdMessId);
        String gdMeClick="gdMesClickErr";
        if(goodMesClick.size()==0){
            GoodsMessClick goodsMessClick=new GoodsMessClick();
            goodsMessClick.setUserId((Integer)session.getAttribute("id"));
            goodsMessClick.setGdmessId(gdMessId);
            goodsMessClick.setClicktime(new Date());
            goodsMessClickService.insertSelective(goodsMessClick);
            gdMeClick="gdMesClickSucc";
        }
        return gdMeClick;
    }





}
