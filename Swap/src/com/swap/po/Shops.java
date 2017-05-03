package com.swap.po;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import com.swap.validate.ShopsGroup1;
import com.swap.validate.UsersGroup1;
import com.swap.validate.UsersGroup2;

public class Shops {
    private Integer id;

    @Size(min=1,max=20,message="{shops.shopname.length}",groups={ShopsGroup1.class})
    private String shopname;

   /* @Size(min=0,max=11,message="{shops.telephone.length}",groups={ShopsGroup1.class})*/
    @Pattern(regexp="(^[0-9]{0}$)|(^1[3|4|5|8][0-9]{9}$)",message="{shops.telephone.length}",groups={ShopsGroup1.class})
    private String telephone;

    @Size(min=0,max=12,message="{shops.qqnumber.length}",groups={ShopsGroup1.class})
    @Pattern(regexp="(^[0-9]{0}$)|(^[0-9]{5,12}$)",message="{shops.qqnumber.length}",groups={ShopsGroup1.class})
    private String qqnumber;

    @Email(message="{shops.email.iserr}",groups={ShopsGroup1.class})
    private String email;

    @Size(min=0,max=20,message="{shops.adress.length}",groups={ShopsGroup1.class})
    private String adress;

    private Integer reputationvalue;
    
    private Date createdate;

    @Size(min=0,max=50,message="{shops.announcement.length}",groups={ShopsGroup1.class})
    private String announcement;

    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname == null ? null : shopname.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getQqnumber() {
        return qqnumber;
    }

    public void setQqnumber(String qqnumber) {
        this.qqnumber = qqnumber == null ? null : qqnumber.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress == null ? null : adress.trim();
    }
    
    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getReputationvalue() {
        return reputationvalue;
    }

    public void setReputationvalue(Integer reputationvalue) {
        this.reputationvalue = reputationvalue;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement == null ? null : announcement.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}