package com.swap.exception;
/**
 * <p>Title:CustomException </p>
 * <p>Description: 系统自定义异常类,针对预期的异常需要在程序中抛出此类的异常</p>
 * @author 郭光辉
 * @date 2015年9月12日下午4:07:14
 */
public class CustomException extends Exception{
    //异常信息
    public String message;

    public CustomException(String message){
        super(message);
        this.message=message;
    }

    @Override
	public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
