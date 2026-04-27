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
public class AdminOrderConfirm {
    
    private int confirmedId;
    private int bookId;
    private String bookName;
    private String bookAuthor;
    private String bookPhotoName;
    private int bookQuantity;
    private double totalPrice;
    private String paymentMethod;
    private String userName;
    private String userMobile;
    private String userEmail;
    private String userVillage;
    private String userLandmark;
    private String userDistrict;
    private String userPincode;
    private String userState;
    private Timestamp orderedDate;
     private Timestamp orderConfirmedDate;
     private String orderStatus;
     private String receipt;

    public AdminOrderConfirm() {
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public AdminOrderConfirm(int confirmedId, int bookId, String bookName, String bookAuthor, String bookPhotoName, int bookQuantity, double totalPrice, String paymentMethod, String userName, String userMobile, String userEmail, String userVillage, String userLandmark, String userDistrict, String userPincode, String userState, Timestamp orderedDate, Timestamp orderConfirmedDate, String orderStatus) {
        this.confirmedId = confirmedId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPhotoName = bookPhotoName;
        this.bookQuantity = bookQuantity;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.userName = userName;
        this.userMobile = userMobile;
        this.userEmail = userEmail;
        this.userVillage = userVillage;
        this.userLandmark = userLandmark;
        this.userDistrict = userDistrict;
        this.userPincode = userPincode;
        this.userState = userState;
        this.orderedDate = orderedDate;
        this.orderConfirmedDate = orderConfirmedDate;
        this.orderStatus = orderStatus;
    }

    public AdminOrderConfirm(int bookId, String bookName, String bookAuthor, String bookPhotoName, int bookQuantity, double totalPrice, String paymentMethod, String userName, String userMobile, String userEmail, String userVillage, String userLandmark, String userDistrict, String userPincode, String userState, Timestamp orderedDate, String orderStatus,String receipt) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPhotoName = bookPhotoName;
        this.bookQuantity = bookQuantity;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.userName = userName;
        this.userMobile = userMobile;
        this.userEmail = userEmail;
        this.userVillage = userVillage;
        this.userLandmark = userLandmark;
        this.userDistrict = userDistrict;
        this.userPincode = userPincode;
        this.userState = userState;
        this.orderedDate = orderedDate;
        this.orderStatus = orderStatus;
        this.receipt=receipt;
    }

    public AdminOrderConfirm(int confirmedId) {
        this.confirmedId = confirmedId;
    }

    public int getConfirmedId() {
        return confirmedId;
    }

    public void setConfirmedId(int confirmedId) {
        this.confirmedId = confirmedId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPhotoName() {
        return bookPhotoName;
    }

    public void setBookPhotoName(String bookPhotoName) {
        this.bookPhotoName = bookPhotoName;
    }

    public int getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(int bookQuantity) {
        this.bookQuantity = bookQuantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
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

    public String getUserVillage() {
        return userVillage;
    }

    public void setUserVillage(String userVillage) {
        this.userVillage = userVillage;
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

    public Timestamp getOrderedDate() {
        return orderedDate;
    }

    public void setOrderedDate(Timestamp orderedDate) {
        this.orderedDate = orderedDate;
    }

    public Timestamp getOrderConfirmedDate() {
        return orderConfirmedDate;
    }

    public void setOrderConfirmedDate(Timestamp orderConfirmedDate) {
        this.orderConfirmedDate = orderConfirmedDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
     
     
    
    
}
