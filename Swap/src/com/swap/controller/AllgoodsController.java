package com.swap.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swap.po.GoodsAndPageVo;
import com.swap.po.GoodsCustom;
import com.swap.po.Page;
import com.swap.po.Users;
import com.swap.service.GoodsService;
import com.swap.service.UsersService;

@Controller
@RequestMapping("/allgoods")
public class AllgoodsController {

    @Autowired
    public GoodsService goodsService;
    @Autowired
    public UsersService usersService;

    /**
    * <p>Title:selectallgoods </p>
    * <p>Description:根据小分类查询所有对应信息 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月29日
     */
    @RequestMapping("/selectallgoods")
    @ResponseBody
    public GoodsAndPageVo selectallgoods(HttpServletRequest request,HttpSession session,Model model,Integer pageNow,String smallclassify)throws Exception {
        //从session中获取bigclassify
        String bigclassify=(String) session.getAttribute("bigclassify");
        if(smallclassify!=null){
            session.setAttribute("smallclassify", smallclassify);
        }else{
            smallclassify=(String) session.getAttribute("smallclassify");
        }
        //分页查询小分类下的所有物品
        Page page = null;
        int totalCount = goodsService.getSmallclassifysCount(bigclassify,smallclassify);
        if (pageNow != null) {
            page = new Page(totalCount, pageNow);
        } else {
            page = new Page(totalCount, 1);
        }
        List<GoodsCustom> goodsCustom = goodsService.selectBygoodsname(page,bigclassify,smallclassify);
        GoodsAndPageVo goodsAndPageVo=new GoodsAndPageVo();
        goodsAndPageVo.setGoodsCustom(goodsCustom);
        goodsAndPageVo.setPage(page);
        return goodsAndPageVo;
    }

    /**
    * <p>Title:selectallgoodss </p>
    * <p>Description:根据大分类查询所有的对应信息 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月29日
     */
    @RequestMapping("/selectallgoodss")
    public String selectallgoodss(HttpSession session,HttpServletRequest request, Model model,String bigclassify,Integer pageNow,String address) throws Exception {
        if(bigclassify!=null){
            bigclassify = new String(request.getParameter("bigclassify").getBytes("ISO-8859-1"), "UTF-8");
            session.setAttribute("bigclassify", bigclassify);
        }else{
            bigclassify=(String) session.getAttribute("bigclassify");
        }
        if(address!=null){
            session.setAttribute("address", address);
        }else{
            address=(String) session.getAttribute("address");
        }

        //查询当前用户的信息
        Integer user_id=(Integer)session.getAttribute("id");
        Users user=null;
        if(user_id!=null){
             user=usersService.selectByPrimaryKey(user_id);
        }

        //分页查询大分类下的所有物品
        Page page = null;
        int totalCount = goodsService.getBigclassifysCount(bigclassify);
        if (pageNow != null) {
            page = new Page(totalCount, pageNow);
        } else {
            page = new Page(totalCount, 1);
        }
        List<GoodsCustom> goodsCustom = goodsService.selectAllBygoodsname(page,bigclassify);
        model.addAttribute("goodsCustom", goodsCustom);
        model.addAttribute("page", page);
        model.addAttribute("user", user);
        return address;
    }
}
