package com.swap.po;

public class ShopsCollection {
    private Integer id;

    private Integer userId;

    private Integer shopId;

    private ShopsCustom shopsCustom;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public ShopsCustom getShopsCustom() {
        return shopsCustom;
    }

    public void setShopsCustom(ShopsCustom shopsCustom) {
        this.shopsCustom = shopsCustom;
    }
}