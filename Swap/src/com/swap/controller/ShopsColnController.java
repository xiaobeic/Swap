package com.swap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swap.po.ShopsCollection;
import com.swap.service.ShopsCollectionService;

@RequestMapping("/shopsCollection")
@Controller
public class ShopsColnController {

    @Autowired
    public ShopsCollectionService shopsCollectionService;


    /**
    * <p>Title:shopsCollectionDelete </p>
    * <p>Description:personaCenter3店铺收藏-取消收藏操作 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/shopsCollectionDelete")
    public @ResponseBody String shopsCollectionDelete(Integer id) throws Exception{
        shopsCollectionService.deleteByPrimaryKey(id);
        return "deleteSucc";
    }


    /**
    * <p>Title:goodsCollDelete </p>
    * <p>Description: /Blurb-取消店铺收藏-删除对应信息</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/shopsCollDelete")
    public @ResponseBody String shopsCollDelete(Integer shopsCollId) throws Exception{
        shopsCollectionService.deleteByPrimaryKey(shopsCollId);
        return "deleteCollSucc";
    }


    /**
    * <p>Title:goodsCollAdd</p>
    * <p>Description: Blurb添加店铺收藏发-对应信息</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/shopsCollAdd")
    public @ResponseBody String shopsCollAdd(HttpSession session,Integer shopId) throws Exception{
        //根据shopId和当前用户id查询商店收藏信息
        List<ShopsCollection> shopsCollections = shopsCollectionService.selectByUserAndShop((Integer)session.getAttribute("id"), shopId);
        String addInfo="0";
        if(shopsCollections.size()==0){
            ShopsCollection shopsController=new ShopsCollection();
            shopsController.setUserId((Integer)session.getAttribute("id"));
            shopsController.setShopId(shopId);
            int shopsCollId=shopsCollectionService.insertSelective(shopsController);
            addInfo=shopsCollId+"";
        }
        return addInfo;
    }


    /**
    * <p>Title:goodsCollDelete </p>
    * <p>Description: /Blurb-取消店铺收藏-删除对应信息</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/DeleteshopsColl")
    public @ResponseBody String DeleteshopsColl(Integer shopsCollId) throws Exception{
        String delShopsStaus="delShopColFalse";
        int n=shopsCollectionService.deleteByPrimaryKey(shopsCollId);
        if(n!=0){
            delShopsStaus="delShopColSucc";
        }
        return delShopsStaus;
    }


    /**
    * <p>Title:goodsCollAdd</p>
    * <p>Description: sellerCenter添加店铺收藏发-对应信息</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/AddshopsColl")
    public @ResponseBody String AddshopsColl(HttpSession session,Integer shopId) throws Exception{
        String addShopsStaus="addShopColFalse";
        //验证是否已经收藏
        List<ShopsCollection> shopsCollections=shopsCollectionService.selectByUserAndShop((Integer)session.getAttribute("id"), shopId);
        if(shopsCollections.size()>0){
            return addShopsStaus;
        }
        ShopsCollection shopsController=new ShopsCollection();
        shopsController.setUserId((Integer)session.getAttribute("id"));
        shopsController.setShopId(shopId);
        int n=shopsCollectionService.insertSelective(shopsController);
        if(n!=0){
            addShopsStaus=n+"";
        }
        return addShopsStaus;
    }
}
