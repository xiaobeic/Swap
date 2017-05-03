package com.swap.po;

import javax.validation.constraints.Size;

import com.swap.validate.UsersGroup1;
import com.swap.validate.UsersGroup2;
import com.swap.validate.UsersGroup3;

public class Users {

    private Integer id;

    @Size(min=1,max=20,message="{users.username.length}",groups={UsersGroup1.class,UsersGroup2.class})
    private String username;


    @Size(min=8,max=18,message="{users.password.length}",groups={UsersGroup1.class,UsersGroup2.class,UsersGroup3.class})
    private String password;

    private String headimg;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg == null ? null : headimg.trim();
    }
}