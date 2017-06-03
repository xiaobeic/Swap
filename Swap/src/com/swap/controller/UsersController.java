package com.swap.controller;

import java.io.File;
import java.util.List;
import java.util.ResourceBundle;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swap.po.Page;
import com.swap.po.ShopsCustom;
import com.swap.po.Users;
import com.swap.po.UsersCustom;
import com.swap.service.ShopsService;
import com.swap.service.UsersService;
import com.swap.validate.UsersGroup3;

@RequestMapping("/users")
@Controller
public class UsersController {
//用户更新密码
    @Autowired
    private UsersService usersService;
    @Autowired
    private ShopsService shopsService;

    @RequestMapping("/ChangePassword")//更新用户密码
    public String ChangePassword(HttpSession session,Model model,@Validated(value={UsersGroup3.class}) UsersCustom usersCustom,BindingResult bindingResult,RedirectAttributes redirectAttributes)throws Exception{
        //验证字段
        if(bindingResult.hasErrors()){
            //将错误信息传到页面
            List<FieldError>  err=bindingResult.getFieldErrors();
            for (int i = 0; i < err.size(); i++) {
                model.addAttribute(err.get(i).getField()+"Error",err.get(i).getDefaultMessage());
            }
            if(!usersCustom.getNewPassword().equals(usersCustom.getConfirmPassword())){
                 model.addAttribute("ocPasswordError","两次输入的密码不相同");
            }
            //验证不通过重新转向上传界面
            return "forward:/users/userAndShopQuery.do";
        }
        //验证两次密码是否输入相同
        if(!usersCustom.getNewPassword().equals(usersCustom.getConfirmPassword())){
             model.addAttribute("ocPasswordError","两次输入的密码不相同");
             return "forward:/users/userAndShopQuery.do";
        }
        //验证原密码是否输入正确
        Integer ids=(Integer)session.getAttribute("id");
        Users u=usersService.selectByPrimaryKey(ids);
        if(!u.getPassword().equals(usersCustom.getPassword())){
            model.addAttribute("passwordIsError","输入的密码不正确");
            return "forward:/users/userAndShopQuery.do";
        }

        Users user=new Users();
        user.setId(ids);
        user.setPassword(usersCustom.getNewPassword());
        usersService.updateByPrimaryKeySelective(user);
        redirectAttributes.addFlashAttribute("passSuccess", "修改成功");
        return "redirect:/users/userAndShopQuery.do";
    }


    /**
    * <p>Title:Uploadhead </p>
    * <p>Description: 个人中心头像上传</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月21日
     */
    @RequestMapping("/Uploadhead")
    public String Uploadhead(HttpSession session,MultipartFile user_pic,RedirectAttributes redirectAttributes)throws Exception{
        //上传图片
        //原始名称
        String originalFilename =user_pic.getOriginalFilename();
        if(user_pic != null && originalFilename!=null&&originalFilename.length()>0){
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
            user_pic.transferTo(newFile);

            Users users=new Users();
            users.setId((Integer)session.getAttribute("id"));
            //将新图片名称写到itemsCustom中
            users.setHeadimg(newFilename);
            usersService.updateByPrimaryKeySelective(users);
            redirectAttributes.addFlashAttribute("updateHeadSuc", "上传成功");
        }

        //重定向
        redirectAttributes.addFlashAttribute("accountTab", "account2");
        return "redirect:/users/userAndShopQuery.do";

    }


    /**
    * <p>Title:userAndShopQuery </p>
    * <p>Description: personaCenter5所有信息查询</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月21日
     */
    @RequestMapping("/userAndShopQuery")
    public String userAndShopQuery(HttpSession session,Model model) throws Exception{
        //根据用户id查询自己的商店和用户信息
        ShopsCustom shopsCustom=shopsService.userAndShopQuery((Integer)session.getAttribute("id"));
        model.addAttribute("shopsCustom", shopsCustom);
        return "personaCenter5";
    }


    /**
    * <p>Title:userAndShopQuery </p>
    * <p>Description: index.jsp所有信息查询</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年4月21日
     */
    @RequestMapping("/userQuery")
    public String userQuery(HttpSession session,Model model) throws Exception{
        //根据用户id查询自己的商店和用户信息
        Integer id=(Integer) session.getAttribute("id");
        if(id!=null){
            ShopsCustom shopsCustom=shopsService.userAndShopQuery(id);
            model.addAttribute("shopsCustom", shopsCustom);
        }
        return "index";
    }

    /**
    * <p>Title:adminQueryUsers </p>
    * <p>Description: </p>
    * @author Shane
    * @date 2017年5月27日
     */
    @RequestMapping("adminQueryUsers")
    public ModelAndView adminQueryUsers(Integer pageNow) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        //分页查询所有用户
        Page page = null;
        int totalCount = usersService.getUsersCount();
        if (pageNow != null) {
            page = new Page(totalCount, pageNow);
        } else {
            page = new Page(totalCount, 1);
        }
        page.setPageSize(10);
        if (pageNow != null && pageNow > page.getTotalPageCount()) {
            page.setPageNow(page.getTotalPageCount());
        }

        List<Users> users = usersService.adminQueryUsers(page);
        modelAndView.setViewName("userManagement");
        modelAndView.addObject("users", users);
        modelAndView.addObject("page", page);
        return modelAndView;
    }

    /**
    * <p>Title:adminDeleteUser </p>
    * <p>Description: </p>
    * @author Shane
    * @date 2017年5月31日
     */
    @RequestMapping("adminDeleteUser")
    public String adminDeleteUser(Integer userId,HttpSession session) throws Exception {
    	int status = usersService.deleteByPrimaryKey(userId);
    	if (status == 1) {
    		session.setAttribute("opeMessage", "删除成功");
    	} else {
    		session.setAttribute("opeMessage", "删除失败");
    	}
    	return "redirect:/users/adminQueryUsers.action";
    }

    /**
    * <p>Title:adminSearchUsers </p>
    * <p>Description: </p>
    * @author Shane
    * @date 2017年5月31日
     */
    @RequestMapping("adminSearchUsers")
    public ModelAndView adminSearchUsers(String keyword) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();

    	List<Users> users = usersService.adminSearchUsers(keyword);
        modelAndView.setViewName("userManagement");
        modelAndView.addObject("users", users);
        modelAndView.addObject("keyword", keyword);

    	return modelAndView;
    }

}
