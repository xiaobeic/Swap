package com.swap.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swap.po.Goods;
import com.swap.po.GoodsCustom;
import com.swap.po.ShopsCustom;
import com.swap.search.SearchGoods;
import com.swap.service.GoodsService;
import com.swap.service.ShopsService;
import com.swap.validate.GoodsGroup1;


@Controller
@RequestMapping("goods")
public class GoodsController {

    @Autowired
    public GoodsService goodsService;
    @Autowired
    public ShopsService shopsService;
    @Autowired
    public SearchGoods searchGoods;

    /**
    * <p>Title:goodsUpload </p>
    * <p>Description:物品上传 </p>
    * <p>Company: </p>
    *  RedirectAttributes:可带参数进行重定向，适用于spring3.1之后版本
    * @author guanghui
    * @date 2016年4月19日
     */
    @RequestMapping("goodsUpload")
    public String goodsUpload(HttpSession session,Model model,@Validated(value={GoodsGroup1.class}) GoodsCustom goodsCustom,BindingResult bindingResult,@RequestParam  MultipartFile[] goodsimgs,RedirectAttributes redirectAttributes) throws Exception{
        //验证字段
        if(bindingResult.hasErrors()){
            //将错误信息传到页面
            List<FieldError>  err=bindingResult.getFieldErrors();
            for (int i = 0; i < err.size(); i++) {
                model.addAttribute(err.get(i).getField()+"Error",err.get(i).getDefaultMessage());
            }
            for(int i=0;i<goodsimgs.length;i++){
                if(goodsimgs[i].getSize()==0){
                    model.addAttribute("goodsimgsError"+i,"请上传图片");
                }
            }
            //验证不通过重新转向上传界面，并把校验失败信息返回界面
            model.addAttribute("titleTab", "person2");
            return "forward:/shops/queryPsersonCenter1.do";
        }


        //验证图片字段
        if(goodsimgs[0].getSize()==0||goodsimgs[1].getSize()==0||goodsimgs[2].getSize()==0){
            for(int i=0;i<goodsimgs.length;i++){
                if(goodsimgs[i].getSize()==0){
                    model.addAttribute("goodsimgsError"+i,"请上传图片");
                }
            }
            //验证不通过重新转向上传界面，并把校验失败信息返回界面
            model.addAttribute("titleTab", "person2");
            return "forward:/shops/queryPsersonCenter1.do";
        }

        //插入数据前设置字段
        Goods goods=new  Goods();
        BeanUtils.copyProperties(goodsCustom,goods);   //copy对应的属性
        if(goodsCustom.getOriginalprice_1()!=null&&goodsCustom.getOriginalprice_1().length()>0){
            goods.setOriginalprice(Integer.parseInt(goodsCustom.getOriginalprice_1()));
        }
        if(goodsCustom.getEvaluation_1()!=null&&goodsCustom.getOriginalprice_1().length()>0){
            goods.setEvaluation(Integer.parseInt(goodsCustom.getEvaluation_1()));
        }
        if(goods.getQuality()!=null){
            goods.setQuality(goods.getQuality()+"成新");
        }
        goods.setUploadtime(new Date());

        ShopsCustom shopsCustom=shopsService.userAndShopQuery((Integer)session.getAttribute("id"));
        goods.setShopId(shopsCustom.getId());


        //物品图片上传
        for(int i=0;i<goodsimgs.length;i++){
            String originalFilename = goodsimgs[i].getOriginalFilename();
            if(goodsimgs[i] != null && originalFilename!=null&&originalFilename.length()>0){
                //存储图片的物理路径
                ResourceBundle resource = ResourceBundle.getBundle("path");
                String pic_path=resource.getString("upload.path");
                //    String pic_path="E:\\tomcat\\upload\\";
                //    String pic_path="/home/ubuntu/swapupload/";
                //生成新的名称
                String newFilename=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
                //新图片
                File newFile=new File(pic_path+newFilename);
                //将内存中的数据写入磁盘
                goodsimgs[i].transferTo(newFile);

                //将新图片名称写到itemsCustom中
                if(i==0){
                    goods.setGoodsimg1(newFilename);
                }
                else if(i==1){
                    goods.setGoodsimg2(newFilename);
                }
                else{
                    goods.setGoodsimg3(newFilename);
                }

            }
        }
        int insertGoods=goodsService.insertSelective(goods);

        if(insertGoods!=0){
            //数据库数据添加成功，添加索引文件
            goods.setId(insertGoods);
            searchGoods.AddGoodsInfo(goods);
        }



        //redirectAttributes可带参数进行重定向，把上传成功提示信息转到界面
        redirectAttributes.addFlashAttribute("uploadSuccess", "上传成功");
        redirectAttributes.addFlashAttribute("titleTab", "person2");
        return "redirect:/shops/queryPsersonCenter1.do";
    }

    /**
    * <p>Title:goodsDelete </p>
    * <p>Description:物品删除 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月20日
     */
    @RequestMapping("goodsDelete")
    public @ResponseBody String goodsDelete(Integer id) throws Exception{
        int delResult=goodsService.deleteByPrimaryKey(id);
        if(delResult!=0){
            //数据库数据删除成功，删除索引文件对应记录
            searchGoods.DeleteGoodsInfo(id);
        }
        return "deleteSucc";
    }

    /**
    * <p>Title:goodsCollectionSelect </p>
    * <p>Description:personcenter2全部信息查询 </p>
    * <p>Company: </p>
    * @author guanghui
     * @throws Exception
    * @date 2016年4月20日
     */
    @RequestMapping("/goodsCollectionSelect")
    public String goodsCollectionSelect(HttpSession session,Model model) throws Exception{
        //根据用户id查询商店和用户信息
        ShopsCustom shopsCustom=shopsService.userAndShopQuery((Integer)session.getAttribute("id"));
        //根据用户id查询查询收藏的物品信息
        List<GoodsCustom> goods=goodsService.goodsCollectionselectAll((Integer)session.getAttribute("id"));

        model.addAttribute("shopsCustom", shopsCustom);
        model.addAttribute("goods",goods);
        return "personaCenter2";
    }
}
