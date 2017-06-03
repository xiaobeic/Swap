package com.swap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swap.po.GoodsCustom;
import com.swap.po.Page;
import com.swap.po.Shops;
import com.swap.po.ShopsCollection;
import com.swap.po.ShopsCustom;
import com.swap.service.GoodsService;
import com.swap.service.ShopsService;
import com.swap.service.UsersService;
import com.swap.validate.ShopsGroup1;

@RequestMapping("/shops")
@Controller
public class ShopsController {
    /*
     * 店铺增删改查
     */
    @Autowired
    private ShopsService shopsService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private GoodsService goodsService;

    /**
    * <p>Title:updateshops </p>
    * <p>Description: 店铺信息更新</p>
    * <p>Company: </p>
    * RedirectAttributes:可带参数进行重定向，适用于spring3.1之后版本
    * @author guanghui
    * @date 2016年4月19日
     */
    @RequestMapping("/updateshops")
    public String updateshops(Model model,@Validated(value={ShopsGroup1.class}) ShopsCustom shopsCustom,BindingResult bindingResult,RedirectAttributes redirectAttributes) throws Exception {
        //验证字段
        if(bindingResult.hasErrors()){
            //将错误信息传到页面
            List<FieldError>  err=bindingResult.getFieldErrors();
            for (int i = 0; i < err.size(); i++) {
                model.addAttribute(err.get(i).getField()+"Error",err.get(i).getDefaultMessage());
            }
            //验证不通过重新转向上传界面，并把校验失败信息返回界面
            model.addAttribute("titleTab", "person3");
            return "forward:/shops/queryPsersonCenter1.action";
        }
        Shops shops=new Shops();
        BeanUtils.copyProperties(shopsCustom,shops);
        shops.setId(shopsCustom.getId());
        shopsService.updateByPrimaryKeySelective(shops);

        //redirectAttributes可带参数进行重定向，把上传成功提示信息转到界面
        redirectAttributes.addFlashAttribute("updateSuccess", "更新成功");
        redirectAttributes.addFlashAttribute("titleTab", "person3");
        return "redirect:/shops/queryPsersonCenter1.do";
    }

    /**
    * <p>Title:queryShops </p>
    * <p>Description:personaCenter1所有信息查询 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月19日
     */
    @RequestMapping("/queryPsersonCenter1")
    public String queryShops(HttpSession session,Model model) throws Exception{
        //根据用户id查询商店和用户信息
        ShopsCustom shopsCustom=shopsService.userAndShopQuery((Integer)session.getAttribute("id"));
        //根据商店id查询物品信息
        List<GoodsCustom> goods=goodsService.selectAllByShopId(shopsCustom.getId());

        model.addAttribute("shopsCustom", shopsCustom);
        model.addAttribute("goods",goods);
        return "personaCenter1";
    }

    /**
    * <p>Title:shopsColSelect </p>
    * <p>Description: personCenter3所有信息查询</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/shopsCollectionSelect")
    public String shopsCollectionSelect(HttpSession session,Model model) throws Exception{
        //根据用户id查询自己的商店和用户信息
        ShopsCustom shopsCustom=shopsService.userAndShopQuery((Integer)session.getAttribute("id"));
        //根据用户id查询收藏的商店，用户和物品信息
        List<ShopsCollection> shopsCollection=shopsService.shopsCollectionSelect((Integer)session.getAttribute("id"));
        //根据商店id查询物品信息
        model.addAttribute("shopsCustom", shopsCustom);
        model.addAttribute("shopsCollection", shopsCollection);

        return "personaCenter3";
    }


    /**
    * <p>Title:adminQueryShops </p>
    * <p>Description: </p>
    * @author Shane
    * @date 2017年5月29日
     */
    @RequestMapping("adminQueryShops")
    public ModelAndView adminQueryShops(Integer pageNow) throws Exception{
        ModelAndView modelAndView = new ModelAndView();

      //分页查询所有店铺
        Page page = null;
        int totalCount = shopsService.getShopsCount();
        if (pageNow != null) {
            page = new Page(totalCount, pageNow);
        } else {
            page = new Page(totalCount, 1);
        }
        page.setPageSize(10);
        if (pageNow != null && pageNow > page.getTotalPageCount()) {
            page.setPageNow(page.getTotalPageCount());
        }

        List<ShopsCustom> shopsCustoms = shopsService.adminQueryShops(page);
        modelAndView.setViewName("shopManagement");
        modelAndView.addObject("shopsCustoms", shopsCustoms);
        modelAndView.addObject("page", page);
        return modelAndView;
    }


    /**
     * <p>Title:adminDeleteShop </p>
     * <p>Description: </p>
     * @author Shane
     * @date 2017年5月31日
      */
     @RequestMapping("adminDeleteShop")
     public String adminDeleteShop(Integer shopId,HttpSession session) throws Exception {
     	int status = shopsService.deleteByPrimaryKey(shopId);
     	if (status == 1) {
     		session.setAttribute("opeMessage", "删除成功");
     	} else {
     		session.setAttribute("opeMessage", "删除失败");
     	}
     	return "redirect:/shops/adminQueryShops.action";
     }

     /**
      * <p>Title:adminSearchShop </p>
      * <p>Description: </p>
      * @author Shane
      * @date 2017年5月31日
       */
      @RequestMapping("adminSearchShop")
      public ModelAndView adminSearchShop(String keyword) throws Exception {
      	ModelAndView modelAndView = new ModelAndView();

      	  List<ShopsCustom> shopsCustoms = shopsService.adminSearchShop(keyword);
          modelAndView.setViewName("shopManagement");
          modelAndView.addObject("shopsCustoms", shopsCustoms);
          modelAndView.addObject("keyword", keyword);

      	return modelAndView;
      }
}
