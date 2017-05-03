package com.swap.controller;



import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swap.po.Users;
import com.swap.po.UsersCustom;
import com.swap.service.LoginService;
import com.swap.validate.UsersGroup1;
import com.swap.validate.UsersGroup2;

/**
 * <p>Title:LoginController </p>
 * <p>Description: </p>
 * @author 郭光辉
 * @date 2015年9月15日下午8:43:13
 */
@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;

    /**
     * @param session
     * @param adress   登入成功后跳转到当前页面
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public String login(HttpServletResponse httpServletResponse,HttpServletRequest httpServletRequest,HttpSession session,
            Model model,@Validated(value={UsersGroup1.class}) UsersCustom usersCustom,BindingResult bindingResult,RedirectAttributes redirectAttributes)throws Exception{

        if(bindingResult.hasErrors()){
            //将错误信息传到页面
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            model.addAttribute("allErrors", allErrors);
            //验证不通过重新转向登入界面
            return "login";
        }
        //调用service进行用户身份验证
        int loginstatu=loginService.login(usersCustom.getUsername(), usersCustom.getPassword());
        if(loginstatu==-1){
            model.addAttribute("loginError", "密码不正确");
            return "login";
        }
        else if(loginstatu==0){
            model.addAttribute("loginError", "用户名不存在");
            return "login";
        }
        else{
            //登入成功，在Session中保存用户身份信息
            session.setAttribute("username",usersCustom.getUsername());
            session.setAttribute("id",loginstatu);
            //登入成功，设置Cookie
            httpServletRequest.setCharacterEncoding("utf-8");
            String[] isUseCookie=httpServletRequest.getParameterValues("isUseCookie");
            if(isUseCookie!=null&&isUseCookie.length>0)
            {
                String username=URLEncoder.encode(usersCustom.getUsername(),"UTF-8");
                Cookie cookie1 = new Cookie("username", username);
                Cookie cookie2 = new Cookie("password", usersCustom.getPassword());
                cookie1.setMaxAge(8640000);
                cookie2.setMaxAge(8640000);
                httpServletResponse.addCookie(cookie1);
                httpServletResponse.addCookie(cookie2);
            }
            else{
                Cookie[] cookies=httpServletRequest.getCookies();
                if(cookies!=null&&cookies.length>0)
                {
                    for(Cookie c:cookies)
                    {
                        if(c.getName().equals("username")||c.getName().equals("password"))
                        {
                            c.setMaxAge(0);//设置cookie失效
                            httpServletResponse.addCookie(c);//重新保存
                        }
                    }
                }
            }

            //根据不同的地址，执行不同的action
            String address=(String) session.getAttribute("adress");
            if(address!=null){
                if(address.equals("personaCenter1")){
                    return "redirect:/shops/queryPsersonCenter1.do";
                }
                else if(address.equals("index")){
                    return "redirect:/users/userQuery.action";
                }
                else if(address.equals("Blurb")){
                    return "redirect:/blurb/blurbQuery.action";
                }
                else if(address.equals("sellerCenter")){
                    return "redirect:/sellerCenter/sellerCenterSelect.action";
                }
                else{
                    redirectAttributes.addAttribute("address", session.getAttribute("adress"));
                    redirectAttributes.addAttribute("bigclassify", session.getAttribute("bigclassify"));
                    return "redirect:/allgoods/selectallgoodss.action";
                }
            }
            //address为空转到默认地址index.jsp
            else{
                return "redirect:/users/userQuery.action";
            }

        }
    }

    /**
     * 退出
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session)throws Exception{
        //清除session
        session.invalidate();
        return "index";
    }



    /**
     * 注册
     * @param session
     * @param username
     * @param password
     * @param validatenum
     * @return
     * @throws Exception
     */
    @RequestMapping("/register")
    public String register(HttpSession session,Model model,@Validated(value={UsersGroup2.class}) UsersCustom usersCustom,BindingResult bindingResult)throws Exception{
        if(bindingResult.hasErrors()){
            //将错误信息传到页面
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            model.addAttribute("allErrors", allErrors);
            //验证不通过重新转向注册界面
            return "register";
        }
        //验证验证码
        if (null == usersCustom.getValidatenum() || "".equals(usersCustom.getValidatenum())) {
            model.addAttribute("registerError", "验证码不能为空");
            return "register";
        }else {
            String certCode = session.getAttribute("certCode").toString();
            if (!certCode.equals(usersCustom.getValidatenum())) {
                model.addAttribute("registerError", "验证码不正确");
                return "register";
            }
        }
        //到此处说明用户名，密码不为空且验证码无误
        Users user=new Users();
        user.setUsername(usersCustom.getUsername());
        user.setPassword(usersCustom.getPassword());
        user.setHeadimg("swapdefult.jpg");
        int n=loginService.insertSelective(user);
        //返回的n判断用户名是否能够使用
        if(n==0){
            model.addAttribute("registerError", "用户名已被使用");
            return "register";
        }
        model.addAttribute("registerInfo", "注册成功，请登入");
        return "login";
    }
}
