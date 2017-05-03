package com.swap.po;

import java.util.List;

public class GoodsAndPageVo {
    private List<GoodsCustom> goodsCustom;
    private Page page;

    public List<GoodsCustom> getGoodsCustom() {
        return goodsCustom;
    }
    public void setGoodsCustom(List<GoodsCustom> goodsCustom) {
        this.goodsCustom = goodsCustom;
    }
    public Page getPage() {
        return page;
    }
    public void setPage(Page page) {
        this.page = page;
    }

}
