package com.swap.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swap.po.GoodsClick;
import com.swap.po.Shops;
import com.swap.service.GoodsClickService;
import com.swap.service.ShopsService;

@RequestMapping("/goodsClick")
@Controller
public class GoodsClickController {
    @Autowired
    private GoodsClickService goodsClickService;
    @Autowired
    private ShopsService shopsService;

    /**
    * <p>Title:goodsClickInsert </p>
    * <p>Description:物品点赞操作 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月22日
     */
    @RequestMapping("/goodsClickInsert")
    public @ResponseBody String goodsClickInsert(HttpSession session,Integer shop_id,Integer num) throws Exception{
        //通过本人的id和物品的id查询GoodsClick表是否有记录，防止重复操作
        List<GoodsClick> userAndGoodsSelect = goodsClickService.userAndGoodsSelect((Integer)session.getAttribute("id"), (Integer)session.getAttribute("goods_id"));
        //如果等于0，无记录，进行插入信息，且信誉值进行+1或-1
        String clickStr="clickErr";
        if(userAndGoodsSelect.size()==0){
            //插入信息
            GoodsClick record=new GoodsClick();
            record.setClicktime(new Date());
            record.setUserId((Integer)session.getAttribute("id"));
            record.setGoodsId((Integer)session.getAttribute("goods_id"));
            record.setClickNum(num);
            record.setShopId(shop_id);
            goodsClickService.insertSelective(record);
            //信誉值进行+1或-1
            Shops shop=new Shops();
            shop.setId(shop_id);
            shop.setReputationvalue(num);
            shopsService.updateReputationvalue(shop);
            clickStr="clickSucc";
        }
        return clickStr;
    }
}
