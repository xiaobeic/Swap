package com.swap.po;

import javax.validation.constraints.Pattern;

import com.swap.validate.GoodsGroup1;

public class GoodsCustom extends Goods {

    @Pattern(regexp="^[0-9]{0,8}$",message="{goodsCustom.originalprice.number}",groups={GoodsGroup1.class})
    private String originalprice_1;



    @Pattern(regexp="^[0-9]{0,8}$",message="{goodsCustom.evaluation.number}",groups={GoodsGroup1.class})
    private String evaluation_1;

    private String gcid;

    public String getGcid() {
        return gcid;
    }


    public void setGcid(String gcid) {
        this.gcid = gcid;
    }


    public String getOriginalprice_1() {
        return originalprice_1;
    }


    public void setOriginalprice_1(String originalprice_1) {
        this.originalprice_1 = originalprice_1;
    }


    public String getEvaluation_1() {
        return evaluation_1;
    }


    public void setEvaluation_1(String evaluation_1) {
        this.evaluation_1 = evaluation_1;
    }

}
