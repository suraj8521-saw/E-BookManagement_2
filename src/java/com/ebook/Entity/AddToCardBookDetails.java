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
public class AddToCardBookDetails {
    
    private int bookAddToCardId;
     private int bookId;
    private String bookName;
    private String bookAuthor;
    private int bookQuantity;
    private Double bookPrice;
    
    private Double bookTotalPrice;
    private String bookCategory;
    private String bookPhotoName;
    private String userEmail;
    private Timestamp addToCardDate;

    public AddToCardBookDetails() {
    }

    public AddToCardBookDetails(String userEmail) {
        this.userEmail = userEmail;
    }

    public AddToCardBookDetails(int bookId, String bookName, String bookAuthor, int bookQuantity, Double bookPrice, Double bookTotalPrice, String bookCategory, String bookPhotoName, String userEmail) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookQuantity = bookQuantity;
        this.bookPrice = bookPrice;
        this.bookTotalPrice = bookTotalPrice;
        this.bookCategory = bookCategory;
        this.bookPhotoName = bookPhotoName;
        this.userEmail = userEmail;
    }

    public AddToCardBookDetails(int bookAddToCardId, int bookQuantity, Double bookTotalPrice, String userEmail) {
        this.bookAddToCardId = bookAddToCardId;
        this.bookQuantity = bookQuantity;
        this.bookTotalPrice = bookTotalPrice;
        this.userEmail = userEmail;
    }

    public AddToCardBookDetails(int bookAddToCardId) {
        this.bookAddToCardId = bookAddToCardId;
    }

   

    

    public AddToCardBookDetails(int bookAddToCardId, int bookId, String bookName, String bookAuthor, Double bookPrice, String bookCategory, String bookPhotoName, String userEmail, Timestamp addToCardDate) {
        this.bookAddToCardId = bookAddToCardId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPrice = bookPrice;
        this.bookCategory = bookCategory;
        this.bookPhotoName = bookPhotoName;
        this.userEmail = userEmail;
        this.addToCardDate = addToCardDate;
    }

    public AddToCardBookDetails(int bookId, String bookName, String bookAuthor, Double bookPrice, String bookCategory, String bookPhotoName, String userEmail) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPrice = bookPrice;
        this.bookCategory = bookCategory;
        this.bookPhotoName = bookPhotoName;
        this.userEmail = userEmail;
    }

    public int getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(int bookQuantity) {
        this.bookQuantity = bookQuantity;
    }

    public Double getBookTotalPrice() {
        return bookTotalPrice;
    }

    public void setBookTotalPrice(Double bookTotalPrice) {
        this.bookTotalPrice = bookTotalPrice;
    }

    public int getBookAddToCardId() {
        return bookAddToCardId;
    }

    public void setBookAddToCardId(int bookAddToCardId) {
        this.bookAddToCardId = bookAddToCardId;
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

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookPhotoName() {
        return bookPhotoName;
    }

    public void setBookPhotoName(String bookPhotoName) {
        this.bookPhotoName = bookPhotoName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public Timestamp getAddToCardDate() {
        return addToCardDate;
    }

    public void setAddToCardDate(Timestamp addToCardDate) {
        this.addToCardDate = addToCardDate;
    }

    public int loginedUserEmail() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
