package com.swap.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swap.po.GoodsMessage;
import com.swap.service.GoodsMessageService;

@RequestMapping("/goodsMessage")
@Controller
public class GoodsMesController {

    @Autowired
    private GoodsMessageService goodsMessageService;


    /**
    * <p>Title:goodsMesInsert </p>
    * <p>Description: 物品评论</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月29日
     */
    @RequestMapping("/goodsMesInsert")
    public @ResponseBody String goodsMesInsert(HttpSession session,GoodsMessage goodsMessage)throws Exception{
        String insertResult="insertFalse";
        if(goodsMessage.getMessage().length()==0||goodsMessage.getMessage()==""){
            insertResult="insertEmpty";
            return insertResult;
        }
        if(goodsMessage.getMessage().length()>100){
            insertResult="insertOverlen";
            return insertResult;
        }
        goodsMessage.setUserId((Integer)session.getAttribute("id"));
        goodsMessage.setPublishtime(new Date());
        int insertSelective = goodsMessageService.insertSelective(goodsMessage);
        if(insertSelective!=0){
            insertResult=insertSelective+"";
        }
        return insertResult;
    }
}
