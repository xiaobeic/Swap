package com.swap.po;

import java.util.Date;

public class GoodsMessClick {
    private Integer id;

    private Date clicktime;

    private Integer userId;

    private Integer gdmessId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getClicktime() {
        return clicktime;
    }

    public void setClicktime(Date clicktime) {
        this.clicktime = clicktime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGdmessId() {
        return gdmessId;
    }

    public void setGdmessId(Integer gdmessId) {
        this.gdmessId = gdmessId;
    }
}