package com.swap.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


/**
 * <p>Title:CustomExceptionResolver </p>
 * <p>Description:全局异常处理器 </p>
 * @author 郭光辉
 * @date 2015年9月12日下午4:18:06
 */
public class CustomExceptionResolver implements HandlerExceptionResolver{

    //handler就是处理器适配器要执行Handler对象（只有method）
    //ex是系统抛出的异常
    @Override
    public ModelAndView resolveException(HttpServletRequest request,
            HttpServletResponse response, Object handler, Exception ex) {

        //解析出异常类型
        CustomException customException=null;
        if(ex instanceof CustomException){
            //如果该异常类型是系统自定义的异常，直接取出异常信息，在错误页面展示
            customException=(CustomException)ex;
        }else{
            //如果该异常类型不是系统自定义的异常，构造一个自定义的异常类型（信息为“未知错误”）
            customException=new CustomException("出现未知错误！");
        }

        //错误信息
        String message=customException.getMessage();

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("message",message);
        modelAndView.setViewName("error");

        return modelAndView;
    }

}
