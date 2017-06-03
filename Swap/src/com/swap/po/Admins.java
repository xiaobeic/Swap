package com.swap.po;

import javax.validation.constraints.Size;

import com.swap.validate.AdminsGroup1;

public class Admins {

    private Integer id;

    @Size(min=1,max=20,message="{admin.username.length}",groups={AdminsGroup1.class})
    private String adminname;

    @Size(min=6,max=18,message="{admin.password.length}",groups={AdminsGroup1.class})
    private String password;

    private String logintime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogintime() {
        return logintime;
    }

    public void setLogintime(String logintime) {
        this.logintime = logintime;
    }

}