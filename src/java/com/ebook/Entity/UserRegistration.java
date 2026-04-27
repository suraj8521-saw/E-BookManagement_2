/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.Entity;
import java.sql.Timestamp;

/**
 *
 * @author suraj
 */
public class UserRegistration {
    
  private int registerId;
  private String userName;
  private String userMobile;
  private String userEmail;
  private String userPassword;
  private Timestamp userRegisterDate;
  private String userPhotoName;

    public UserRegistration() {
    }

    public UserRegistration(int registerId, String userName, String userMobile, String userEmail, String userPassword, Timestamp userRegisterDate) {
        this.registerId = registerId;
        this.userName = userName;
        this.userMobile = userMobile;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userRegisterDate = userRegisterDate;
    }

   

    public UserRegistration(String userName, String userMobile, String userEmail, String userPassword) {
        this.userName = userName;
        this.userMobile = userMobile;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
    }

    public UserRegistration(int registerId, String userName, String userMobile, String userEmail, String userPhotoName) {
        this.registerId = registerId;
        this.userName = userName;
        this.userMobile = userMobile;
        this.userEmail = userEmail;
        this.userPhotoName = userPhotoName;
    }
     

    public int getRegisterId() {
        return registerId;
    }

    public void setRegisterId(int registerId) {
        this.registerId = registerId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Timestamp getUserRegisterDate() {
        return userRegisterDate;
    }

    public void setUserRegisterDate(Timestamp userRegisterDate) {
        this.userRegisterDate = userRegisterDate;
    }
    
  public String getUserPhotoName() {
        return userPhotoName;
    }

    public void setUserPhotoName(String userPhotoName) {
        this.userPhotoName = userPhotoName;
    }
  
  
}
