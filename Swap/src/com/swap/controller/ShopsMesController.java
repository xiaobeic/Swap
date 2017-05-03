package com.swap.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swap.po.ShopsCustom;
import com.swap.po.ShopsMessage;
import com.swap.po.ShopsMessageCustom;
import com.swap.service.ShopsMessageService;
import com.swap.service.ShopsService;

@Controller
@RequestMapping("/shopsMessage")
public class ShopsMesController {

    @Autowired
    private ShopsService shopsService;

    @Autowired
    private ShopsMessageService shopsMessageService;

    /**
    * <p>Title:selectshopsMessage </p>
    * <p>Description: personaCenter4所有信息查询</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月21日
     */
    @RequestMapping("/selectshopsMessage")
    public String selectshopsMessage(HttpSession session,Model model) throws Exception {
        //根据用户id查询自己的商店和用户信息
        ShopsCustom shopsCustom=shopsService.userAndShopQuery((Integer)session.getAttribute("id"));
        //根据用户id查询留言
        List<ShopsMessageCustom> shopsMessage = shopsMessageService.selectByPrimary((Integer)session.getAttribute("id"));
        model.addAttribute("shopsCustom", shopsCustom);
        model.addAttribute("shopsMessage", shopsMessage);
        return "personaCenter4";
    }



    /**
    * <p>Title:selectshopsMessage </p>
    * <p>Description: 留言查询</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月21日
     */
    @RequestMapping("/selectByIdshopsMess")
    public @ResponseBody List<ShopsMessageCustom> selectByIdshopsMess(HttpSession session,Integer userid) throws Exception {
        //根据用户userid和当前用户id查询留言
        List<ShopsMessageCustom> shopsMessageCustoms = shopsMessageService.selectByIdshopsMess(userid, (Integer)session.getAttribute("id"));
        return shopsMessageCustoms;
    }


    /**
    * <p>shopsMessageDelete </p>
    * <p>Description: 个人中心personaCenter4-删除留言</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("/shopsMessageDelete")
    public @ResponseBody String shopsMessageDelete(Integer id) throws Exception{
        shopsMessageService.deleteByPrimaryKey(id);
        return "deleteSucc";
    }


    /**
    * <p>Title:shopsMessInsert </p>
    * <p>Description:留言插入 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月28日
     */
    @RequestMapping("/shopsMessInsert")
    public @ResponseBody String shopsMessInsert(HttpSession session,ShopsMessage shopsMessage)throws Exception{
        String insertResult="insertFalse";
        if(shopsMessage.getMessage().length()==0||shopsMessage.getMessage()==""){
            insertResult="insertEmpty";
            return insertResult;
        }
        if(shopsMessage.getMessage().length()>50){
            insertResult="insertOverlen";
            return insertResult;
        }
        shopsMessage.setMyId((Integer)session.getAttribute("id"));
        shopsMessage.setPublishtime(new Date());
        int insertSelective = shopsMessageService.insertSelective(shopsMessage);
        if(insertSelective!=0){
            insertResult="insertSucc";
        }
        return insertResult;
    }
}
