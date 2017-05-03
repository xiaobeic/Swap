package com.swap.po;

import java.util.Date;

public class ShopsMessage {
    private Integer id;

    private String message;

    private Date publishtime;

    private Integer userId;

    private Integer myId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public Date getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(Date publishtime) {
        this.publishtime = publishtime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getMyId() {
        return myId;
    }

    public void setMyId(Integer myId) {
        this.myId = myId;
    }

}