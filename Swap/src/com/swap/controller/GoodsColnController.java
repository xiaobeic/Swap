package com.swap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swap.po.GoodsCollection;
import com.swap.service.GoodsCollectionService;

@RequestMapping("/goodsCollection")
@Controller
public class GoodsColnController {

    @Autowired
    private GoodsCollectionService goodsCollectionService;

    /**
    * <p>Title:goodsCollectionDelete </p>
    * <p>Description: 个人中心personCenter2-取消收藏-删除对应信息</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/goodsCollectionDelete")
    public @ResponseBody String goodsCollectionDelete(Integer id) throws Exception{
        goodsCollectionService.deleteByPrimaryKey(id);
        return "deleteSucc";
    }




    /**
    * <p>Title:goodsCollDelete </p>
    * <p>Description: /Blurb-取消收藏-删除对应信息</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/goodsCollDelete")
    public @ResponseBody String goodsCollDelete(Integer goodsCollId) throws Exception{
        goodsCollectionService.deleteByPrimaryKey(goodsCollId);
        return "deleteSucc";
    }


    /**
    * <p>Title:goodsCollAdd</p>
    * <p>Description: Blurb添加收藏发-对应信息</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/goodsCollAdd")
    public @ResponseBody String goodsCollAdd(HttpSession session) throws Exception{
        int userId=(Integer)session.getAttribute("id");
        int goods_id=(Integer)session.getAttribute("goods_id");
        List<GoodsCollection> goodsCollections = goodsCollectionService.selectByUserAndGoods(userId, goods_id);
        if(goodsCollections.size()==0){
            GoodsCollection goodsCollection=new GoodsCollection();
            goodsCollection.setUserId(userId);
            goodsCollection.setGoodId(goods_id);
            int n=goodsCollectionService.insertSelective(goodsCollection);
            return n+"";
        }
        else{
            return "0";
        }
    }

}
