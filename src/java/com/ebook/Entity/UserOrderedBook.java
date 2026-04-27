/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.Entity;
import java.sql.Timestamp; // ✅ Sahi


/**
 *
 * @author suraj
 */
public class UserOrderedBook {
    private int bookOrderedId;
    private int bookId;
    private String bookName;
    private String BookAuthor;
    private int orderedBookQuantity ;
    private double orderedBookTotalPrice ;
    private String orderedBookPhotoName;
    private String orderedUserName;
    private String orderedUserMobileNo;
    private String orderedUserEmail;
    private String orderedUserVilage;
    private String orderedUserLandmark;
    private String orderedUserDistrict;
    private String orderedUserPincode;
    private String orderedUserState;
    private String paymentMethod;
    private int userAddressId;
    private Timestamp orderedDate;
    private String receipt;

    public UserOrderedBook() {
    }

    public UserOrderedBook(int bookId, String bookName, String BookAuthor, int orderedBookQuantity, double orderedBookTotalPrice, String orderedBookPhotoName, String orderedUserName, String orderedUserMobileNo, String orderedUserEmail, String orderedUserVilage, String orderedUserLandmark, String orderedUserDistrict, String orderedUserPincode, String orderedUserState, String paymentMethod, int userAddressId, String receipt) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.BookAuthor = BookAuthor;
        this.orderedBookQuantity = orderedBookQuantity;
        this.orderedBookTotalPrice = orderedBookTotalPrice;
        this.orderedBookPhotoName = orderedBookPhotoName;
        this.orderedUserName = orderedUserName;
        this.orderedUserMobileNo = orderedUserMobileNo;
        this.orderedUserEmail = orderedUserEmail;
        this.orderedUserVilage = orderedUserVilage;
        this.orderedUserLandmark = orderedUserLandmark;
        this.orderedUserDistrict = orderedUserDistrict;
        this.orderedUserPincode = orderedUserPincode;
        this.orderedUserState = orderedUserState;
        this.paymentMethod = paymentMethod;
        this.userAddressId = userAddressId;
        this.receipt = receipt;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public UserOrderedBook(int bookOrderedId) {
        this.bookOrderedId = bookOrderedId;
    }

    public UserOrderedBook(String orderedUserEmail) {
        this.orderedUserEmail = orderedUserEmail;
    }

    public UserOrderedBook(int bookId, String bookName, String BookAuthor, int orderedBookQuantity, double orderedBookTotalPrice, String orderedBookPhotoName, String orderedUserName, String orderedUserMobileNo, String orderedUserEmail, String orderedUserVilage, String orderedUserLandmark, String orderedUserDistrict, String orderedUserPincode, String orderedUserState, String paymentMethod, int userAddressId) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.BookAuthor = BookAuthor;
        this.orderedBookQuantity = orderedBookQuantity;
        this.orderedBookTotalPrice = orderedBookTotalPrice;
        this.orderedBookPhotoName = orderedBookPhotoName;
        this.orderedUserName = orderedUserName;
        this.orderedUserMobileNo = orderedUserMobileNo;
        this.orderedUserEmail = orderedUserEmail;
        this.orderedUserVilage = orderedUserVilage;
        this.orderedUserLandmark = orderedUserLandmark;
        this.orderedUserDistrict = orderedUserDistrict;
        this.orderedUserPincode = orderedUserPincode;
        this.orderedUserState = orderedUserState;
        this.paymentMethod = paymentMethod;
        this.userAddressId = userAddressId;
    }

    public UserOrderedBook(int bookId, String bookName, String BookAuthor, int orderedBookQuantity, double orderedBookTotalPrice, String orderedBookPhotoName, String orderedUserName, String orderedUserMobileNo, String orderedUserEmail, String orderedUserVilage, String orderedUserLandmark, String orderedUserDistrict, String orderedUserPincode, String orderedUserState, String paymentMethod, int userAddressId, Timestamp orderedDate) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.BookAuthor = BookAuthor;
        this.orderedBookQuantity = orderedBookQuantity;
        this.orderedBookTotalPrice = orderedBookTotalPrice;
        this.orderedBookPhotoName = orderedBookPhotoName;
        this.orderedUserName = orderedUserName;
        this.orderedUserMobileNo = orderedUserMobileNo;
        this.orderedUserEmail = orderedUserEmail;
        this.orderedUserVilage = orderedUserVilage;
        this.orderedUserLandmark = orderedUserLandmark;
        this.orderedUserDistrict = orderedUserDistrict;
        this.orderedUserPincode = orderedUserPincode;
        this.orderedUserState = orderedUserState;
        this.paymentMethod = paymentMethod;
        this.userAddressId = userAddressId;
        this.orderedDate = orderedDate;
    }

    public UserOrderedBook(String bookName, String BookAuthor, int orderedBookQuantity, double orderedBookTotalPrice, String orderedBookPhotoName, String orderedUserName, String orderedUserMobileNo, String orderedUserEmail, String orderedUserVilage, String orderedUserLandmark, String orderedUserDistrict, String orderedUserPincode, String orderedUserState, String paymentMethod, int userAddressId) {
        this.bookName = bookName;
        this.BookAuthor = BookAuthor;
        this.orderedBookQuantity = orderedBookQuantity;
        this.orderedBookTotalPrice = orderedBookTotalPrice;
        this.orderedBookPhotoName = orderedBookPhotoName;
        this.orderedUserName = orderedUserName;
        this.orderedUserMobileNo = orderedUserMobileNo;
        this.orderedUserEmail = orderedUserEmail;
        this.orderedUserVilage = orderedUserVilage;
        this.orderedUserLandmark = orderedUserLandmark;
        this.orderedUserDistrict = orderedUserDistrict;
        this.orderedUserPincode = orderedUserPincode;
        this.orderedUserState = orderedUserState;
        this.paymentMethod = paymentMethod;
        this.userAddressId = userAddressId;
    }

    public int getBookId() {
        return bookId;
    }

    public int getBookOrderedId() {
        return bookOrderedId;
    }

    public void setBookOrderedId(int bookOrderedId) {
        this.bookOrderedId = bookOrderedId;
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
        return BookAuthor;
    }

    public void setBookAuthor(String BookAuthor) {
        this.BookAuthor = BookAuthor;
    }

    public int getOrderedBookQuantity() {
        return orderedBookQuantity;
    }

    public void setOrderedBookQuantity(int orderedBookQuantity) {
        this.orderedBookQuantity = orderedBookQuantity;
    }

    public double getOrderedBookTotalPrice() {
        return orderedBookTotalPrice;
    }

    public void setOrderedBookTotalPrice(double orderedBookTotalPrice) {
        this.orderedBookTotalPrice = orderedBookTotalPrice;
    }

    public String getOrderedBookPhotoName() {
        return orderedBookPhotoName;
    }

    public void setOrderedBookPhotoName(String orderedBookPhotoName) {
        this.orderedBookPhotoName = orderedBookPhotoName;
    }

    public String getOrderedUserName() {
        return orderedUserName;
    }

    public void setOrderedUserName(String orderedUserName) {
        this.orderedUserName = orderedUserName;
    }

    public String getOrderedUserMobileNo() {
        return orderedUserMobileNo;
    }

    public void setOrderedUserMobileNo(String orderedUserMobileNo) {
        this.orderedUserMobileNo = orderedUserMobileNo;
    }

    public String getOrderedUserEmail() {
        return orderedUserEmail;
    }

    public void setOrderedUserEmail(String orderedUserEmail) {
        this.orderedUserEmail = orderedUserEmail;
    }

    public String getOrderedUserVilage() {
        return orderedUserVilage;
    }

    public void setOrderedUserVilage(String orderedUserVilage) {
        this.orderedUserVilage = orderedUserVilage;
    }

    public String getOrderedUserLandmark() {
        return orderedUserLandmark;
    }

    public void setOrderedUserLandmark(String orderedUserLandmark) {
        this.orderedUserLandmark = orderedUserLandmark;
    }

    public String getOrderedUserDistrict() {
        return orderedUserDistrict;
    }

    public void setOrderedUserDistrict(String orderedUserDistrict) {
        this.orderedUserDistrict = orderedUserDistrict;
    }

    public String getOrderedUserPincode() {
        return orderedUserPincode;
    }

    public void setOrderedUserPincode(String orderedUserPincode) {
        this.orderedUserPincode = orderedUserPincode;
    }

    public String getOrderedUserState() {
        return orderedUserState;
    }

    public void setOrderedUserState(String orderedUserState) {
        this.orderedUserState = orderedUserState;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getUserAddressId() {
        return userAddressId;
    }

    public void setUserAddressId(int userAddressId) {
        this.userAddressId = userAddressId;
    }

    public Timestamp getOrderedDate() {
        return orderedDate;
    }

    public void setOrderedDate(Timestamp orderedDate) {
        this.orderedDate = orderedDate;
    }
    
    
}
