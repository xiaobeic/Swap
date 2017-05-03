package com.swap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.swap.po.GoodsClickTotal;
import com.swap.po.GoodsCustom;
import com.swap.po.ShopsCollection;
import com.swap.po.ShopsCustom;
import com.swap.po.Users;
import com.swap.service.GoodsClickService;
import com.swap.service.GoodsService;
import com.swap.service.ShopsCollectionService;
import com.swap.service.ShopsService;
import com.swap.service.UsersService;

@RequestMapping("sellerCenter")
@Controller
public class SellerCenController {

    @Autowired
    private UsersService usersService;
    @Autowired
    private ShopsService shopsService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private ShopsCollectionService shopsCollectionService;
    @Autowired
    private GoodsClickService goodsClickService;

    @RequestMapping("/sellerCenterSelect")
    public String sellerCenterSelect(HttpSession session,Model model,Integer shopId) throws Exception{
        //将商品id设置Session中，节省其他Controller跳转传参
        if(shopId!=null){
            session.setAttribute("shopId", shopId);
        }
        else{
            shopId=(Integer) session.getAttribute("shopId");
        }
        //查询当前用户的信息
        Users user=usersService.selectByPrimaryKey((Integer)session.getAttribute("id"));
        //根据shopId查询物品所在商店和用户信息
        ShopsCustom shopsCustom=shopsService.userAndShopSelect(shopId);
        //根据shopId查询商店的物品
        List<GoodsCustom> goodsCustoms=goodsService.selectAllByShopId(shopId);
        //根据shopId和当前用户id查询商店收藏信息
        List<ShopsCollection> shopsCollections = shopsCollectionService.selectByUserAndShop((Integer)session.getAttribute("id"), shopId);
        ShopsCollection shopsCollection=null;
        if(shopsCollections.size()>0){
            shopsCollection=shopsCollections.get(0);
        }
        //查询商店的点赞情况
        GoodsClickTotal goodsClickTotals=goodsClickService.selectAllClick(shopId);

        model.addAttribute("user", user);
        model.addAttribute("shopsCustom", shopsCustom);
        model.addAttribute("goodsCustom", goodsCustoms);
        model.addAttribute("shopsCollection", shopsCollection);
        model.addAttribute("goodsClickTotals", goodsClickTotals);

        return "sellerCenter";
    }
}
