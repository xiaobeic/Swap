package com.swap.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
* <p>Title:LoginInterceptor </p>
* <p>Description:登入认证的拦截器 </p>
* @author 郭光辉
* @date 2015年9月15日下午8:49:46
 */
public class LoginInterceptor implements HandlerInterceptor{

    /**
     * 这个方法在业务处理器处理请求之前被调用，在该方法中对用户请求request进行处理。
     * 如果程序员决定改拦截器对请求进行拦截处理后还要调用其他的拦截器，或者是业务处理
     * 器去进行处理，则返回true，如果程序员决定不需要再调用其他的组件去处理请求，则返回false
     *
     * 用于身份认证、身份权限，日志，事务等
     * 若果认证不通过，需要拦截方法不在继续向下执行
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object arg2) throws Exception {
        //获取请求的url
        String url=request.getRequestURI();
        //判断url是否为公开地址，以.action结尾的请求是公开地址，以.do结尾的请求不公开
        if(url.indexOf(".action")>=0){
            return true;
        }

        //判断session
        HttpSession session=request.getSession();
        String username = (String) session.getAttribute("username");
        if(username != null){
            //身份存在，放行
            return true;
        }
        //执行到这里表示用户身份需要认证，跳转登入页面
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        return false;
    }


    /**
     * 该方法在业务处理器处理完请求后，但是DispatcherServlet向客户端返回响应前被调用
     * 在该方法中对用户请求request进行处理
     *
     * 可以对请求域中的属性或视图进行修改
     */
    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
            Object arg2, ModelAndView arg3) throws Exception {
    }



    /**
     * 该方法在DispatcherServlet完全处理完请求后被调用，
     *
     * 可以在该方法中进行一些资源清理的操作，统一异常处理
     */
    @Override
    public void afterCompletion(HttpServletRequest arg0,
            HttpServletResponse arg1, Object arg2, Exception arg3)throws Exception {

    }
}
