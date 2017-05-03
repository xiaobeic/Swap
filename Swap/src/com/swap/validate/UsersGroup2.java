package com.swap.validate;



/**
 * <p>Title:ValidGroup1 </p>
 * <p>Description: 校验分组</p>
 * @author 郭光辉
 * @date 2015年9月11日上午9:44:33
 */
public interface UsersGroup2 {
    //接口中不需要定义任何方法，仅是区分不同的校验规则进行分组
    //次分组只校验商品名称的长度，在po中如下：
       /*@Size(min=1,max=30,message="{items.name.length.error}",groups={ValidGroup1.class})*/
    //在handler引用如下：
       /*@Validated(value={ValidGroup1.class})*/
}
