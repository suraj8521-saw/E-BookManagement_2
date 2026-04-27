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
public class razorpayonlinepayment {
    private int onlinePayId;
    private String  razorpayOrderId   ;
    private double amount;
    private String   status  ;
    private String    userEmail ;
    private String    razorpaySignature ;
    private String    razorpayPaymentId ;
    private String    receipt ;
    private int registerId ;
    private Timestamp paymentDate;

    public razorpayonlinepayment() {
    }

    public razorpayonlinepayment(String razorpayOrderId, int registerId) {
        this.razorpayOrderId = razorpayOrderId;
        this.registerId = registerId;
    }

    public razorpayonlinepayment(int onlinePayId, String razorpayOrderId, double amount, String status, String userEmail, String razorpaySignature, String razorpayPaymentId, String receipt, int registerId, Timestamp paymentDate) {
        this.onlinePayId = onlinePayId;
        this.razorpayOrderId = razorpayOrderId;
        this.amount = amount;
        this.status = status;
        this.userEmail = userEmail;
        this.razorpaySignature = razorpaySignature;
        this.razorpayPaymentId = razorpayPaymentId;
        this.receipt = receipt;
        this.registerId = registerId;
        this.paymentDate = paymentDate;
    }

    public razorpayonlinepayment(String razorpayOrderId, String status, String razorpaySignature, String razorpayPaymentId, int registerId) {
        this.razorpayOrderId = razorpayOrderId;
        this.status = status;
        this.razorpaySignature = razorpaySignature;
        this.razorpayPaymentId = razorpayPaymentId;
        this.registerId = registerId;
    }

    public razorpayonlinepayment(String razorpayOrderId, double amount, String status, String userEmail, String receipt, int registerId) {
        this.razorpayOrderId = razorpayOrderId;
        this.amount = amount;
        this.status = status;
        this.userEmail = userEmail;
        this.receipt = receipt;
        this.registerId = registerId;
    }

    public razorpayonlinepayment(String razorpaySignature, String razorpayPaymentId) {
        this.razorpaySignature = razorpaySignature;
        this.razorpayPaymentId = razorpayPaymentId;
    }

    public int getOnlinePayId() {
        return onlinePayId;
    }

    public void setOnlinePayId(int onlinePayId) {
        this.onlinePayId = onlinePayId;
    }

    public String getRazorpayOrderId() {
        return razorpayOrderId;
    }

    public void setRazorpayOrderId(String razorpayOrderId) {
        this.razorpayOrderId = razorpayOrderId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getRazorpaySignature() {
        return razorpaySignature;
    }

    public void setRazorpaySignature(String razorpaySignature) {
        this.razorpaySignature = razorpaySignature;
    }

    public String getRazorpayPaymentId() {
        return razorpayPaymentId;
    }

    public void setRazorpayPaymentId(String razorpayPaymentId) {
        this.razorpayPaymentId = razorpayPaymentId;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public int getRegisterId() {
        return registerId;
    }

    public void setRegisterId(int registerId) {
        this.registerId = registerId;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    
}
