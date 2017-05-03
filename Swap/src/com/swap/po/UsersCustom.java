package com.swap.po;

import javax.validation.constraints.Size;

import com.swap.validate.UsersGroup3;

/**
* <p>Title:UsersCustom </p>
* <p>Description: Users类的属性扩展</p>
* <p>Company: </p>
* @author guanghui
* @date 2016年4月16日
*/
public class UsersCustom extends Users{

    @Size(min=8,max=18,message="{users.password.length}",groups={UsersGroup3.class})
    private String newPassword;

    @Size(min=8,max=18,message="{users.password.length}",groups={UsersGroup3.class})
    private String confirmPassword;

    private String validatenum;

    private String adress;
    public String getNewPassword() {
        return newPassword;
    }
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    public String getConfirmPassword() {
        return confirmPassword;
    }
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    public String getValidatenum() {
        return validatenum;
    }
    public void setValidatenum(String validatenum) {
        this.validatenum = validatenum;
    }
    public String getAdress() {
        return adress;
    }
    public void setAdress(String adress) {
        this.adress = adress;
    }

}
