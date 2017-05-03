package com.swap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swap.po.Goods;
import com.swap.po.Users;
import com.swap.search.SearchGoods;
import com.swap.service.ShopsService;
import com.swap.service.UsersService;


@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private SearchGoods searchGoods;
    @Autowired
    private ShopsService shopsService;
    @Autowired
    private UsersService usersService;

    @RequestMapping("/searchGoods")
    public String searchGoods(HttpSession session,Model model,String goodsInfo,String shopsInfo,RedirectAttributes redirectAttributes)throws Exception{
        //物品搜索利用lucene检索技术，商店搜索使用sql语句“like”实现
        if(goodsInfo!=null&&goodsInfo!=""){
            List<Goods> goods=searchGoods.SearchGoodsInfo(goodsInfo);
            if(goods!=null){
                //查询当前用户的信息
                Users user=usersService.selectByPrimaryKey((Integer)session.getAttribute("id"));
                model.addAttribute("goods", goods);
                model.addAttribute("user", user);
                return "searchResult";
            }
            else{
                //无搜索记录跳转页面
                return "searchResultEmpty";
            }
        }
        else{
            //根据用户名查询出商店id，然后跳转到SellerCenController
            int shopsId = shopsService.selectByShopname(shopsInfo);
            if(shopsId>0){
                redirectAttributes.addAttribute("shopId", shopsId);
                return "redirect:/sellerCenter/sellerCenterSelect.action";
            }else{
                //无搜索记录跳转页面
                return "searchResultEmpty";
            }

        }
    }
}
