package com.swap.po;

import java.util.Date;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import com.swap.validate.GoodsGroup1;

public class Goods {
	private Integer id;

	@Size(min=1,max=20,message="{goods.goodsname.length}",groups={GoodsGroup1.class})
    private String goodsname;

    private String quality;

    @Size(min=0,max=20,message="{goods.intention.length}",groups={GoodsGroup1.class})
    private String intention;

    private Date uploadtime;

    private Integer viewnumber;  
    
    private Integer originalprice;
   
    private Integer evaluation;

    @Size(min=0,max=100,message="{goods.sellerspeak.length}",groups={GoodsGroup1.class})
    private String sellerspeak;

    private String bigclassify;

    private String smallclassify;

    @Size(min=0,max=100,message="{goods.goodsmessage.length}",groups={GoodsGroup1.class})
    private String goodsmessage;

    private String goodsimg1;

    private String goodsimg2;

    private String goodsimg3;

    private Integer shopId;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
    }
    public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public String getIntention() {
        return intention;
    }

    public void setIntention(String intention) {
        this.intention = intention == null ? null : intention.trim();
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public Integer getViewnumber() {
        return viewnumber;
    }

    public void setViewnumber(Integer viewnumber) {
        this.viewnumber = viewnumber;
    }

    public Integer getOriginalprice() {
        return originalprice;
    }

    public void setOriginalprice(Integer originalprice) {
        this.originalprice = originalprice;
    }

    public Integer getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(Integer evaluation) {
        this.evaluation = evaluation;
    }

    public String getSellerspeak() {
        return sellerspeak;
    }

    public void setSellerspeak(String sellerspeak) {
        this.sellerspeak = sellerspeak == null ? null : sellerspeak.trim();
    }

    public String getBigclassify() {
        return bigclassify;
    }

    public void setBigclassify(String bigclassify) {
        this.bigclassify = bigclassify == null ? null : bigclassify.trim();
    }

    public String getSmallclassify() {
        return smallclassify;
    }

    public void setSmallclassify(String smallclassify) {
        this.smallclassify = smallclassify == null ? null : smallclassify.trim();
    }

    public String getGoodsmessage() {
        return goodsmessage;
    }

    public void setGoodsmessage(String goodsmessage) {
        this.goodsmessage = goodsmessage == null ? null : goodsmessage.trim();
    }

    public String getGoodsimg1() {
        return goodsimg1;
    }

    public void setGoodsimg1(String goodsimg1) {
        this.goodsimg1 = goodsimg1 == null ? null : goodsimg1.trim();
    }

    public String getGoodsimg2() {
        return goodsimg2;
    }

    public void setGoodsimg2(String goodsimg2) {
        this.goodsimg2 = goodsimg2 == null ? null : goodsimg2.trim();
    }

    public String getGoodsimg3() {
        return goodsimg3;
    }

    public void setGoodsimg3(String goodsimg3) {
        this.goodsimg3 = goodsimg3 == null ? null : goodsimg3.trim();
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }
}