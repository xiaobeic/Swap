package com.swap.po;

import java.util.List;

public class ShopsCustom extends Shops{
    private String username;
    private String headimg;

    private List<Goods> goods;

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getHeadimg() {
        return headimg;
    }
    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }
    public List<Goods> getGoods() {
        return goods;
    }
    public void setGoods(List<Goods> goods) {
        this.goods = goods;
    }

}
