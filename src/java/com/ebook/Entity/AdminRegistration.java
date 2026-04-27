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
public class AdminRegistration {
    
     private int adminRegistrationId;
  private String adminName;
  private String adminMobile;
  private String adminEmail;
  private String adminPassword;
  private Timestamp adminRegisterDate;

    public AdminRegistration() {
    }

    public AdminRegistration(String adminName, String adminMobile, String adminEmail, String adminPassword) {
        this.adminName = adminName;
        this.adminMobile = adminMobile;
        this.adminEmail = adminEmail;
        this.adminPassword = adminPassword;
    }
    

    public AdminRegistration(int adminRegistrationId, String adminName, String adminMobile, String adminEmail, String adminPassword, Timestamp adminRegisterDate) {
        this.adminRegistrationId = adminRegistrationId;
        this.adminName = adminName;
        this.adminMobile = adminMobile;
        this.adminEmail = adminEmail;
        this.adminPassword = adminPassword;
        this.adminRegisterDate = adminRegisterDate;
    }

    public int getAdminRegistrationId() {
        return adminRegistrationId;
    }

    public void setAdminRegistrationId(int adminRegistrationId) {
        this.adminRegistrationId = adminRegistrationId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminMobile() {
        return adminMobile;
    }

    public void setAdminMobile(String adminMobile) {
        this.adminMobile = adminMobile;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public Timestamp getAdminRegisterDate() {
        return adminRegisterDate;
    }

    public void setAdminRegisterDate(Timestamp adminRegisterDate) {
        this.adminRegisterDate = adminRegisterDate;
    }
  
}
