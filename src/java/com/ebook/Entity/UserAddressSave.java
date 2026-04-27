/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.Entity;

/**
 *
 * @author suraj
 */
public class UserAddressSave {
    
    private int userAddressId;
    private String userName;
    private String  userMobile ;
    private String userVilage;
    private String userLandmark;
    private String userDistrict;
    private String userPincode ;
    private String userState;
    private String userEmail;

    public UserAddressSave() {
    }

    public UserAddressSave(int userAddressId, String userName, String userMobile, String userVilage, String userLandmark, String userDistrict, String userPincode, String userState, String userEmail) {
        this.userAddressId = userAddressId;
        this.userName = userName;
        this.userMobile = userMobile;
        this.userVilage = userVilage;
        this.userLandmark = userLandmark;
        this.userDistrict = userDistrict;
        this.userPincode = userPincode;
        this.userState = userState;
        this.userEmail = userEmail;
    }

    public UserAddressSave(String userName, String userMobile, String userVilage, String userLandmark, String userDistrict, String userPincode, String userState, String userEmail) {
        this.userName = userName;
        this.userMobile = userMobile;
        this.userVilage = userVilage;
        this.userLandmark = userLandmark;
        this.userDistrict = userDistrict;
        this.userPincode = userPincode;
        this.userState = userState;
        this.userEmail = userEmail;
    }

    public int getUserAddressId() {
        return userAddressId;
    }

    public void setUserAddressId(int userAddressId) {
        this.userAddressId = userAddressId;
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

    public String getUserVilage() {
        return userVilage;
    }

    public void setUserVilage(String userVilage) {
        this.userVilage = userVilage;
    }

    public String getUserLandmark() {
        return userLandmark;
    }

    public void setUserLandmark(String userLandmark) {
        this.userLandmark = userLandmark;
    }

    public String getUserDistrict() {
        return userDistrict;
    }

    public void setUserDistrict(String userDistrict) {
        this.userDistrict = userDistrict;
    }

    public String getUserPincode() {
        return userPincode;
    }

    public void setUserPincode(String userPincode) {
        this.userPincode = userPincode;
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    
    
    
}
