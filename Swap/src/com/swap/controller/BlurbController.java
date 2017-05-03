package com.swap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.swap.po.Goods;
import com.swap.po.GoodsClick;
import com.swap.po.GoodsCollection;
import com.swap.po.GoodsMessageCustom;
import com.swap.po.ShopsCollection;
import com.swap.po.ShopsCustom;
import com.swap.po.Users;
import com.swap.service.GoodsClickService;
import com.swap.service.GoodsCollectionService;
import com.swap.service.GoodsMessClickService;
import com.swap.service.GoodsMessageService;
import com.swap.service.GoodsService;
import com.swap.service.ShopsCollectionService;
import com.swap.service.ShopsService;
import com.swap.service.UsersService;

@RequestMapping("/blurb")
@Controller
public class BlurbController {

    @Autowired
    private ShopsService shopsService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodsClickService goodsClickService;
    @Autowired
    private GoodsMessageService goodsMessageService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private GoodsCollectionService goodsCollectionService;
    @Autowired
    private ShopsCollectionService shopsCollectionService;
    @Autowired
    private GoodsMessClickService goodsMessClickService;

    /**
    * <p>Title:blurbQuery </p>
    * <p>Description: </p>
    * <p>Company:查询Blurb的所有信息 </p>
    * @author guanghui
    * @date 2016年4月22日
     */
    @RequestMapping("/blurbQuery")
    public String blurbQuery(HttpSession session,Model model,Integer goods_id) throws Exception{
        //将商品id设置Session中，节省其他Controller跳转传参
        if(goods_id!=null){
            session.setAttribute("goods_id", goods_id);
        }
        else{
            goods_id=(Integer) session.getAttribute("goods_id");
        }

        //查询当前用户的信息
        Users user=usersService.selectByPrimaryKey((Integer)session.getAttribute("id"));
        //根据goods_id查询商品的信息
        Goods goods=goodsService.selectByPrimaryKey(goods_id);
        //根据goods.shopId查询物品所在商店和用户信息
        ShopsCustom shopsCustom=shopsService.userAndShopSelect(goods.getShopId());
        //根据当前用户id和goods.id查询用户点赞的信息
        List<GoodsClick> goodsClicks = goodsClickService.userAndGoodsSelect((Integer)session.getAttribute("id"), (Integer)session.getAttribute("goods_id"));
        GoodsClick goodsClick=null;
        if(goodsClicks.size()>0){
            goodsClick=goodsClicks.get(0);
        }
        //根据goods.id和当前用户id查询收藏物品的信息
        List<GoodsCollection> goodsCollections = goodsCollectionService.selectByUserAndGoods((Integer)session.getAttribute("id"), goods_id);
        GoodsCollection goodsCollection=null;
        if(goodsCollections.size()>0){
            goodsCollection=goodsCollections.get(0);
        }
        //根据shop.id和当前用户id查询收藏店铺的信息
        List<ShopsCollection> shopsCollections = shopsCollectionService.selectByUserAndShop((Integer)session.getAttribute("id"), goods.getShopId());
        ShopsCollection shopsCollection=null;
        if(shopsCollections.size()>0){
            shopsCollection=shopsCollections.get(0);
        }
        //根据goods.id查询商品评论信息
        List<GoodsMessageCustom> goodsMessage = goodsMessageService.goodsMessageSelect(goods.getId());
        //获得评论量总数
        int    goodsMesstotal=goodsMessage.size();



        model.addAttribute("user",user);
        model.addAttribute("goods",goods);
        model.addAttribute("shopsCustom",shopsCustom);
        model.addAttribute("goodsClick",goodsClick);
        model.addAttribute("goodsCollection",goodsCollection);
        model.addAttribute("shopsCollection",shopsCollection);
        model.addAttribute("goodsMessage",goodsMessage);
        model.addAttribute("goodsMesstotal",goodsMesstotal);
        return "Blurb";
    }
}
