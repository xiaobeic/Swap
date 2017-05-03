package com.swap.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * <p>Title:CustomDateConverter </p>
 * <p>Description: 日期转换器</p>
 * @author 郭光辉
 * @date 2015年9月9日上午11:53:29
 */
public class CustomDateConverter implements Converter<String,Date>{

    @Override
    public Date convert(String source) {
        //实现将字符串转成日期类型（yyyy-MM-dd HH:mm:ss）
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //转换成功直接返回
            return simpleDateFormat.parse(source);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //如果参数绑定失败返回空
        return null;
    }

}
